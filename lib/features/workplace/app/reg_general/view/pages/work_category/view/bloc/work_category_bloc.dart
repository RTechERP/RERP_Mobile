import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../../common/helpers/get_days_helper.dart';
import '../../../../../../../../../common/helpers/convert_date_helper.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/work_category_model.dart';
import '../../data/repository/work_category_repo.dart';
import 'dart:convert';
import '../../../../../../../../../di/injection.dart';
import '../../../../../../../../../common/local_data/shared_pref.dart';
import '../../../../../../../../../common/local_data/pref_key.dart';

part 'work_category_event.dart';
part 'work_category_state.dart';
part 'work_category_bloc.g.dart';
part 'work_category_bloc.freezed.dart';

@injectable
class WorkCategoryBloc extends BaseBloc<WorkCategoryEvent, WorkCategoryState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final WorkCategoryRepo _workCategoryRepo;
  bool _isSubmittingReport = false;
  bool _isInitAddInFlight = false;

  WorkCategoryBloc(this._workCategoryRepo, this._authRepo, this._log)
    : super(WorkCategoryState.init()) {
    on<WorkCategoryEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: () => _onInitAdd(emit),
        fetchParents: (projectId) =>
            _onFetchParents(emit, projectId: projectId),
        submitBatch: (slips) => _onSubmitBatch(emit, slips: slips),
        onCancelSubmit: (id) => _onCancelSubmit(emit, id: id),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        clearSubmitState: () async => _onClearSubmitState(emit),
        fetchDetail: (id) => _onFetchDetail(emit, id: id),
        submitEdit: (id, slip) => _onSubmitEdit(emit, id: id, slip: slip),
      );
    });
  }

  Map<String, dynamic> _workCategoryListPayload({required int userId}) {
    return <String, dynamic>{
      'KeyWord': '',
      'ProjectID': 0,
      'Status': "0;1;2;3",
      'UserID': userId,
    };
  }

  Future<void> _onInit(Emitter<WorkCategoryState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('❌ WorkCategoryBloc _onInit get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final now = DateTime.now();
        final (defaultStart, defaultEnd) = GetDaysHelper.calendarMonthBounds(
          now,
        );

        late final DateTime rangeStart;
        late final DateTime rangeEnd;
        if (state.dateStart != null && state.dateEnd != null) {
          final a = state.dateStart!;
          final b = state.dateEnd!;
          final lo = a.isAfter(b) ? b : a;
          (rangeStart, rangeEnd) = GetDaysHelper.calendarMonthBounds(lo);
        } else {
          rangeStart = defaultStart;
          rangeEnd = defaultEnd;
        }

        final payload = _workCategoryListPayload(userId: user?.id ?? 0);

        _log.logI('WorkCategoryBloc _onInit payload: $payload');

        final res = await _workCategoryRepo.getWorkCategory(payload: payload);

        await res.fold(
          (l) async {
            _log.logE('❌ WorkCategoryBloc _onInit API failed: $l');
            emit(
              state.copyWith(
                status: BaseStateStatus.failed,
                message: l.getErrorMessage,
              ),
            );
          },
          (r) async {
            _log.logI('✅ WorkCategoryBloc _onInit success, total: ${r.length}');

            // Pre-fetch add screen data silently
            add(const WorkCategoryEvent.initAdd());

            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                workCategories: r,
                dateStart: rangeStart,
                dateEnd: rangeEnd,
                employeeId: user?.employeeId,
                loginName: user?.loginName,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onInitAdd(Emitter<WorkCategoryState> emit) async {
    if (state.assigners.isNotEmpty &&
        state.projects.isNotEmpty &&
        state.projectTypes.isNotEmpty) {
      _log.logI('ℹ️ WorkCategoryBloc initAdd skipped: data already cached');
      emit(state.copyWith(status: BaseStateStatus.success));
      return;
    }

    if (_isInitAddInFlight) {
      _log.logI('ℹ️ WorkCategoryBloc initAdd skipped: request in-flight');
      return;
    }
    _isInitAddInFlight = true;
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.fold((_) => null, (u) => u);
      if (user == null) {
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      final localStorage = getIt<LocalStorage>();
      final cachedAssigners = await localStorage.get<String>(
        PrefKeys.workAssigners,
      );
      final cachedProjects = await localStorage.get<String>(
        PrefKeys.workProjects,
      );
      final cachedProjectTypes = await localStorage.get<String>(
        PrefKeys.workProjectTypes,
      );

      if (cachedAssigners != null &&
          cachedProjects != null &&
          cachedProjectTypes != null) {
        try {
          final assignerResponse = WorkAssignResponse.fromJson(
            jsonDecode(cachedAssigners),
          );
          final projectList = (jsonDecode(cachedProjects) as List)
              .map((e) => WorkProjectItem.fromJson(e as Map<String, dynamic>))
              .toList();
          final projectTypeList = (jsonDecode(cachedProjectTypes) as List)
              .map(
                (e) => WorkProjectTypeItem.fromJson(e as Map<String, dynamic>),
              )
              .toList();

          _log.logI('✅ WorkCategoryBloc initAdd success from local cache');
          emit(
            state.copyWith(
              status: BaseStateStatus.success,
              assigners: assignerResponse.rows,
              defaultAssignerId: assignerResponse.employeeRequest,
              projects: projectList,
              projectTypes: projectTypeList,
              employeeId: user.employeeId,
              loginName: user.loginName,
            ),
          );
          return;
        } catch (e) {
          _log.logE('Error decoding cache: $e');
        }
      }

      final futureAssigner = _workCategoryRepo.getAssigner();
      final futureProject = _workCategoryRepo.getWorkProject();
      final futureProjectType = _workCategoryRepo.getWorkProjectType();

      await Future.wait([futureAssigner, futureProject, futureProjectType]);

      final assignerRes = await futureAssigner;
      final projectRes = await futureProject;
      final projectTypeRes = await futureProjectType;

      var assigners = <WorkAssignItem>[];
      int? defaultAssignerId;
      var projects = <WorkProjectItem>[];
      var projectTypes = <WorkProjectTypeItem>[];
      String? errorMsg;

      assignerRes.fold((l) => errorMsg = l.getErrorMessage, (r) {
        assigners = r.rows;
        defaultAssignerId = r.employeeRequest;
        localStorage.save(PrefKeys.workAssigners, jsonEncode(r.toJson()));
      });
      if (errorMsg != null) {
        _log.logE('❌ WorkCategoryBloc initAdd getAssigner failed: $errorMsg');
        emit(state.copyWith(status: BaseStateStatus.failed, message: errorMsg));
        return;
      }

      projectRes.fold((l) => errorMsg = l.getErrorMessage, (r) {
        projects = r;
        localStorage.save(
          PrefKeys.workProjects,
          jsonEncode(r.map((e) => e.toJson()).toList()),
        );
      });
      if (errorMsg != null) {
        _log.logE(
          '❌ WorkCategoryBloc initAdd getWorkProject failed: $errorMsg',
        );
        emit(state.copyWith(status: BaseStateStatus.failed, message: errorMsg));
        return;
      }

      projectTypeRes.fold((l) => errorMsg = l.getErrorMessage, (r) {
        projectTypes = r;
        localStorage.save(
          PrefKeys.workProjectTypes,
          jsonEncode(r.map((e) => e.toJson()).toList()),
        );
      });
      if (errorMsg != null) {
        _log.logE(
          '❌ WorkCategoryBloc initAdd getWorkProjectType failed: $errorMsg',
        );
        emit(state.copyWith(status: BaseStateStatus.failed, message: errorMsg));
        return;
      }

      _log.logI('✅ WorkCategoryBloc initAdd success');
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          assigners: assigners,
          projects: projects,
          projectTypes: projectTypes,
          employeeId: user.employeeId,
          loginName: user.loginName,
          defaultAssignerId: defaultAssignerId,
        ),
      );
    } finally {
      _isInitAddInFlight = false;
    }
  }

  Future<void> _onFetchParents(
    Emitter<WorkCategoryState> emit, {
    int? projectId,
  }) async {
    final parentRes = await _workCategoryRepo.getWorkParent(
      projectID: projectId,
    );
    var parents = <WorkParentItem>[];
    String? errorMsg;

    parentRes.fold((l) => errorMsg = l.getErrorMessage, (r) => parents = r);

    if (errorMsg != null) {
      _log.logE('❌ WorkCategoryBloc initAdd getWorkParent failed: $errorMsg');
    } else {
      emit(state.copyWith(parents: parents));
    }
  }

  Future<void> _onChangeDateRange(
    Emitter<WorkCategoryState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    final lo = start.isAfter(end) ? end : start;
    final (rangeStart, rangeEnd) = GetDaysHelper.calendarMonthBounds(lo);

    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        dateStart: rangeStart,
        dateEnd: rangeEnd,
      ),
    );

    final userRes = await _authRepo.getCurrentUser();
    await userRes.fold(
      (err) async {
        _log.logE('❌ WorkCategoryBloc changeDateRange get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final payload = _workCategoryListPayload(userId: user?.id ?? 0);

        final res = await _workCategoryRepo.getWorkCategory(payload: payload);
        await res.fold(
          (l) async {
            _log.logE('❌ WorkCategoryBloc changeDateRange API failed: $l');
            emit(
              state.copyWith(
                status: BaseStateStatus.failed,
                message: l.getErrorMessage,
              ),
            );
          },
          (r) async {
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                workCategories: r,
                dateStart: rangeStart,
                dateEnd: rangeEnd,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onSubmitBatch(
    Emitter<WorkCategoryState> emit, {
    required List<WorkCategorySubmitSlip> slips,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
      );

      if (slips.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Không có phiếu để gửi',
          ),
        );
        return;
      }

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.fold((_) => null, (u) => u);


      String _buildCode(String refCode, int stt) {
        final idx = refCode.lastIndexOf('_');
        final prefix = idx >= 0 ? refCode.substring(0, idx) : refCode;
        return '${prefix}_$stt';
      }

      // ── Fetch all items per project để lấy STT & Code prefix chuẩn ──────────
      final Map<int, int> nextSttByProject = {};
      final Map<int, String> refCodeByProject = {};
      for (final pid in slips.map((s) => s.projectId).toSet()) {
        final res = await _workCategoryRepo.getWorkCategory(
          payload: {'KeyWord': '', 'ProjectID': pid, 'Status': '0;1;2;3', 'UserID': 0},
        );
        final allItems = res.fold((_) => <WorkCategoryItem>[], (r) => r);
        int maxStt = 0;
        WorkCategoryItem? refItem;
        for (final it in allItems) {
          final stt = int.tryParse(it.stt) ?? 0; // dùng field STT từ API
          if (stt > maxStt) {
            maxStt = stt;
            refItem = it;
          }
        }
        nextSttByProject[pid] = maxStt + 1;
        if (refItem != null) refCodeByProject[pid] = refItem.code;
      }

      // ── Build items list ───────────────────────────────────────────────────
      final List<Map<String, dynamic>> items = [];

      for (var i = 0; i < slips.length; i++) {
        final slip = slips[i];

        final start = ConvertDateHelper.normalizeToMinute(slip.planStartDate);
        final end = ConvertDateHelper.normalizeToMinute(slip.planEndDate);

        if (end.isBefore(start)) {
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message:
                  'Phiếu ${i + 1}: Thời gian kết thúc phải lớn hơn hoặc bằng thời gian bắt đầu',
            ),
          );
          return;
        }

        final stt = nextSttByProject[slip.projectId]!;
        nextSttByProject[slip.projectId] = stt + 1;
        final refCode = refCodeByProject[slip.projectId];
        // If no existing items: use projectCode directly as prefix (e.g. "RTC1_1")
        // If existing items found: derive prefix by stripping last _<stt> suffix
        final code = refCode != null
            ? _buildCode(refCode, stt)
            : '${slip.projectCode}_$stt';

        items.add({
          'ID': 0,
          'Status': slip.status,
          'STT': null,
          'UserID': user?.id ?? 0,
          'ProjectID': slip.projectId,
          'Mission': slip.mission,
          'PlanStartDate': ConvertDateHelper.toLocalIso8601(start),
          'PlanEndDate': ConvertDateHelper.toLocalIso8601(end),
          'ActualStartDate': slip.actualStartDate != null
              ? ConvertDateHelper.toLocalIso8601(
                  ConvertDateHelper.normalizeToMinute(slip.actualStartDate!))
              : null,
          'ActualEndDate': slip.actualEndDate != null
              ? ConvertDateHelper.toLocalIso8601(
                  ConvertDateHelper.normalizeToMinute(slip.actualEndDate!))
              : null,
          'Note': slip.note,
          'TotalDayPlan': slip.totalDayPlan,
          'PercentItem': 0,
          'ParentID': slip.parentId,
          'TotalDayActual': 0,
          'ItemLate': 0,
          'TimeSpan': 0,
          'TypeProjectItem': slip.typeProjectItem,
          'PercentageActual': slip.percentageActual,
          'EmployeeIDRequest': slip.employeeIdRequest,
          'UpdatedDateActual': null,
          'IsApproved': 0,
          'Code': code,
          'CreatedDate': null,
          'CreatedBy': null,
          'UpdatedDate': null,
          'UpdatedBy': null,
          'IsUpdateLate': false,
          'ReasonLate': '',
          'UpdatedDateReasonLate': null,
          'IsApprovedLate': false,
          'EmployeeRequestID': 0,
          'EmployeeRequestName': null,
          'IsDeleted': false,
          'Location': slip.location,
        });
      }

      final payload = {
        'projectItems': items,
        'projectItemProblem': null,
        'ProjectItemFile': null,
      };

      _log.logI('WorkCategoryBloc submitBatch payload: $payload');

      final result = await _workCategoryRepo.saveWorkCategory(payload: payload);
      final failed = result.fold((err) => err, (_) => null);

      if (failed != null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: failed.getErrorMessage,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: true,
          status: BaseStateStatus.success,
          message: 'Tạo hạng mục công việc thành công',
        ),
      );
    } catch (e) {
      _log.logE('❌ WorkCategoryBloc submitBatch exception: $e');

      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi gửi dữ liệu',
        ),
      );
    } finally {
      _isSubmittingReport = false;
    }
  }

  Future<void> _onCancelSubmit(
    Emitter<WorkCategoryState> emit, {
    required int id,
  }) async {
    // if (_isSubmittingReport) return;
    // _isSubmittingReport = true;
    //
    // try {
    //   emit(
    //     state.copyWith(
    //       isDeleting: true,
    //       deleteSuccess: false,
    //       status: BaseStateStatus.loading,
    //       message: null,
    //     ),
    //   );
    //
    //   final item = <String, dynamic>{'ID': id, 'IsDeleted': true};
    //
    //   final payload = {
    //     'projectItem': item,
    //     'projectItems': [item],
    //     'projectItemProblem': null,
    //     'ProjectItemFile': null,
    //   };
    //
    //   _log.logI('WorkCategoryBloc cancelSubmit ID=$id payload: $payload');
    //
    //   final saveRes = await _workCategoryRepo.saveWorkCategory(
    //     payload: payload,
    //   );
    //   await saveRes.fold(
    //     (err) async {
    //       _log.logE('❌ WorkCategoryBloc cancelSubmit failed: $err');
    //       emit(
    //         state.copyWith(
    //           isDeleting: false,
    //           deleteSuccess: false,
    //           status: BaseStateStatus.failed,
    //           message: err.getErrorMessage,
    //         ),
    //       );
    //     },
    //     (_) async {
    //       _log.logI('✅ WorkCategoryBloc cancelSubmit success ID=$id');
    //       final updated = state.workCategories
    //           .where((e) => e.id != id)
    //           .toList();
    //       emit(
    //         state.copyWith(
    //           isDeleting: false,
    //           deleteSuccess: true,
    //           status: BaseStateStatus.success,
    //           workCategories: updated,
    //           message: null,
    //         ),
    //       );
    //     },
    //   );
    // } catch (e) {
    //   _log.logE('❌ WorkCategoryBloc cancelSubmit exception: $e');
    //   emit(
    //     state.copyWith(
    //       isDeleting: false,
    //       deleteSuccess: false,
    //       status: BaseStateStatus.failed,
    //       message: 'Có lỗi xảy ra khi gửi dữ liệu',
    //     ),
    //   );
    // } finally {
    //   _isSubmittingReport = false;
    // }
  }

  void _onClearSubmitState(Emitter<WorkCategoryState> emit) {
    emit(
      state.copyWith(submitSuccess: false, editSuccess: false, message: null),
    );
  }

  Future<void> _onFetchDetail(
    Emitter<WorkCategoryState> emit, {
    required int id,
  }) async {
    emit(state.copyWith(isFetchingDetail: true, message: null));
  }

  Future<void> _onSubmitEdit(
    Emitter<WorkCategoryState> emit, {
    required int id,
    required WorkCategorySubmitSlip slip,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;
    try {
      emit(
        state.copyWith(isSubmitting: true, editSuccess: false, message: null),
      );

      final start = ConvertDateHelper.normalizeToMinute(slip.planStartDate);
      final end = ConvertDateHelper.normalizeToMinute(slip.planEndDate);

      if (end.isBefore(start)) {
        emit(
          state.copyWith(
            isSubmitting: false,
            editSuccess: false,
            status: BaseStateStatus.failed,
            message:
                'Thời gian kết thúc phải lớn hơn hoặc bằng thời gian bắt đầu',
          ),
        );
        return;
      }

      final existingItem = state.workCategories.firstWhere((e) => e.id == id);
      final item = existingItem.toJson();
      item['ProjectID'] = slip.projectId;
      item['TypeProjectItem'] = slip.typeProjectItem;
      item['ParentID'] = slip.parentId;
      item['Mission'] = slip.mission;
      item['PlanStartDate'] = ConvertDateHelper.toLocalIso8601(start);
      item['PlanEndDate'] = ConvertDateHelper.toLocalIso8601(end);
      item['EmployeeIDRequest'] = slip.employeeIdRequest;
      item['EmployeeCreateID'] = slip.employeeCreateId;
      item['TotalDayPlan'] = slip.totalDayPlan;
      item['Note'] = slip.note;
      item['IsDeleted'] = false;

      final payload = {
        'projectItem': item,
        'projectItems': [item],
        'projectItemProblem': null,
        'ProjectItemFile': null,
      };

      _log.logI('WorkCategoryBloc submitEdit payload: $payload');

      final result = await _workCategoryRepo.saveWorkCategory(payload: payload);

      final failed = result.fold((err) => err, (_) => null);

      if (failed != null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            editSuccess: false,
            status: BaseStateStatus.failed,
            message: failed.getErrorMessage,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          isSubmitting: false,
          editSuccess: true,
          status: BaseStateStatus.success,
          message: 'Cập nhật hạng mục công việc thành công',
        ),
      );
    } catch (e) {
      _log.logE('❌ WorkCategoryBloc submitEdit exception: $e');

      emit(
        state.copyWith(
          isSubmitting: false,
          editSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi cập nhật dữ liệu',
        ),
      );
    } finally {
      _isSubmittingReport = false;
    }
  }
}
