import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/enums/role_enum.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../../common/services/permissions/role_resolver.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/leave_model.dart';
import '../../data/repository/leave_repo.dart';

part 'leave_event.dart';
part 'leave_state.dart';
part 'leave_bloc.g.dart';
part 'leave_bloc.freezed.dart';

@injectable
class LeaveBloc extends BaseBloc<LeaveEvent, LeaveState> {
  final LogUtils _log;
  final AuthRepo _authRepo;

  final LeaveRepo _leaveRepo;
  bool _isSubmittingReport = false;
  bool _isInitAddInFlight = false;

  LeaveBloc(this._leaveRepo, this._authRepo, this._log)
      : super(LeaveState.init()) {
    on<LeaveEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: () => _onInitAdd(emit),
        fetchApprovers: () => _onFetchApprovers(emit),
        submit: (type, approvedTP, dateStart, dateEnd, timeRegister, reason) =>
            _onSubmit(
              emit,
              type: type,
              approvedTP: approvedTP,
              dateStart: dateStart,
              dateEnd: dateEnd,
              timeRegister: timeRegister,
              reason: reason,
            ),
        submitBatch: (approvedTP, slips) =>
            _onSubmitBatch(emit, approvedTP: approvedTP, slips: slips),
        onCancelSubmit: (id) => _onCancelSubmit(emit, id: id),
        onEditSubmit:
            (id, type, approvedTP, dateStart, dateEnd, timeRegister, reason) =>
            _onEditSubmit(
              emit,
              id: id,
              type: type,
              approvedTP: approvedTP,
              dateStart: dateStart,
              dateEnd: dateEnd,
              timeRegister: timeRegister,
              reason: reason,
            ),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        clearSubmitState: () async => _onClearSubmitState(emit),
      );
    });
  }

  Future<void> _onInitAdd(Emitter<LeaveState> emit) async {
    // Chặn bắn API trùng khi UI render / init state gọi nhanh.
    if (_isInitAddInFlight) {
      _log.logI('ℹ️ initAdd skipped: request in-flight');
      return;
    }
    _isInitAddInFlight = true;
    try {
      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.fold((_) => null, (u) => u);
      if (user == null) {
        _log.logE('❌ initAdd: no current user');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      final roles = RoleResolver.resolve(user);
      final skipDateRules = roles.contains(AppRole.admin) ||
          roles.contains(AppRole.hr);

      final todayStart = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

      final approverRes = await _leaveRepo.getApprover();
      final leaveTimeRes = await _leaveRepo.getLeaveTimeItem(
        dateStart: todayStart,
        employeeId: user.employeeId,
      );

      BaseError? err;
      List<ApproverItem> approvers = [];
      List<LeaveTimeItem> leaveTimeItems = [];

      approverRes.fold(
        (l) => err = l,
        (r) => approvers = r,
      );
      if (err != null) {
        _log.logE('❌ Get approver failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err!.getErrorMessage,
          ),
        );
        return;
      }

      leaveTimeRes.fold(
        (l) => err = l,
        (r) => leaveTimeItems = r,
      );
      if (err != null) {
        _log.logE('❌ Get leave time failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err!.getErrorMessage,
          ),
        );
        return;
      }

      _log.logI('✅ initAdd: approver + leaveTime success');
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          approvers: approvers,
          leaveTime: leaveTimeItems,
          employeeId: user.employeeId,
          loginName: user.loginName,
          departmentName: user.departmentName,
          employeeDisplayLine: '${user.code} - ${user.fullName}'.trim(),
          skipLeaveDateConstraints: skipDateRules,
        ),
      );
    } finally {
      _isInitAddInFlight = false;
    }
  }

  Future<void> _onFetchApprovers(Emitter<LeaveState> emit) async {
    final approverRes = await _leaveRepo.getApprover();
    await approverRes.fold(
          (l) async {
        _log.logE('❌ fetchApprovers failed: $l');
        emit(state.copyWith(message: l.getErrorMessage));
      },
          (r) async {
        _log.logI('✅ fetchApprovers success');
        emit(state.copyWith(approvers: r));
      },
    );
  }

  Future<void> _onInit(Emitter<LeaveState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
          (err) async {
        _log.logE('❌ Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
          (user) async {
        final now = DateTime.now();
        final todayStart = DateTime(now.year, now.month, now.day);
        final tomorrow = todayStart.add(const Duration(days: 1));

        final startCandidate = state.dateStart ?? todayStart;
        final endCandidate = state.dateEnd ?? tomorrow;

        // Chuẩn hoá thứ tự (tránh trường hợp user/flow set ngược).
        final effectiveStart = startCandidate.isAfter(endCandidate)
            ? endCandidate
            : startCandidate;
        final effectiveEnd = startCandidate.isAfter(endCandidate)
            ? startCandidate
            : endCandidate;

        // Payload theo contract API (filter theo month/year).
        final payload = <String, dynamic>{
          "IDApprovedTP": 0,
          "departmentId": 0,
          "keyWord": '',
          "month": effectiveStart.month,
          "pageNumber": 1,
          "pageSize": 1000,
          "status": -1,
          "year": effectiveStart.year,
        };

        _log.logI('Payload: $payload'); // debug thêm

        final res = await _leaveRepo.getLeave(payload: payload);

        await res.fold(
              (l) async {
            _log.logE('❌ API failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
              (r) async {
            _log.logI('✅ API success - total: $r');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                leave: r,
                dateStart: effectiveStart,
                dateEnd: effectiveEnd,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onChangeDateRange(
      Emitter<LeaveState> emit, {
        required DateTime dateStart,
        required DateTime dateEnd,
      }) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    // Chuẩn hoá thứ tự (nếu user chọn ngược).
    final effectiveStart = start.isAfter(end) ? end : start;
    final effectiveEnd = start.isAfter(end) ? start : end;

    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        dateStart: effectiveStart,
        dateEnd: effectiveEnd,
      ),
    );

    final userRes = await _authRepo.getCurrentUser();
    await userRes.fold(
          (err) async {
        _log.logE('❌ Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
          (user) async {
        final payload = <String, dynamic>{
          "IDApprovedTP": 0,
          "departmentId": 0,
          "keyWord": '',
          "month": effectiveStart.month,
          "pageNumber": 1,
          "pageSize": 10000,
          "status": -1,
          "year": effectiveStart.year,
        };

        _log.logI('Payload: $payload');

        final res = await _leaveRepo.getLeave(payload: payload);
        await res.fold(
              (l) async {
            _log.logE('❌ API failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
              (r) async {
            _log.logI('✅ API success - total: $r');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                leave: r,
                dateStart: effectiveStart,
                dateEnd: effectiveEnd,
              ),
            );
          },
        );
      },
    );
  }

  Future<Either<BaseError, void>> _saveLeaveRecord({
    required int employeeId,
    int id = 0,
    required int type,
    required int approvedTP,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int timeRegister,
    required String reason,
  }) async {
    final now = DateTime.now();
    final dateRegister = DateTime(
      dateStart.year,
      dateStart.month,
      dateStart.day,
      now.hour,
      now.minute,
      now.second,
      now.millisecond,
    );
    final payload = <String, dynamic>{
      "ID": id,
      "ApprovedID": 0,
      "ApprovedTP": approvedTP,
      "DateEnd": dateEnd.toIso8601String(),
      "DateRegister": dateRegister.toIso8601String(),
      "DateStart": dateStart.toIso8601String(),
      "EmployeeID": employeeId,
      "IsApproved": false,
      "IsDeleted": false,
      "Reason": reason,
      "ReasonHREdit": "",
      "TimeRegister": timeRegister,
      "Type": type,
    };
    return _leaveRepo.saveMultiLeave(payload: payload);
  }

  /// Body save-data: Phase (tổng ngày + đăng ký) + Details (từng phiếu).
  /// Buổi: 1 sáng 8–12h, 2 chiều 13:30–17:30, 3 cả ngày 8–17:30.
  Map<String, dynamic> _leaveSubmitBody({
    required int employeeId,
    required int approvedTP,
    required List<LeaveAddSlip> slips,
  }) {
    final details = <Map<String, dynamic>>[];
    var totalDayPhase = 0.0;

    for (final s in slips) {
      final y = s.date.year, m = s.date.month, d = s.date.day;
      late DateTime start, end;
      late int totalTime;
      late double dayFrac;
      switch (s.timeRegister) {
        case 1:
          start = DateTime(y, m, d, 8);
          end = DateTime(y, m, d, 12);
          totalTime = 4;
          dayFrac = 0.5;
          break;
        case 2:
          start = DateTime(y, m, d, 13, 30);
          end = DateTime(y, m, d, 17, 30);
          totalTime = 4;
          dayFrac = 0.5;
          break;
        default:
          start = DateTime(y, m, d, 8);
          end = DateTime(y, m, d, 17, 30);
          totalTime = 8;
          dayFrac = 1;
      }
      totalDayPhase += dayFrac;

      details.add({
        'ID': 0,
        'StartDate': start.toIso8601String(),
        'EndDate': end.toIso8601String(),
        'TimeOnLeave': s.timeRegister,
        'Type': s.type,
        'TypeIsReal': s.type,
        'Reason': s.reason,
        'EmployeeID': employeeId,
        'ApprovedTP': approvedTP,
        'TotalTime': totalTime,
        'TotalDay': dayFrac,
        'IsApprovedTP': false,
        'IsApprovedHR': false,
        'IsCancelTP': false,
        'DeleteFlag': false,
      });
    }

    return {
      'Phase': {
        'ID': 0,
        'Code': '',
        'EmployeeID': employeeId,
        'DateRegister': DateTime.now().toIso8601String(),
        'Reason': '',
        'TotalDay': totalDayPhase,
        'IsDeleted': false,
      },
      'Details': details,
      'IsPartialUpdate': false,
    };
  }

  Future<void> _onSubmitBatch(
    Emitter<LeaveState> emit, {
    required int approvedTP,
    required List<LeaveAddSlip> slips,
  }) async {
    if (_isSubmittingReport || slips.isEmpty) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      if (user == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      final employeeId = user.employeeId;
      final payload = _leaveSubmitBody(
        employeeId: employeeId,
        approvedTP: approvedTP,
        slips: slips,
      );
      final saveRes = await _leaveRepo.saveMultiLeave(payload: payload);

      await saveRes.fold(
        (err) async {
          _log.logE('❌ Submit Leave batch failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          _log.logI('✅ Submit Leave batch success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              employeeId: employeeId,
              message: 'Tạo đơn xin nghỉ thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Submit Leave batch exception: $e');
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
      _log.logI('🏁 End submit Leave batch');
    }
  }

  Future<void> _onSubmit(
      Emitter<LeaveState> emit, {
        required int type,
        required int approvedTP,
        required DateTime dateStart,
        required DateTime dateEnd,
        required int timeRegister,
        required String reason,
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
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      final employeeId = user.employeeId;
      final saveRes = await _saveLeaveRecord(
        employeeId: employeeId,
        id: 0,
        type: type,
        approvedTP: approvedTP,
        dateStart: dateStart,
        dateEnd: dateEnd,
        timeRegister: timeRegister,
        reason: reason,
      );

      await saveRes.fold(
        (err) async {
          _log.logE('❌ Submit Leave API failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          _log.logI('✅ Submit Leave success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              employeeId: employeeId,
              message: 'Tạo đơn xin nghỉ thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Submit Leave exception: $e');
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
      _log.logI('🏁 End submit Leave');
    }
  }

  void _onClearSubmitState(Emitter<LeaveState> emit) {
    emit(state.copyWith(submitSuccess: false, message: null));
  }

  Future<void> _onEditSubmit(
      Emitter<LeaveState> emit, {
        required int id,
        required int type,
        required int approvedTP,
        required DateTime dateStart,
        required DateTime dateEnd,
        required int timeRegister,
        required String reason,
      }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(
          isSubmitting: true,
          submitSuccess: false,
          message: null,
          deleteSuccess: false,
          isDeleting: false,
        ),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      final saveRes = await _saveLeaveRecord(
        employeeId: user.employeeId,
        id: id,
        type: type,
        approvedTP: approvedTP,
        dateStart: dateStart,
        dateEnd: dateEnd,
        timeRegister: timeRegister,
        reason: reason,
      );
      await saveRes.fold(
            (err) async {
          _log.logE('❌ Edit Leave API failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
            (_) async {
          final updatedLeave = state.leave.map((e) {
            if (e.id != id) return e;
            return e.copyWith(
              type: type,
              approvedTP: approvedTP,
              reason: reason,
            );
          }).toList();

          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              leave: updatedLeave,
              message: 'Cập nhật đơn xin nghỉ thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Edit Leave exception: $e');
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
      _log.logI('🏁 End edit Leave');
    }
  }

  Future<void> _onCancelSubmit(
      Emitter<LeaveState> emit, {
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

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        emit(
          state.copyWith(
            isDeleting: false,
            deleteSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Có lỗi xảy ra khi gửi dữ liệu',
          ),
        );
        return;
      }

      final item = state.leave.where((e) => e.id == id).toList().firstOrNull;
      final dateStart = item?.startDate ?? DateTime.now();
      final dateEnd = item?.dateCancel ?? DateTime.now();

      final payload = <String, dynamic>{
        "ID": id,
        // "ApprovedID": item?. ?? 0,
        "ApprovedTP": item?.approvedTP ?? 0,
        "DateEnd": dateEnd.toIso8601String(),
        "DateStart": dateStart.toIso8601String(),
        "EmployeeID": user.employeeId,
        "IsApproved": false,
        "IsDeleted": true,
        "Reason": item?.reason ?? '',
        "ReasonHREdit": item?.reasonHREdit ?? '',
        "Type": item?.type ?? 0,
      };

      final saveRes = await _leaveRepo.saveMultiLeave(payload: payload);
      await saveRes.fold(
            (err) async {
          _log.logE('❌ Cancel Leave API failed: $err');
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
          final updatedLeave = state.leave.where((e) => e.id != id).toList();
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: true,
              status: BaseStateStatus.success,
              leave: updatedLeave,
              message: null,
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Cancel Leave exception: $e');
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
      _log.logI('🏁 End cancel Leave');
    }
  }
}