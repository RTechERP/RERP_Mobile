import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../../common/utils/datetime_utils.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/in_out_model.dart';
import '../../data/repository/in_out_repo.dart';

part 'in_out_event.dart';
part 'in_out_state.dart';
part 'in_out_bloc.g.dart';
part 'in_out_bloc.freezed.dart';

@injectable
class InOutBloc extends BaseBloc<InOutEvent, InOutState> {
  final LogUtils _log;
  final AuthRepo _authRepo;

  final InOutRepo _InOutRepo;
  bool _isSubmittingReport = false;
  bool _isInitAddInFlight = false;

  InOutBloc(this._InOutRepo, this._authRepo, this._log)
    : super(InOutState.init()) {
    on<InOutEvent>((event, emit) async {
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

  Future<void> _onInitAdd(Emitter<InOutState> emit) async {
    // Chặn bắn API trùng khi UI render / init state gọi nhanh.
    if (_isInitAddInFlight) {
      _log.logI('ℹ️ initAdd skipped: request in-flight');
      return;
    }
    _isInitAddInFlight = true;
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
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
      final employeeID = user.employeeId;

      final fillApproverRes = await _InOutRepo.getFillApprover(
        employeeID: employeeID,
        tableName: 'EmployeeEarlyLate',
      );
      await fillApproverRes.fold(
            (l) async {
          _log.logE('❌ Get approverID failed: $l');
          emit(
            state.copyWith(
              status: BaseStateStatus.failed,
              // message: l.getErrorMessage,
            ),
          );
        },
            (r) async {
          _log.logI('✅ Get approverID success');
          emit(state.copyWith(status: BaseStateStatus.success, approveId: r));
        },
      );
      final approverRes = await _InOutRepo.getApprover();
      await approverRes.fold(
        (l) async {
          _log.logE('❌ Get approver failed: $l');
          emit(
            state.copyWith(
              status: BaseStateStatus.failed,
              message: l.getErrorMessage,
            ),
          );
        },
        (r) async {
          _log.logI('✅ Get approver success');
          emit(state.copyWith(status: BaseStateStatus.success, approvers: r));
        },
      );

      // Auto-fill loại + khung giờ mặc định cho form.
      // - Đi muộn: 08:00 → 09:00
      // - Về sớm: 16:30 → 17:30
      // Screen sẽ đọc state.suggestedType / suggestedFrom / suggestedTo
      // để setValue form → UI chắc chắn render text.
      const String defaultType = 'late_personal';
      const int lateFromH = 8, lateFromM = 0, lateToH = 9, lateToM = 0;

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      emit(state.copyWith(
        suggestedType: defaultType,
        suggestedFrom: DateTime(today.year, today.month, today.day, lateFromH, lateFromM),
        suggestedTo: DateTime(today.year, today.month, today.day, lateToH, lateToM),
      ));
    } finally {
      _isInitAddInFlight = false;
    }
  }

  Future<void> _onFetchApprovers(Emitter<InOutState> emit) async {
    final approverRes = await _InOutRepo.getApprover();
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

  Future<void> _onInit(Emitter<InOutState> emit) async {
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

        final res = await _InOutRepo.getInOut(payload: payload);

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
                inOut: r,
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
    Emitter<InOutState> emit, {
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

        final res = await _InOutRepo.getInOut(payload: payload);
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
                inOut: r,
                dateStart: effectiveStart,
                dateEnd: effectiveEnd,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onSubmit(
    Emitter<InOutState> emit, {
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
        "ID": 0,
        "ApprovedID": 0,
        "ApprovedTP": approvedTP,
        "DateEnd": toVnIso8601(dateEnd),
        "DateRegister": toVnIso8601(dateRegister),
        "DateStart": toVnIso8601(dateStart),
        "EmployeeID": employeeId,
        "IsApproved": false,
        "IsDeleted": false,
        "Reason": reason,
        "ReasonHREdit": "",
        "TimeRegister": timeRegister,
        "Type": type,
      };

      final saveRes = await _InOutRepo.saveInOut(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ Submit InOut API failed: $err');
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
          _log.logI('✅ Submit InOut success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              employeeId: employeeId,
              message: 'Tạo đơn đi muộn/về sớm thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Submit InOut exception: $e');
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
      _log.logI('🏁 End submit InOut');
    }
  }

  void _onClearSubmitState(Emitter<InOutState> emit) {
    emit(state.copyWith(submitSuccess: false, message: null));
  }

  Future<void> _onEditSubmit(
    Emitter<InOutState> emit, {
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

      final payload = <String, dynamic>{
        "ID": id,
        "ApprovedID": 0,
        "ApprovedTP": approvedTP,
        "DateEnd": toVnIso8601(dateEnd),
        "DateRegister": toVnIso8601(DateTime(
          dateStart.year,
          dateStart.month,
          dateStart.day,
          DateTime.now().hour,
          DateTime.now().minute,
          DateTime.now().second,
          DateTime.now().millisecond,
        )),
        "DateStart": toVnIso8601(dateStart),
        "EmployeeID": user.employeeId,
        "IsApproved": false,
        "IsDeleted": false,
        "Reason": reason,
        "ReasonHREdit": "",
        "TimeRegister": timeRegister,
        "Type": type,
      };

      final saveRes = await _InOutRepo.saveInOut(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ Edit InOut API failed: $err');
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
          final updatedInOut = state.inOut.map((e) {
            if (e.id != id) return e;
            return e.copyWith(
              type: type,
              approvedTP: approvedTP,
              dateStart: dateStart,
              dateEnd: dateEnd,
              timeRegister: timeRegister,
              reason: reason,
            );
          }).toList();

          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              inOut: updatedInOut,
              message: 'Cập nhật đơn đi muộn/về sớm thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Edit InOut exception: $e');
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
      _log.logI('🏁 End edit InOut');
    }
  }

  Future<void> _onCancelSubmit(
    Emitter<InOutState> emit, {
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

      final item = state.inOut.where((e) => e.id == id).toList().firstOrNull;
      final dateStart = item?.dateStart ?? DateTime.now();
      final dateEnd = item?.dateEnd ?? DateTime.now();

      final payload = <String, dynamic>{
        "ID": id,
        "ApprovedID": item?.approvedId ?? 0,
        "ApprovedTP": item?.approvedTP ?? 0,
        "DateEnd": toVnIso8601(dateEnd),
        "DateRegister": item?.dateRegister != null
            ? toVnIso8601(item!.dateRegister!)
            : toVnIso8601(DateTime.now()),
        "DateStart": toVnIso8601(dateStart),
        "EmployeeID": user.employeeId,
        "IsApproved": false,
        "IsDeleted": true,
        "Reason": item?.reason ?? '',
        "ReasonHREdit": item?.reasonHREdit ?? '',
        "TimeRegister": item?.timeRegister ?? 0,
        "Type": item?.type ?? 0,
      };

      final saveRes = await _InOutRepo.saveInOut(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ Cancel InOut API failed: $err');
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
          final updatedInOut = state.inOut.where((e) => e.id != id).toList();
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: true,
              status: BaseStateStatus.success,
              inOut: updatedInOut,
              message: null,
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Cancel InOut exception: $e');
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
      _log.logI('🏁 End cancel InOut');
    }
  }
}
