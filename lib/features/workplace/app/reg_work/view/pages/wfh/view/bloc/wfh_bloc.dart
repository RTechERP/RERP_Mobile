import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/wfh_model.dart';
import '../../data/repository/wfh_repo.dart';

part 'wfh_event.dart';
part 'wfh_state.dart';
part 'wfh_bloc.g.dart';
part 'wfh_bloc.freezed.dart';

@injectable
class WfhBloc extends BaseBloc<WfhEvent, WfhState> {
  final LogUtils _log;
  final AuthRepo _authRepo;

  final WfhRepo _WfhRepo;
  bool _isSubmittingReport = false;
  bool _isInitAddInFlight = false;

  WfhBloc(this._WfhRepo, this._authRepo, this._log)
      : super(WfhState.init()) {
    on<WfhEvent>((event, emit) async {
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

  Future<void> _onInitAdd(Emitter<WfhState> emit) async {
    // Chặn bắn API trùng khi UI render / init state gọi nhanh.
    if (_isInitAddInFlight) {
      _log.logI('ℹ️ initAdd skipped: request in-flight');
      return;
    }
    _isInitAddInFlight = true;
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));

      final approverRes = await _WfhRepo.getApprover();
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
    } finally {
      _isInitAddInFlight = false;
    }
  }

  Future<void> _onFetchApprovers(Emitter<WfhState> emit) async {
    final approverRes = await _WfhRepo.getApprover();
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

  Future<void> _onInit(Emitter<WfhState> emit) async {
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
          "page": 1,
          "size": 1000,
          "status": -1,
          "year": effectiveStart.year,
        };

        _log.logI('Payload: $payload'); // debug thêm

        final res = await _WfhRepo.getWfh(payload: payload);

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
                wfh: r,
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
      Emitter<WfhState> emit, {
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
          "page": 1,
          "size": 1000,
          "status": -1,
          "year": effectiveStart.year,
        };

        _log.logI('Payload: $payload');

        final res = await _WfhRepo.getWfh(payload: payload);
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
                wfh: r,
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
      Emitter<WfhState> emit, {
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

      final saveRes = await _WfhRepo.saveWfh(payload: payload);
      await saveRes.fold(
            (err) async {
          _log.logE('❌ Submit Wfh API failed: $err');
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
          _log.logI('✅ Submit Wfh success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              employeeId: employeeId,
              message: 'Tạo đơn ra/vào thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Submit Wfh exception: $e');
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
      _log.logI('🏁 End submit Wfh');
    }
  }

  void _onClearSubmitState(Emitter<WfhState> emit) {
    emit(state.copyWith(submitSuccess: false, message: null));
  }

  Future<void> _onEditSubmit(
      Emitter<WfhState> emit, {
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
        "DateEnd": dateEnd.toIso8601String(),
        "DateRegister": DateTime(
          dateStart.year,
          dateStart.month,
          dateStart.day,
          DateTime.now().hour,
          DateTime.now().minute,
          DateTime.now().second,
          DateTime.now().millisecond,
        ).toIso8601String(),
        "DateStart": dateStart.toIso8601String(),
        "EmployeeID": user.employeeId,
        "IsApproved": false,
        "IsDeleted": false,
        "Reason": reason,
        "ReasonHREdit": "",
        "TimeRegister": timeRegister,
        "Type": type,
      };

      final saveRes = await _WfhRepo.saveWfh(payload: payload);
      await saveRes.fold(
            (err) async {
          _log.logE('❌ Edit Wfh API failed: $err');
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
          final updatedWfh = state.wfh.map((e) {
            if (e.id != id) return e;
            return e.copyWith(

              reason: reason,
            );
          }).toList();

          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              wfh: updatedWfh,
              message: 'Cập nhật đơn ra/vào thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Edit Wfh exception: $e');
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
      _log.logI('🏁 End edit Wfh');
    }
  }

  Future<void> _onCancelSubmit(
      Emitter<WfhState> emit, {
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

      final payload = <String, dynamic>{
        "ID": id,
        "IsDeleted": true,
      };

      final saveRes = await _WfhRepo.saveWfh(payload: payload);
      await saveRes.fold(
            (err) async {
          _log.logE('❌ Cancel Wfh API failed: $err');
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
          final updatedWfh = state.wfh.where((e) => e.id != id).toList();
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: true,
              status: BaseStateStatus.success,
              wfh: updatedWfh,
              message: null,
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Cancel Wfh exception: $e');
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
      _log.logI('🏁 End cancel Wfh');
    }
  }
}
