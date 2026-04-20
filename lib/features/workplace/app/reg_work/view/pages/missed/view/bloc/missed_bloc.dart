import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/missed_model.dart';
import '../../data/repository/missed_repo.dart';

part 'missed_event.dart';
part 'missed_state.dart';
part 'missed_bloc.g.dart';
part 'missed_bloc.freezed.dart';

@injectable
class MissedBloc extends BaseBloc<MissedEvent, MissedState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final MissedRepo _missedRepo;
  bool _isSubmittingReport = false;
  bool _isInitAddInFlight = false;

  MissedBloc(this._missedRepo, this._authRepo, this._log)
    : super(MissedState.init()) {
    on<MissedEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: () => _onInitAdd(emit),
        fetchApprovers: () => _onFetchApprovers(emit),
        submit:
            (
              approvedId,
              dateMissed,
              timeMissed,
              totalDay,
              contentWork,
              reason,
              note,
            ) => _onSubmit(
              emit,
              approvedId: approvedId,
              dateMissed: dateMissed,
              timeMissed: timeMissed,
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
              dateMissed,
              timeMissed,
              totalDay,
              contentWork,
              reason,
              note,
            ) => _onEditSubmit(
              emit,
              id: id,
              approvedId: approvedId,
              dateMissed: dateMissed,
              timeMissed: timeMissed,
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

  Future<void> _onInitAdd(Emitter<MissedState> emit) async {
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
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      final approverRes = await _missedRepo.getApprover();
      final fillApproverRes = await _missedRepo.getFillApprover(
        employeeID: user.employeeId,
        tableName: 'EmployeeNoFingerprint',
      );

      FillApproverItem? fillApprover;
      List<ApproverItem> approvers = [];
      String? errorMsg;

      approverRes.fold(
        (l) => errorMsg = l.getErrorMessage,
        (r) => approvers = r,
      );

      if (errorMsg != null) {
        _log.logE('❌ Get approver failed: $errorMsg');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: errorMsg,
          ),
        );
        return;
      }

      fillApproverRes.fold(
        (l) => _log.logE('❌ Get fill approver failed: $l'),
        (r) => fillApprover = r,
      );

      _log.logI('✅ Get init add success');
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          approvers: approvers,
          approveId: fillApprover,
        ),
      );
    } finally {
      _isInitAddInFlight = false;
    }
  }

  Future<void> _onFetchApprovers(Emitter<MissedState> emit) async {
    final approverRes = await _missedRepo.getApprover();
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

  /// `yyyy-MM-dd` cho API danh sách missed.
  String _missedListDateIso(DateTime d) {
    return '${d.year.toString().padLeft(4, '0')}-'
        '${d.month.toString().padLeft(2, '0')}-'
        '${d.day.toString().padLeft(2, '0')}';
  }

  Map<String, dynamic> _missedListPayload({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) {
    return <String, dynamic>{
      'DateStart': _missedListDateIso(dateStart),
      'DateEnd': _missedListDateIso(dateEnd),
      'DepartmentID': 0,
      'EmployeeID': 0,
      'IDApprovedTP': 0,
      'KeyWord': '',
      'Page': 1,
      'Size': 1000,
      'Status': -1,
    };
  }

  Future<void> _onInit(Emitter<MissedState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('❌ Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final now = DateTime.now();
        // Init luôn tải đủ dữ liệu trong tháng hiện tại (theo lịch máy).
        final monthStart = DateTime(now.year, now.month, 1);
        final monthEnd = DateTime(now.year, now.month + 1, 0);

        final payload = _missedListPayload(
          dateStart: monthStart,
          dateEnd: monthEnd,
        );

        _log.logI('Payload: $payload'); // debug thêm

        final res = await _missedRepo.getMissed(payload: payload);

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
                missed: r,
                dateStart: monthStart,
                dateEnd: monthEnd,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onChangeDateRange(
    Emitter<MissedState> emit, {
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
        final payload = _missedListPayload(
          dateStart: effectiveStart,
          dateEnd: effectiveEnd,
        );

        _log.logI('Payload: $payload');

        final res = await _missedRepo.getMissed(payload: payload);
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
                missed: r,
                dateStart: effectiveStart,
                dateEnd: effectiveEnd,
              ),
            );
          },
        );
      },
    );
  }

  /// `timeMissed`: phút trong ngày (ví dụ 8:00 → 480) để ghép vào [dateMissed] → `DayWork` UTC ISO.
  DateTime _dayWorkUtc(DateTime dateMissed, int timeMissed) {
    final d = DateTime(dateMissed.year, dateMissed.month, dateMissed.day);
    final h = timeMissed ~/ 60;
    final m = timeMissed % 60;
    return DateTime.utc(d.year, d.month, d.day, h, m);
  }

  /// Loại đơn: UI có thể truyền `check_in` / `check_out` qua [contentWork], hoặc [totalDay].round() là 1/2.
  int _missedTypeFromEvent(String contentWork, double totalDay) {
    switch (contentWork.trim()) {
      case 'check_out':
        return 2;
      case 'check_in':
        return 1;
      default:
        final t = totalDay.round();
        if (t == 2) return 2;
        return 1;
    }
  }

  /// Payload save theo contract API (ApprovedTP, DayWork, EmployeeID, ID, Note, ReasonHREdit, Type).
  Map<String, dynamic> _missedSavePayload({
    required int id,
    required int employeeId,
    required int approvedTP,
    required DateTime dayWorkUtc,
    required int type,
    String? note,
    required String reasonHREdit,
  }) {
    return <String, dynamic>{
      'ApprovedTP': approvedTP,
      'DayWork': dayWorkUtc.toIso8601String(),
      'EmployeeID': employeeId,
      'ID': id,
      'Note': (note ?? '').trim(),
      'ReasonHREdit': reasonHREdit.trim(),
      'Type': type,
    };
  }

  /// Map tham số event/UI → đúng [_missedSavePayload] + metadata cập nhật list sau edit.
  ({
    Map<String, dynamic> payload,
    DateTime dayWorkUtc,
    int type,
  }) _prepareMissedSavePayload({
    required int id,
    required int employeeId,
    required int approvedTP,
    required DateTime dateMissed,
    required int timeMissedMinutes,
    required double totalDay,
    required String contentWork,
    required String reasonHREdit,
    String? note,
  }) {
    final dayWorkUtc = _dayWorkUtc(dateMissed, timeMissedMinutes);
    final type = _missedTypeFromEvent(contentWork, totalDay);
    final payload = _missedSavePayload(
      id: id,
      employeeId: employeeId,
      approvedTP: approvedTP,
      dayWorkUtc: dayWorkUtc,
      type: type,
      note: note,
      reasonHREdit: reasonHREdit,
    );
    return (payload: payload, dayWorkUtc: dayWorkUtc, type: type);
  }

  /// Tạo mới: [User.employeeId]. Sửa: giữ [MissedItem.employeeId] nếu có (khớp bản ghi API).
  int _employeeIdForMissedRecord(int recordId, int currentUserEmployeeId) {
    if (recordId == 0) return currentUserEmployeeId;
    for (final e in state.missed) {
      if (e.id == recordId) return e.employeeId ?? currentUserEmployeeId;
    }
    return currentUserEmployeeId;
  }

  static const _duplicateMissedMessage = 'Đã tồn tại bản ghi quên chấm công';

  /// Gọi API check trùng. Trả về `true` nếu đã emit và **không** được phép save (lỗi API hoặc trùng).
  Future<bool> _missedDuplicateBlocksSave({
    required Emitter<MissedState> emit,
    required int duplicateContextId,
    required int employeeId,
    required DateTime dateMissed,
    required int type,
  }) async {
    final res = await _missedRepo.checkMissedDuplicate(
      contextId: duplicateContextId,
      employeeId: employeeId,
      dateMissed: dateMissed,
      type: type,
    );
    return res.fold(
      (err) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
        return true;
      },
      (isDuplicate) {
        if (!isDuplicate) return false;
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: _duplicateMissedMessage,
          ),
        );
        return true;
      },
    );
  }

  Future<void> _onSubmit(
    Emitter<MissedState> emit, {
    required int approvedId,
    required DateTime dateMissed,
    required int timeMissed,
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

      final employeeId = _employeeIdForMissedRecord(0, user.employeeId);
      final prepared = _prepareMissedSavePayload(
        id: 0,
        employeeId: employeeId,
        approvedTP: approvedId,
        dateMissed: dateMissed,
        timeMissedMinutes: timeMissed,
        totalDay: totalDay,
        contentWork: contentWork,
        reasonHREdit: reason,
        note: note,
      );

      if (await _missedDuplicateBlocksSave(
        emit: emit,
        duplicateContextId: 0,
        employeeId: employeeId,
        dateMissed: dateMissed,
        type: prepared.type,
      )) {
        return;
      }

      final saveRes =
          await _missedRepo.saveMissed(payload: prepared.payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ Submit Missed API failed: $err');
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
          _log.logI('✅ Submit Missed success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              employeeId: employeeId,
              message: 'Tạo đơn quên chấm công thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Submit Missed exception: $e');
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
      _log.logI('🏁 End submit Missed');
    }
  }

  void _onClearSubmitState(Emitter<MissedState> emit) {
    emit(state.copyWith(submitSuccess: false, message: null));
  }

  Future<void> _onEditSubmit(
    Emitter<MissedState> emit, {
    required int id,
    required int approvedId,
    required DateTime dateMissed,
    required int timeMissed,
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

      final employeeId =
          _employeeIdForMissedRecord(id, user.employeeId);
      final prepared = _prepareMissedSavePayload(
        id: id,
        employeeId: employeeId,
        approvedTP: approvedId,
        dateMissed: dateMissed,
        timeMissedMinutes: timeMissed,
        totalDay: totalDay,
        contentWork: contentWork,
        reasonHREdit: reason,
        note: note,
      );

      if (await _missedDuplicateBlocksSave(
        emit: emit,
        duplicateContextId: id,
        employeeId: employeeId,
        dateMissed: dateMissed,
        type: prepared.type,
      )) {
        return;
      }

      final saveRes =
          await _missedRepo.saveMissed(payload: prepared.payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ Edit Missed API failed: $err');
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
          final updatedMissed = state.missed.map((e) {
            if (e.id != id) return e;
            return e.copyWith(
              employeeId: employeeId,
              approvedTP: approvedId,
              dayWork: prepared.dayWorkUtc,
              note: (note ?? '').trim(),
              reasonHREdit: reason.trim(),
              type: prepared.type,
            );
          }).toList();

          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              missed: updatedMissed,
              message: 'Cập nhật đơn quên chấm công thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Edit Missed exception: $e');
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
      _log.logI('🏁 End edit Missed');
    }
  }

  Future<void> _onCancelSubmit(
    Emitter<MissedState> emit, {
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

      final payload = <String, dynamic>{"ID": id, "IsDeleted": true};

      final saveRes = await _missedRepo.saveMissed(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ Cancel Missed API failed: $err');
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
          final updatedMissed = state.missed.where((e) => e.id != id).toList();
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: true,
              status: BaseStateStatus.success,
              missed: updatedMissed,
              message: null,
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Cancel Missed exception: $e');
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
      _log.logI('🏁 End cancel Missed');
    }
  }
}
