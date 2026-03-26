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
        submit:
            (
              approvedId,
              dateWFH,
              timeWFH,
              totalDay,
              contentWork,
              reason,
              note,
            ) =>
                _onSubmit(
                  emit,
                  approvedId: approvedId,
                  dateWFH: dateWFH,
                  timeWFH: timeWFH,
                  totalDay: totalDay,
                  contentWork: contentWork,
                  reason: reason,
                  note: note,
                ),
        onCancelSubmit: (id) => _onCancelSubmit(emit, id: id),
        onEditSubmit:
            (
              id,
              approvedId,
              dateWFH,
              timeWFH,
              totalDay,
              contentWork,
              reason,
              note,
            ) =>
                _onEditSubmit(
                  emit,
                  id: id,
                  approvedId: approvedId,
                  dateWFH: dateWFH,
                  timeWFH: timeWFH,
                  totalDay: totalDay,
                  contentWork: contentWork,
                  reason: reason,
                  note: note,
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

  String? _validateWfhSubmit({
    required DateTime dateWFH,
    required String contentWork,
  }) {
    final dateOnly = DateTime(dateWFH.year, dateWFH.month, dateWFH.day);
    final today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    if (!dateOnly.isAfter(today)) {
      return 'Chỉ được đăng ký WFH cho các ngày sau hôm nay';
    }
    if (contentWork.trim().length < 10) {
      return 'Nội dung/kế hoạch công việc tối thiểu 10 ký tự';
    }
    return null;
  }

  Map<String, dynamic> _wfhSavePayload({
    required int id,
    required int employeeId,
    required int approvedId,
    required DateTime dateWFH,
    required int timeWFH,
    required double totalDay,
    required String contentWork,
    required String reason,
    String? note,
  }) {
    final d = dateWFH;
    final dateIso = DateTime.utc(d.year, d.month, d.day, 12).toIso8601String();
    return <String, dynamic>{
      'ID': id,
      'ApprovedBGDID': 0,
      'ApprovedHR': 0,
      'ApprovedID': approvedId,
      'ContentWork': contentWork.trim(),
      'DateApprovedBGD': null,
      'DateWFH': dateIso,
      'DecilineApprove': 0,
      'EmployeeID': employeeId,
      'EvaluateResults': '',
      'IsApproved': false,
      'IsApprovedBGD': false,
      'IsApprovedHR': false,
      'IsDeleted': false,
      'IsProblem': false,
      'Note': (note ?? '').trim(),
      'Reason': reason.trim(),
      'ReasonDeciline': '',
      'ReasonHREdit': '',
      'TimeWFH': timeWFH,
      'TotalDay': totalDay,
    };
  }

  Future<void> _onSubmit(
    Emitter<WfhState> emit, {
    required int approvedId,
    required DateTime dateWFH,
    required int timeWFH,
    required double totalDay,
    required String contentWork,
    required String reason,
    String? note,
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

      final validation = _validateWfhSubmit(
        dateWFH: dateWFH,
        contentWork: contentWork,
      );
      if (validation != null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: validation,
          ),
        );
        return;
      }

      final employeeId = user.employeeId;
      final payload = _wfhSavePayload(
        id: 0,
        employeeId: employeeId,
        approvedId: approvedId,
        dateWFH: dateWFH,
        timeWFH: timeWFH,
        totalDay: totalDay,
        contentWork: contentWork,
        reason: reason,
        note: note,
      );

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
              message: 'Tạo đơn WFH thành công',
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
    required int approvedId,
    required DateTime dateWFH,
    required int timeWFH,
    required double totalDay,
    required String contentWork,
    required String reason,
    String? note,
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

      final validation = _validateWfhSubmit(
        dateWFH: dateWFH,
        contentWork: contentWork,
      );
      if (validation != null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: validation,
          ),
        );
        return;
      }

      final payload = _wfhSavePayload(
        id: id,
        employeeId: user.employeeId,
        approvedId: approvedId,
        dateWFH: dateWFH,
        timeWFH: timeWFH,
        totalDay: totalDay,
        contentWork: contentWork,
        reason: reason,
        note: note,
      );

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
              reason: reason.trim(),
              contentWork: contentWork.trim(),
              note: (note ?? '').trim(),
              dateWFH: dateWFH,
              timeWFH: timeWFH,
              totalDay: totalDay,
              approvedId: approvedId,
            );
          }).toList();

          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              wfh: updatedWfh,
              message: 'Cập nhật đơn WFH thành công',
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
