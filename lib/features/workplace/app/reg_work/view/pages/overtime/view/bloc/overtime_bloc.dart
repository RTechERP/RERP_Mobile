import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../../common/services/permissions/role_groups.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/overtime_model.dart';
import '../../data/repository/overtime_repo.dart';

part 'overtime_event.dart';
part 'overtime_state.dart';
part 'overtime_bloc.g.dart';
part 'overtime_bloc.freezed.dart';

(DateTime start, DateTime end) _calendarMonthBounds(DateTime anyDayInMonth) {
  final y = anyDayInMonth.year, m = anyDayInMonth.month;
  return (DateTime(y, m, 1), DateTime(y, m + 1, 0));
}

@injectable
class OvertimeBloc extends BaseBloc<OvertimeEvent, OvertimeState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final OvertimeRepo _overtimeRepo;
  bool _isSubmittingReport = false;
  bool _isInitAddInFlight = false;

  OvertimeBloc(this._overtimeRepo, this._authRepo, this._log)
      : super(OvertimeState.init()) {
    on<OvertimeEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: () => _onInitAdd(emit),
        submitBatch: (approvedId, dateRegister, isProblem, slips, fileInfo) =>
            _onSubmitBatch(
              emit,
              approvedId: approvedId,
              dateRegister: dateRegister,
              isProblem: isProblem,
              slips: slips,
              fileInfo: fileInfo,
            ),
        onCancelSubmit: (id) => _onCancelSubmit(emit, id: id),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        clearSubmitState: () async => _onClearSubmitState(emit),
        fetchDetail: (id) => _onFetchDetail(emit, id: id),
        submitEdit: (id, approvedId, dateRegister, isProblem, slip, fileInfo) =>
            _onSubmitEdit(
              emit,
              id: id,
              approvedId: approvedId,
              dateRegister: dateRegister,
              isProblem: isProblem,
              slip: slip,
              fileInfo: fileInfo,
            ),
      );
    });
  }

  Map<String, dynamic> _overtimeListPayload({
    required int month,
    required int year,
  }) {
    // DateStart = đầu tháng (00:00:00 giờ địa phương) → chuyển sang UTC
    final dateStart = DateTime(year, month, 1).toUtc();
    // DateEnd = cuối ngày cuối tháng (23:59:59 UTC)
    final dateEnd = DateTime.utc(year, month + 1, 0, 23, 59, 59);
    return <String, dynamic>{
      'DateStart': dateStart.toIso8601String(),
      'DateEnd': dateEnd.toIso8601String(),
      'KeyWord': '',
      'EmployeeID': 0,
      'IsApprove': -1,
      'Type': 0,
    };
  }

  Future<void> _onInit(Emitter<OvertimeState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('❌ OvertimeBloc _onInit get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final now = DateTime.now();
        final (defaultStart, defaultEnd) = _calendarMonthBounds(now);

        late final DateTime rangeStart;
        late final DateTime rangeEnd;
        if (state.dateStart != null && state.dateEnd != null) {
          final a = state.dateStart!;
          final b = state.dateEnd!;
          final lo = a.isAfter(b) ? b : a;
          (rangeStart, rangeEnd) = _calendarMonthBounds(lo);
        } else {
          rangeStart = defaultStart;
          rangeEnd = defaultEnd;
        }

        final payload = _overtimeListPayload(
          month: rangeStart.month,
          year: rangeStart.year,
        );

        _log.logI('OvertimeBloc _onInit payload: $payload');

        final res = await _overtimeRepo.getOvertime(payload: payload);

        await res.fold(
          (l) async {
            _log.logE('❌ OvertimeBloc _onInit API failed: $l');
            emit(
              state.copyWith(
                status: BaseStateStatus.failed,
                message: l.getErrorMessage,
              ),
            );
          },
          (r) async {
            _log.logI('✅ OvertimeBloc _onInit success, total: ${r.length}');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                overtime: r,
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

  Future<void> _onInitAdd(Emitter<OvertimeState> emit) async {
    if (_isInitAddInFlight) {
      _log.logI('ℹ️ OvertimeBloc initAdd skipped: request in-flight');
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

      final isProjectRequired = DepartmentGroups.overtimeDepartmentID
          .contains(user.departmentId);

      final approverRes = await _overtimeRepo.getApprover();
      final typeRes = await _overtimeRepo.getOvertimeType();
      final projectRes = await _overtimeRepo.getOvertimeProject();
      final fillApproverRes = await _overtimeRepo.getFillApprover(
        employeeID: user.employeeId,
        tableName: 'EmployeeOverTime',
      );

      var approvers = <ApproverItem>[];
      var overtimeTypes = <OvertimeType>[];
      var overtimeProjects = <OvertimeProject>[];
      FillApproverItem? fillApprover;
      String? errorMsg;

      approverRes.fold(
        (l) => errorMsg = l.getErrorMessage,
        (r) => approvers = r,
      );
      if (errorMsg != null) {
        _log.logE('❌ OvertimeBloc initAdd getApprover failed: $errorMsg');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: errorMsg,
          ),
        );
        return;
      }

      typeRes.fold(
        (l) => errorMsg = l.getErrorMessage,
        (r) => overtimeTypes = r,
      );
      if (errorMsg != null) {
        _log.logE('❌ OvertimeBloc initAdd getOvertimeType failed: $errorMsg');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: errorMsg,
          ),
        );
        return;
      }

      projectRes.fold(
        (l) {
          _log.logE('❌ OvertimeBloc initAdd getProject failed: $l');
        },
        (r) => overtimeProjects = r,
      );

      fillApproverRes.fold(
        (l) => _log.logE('❌ OvertimeBloc initAdd getFillApprover failed: $l'),
        (r) => fillApprover = r,
      );

      _log.logI('✅ OvertimeBloc initAdd success');
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          approvers: approvers,
          overtimeTypes: overtimeTypes,
          overtimeProjects: overtimeProjects,
          employeeId: user.employeeId,
          loginName: user.loginName,
          approveId: fillApprover,
          isProjectRequired: isProjectRequired,
        ),
      );
    } finally {
      _isInitAddInFlight = false;
    }
  }

  Future<void> _onChangeDateRange(
    Emitter<OvertimeState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    final lo = start.isAfter(end) ? end : start;
    final (rangeStart, rangeEnd) = _calendarMonthBounds(lo);

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
        _log.logE('❌ OvertimeBloc changeDateRange get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final payload = _overtimeListPayload(
          month: rangeStart.month,
          year: rangeStart.year,
        );

        final res = await _overtimeRepo.getOvertime(payload: payload);
        await res.fold(
          (l) async {
            _log.logE('❌ OvertimeBloc changeDateRange API failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed, message: l.getErrorMessage));
          },
          (r) async {
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                overtime: r,
                dateStart: rangeStart,
                dateEnd: rangeEnd,
              ),
            );
          },
        );
      },
    );
  }

  static DateTime _normalizeToMinute(DateTime dt) =>
      DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute);

  /// Format DateTime thành ISO 8601 có timezone offset (VD: 2026-03-31T18:00:00.000+07:00)
  static String _toLocalIso8601(DateTime dt) {
    final local = dt.isUtc ? dt.toLocal() : dt;
    final offset = local.timeZoneOffset;
    final sign = offset.isNegative ? '-' : '+';
    final oh = offset.inHours.abs().toString().padLeft(2, '0');
    final om = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    final ms = local.millisecond.toString().padLeft(3, '0');
    return '${local.year.toString().padLeft(4, '0')}-'
        '${local.month.toString().padLeft(2, '0')}-'
        '${local.day.toString().padLeft(2, '0')}T'
        '${local.hour.toString().padLeft(2, '0')}:'
        '${local.minute.toString().padLeft(2, '0')}:'
        '${local.second.toString().padLeft(2, '0')}.'
        '$ms$sign$oh:$om';
  }

  Future<void> _onSubmitBatch(
    Emitter<OvertimeState> emit, {
    required int approvedId,
    required DateTime dateRegister,
    required bool isProblem,
    required List<OvertimeAddSlip> slips,
    Map<String, String?>? fileInfo,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
      );

      // Ưu tiên dùng employeeId đã fetch ở initAdd; fallback sang getCurrentUser.
      int? employeeId = state.employeeId;
      if (employeeId == null || employeeId <= 0) {
        final userRes = await _authRepo.getCurrentUser();
        employeeId = userRes.fold((_) => null, (u) => u?.employeeId);
      }
      if (employeeId == null || employeeId <= 0) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Không lấy được ID nhân viên, vui lòng thử lại',
          ),
        );
        return;
      }

      final dateRegisterStr = _toLocalIso8601(_normalizeToMinute(dateRegister));

      // Gọi API lần lượt từng phiếu
      for (var i = 0; i < slips.length; i++) {
        final s = slips[i];
        final ts = _normalizeToMinute(s.timeStart);
        final te = _normalizeToMinute(s.endTime);
        final totalMinutes = te.difference(ts).inMinutes;
        final timeReality =
            totalMinutes % 60 == 0 ? totalMinutes ~/ 60 : totalMinutes / 60.0;

        final slipObject = <String, dynamic>{
          'ID': 0,
          'EmployeeID': employeeId,
          'ApprovedID': approvedId,
          'DateRegister': dateRegisterStr,
          'TimeStart': _toLocalIso8601(ts),
          'EndTime': _toLocalIso8601(te),
          'TimeReality': timeReality,
          'Location': s.location,
          'ProjectID': s.projectId ?? 0,
          'Overnight': s.overnight,
          'CostOvernight': s.overnight ? 30000 : 0,
          'TypeID': s.typeId,
          'Reason': s.reason.isEmpty ? ' ' : s.reason,
          'IsProblem': isProblem,
          'IsApproved': false,
          'IsApprovedHR': false,
          'ApproveHR': 0,
          'IsDeleted': false,
        };

        final payload = <String, dynamic>{
          'EmployeeOvertimes': [slipObject],
          'employeeOvertimeFile': <String, dynamic>{
            'ID': 0,
            'EmployeeOvertimeID': 0,
            'FileName': fileInfo?['fileName'],
            'OriginPath': fileInfo?['originPath'],
            'ServerPath': null,
          },
        };

        _log.logI('OvertimeBloc submitBatch phiếu ${i + 1}/${ slips.length}: $payload');

        final saveRes = await _overtimeRepo.saveOvertime(payload: payload);
        final failed = saveRes.fold((err) => err, (_) => null);
        if (failed != null) {
          _log.logE('❌ OvertimeBloc submitBatch phiếu ${i + 1} failed: $failed');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: 'Phiếu ${i + 1}: ${failed.getErrorMessage}',
            ),
          );
          return;
        }
        _log.logI('✅ OvertimeBloc submitBatch phiếu ${i + 1} success');
      }

      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: true,
          status: BaseStateStatus.success,
          message: 'Tạo đơn làm thêm giờ thành công',
        ),
      );
    } catch (e) {
      _log.logE('❌ OvertimeBloc submitBatch exception: $e');
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
    Emitter<OvertimeState> emit, {
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

      final payload = <String, dynamic>{
        'EmployeeOvertimes': [
          <String, dynamic>{
            'ID': id,
            'IsDeleted': true,
          },
        ],
        'employeeOvertimeFile': <String, dynamic>{
          'ID': 0,
          'EmployeeOvertimeID': id,
          'FileName': null,
          'OriginPath': null,
          'ServerPath': null,
        },
      };

      _log.logI('OvertimeBloc cancelSubmit ID=$id payload: $payload');

      final saveRes = await _overtimeRepo.saveOvertime(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ OvertimeBloc cancelSubmit failed: $err');
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
          _log.logI('✅ OvertimeBloc cancelSubmit success ID=$id');
          final updated = state.overtime.where((e) => e.id != id).toList();
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: true,
              status: BaseStateStatus.success,
              overtime: updated,
              message: null,
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ OvertimeBloc cancelSubmit exception: $e');
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

  void _onClearSubmitState(Emitter<OvertimeState> emit) {
    emit(state.copyWith(submitSuccess: false, editSuccess: false, message: null));
  }

  Future<void> _onFetchDetail(
    Emitter<OvertimeState> emit, {
    required int id,
  }) async {
    emit(state.copyWith(isFetchingDetail: true, detailItem: null, message: null));
    try {
      final res = await _overtimeRepo.getOvertimeById(id);
      res.fold(
        (err) {
          _log.logE('❌ OvertimeBloc fetchDetail failed: $err');
          emit(state.copyWith(
            isFetchingDetail: false,
            message: err.getErrorMessage,
            status: BaseStateStatus.failed,
          ));
        },
        (item) {
          _log.logI('✅ OvertimeBloc fetchDetail success: ${item.id}');
          emit(state.copyWith(isFetchingDetail: false, detailItem: item));
        },
      );
    } catch (e) {
      _log.logE('❌ OvertimeBloc fetchDetail exception: $e');
      emit(state.copyWith(
        isFetchingDetail: false,
        status: BaseStateStatus.failed,
        message: 'Không tải được chi tiết đơn',
      ));
    }
  }

  Future<void> _onSubmitEdit(
    Emitter<OvertimeState> emit, {
    required int id,
    required int approvedId,
    required DateTime dateRegister,
    required bool isProblem,
    required OvertimeAddSlip slip,
    Map<String, String?>? fileInfo,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;
    try {
      emit(state.copyWith(isSubmitting: true, editSuccess: false, message: null));

      int? employeeId = state.employeeId;
      if (employeeId == null || employeeId <= 0) {
        final userRes = await _authRepo.getCurrentUser();
        employeeId = userRes.fold((_) => null, (u) => u?.employeeId);
      }
      if (employeeId == null || employeeId <= 0) {
        emit(state.copyWith(
          isSubmitting: false,
          editSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Không lấy được ID nhân viên, vui lòng thử lại',
        ));
        return;
      }

      final ts = _normalizeToMinute(slip.timeStart);
      final te = _normalizeToMinute(slip.endTime);
      final totalMinutes = te.difference(ts).inMinutes;
      final timeReality =
          totalMinutes % 60 == 0 ? totalMinutes ~/ 60 : totalMinutes / 60.0;

      final slipObject = <String, dynamic>{
        'ID': id,
        'EmployeeID': employeeId,
        'ApprovedID': approvedId,
        'DateRegister': _toLocalIso8601(_normalizeToMinute(dateRegister)),
        'TimeStart': _toLocalIso8601(ts),
        'EndTime': _toLocalIso8601(te),
        'TimeReality': timeReality,
        'Location': slip.location,
        'ProjectID': slip.projectId ?? 0,
        'Overnight': slip.overnight,
        'CostOvernight': slip.overnight ? 30000 : 0,
        'TypeID': slip.typeId,
        'Reason': slip.reason.isEmpty ? ' ' : slip.reason,
        'IsProblem': isProblem,
        'IsApproved': false,
        'IsApprovedHR': false,
        'ApproveHR': 0,
        'IsDeleted': false,
      };

      final payload = <String, dynamic>{
        'EmployeeOvertimes': [slipObject],
        'employeeOvertimeFile': <String, dynamic>{
          'ID': 0,
          'EmployeeOvertimeID': id,
          'FileName': fileInfo?['fileName'],
          'OriginPath': fileInfo?['originPath'],
          'ServerPath': null,
        },
      };

      _log.logI('OvertimeBloc submitEdit ID=$id payload: $payload');

      final saveRes = await _overtimeRepo.saveOvertime(payload: payload);
      saveRes.fold(
        (err) {
          _log.logE('❌ OvertimeBloc submitEdit failed: $err');
          emit(state.copyWith(
            isSubmitting: false,
            editSuccess: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ));
        },
        (_) {
          _log.logI('✅ OvertimeBloc submitEdit success ID=$id');
          emit(state.copyWith(
            isSubmitting: false,
            editSuccess: true,
            status: BaseStateStatus.success,
            message: 'Cập nhật đơn làm thêm giờ thành công',
          ));
        },
      );
    } catch (e) {
      _log.logE('❌ OvertimeBloc submitEdit exception: $e');
      emit(state.copyWith(
        isSubmitting: false,
        editSuccess: false,
        status: BaseStateStatus.failed,
        message: 'Có lỗi xảy ra khi cập nhật dữ liệu',
      ));
    } finally {
      _isSubmittingReport = false;
    }
  }
}
