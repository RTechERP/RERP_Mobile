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
        fetchParents: (projectId) => _onFetchParents(emit, projectId: projectId),
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

  Map<String, dynamic> _workCategoryListPayload({
    required int userId,
  }) {

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
        final (defaultStart, defaultEnd) = GetDaysHelper.calendarMonthBounds(now);

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

        final payload = _workCategoryListPayload(
          userId: user?.id ?? 0,
        );

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

      final assignerRes = await _workCategoryRepo.getAssigner();
      final projectRes = await _workCategoryRepo.getWorkProject();
      final projectTypeRes = await _workCategoryRepo.getWorkProjectType();

      var assigners = <WorkAssignItem>[];
      var projects = <WorkProjectItem>[];
      var projectTypes = <WorkProjectTypeItem>[];
      String? errorMsg;

      assignerRes.fold(
        (l) => errorMsg = l.getErrorMessage,
        (r) => assigners = r,
      );
      if (errorMsg != null) {
        _log.logE('❌ WorkCategoryBloc initAdd getAssigner failed: $errorMsg');
        emit(state.copyWith(status: BaseStateStatus.failed, message: errorMsg));
        return;
      }

      projectRes.fold(
        (l) => errorMsg = l.getErrorMessage,
        (r) => projects = r,
      );
      if (errorMsg != null) {
        _log.logE('❌ WorkCategoryBloc initAdd getWorkProject failed: $errorMsg');
        emit(state.copyWith(status: BaseStateStatus.failed, message: errorMsg));
        return;
      }

      projectTypeRes.fold(
        (l) => errorMsg = l.getErrorMessage,
        (r) => projectTypes = r,
      );
      if (errorMsg != null) {
        _log.logE('❌ WorkCategoryBloc initAdd getWorkProjectType failed: $errorMsg');
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
      final parentRes = await _workCategoryRepo.getWorkParent(projectID: projectId);
      var parents = <WorkParentItem>[];
      String? errorMsg;

      parentRes.fold(
        (l) => errorMsg = l.getErrorMessage,
        (r) => parents = r,
      );

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
        final payload = _workCategoryListPayload(
          userId: user?.id ?? 0,
        );

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
        state.copyWith(
          isSubmitting: true,
          submitSuccess: false,
          message: null,
        ),
      );

      final slipList = slips;

      if (slipList.isEmpty) {
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

      final List<Map<String, dynamic>> items = [];

      for (var i = 0; i < slipList.length; i++) {
        final slip = slipList[i];

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

        items.add({
          'ID': 0,
          'ProjectID': slip.projectId,
          'TypeProjectItem': slip.typeProjectItem,
          'ParentID': slip.parentId,
          'Mission': slip.mission,
          'PlanStartDate': ConvertDateHelper.toLocalIso8601(start),
          'PlanEndDate': ConvertDateHelper.toLocalIso8601(end),
          'EmployeeIDRequest': slip.employeeIdRequest,
          'EmployeeCreateID': slip.employeeCreateId,
          'TotalDayPlan': slip.totalDayPlan,
          'Note': slip.note,
          'IsDeleted': false,
        });
      }

      _log.logI('WorkCategoryBloc submitBatch payload: $items');

      final result = await _workCategoryRepo.saveWorkCategory(
        payload: items,
      );

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
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(
          isDeleting: true,
          deleteSuccess: false,
          status: BaseStateStatus.loading,
          message: null,
        ),
      );

      final payload = [
        <String, dynamic>{
          'ID': id,
          'IsDeleted': true,
        }
      ];

      _log.logI('WorkCategoryBloc cancelSubmit ID=$id payload: $payload');

      final saveRes = await _workCategoryRepo.saveWorkCategory(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ WorkCategoryBloc cancelSubmit failed: $err');
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          _log.logI('✅ WorkCategoryBloc cancelSubmit success ID=$id');
          final updated = state.workCategories.where((e) => e.id != id).toList();
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: true,
              status: BaseStateStatus.success,
              workCategories: updated,
              message: null,
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ WorkCategoryBloc cancelSubmit exception: $e');
      emit(
        state.copyWith(
          isDeleting: false,
          deleteSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi gửi dữ liệu',
        ),
      );
    } finally {
      _isSubmittingReport = false;
    }
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
    emit(
      state.copyWith(isFetchingDetail: true, message: null),
    );
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
        state.copyWith(
          isSubmitting: true,
          editSuccess: false,
          message: null,
        ),
      );

      final start = ConvertDateHelper.normalizeToMinute(slip.planStartDate);
      final end = ConvertDateHelper.normalizeToMinute(slip.planEndDate);

      if (end.isBefore(start)) {
        emit(
          state.copyWith(
            isSubmitting: false,
            editSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Thời gian kết thúc phải lớn hơn hoặc bằng thời gian bắt đầu',
          ),
        );
        return;
      }

      final item = {
        'ID': id,
        'ProjectID': slip.projectId,
        'TypeProjectItem': slip.typeProjectItem,
        'ParentID': slip.parentId,
        'Mission': slip.mission,
        'PlanStartDate': ConvertDateHelper.toLocalIso8601(start),
        'PlanEndDate': ConvertDateHelper.toLocalIso8601(end),
        'EmployeeIDRequest': slip.employeeIdRequest,
        'EmployeeCreateID': slip.employeeCreateId,
        'TotalDayPlan': slip.totalDayPlan,
        'Note': slip.note,
        'IsDeleted': false,
      };

      _log.logI('WorkCategoryBloc submitEdit payload: [$item]');

      final result = await _workCategoryRepo.saveWorkCategory(
        payload: [item],
      );

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
