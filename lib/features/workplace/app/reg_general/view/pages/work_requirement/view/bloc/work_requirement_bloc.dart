import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../../data/datasource/models/work_requirement_model.dart';
import '../../data/repository/work_requirement_repo.dart';

part 'work_requirement_event.dart';
part 'work_requirement_state.dart';
part 'work_requirement_bloc.freezed.dart';
part 'work_requirement_bloc.g.dart';

@injectable
class WorkRequirementBloc
    extends BaseBloc<WorkRequirementEvent, WorkRequirementState> {
  final WorkRequirementRepo _workRequirementRepo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  bool _isSubmittingReport = false;

  WorkRequirementBloc(this._workRequirementRepo, this._authRepo, this._log)
    : super(WorkRequirementState.init()) {
    on<WorkRequirementEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart, dateEnd),
        refresh: () => _onRefresh(emit),
        initAdd: () => _onInitAdd(emit),
        updateFormField: (rowIndex, field, value) =>
            _onUpdateFormField(emit, rowIndex, field, value),
        changeDateRequest: (date) => _onChangeDateRequest(emit, date),
        changeDeadline: (date) => _onChangeDeadline(emit, date),
        changeRequiredDepartment: (id, name) =>
            _onChangeRequiredDepartment(emit, id, name),
        changeCoordinationDepartment: (id, name) =>
            _onChangeCoordinationDepartment(emit, id, name),
        changeApprover: (id, displayName) =>
            _onChangeApprover(emit, id, displayName),
        changeAttachments: (names) => _onChangeAttachments(emit, names),
        submit:
            (
              approvedTBPId,
              dateRequest,
              deadlineRequest,
              requiredDepartmentId,
              details,
              coordinationDepartmentId,
            ) => _onSubmit(
              emit,
              approvedTBPId: approvedTBPId,
              dateRequest: dateRequest,
              deadlineRequest: deadlineRequest,
              requiredDepartmentId: requiredDepartmentId,
              coordinationDepartmentId: coordinationDepartmentId,
              details: details,
            ),
        initDetail: (id) => _onInitDetail(emit, id),
        initEdit: (id, item) => _onInitEdit(emit, id: id, item: item),
        editSubmit:
            (
              id,
              approvedTBPId,
              dateRequest,
              deadlineRequest,
              requiredDepartmentId,
              details,
              coordinationDepartmentId,
            ) => _onEditSubmit(
              emit,
              id: id,
              approvedTBPId: approvedTBPId,
              dateRequest: dateRequest,
              deadlineRequest: deadlineRequest,
              requiredDepartmentId: requiredDepartmentId,
              coordinationDepartmentId: coordinationDepartmentId,
              details: details,
            ),
        deleteRequirement: (ids) => _onDeleteRequirement(emit, ids),
        clearDeleteSuccess: () => _onClearDeleteSuccess(emit),
        clearSubmitState: () => _onClearSubmitState(emit),
      );
    });
  }

  //---(Init)---//

  Future<void> _onInit(Emitter<WorkRequirementState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        if (user == null) {
          emit(state.copyWith(status: BaseStateStatus.failed));
          return;
        }

        final now = DateTime.now();
        final startOfMonth = DateTime(now.year, now.month, 1);
        final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

        emit(
          state.copyWith(
            employeeId: user.employeeId,
            departmentId: user.departmentId,
            dateStart: startOfMonth,
            dateEnd: endOfMonth,
          ),
        );

        await _fetchItems(
          emit,
          departmentId: user.departmentId,
          employeeId: user.employeeId,
          dateStart: startOfMonth,
          dateEnd: endOfMonth,
        );
      },
    );
  }

  //---(Refresh)---//

  Future<void> _onRefresh(Emitter<WorkRequirementState> emit) async {
    if (state.employeeId == null || state.departmentId == null) {
      await _onInit(emit);
      return;
    }

    await _fetchItems(
      emit,
      departmentId: state.departmentId,
      employeeId: state.employeeId,
      dateStart: state.dateStart,
      dateEnd: state.dateEnd,
    );
  }

  //---(ChangeDateRange)---//

  Future<void> _onChangeDateRange(
    Emitter<WorkRequirementState> emit,
    DateTime dateStart,
    DateTime dateEnd,
  ) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        dateStart: dateStart,
        dateEnd: dateEnd,
      ),
    );

    await _fetchItems(
      emit,
      departmentId: state.departmentId,
      employeeId: state.employeeId,
      dateStart: dateStart,
      dateEnd: dateEnd,
    );
  }

  //---(Fetch)---//

  Future<void> _fetchItems(
    Emitter<WorkRequirementState> emit, {
    required int? departmentId,
    required int? employeeId,
    required DateTime? dateStart,
    required DateTime? dateEnd,
  }) async {
    final payload = <String, dynamic>{
      'DepartmentID': departmentId ?? 0,
      'EmployeeID': employeeId ?? 0,
      'DateStart': dateStart?.toIso8601String() ?? '',
      'DateEnd': dateEnd?.toIso8601String() ?? '',
    };

    _log.logI('WorkRequirement payload: $payload');

    final res = await _workRequirementRepo.getWorkRequirement(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('Get work requirement failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (items) async {
        _log.logI('Get work requirement success: ${items.length} items');
        emit(state.copyWith(status: BaseStateStatus.success, items: items));
      },
    );
  }

  //---(InitAdd)---//

  Future<void> _onInitAdd(Emitter<WorkRequirementState> emit) async {
    final initialDeadline = DateTime.now();
    final deadlineFormatted = DateFormat('dd/MM/yyyy').format(initialDeadline);

    final initialDetailValues = <int, Map<String, String>>{
      7: {'explanation': deadlineFormatted},
    };

    emit(
      state.copyWith(
        isSubmitting: false,
        submitSuccess: false,
        message: null,
        departments: [],
        approvers: [],
        requiredDepartmentId: null,
        coordinationDepartmentId: null,
        approvedTBPId: null,
        dateRequest: DateTime.now(),
        deadlineRequest: initialDeadline,
        detailValues: initialDetailValues,
        attachmentNames: [],
      ),
    );

    final depsRes = await _workRequirementRepo.getDepartments();
    await depsRes.fold(
      (err) async {
        _log.logE('Get departments failed: $err');
      },
      (deps) async {
        emit(state.copyWith(departments: deps));
      },
    );

    final approversRes = await _workRequirementRepo.getApprovers();
    await approversRes.fold(
      (err) async {
        _log.logE('Get approvers failed: $err');
      },
      (approvers) async {
        emit(state.copyWith(approvers: approvers));
      },
    );

    final userRes = await _authRepo.getCurrentUser();
    userRes.fold(
      (err) {
        _log.logE('Get user in initAdd failed: $err');
      },
      (user) {
        if (user != null) {
          final updated = Map<int, Map<String, String>>.from(
            state.detailValues,
          );
          updated[1] = {'explanation': user.fullName};
          emit(state.copyWith(detailValues: updated));
        }
      },
    );
  }

  //---(FormField)---//

  Future<void> _onUpdateFormField(
    Emitter<WorkRequirementState> emit,
    int rowIndex,
    String field,
    String value,
  ) async {
    final updated = Map<int, Map<String, String>>.from(state.detailValues);
    updated[rowIndex] = Map<String, String>.from(updated[rowIndex] ?? {});
    updated[rowIndex]![field] = value;
    emit(state.copyWith(detailValues: updated));
  }

  //---(DateChange)---//

  Future<void> _onChangeDateRequest(
    Emitter<WorkRequirementState> emit,
    DateTime? date,
  ) async {
    emit(state.copyWith(dateRequest: date));
  }

  Future<void> _onChangeDeadline(
    Emitter<WorkRequirementState> emit,
    DateTime? date,
  ) async {
    if (date == null) {
      emit(state.copyWith(deadlineRequest: date));
      return;
    }
    final updated = Map<int, Map<String, String>>.from(state.detailValues);
    updated[7] = Map<String, String>.from(updated[7] ?? {});
    updated[7]!['explanation'] = DateFormat('dd/MM/yyyy').format(date);
    emit(state.copyWith(deadlineRequest: date, detailValues: updated));
  }

  //---(Department)---//

  Future<void> _onChangeRequiredDepartment(
    Emitter<WorkRequirementState> emit,
    int? id,
    String? name,
  ) async {
    emit(
      state.copyWith(requiredDepartmentId: id, requiredDepartmentName: name),
    );
  }

  Future<void> _onChangeCoordinationDepartment(
    Emitter<WorkRequirementState> emit,
    int? id,
    String? name,
  ) async {
    emit(
      state.copyWith(
        coordinationDepartmentId: id,
        coordinationDepartmentName: name,
      ),
    );
  }

  //---(Approver)---//

  Future<void> _onChangeApprover(
    Emitter<WorkRequirementState> emit,
    int? id,
    String? displayName,
  ) async {
    emit(state.copyWith(approvedTBPId: id, approverDisplayName: displayName));
  }

  //---(Attachments)---//

  Future<void> _onChangeAttachments(
    Emitter<WorkRequirementState> emit,
    List<String> names,
  ) async {
    emit(state.copyWith(attachmentNames: names));
  }

  //---(Submit)---//

  Future<void> _onSubmit(
    Emitter<WorkRequirementState> emit, {
    required int approvedTBPId,
    required DateTime dateRequest,
    required DateTime deadlineRequest,
    required int requiredDepartmentId,
    required List<WorkRequirementDetailItem> details,
    int? coordinationDepartmentId,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        _log.logE('Submit: no current user');
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Khong lay duoc thong tin nguoi dung',
          ),
        );
        return;
      }

      final payload = _buildSubmitPayload(
        user: user,
        approvedTBPId: approvedTBPId,
        dateRequest: dateRequest,
        deadlineRequest: deadlineRequest,
        requiredDepartmentId: requiredDepartmentId,
        coordinationDepartmentId: coordinationDepartmentId,
        details: details,
      );

      _log.logI('payload: $payload');

      final saveRes = await _workRequirementRepo.saveWorkRequirement(
        payload: payload,
      );

      await saveRes.fold(
        (err) async {
          _log.logE('Submit failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (saved) async {
          _log.logI(
            'Submit success - NumberRequest: ${saved.numberRequest}, ID: ${saved.id}',
          );
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              message: 'Gui yeu cau thanh cong',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('Submit exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          status: BaseStateStatus.failed,
          message: 'Co loi xay ra',
        ),
      );
    } finally {
      _isSubmittingReport = false;
      _log.logI('End submit');
    }
  }

  //---(ClearSubmit)---//

  Future<void> _onClearSubmitState(Emitter<WorkRequirementState> emit) async {
    emit(
      state.copyWith(isSubmitting: false, submitSuccess: false, message: null),
    );
  }

  //---(InitDetail)---//

  Future<void> _onInitDetail(Emitter<WorkRequirementState> emit, int id) async {
    emit(
      state.copyWith(
        isDetailLoading: true,
        detailId: id,
        detailData: null,
        status: BaseStateStatus.loading,
      ),
    );

    final res = await _workRequirementRepo.getWorkRequirementDetail(id);

    await res.fold(
      (err) async {
        _log.logE('Get work requirement detail failed: $err');
        emit(
          state.copyWith(
            isDetailLoading: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (data) async {
        _log.logI('Get work requirement detail success');
        emit(
          state.copyWith(
            isDetailLoading: false,
            detailData: data,
            status: BaseStateStatus.success,
          ),
        );
      },
    );
  }

  //---(InitEdit)---//

  Future<void> _onInitEdit(
    Emitter<WorkRequirementState> emit, {
    required int id,
    required WorkRequirementItem item,
  }) async {
    // TBP Duyệt: build display name từ fullNameApprovedTBP
    final approverDisplay = (item.fullNameApprovedTBP?.isNotEmpty == true)
        ? item.fullNameApprovedTBP!
        : null;

    // Bộ phận được yêu cầu
    final requiredDeptId = item.requiredDepartmentID;
    final requiredDeptName = item.requiredDepartment;

    // Bộ phận phối hợp
    final coordinationDeptId = item.coordinationDepartmentID;
    final coordinationDeptName = item.coordinationDepartment;

    emit(
      state.copyWith(
        isDetailLoading: true,
        isSubmitting: false,
        submitSuccess: false,
        message: null,
        departments: [],
        approvers: [],
        requiredDepartmentId: requiredDeptId,
        requiredDepartmentName: requiredDeptName,
        coordinationDepartmentId: coordinationDeptId,
        coordinationDepartmentName: coordinationDeptName,
        approvedTBPId: item.approvedTBPID,
        approverDisplayName: approverDisplay,
        dateRequest: item.dateRequest,
        deadlineRequest: item.deadlineRequest,
        detailValues: {},
        attachmentNames: [],
      ),
    );

    final depsRes = await _workRequirementRepo.getDepartments();
    await depsRes.fold(
      (err) async {
        _log.logE('Get departments in edit failed: $err');
      },
      (deps) async {
        emit(state.copyWith(departments: deps));
      },
    );

    final approversRes = await _workRequirementRepo.getApprovers();
    await approversRes.fold(
      (err) async {
        _log.logE('Get approvers in edit failed: $err');
      },
      (approvers) async {
        emit(state.copyWith(approvers: approvers));
      },
    );

    final detailRes = await _workRequirementRepo.getWorkRequirementDetail(id);
    await detailRes.fold(
      (err) async {
        _log.logE('Get edit detail failed: $err');
        emit(state.copyWith(isDetailLoading: false));
      },
      (detailData) async {
        final detailValues = _parseDetailValues(detailData.details ?? []);

        // Override row 1 (Người yêu cầu) với requestedBy từ detailsCategory
        final requestedBy = detailData.detailsCategory?.isNotEmpty == true
            ? detailData.detailsCategory!.first.requestedBy
            : null;
        if (requestedBy != null && requestedBy.isNotEmpty) {
          detailValues[1] = {
            ...(detailValues[1] ?? {}),
            'explanation': requestedBy,
          };
        }

        final deadlineDateStr = detailData.detailsCategory?.isNotEmpty == true
            ? detailData.detailsCategory!.first.deadlineDate
            : null;
        DateTime? parsedDeadline;
        if (deadlineDateStr != null) {
          try {
            parsedDeadline = DateFormat('dd/MM/yyyy').parse(deadlineDateStr);
          } catch (_) {
            parsedDeadline = null;
          }
        }

        emit(
          state.copyWith(
            isDetailLoading: false,
            detailData: detailData,
            dateRequest: parsedDeadline ?? state.dateRequest,
            deadlineRequest: parsedDeadline ?? item.deadlineRequest,
            detailValues: detailValues,
          ),
        );
      },
    );
  }

  //---(EditSubmit)---//

  Future<void> _onEditSubmit(
    Emitter<WorkRequirementState> emit, {
    required int id,
    required int approvedTBPId,
    required DateTime dateRequest,
    required DateTime deadlineRequest,
    required int requiredDepartmentId,
    required List<WorkRequirementDetailItem> details,
    int? coordinationDepartmentId,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        _log.logE('Edit: no current user');
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Khong lay duoc thong tin nguoi dung',
          ),
        );
        return;
      }

      final payload = _buildEditPayload(
        id: id,
        user: user,
        approvedTBPId: approvedTBPId,
        dateRequest: dateRequest,
        deadlineRequest: deadlineRequest,
        requiredDepartmentId: requiredDepartmentId,
        coordinationDepartmentId: coordinationDepartmentId,
        details: details,
      );

      _log.logI('Edit payload: $payload');

      final saveRes = await _workRequirementRepo.editWorkRequirement(
        id: id,
        payload: payload,
      );

      await saveRes.fold(
        (err) async {
          _log.logE('Edit failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          _log.logI('Edit success - id: $id');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              message: 'Cap nhat thanh cong',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('Edit exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          status: BaseStateStatus.failed,
          message: 'Co loi xay ra',
        ),
      );
    } finally {
      _isSubmittingReport = false;
      _log.logI('End edit submit');
    }
  }

  //---(ClearDelete)---//

  Future<void> _onClearDeleteSuccess(Emitter<WorkRequirementState> emit) async {
    emit(
      state.copyWith(isDeleting: false, deleteSuccess: false, message: null),
    );
  }

  //---(Delete)---//

  Future<void> _onDeleteRequirement(
    Emitter<WorkRequirementState> emit,
    List<int> ids,
  ) async {
    emit(state.copyWith(isDeleting: true, deleteSuccess: false, message: null));

    final res = await _workRequirementRepo.deleteWorkRequirement(ids);

    await res.fold(
      (err) async {
        _log.logE('Delete work requirement failed: $err');
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
        _log.logI('Delete work requirement success - ids: $ids');
        final updatedItems = state.items
            .where((e) => !ids.contains(e.id))
            .toList();
        emit(
          state.copyWith(
            isDeleting: false,
            deleteSuccess: true,
            status: BaseStateStatus.success,
            message: 'Xoa yeu cau thanh cong',
            items: updatedItems,
          ),
        );
      },
    );
  }

  //---(Helper)---//

  Map<String, dynamic> _buildSubmitPayload({
    required dynamic user,
    required int approvedTBPId,
    required DateTime dateRequest,
    required DateTime deadlineRequest,
    required int requiredDepartmentId,
    int? coordinationDepartmentId,
    required List<WorkRequirementDetailItem> details,
  }) {
    final detailsPayload = <Map<String, dynamic>>[];
    for (final detail in details) {
      detailsPayload.add(<String, dynamic>{
        'ID': 0,
        'JobRequirementID': 0,
        'STT': detail.rowIndex,
        'Category': detail.title,
        'Description': detail.explanation,
        'Target': detail.target,
        'Note': detail.note ?? '',
        'IsDeleted': false,
      });
    }

    return <String, dynamic>{
      'ID': 0,
      'NumberRequest': '',
      'DateRequest': dateRequest.toIso8601String(),
      'DeadlineRequest': deadlineRequest.toIso8601String(),
      'EmployeeID': user.employeeId ?? 0,
      'CoordinationDepartmentID': coordinationDepartmentId ?? 0,
      'RequiredDepartmentID': requiredDepartmentId,
      'ApprovedTBPID': approvedTBPId,
      'IsApprovedTBP': false,
      'DateApprovedTBP': null,
      'IsApprovedHR': false,
      'DateApprovedHR': null,
      'ApprovedHRID': null,
      'IsApprovedBGD': false,
      'DateApprovedBGD': null,
      'ApprovedBGDID': null,
      'EvaluateCompletion': '',
      'IsDeleted': false,
      'CreatedBy': '',
      'CreatedDate': DateTime.now().toUtc().toIso8601String(),
      'UpdatedBy': '',
      'UpdatedDate': DateTime.now().toUtc().toIso8601String(),
      'IsRequestBuy': false,
      'Status': 0,
      'Note': '',
      'IsRequestBGDApproved': false,
      'IsRequestPriceQuote': false,
      'JobRequirementDetails': detailsPayload,
      'JobRequirementFiles': <dynamic>[],
    };
  }

  Map<String, dynamic> _buildEditPayload({
    required int id,
    required dynamic user,
    required int approvedTBPId,
    required DateTime dateRequest,
    required DateTime deadlineRequest,
    required int requiredDepartmentId,
    int? coordinationDepartmentId,
    required List<WorkRequirementDetailItem> details,
  }) {
    final detailsPayload = <Map<String, dynamic>>[];
    for (final detail in details) {
      detailsPayload.add(<String, dynamic>{
        'ID': 0,
        'JobRequirementID': id,
        'STT': detail.rowIndex,
        'Category': detail.title,
        'Description': detail.explanation,
        'Target': detail.target,
        'Note': detail.note ?? '',
        'IsDeleted': false,
      });
    }

    return <String, dynamic>{
      'ID': id,
      'NumberRequest': '',
      'DateRequest': dateRequest.toIso8601String(),
      'DeadlineRequest': deadlineRequest.toIso8601String(),
      'EmployeeID': user.employeeId ?? 0,
      'CoordinationDepartmentID': coordinationDepartmentId ?? 0,
      'RequiredDepartmentID': requiredDepartmentId,
      'ApprovedTBPID': approvedTBPId,
      'IsApprovedTBP': false,
      'DateApprovedTBP': null,
      'IsApprovedHR': false,
      'DateApprovedHR': null,
      'ApprovedHRID': null,
      'IsApprovedBGD': false,
      'DateApprovedBGD': null,
      'ApprovedBGDID': null,
      'EvaluateCompletion': '',
      'IsDeleted': false,
      'CreatedBy': '',
      'CreatedDate': DateTime.now().toUtc().toIso8601String(),
      'UpdatedBy': '',
      'UpdatedDate': DateTime.now().toUtc().toIso8601String(),
      'IsRequestBuy': false,
      'Status': 0,
      'Note': '',
      'IsRequestBGDApproved': false,
      'IsRequestPriceQuote': false,
      'JobRequirementDetails': detailsPayload,
      'JobRequirementFiles': <dynamic>[],
    };
  }

  Map<int, Map<String, String>> _parseDetailValues(
    List<WorkRequirementDetailResponse> details,
  ) {
    final result = <int, Map<String, String>>{};
    // Map category name -> row index (0-based) matching _detailMetas order
    const categoryIndexMap = {
      'noi dung yeu cau': 0,
      'nguoi yeu cau': 1,
      'ly do': 2,
      'so luong': 3,
      'don vi tinh': 4,
      'chat luong': 5,
      'dia diem': 6,
      'thoi gian hoan thanh de nghi': 7,
    };
    for (final d in details) {
      final cat = (d.category ?? '').toLowerCase().trim();
      final idx = categoryIndexMap[cat] ?? ((d.stt ?? 1) - 1);
      result[idx] = {
        'explanation': d.description ?? '',
        'target': d.target ?? '',
        'note': d.note ?? '',
      };
    }
    return result;
  }
}
