import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/overnight_model.dart';
import '../../data/repository/overnight_repo.dart';

part 'overnight_event.dart';
part 'overnight_state.dart';
part 'overnight_bloc.g.dart';
part 'overnight_bloc.freezed.dart';

(DateTime start, DateTime end) _calendarMonthBounds(DateTime anyDayInMonth) {
  final y = anyDayInMonth.year, m = anyDayInMonth.month;
  return (DateTime(y, m, 1), DateTime(y, m + 1, 0));
}

@injectable
class OvernightBloc extends BaseBloc<OvernightEvent, OvernightState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final OvernightRepo _overnightRepo;
  bool _isSubmittingReport = false;
  bool _isInitAddInFlight = false;

  OvernightBloc(this._overnightRepo, this._authRepo, this._log)
    : super(OvernightState.init()) {
    on<OvernightEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: () => _onInitAdd(emit),
        submitBatch: (approvedId, dateRegister, isProblem, slips) => _onSubmitBatch(
          emit,
          approvedId: approvedId,
          dateRegister: dateRegister,
          isProblem: isProblem,
          slips: slips,
        ),
        onCancelSubmit: (id) => _onCancelSubmit(emit, id: id),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        clearSubmitState: () async => _onClearSubmitState(emit),
        fetchDetail: (id) => _onFetchDetail(emit, id: id),
        submitEdit: (id, approvedId, dateRegister, isProblem) => _onSubmitEdit(
          emit,
          id: id,
          approvedId: approvedId,
          dateRegister: dateRegister,
          isProblem: isProblem,
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
      'DepartmentID': 0,
      'EmployeeID': 0,
      'IsApprove': -1,
      'Page': 1,
      'Size':1000,
    };
  }

  Future<void> _onInit(Emitter<OvernightState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('❌ OvernightBloc _onInit get user failed: $err');
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

        _log.logI('OvernightBloc _onInit payload: $payload');

        final res = await _overnightRepo.getOverNight(payload: payload);

        await res.fold(
          (l) async {
            _log.logE('❌ OvernightBloc _onInit API failed: $l');
            emit(
              state.copyWith(
                status: BaseStateStatus.failed,
                message: l.getErrorMessage,
              ),
            );
          },
          (r) async {
            _log.logI('✅ OvernightBloc _onInit success, total: ${r.length}');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                overnight: r,
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

  Future<void> _onInitAdd(Emitter<OvernightState> emit) async {
    if (_isInitAddInFlight) {
      _log.logI('ℹ️ OvernightBloc initAdd skipped: request in-flight');
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

      final approverRes = await _overnightRepo.getApprover();

      var approvers = <ApproverItem>[];
      String? errorMsg;

      approverRes.fold(
        (l) => errorMsg = l.getErrorMessage,
        (r) => approvers = r,
      );
      if (errorMsg != null) {
        _log.logE('❌ OvernightBloc initAdd getApprover failed: $errorMsg');
        emit(state.copyWith(status: BaseStateStatus.failed, message: errorMsg));
        return;
      }

      if (errorMsg != null) {
        _log.logE('❌ OvernightBloc initAdd getOvertimeType failed: $errorMsg');
        emit(state.copyWith(status: BaseStateStatus.failed, message: errorMsg));
        return;
      }

      _log.logI('✅ OvernightBloc initAdd success');
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          approvers: approvers,
          employeeId: user.employeeId,
          loginName: user.loginName,
        ),
      );
    } finally {
      _isInitAddInFlight = false;
    }
  }

  Future<void> _onChangeDateRange(
    Emitter<OvernightState> emit, {
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
        _log.logE('❌ OvernightBloc changeDateRange get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final payload = _overtimeListPayload(
          month: rangeStart.month,
          year: rangeStart.year,
        );

        final res = await _overnightRepo.getOverNight(payload: payload);
        await res.fold(
          (l) async {
            _log.logE('❌ OvernightBloc changeDateRange API failed: $l');
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
                overnight: r,
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
      Emitter<OvernightState> emit, {
        required int approvedId,
        required DateTime dateRegister,
        required bool isProblem,
        required List<OvernightSubmitSlip> slips,
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
            message: 'Không lấy được ID nhân viên',
          ),
        );
        return;
      }

      final dateRegisterStr =
      _toLocalIso8601(_normalizeToMinute(dateRegister));

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

        final start = _normalizeToMinute(slip.timeStart);
        final end = _normalizeToMinute(slip.endTime);

        final totalMinutes = end.difference(start).inMinutes;

        if (totalMinutes <= 0) {
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message:
              'Phiếu ${i + 1}: Thời gian kết thúc phải lớn hơn thời gian bắt đầu',
            ),
          );
          return;
        }

        final totalHours = totalMinutes / 60.0;
        final breaksTime = slip.breakHours;
        final workTime = totalHours - breaksTime;

        items.add({
          'ID': 0,
          'EmployeeID': employeeId,
          'ApprovedTBP': approvedId,
          'DateRegister': dateRegisterStr,
          'DateStart': _toLocalIso8601(start),
          'DateEnd': _toLocalIso8601(end),
          'TotalHours':
          totalHours % 1 == 0 ? totalHours.toInt() : totalHours,
          'BreaksTime': breaksTime,
          'Location': slip.location,
          'Note': slip.reason.isEmpty ? '' : slip.reason,
          'IsProblem': isProblem,
          'ReasonHREdit': '',
          'IsDeleted': false,
          'WorkTime': workTime,
          'IsApprovedTBP': 0,
          'IsApprovedHR': 0,
          'ApprovedHR': 0,
        });
      }

      _log.logI('OvernightBloc submitBatch payload: $items');

      final result = await _overnightRepo.saveOverNight(
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
          message: 'Tạo đơn làm đêm thành công',
        ),
      );
    } catch (e) {
      _log.logE('❌ OvernightBloc submitBatch exception: $e');

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
    Emitter<OvernightState> emit, {
    required int id,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

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
    //   final payload = <String, dynamic>{
    //     'EmployeeOvertimes': [
    //       <String, dynamic>{'ID': id, 'IsDeleted': true},
    //     ],
    //     'employeeOvertimeFile': <String, dynamic>{
    //       'ID': 0,
    //       'EmployeeOvertimeID': id,
    //       'FileName': null,
    //       'OriginPath': null,
    //       'ServerPath': null,
    //     },
    //   };
    //
    //   _log.logI('OvernightBloc cancelSubmit ID=$id payload: $payload');
    //
    //   final saveRes = await _overnightRepo.saveOverNight(payload: payload);
    //   await saveRes.fold(
    //     (err) async {
    //       _log.logE('❌ OvernightBloc cancelSubmit failed: $err');
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
    //       _log.logI('✅ OvernightBloc cancelSubmit success ID=$id');
    //       final updated = state.overtime.where((e) => e.id != id).toList();
    //       emit(
    //         state.copyWith(
    //           isDeleting: false,
    //           deleteSuccess: true,
    //           status: BaseStateStatus.success,
    //           overtime: updated,
    //           message: null,
    //         ),
    //       );
    //     },
    //   );
    // } catch (e) {
    //   _log.logE('❌ OvernightBloc cancelSubmit exception: $e');
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

  void _onClearSubmitState(Emitter<OvernightState> emit) {
    emit(
      state.copyWith(submitSuccess: false, editSuccess: false, message: null),
    );
  }

  Future<void> _onFetchDetail(
    Emitter<OvernightState> emit, {
    required int id,
  }) async {
    emit(
      state.copyWith(isFetchingDetail: true, message: null),
    );
    // try {
    //   final res = await _overnightRepo.getOvertimeById(id);
    //   res.fold(
    //         (err) {
    //       _log.logE('❌ OvernightBloc fetchDetail failed: $err');
    //       emit(state.copyWith(
    //         isFetchingDetail: false,
    //         message: err.getErrorMessage,
    //         status: BaseStateStatus.failed,
    //       ));
    //     },
    //         (item) {
    //       _log.logI('✅ OvernightBloc fetchDetail success: ${item.id}');
    //       emit(state.copyWith(isFetchingDetail: false, detailItem: item));
    //     },
    //   );
    // } catch (e) {
    //   _log.logE('❌ OvernightBloc fetchDetail exception: $e');
    //   emit(state.copyWith(
    //     isFetchingDetail: false,
    //     status: BaseStateStatus.failed,
    //     message: 'Không tải được chi tiết đơn',
    //   ));
    // }
  }

  Future<void> _onSubmitEdit(
    Emitter<OvernightState> emit, {
    required int id,
    required int approvedId,
    required DateTime dateRegister,
    required bool isProblem,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;
    // try {
    //   emit(
    //     state.copyWith(isSubmitting: true, editSuccess: false, message: null),
    //   );
    //
    //   int? employeeId = state.employeeId;
    //   if (employeeId == null || employeeId <= 0) {
    //     final userRes = await _authRepo.getCurrentUser();
    //     employeeId = userRes.fold((_) => null, (u) => u?.employeeId);
    //   }
    //   if (employeeId == null || employeeId <= 0) {
    //     emit(
    //       state.copyWith(
    //         isSubmitting: false,
    //         editSuccess: false,
    //         status: BaseStateStatus.failed,
    //         message: 'Không lấy được ID nhân viên, vui lòng thử lại',
    //       ),
    //     );
    //     return;
    //   }
    //
    //   final ts = _normalizeToMinute(slip.timeStart);
    //   final te = _normalizeToMinute(slip.endTime);
    //   final totalMinutes = te.difference(ts).inMinutes;
    //   final timeReality = totalMinutes % 60 == 0
    //       ? totalMinutes ~/ 60
    //       : totalMinutes / 60.0;
    //
    //   final slipObject = <String, dynamic>{
    //     'ID': id,
    //     'EmployeeID': employeeId,
    //     'ApprovedID': approvedId,
    //     'DateRegister': _toLocalIso8601(_normalizeToMinute(dateRegister)),
    //     'TimeStart': _toLocalIso8601(ts),
    //     'EndTime': _toLocalIso8601(te),
    //     'TimeReality': timeReality,
    //     'Location': slip.location,
    //     'ProjectID': slip.projectId ?? 0,
    //     'Overnight': slip.overnight,
    //     'CostOvernight': slip.overnight ? 30000 : 0,
    //     'TypeID': slip.typeId,
    //     'Reason': slip.reason.isEmpty ? ' ' : slip.reason,
    //     'IsProblem': isProblem,
    //     'IsApproved': false,
    //     'IsApprovedHR': false,
    //     'ApproveHR': 0,
    //     'IsDeleted': false,
    //   };
    //
    //   final payload = <String, dynamic>{
    //     'EmployeeOvertimes': [slipObject],
    //     'employeeOvertimeFile': <String, dynamic>{
    //       'ID': 0,
    //       'EmployeeOvertimeID': id,
    //       'FileName': fileInfo?['fileName'],
    //       'OriginPath': fileInfo?['originPath'],
    //       'ServerPath': null,
    //     },
    //   };
    //
    //   _log.logI('OvernightBloc submitEdit ID=$id payload: $payload');
    //
    //   final saveRes = await _overnightRepo.saveOverNight(payload: payload);
    //   saveRes.fold(
    //     (err) {
    //       _log.logE('❌ OvernightBloc submitEdit failed: $err');
    //       emit(
    //         state.copyWith(
    //           isSubmitting: false,
    //           editSuccess: false,
    //           status: BaseStateStatus.failed,
    //           message: err.getErrorMessage,
    //         ),
    //       );
    //     },
    //     (_) {
    //       _log.logI('✅ OvernightBloc submitEdit success ID=$id');
    //       emit(
    //         state.copyWith(
    //           isSubmitting: false,
    //           editSuccess: true,
    //           status: BaseStateStatus.success,
    //           message: 'Cập nhật đơn làm đêm thành công',
    //         ),
    //       );
    //     },
    //   );
    // } catch (e) {
    //   _log.logE('❌ OvernightBloc submitEdit exception: $e');
    //   emit(
    //     state.copyWith(
    //       isSubmitting: false,
    //       editSuccess: false,
    //       status: BaseStateStatus.failed,
    //       message: 'Có lỗi xảy ra khi cập nhật dữ liệu',
    //     ),
    //   );
    // } finally {
    //   _isSubmittingReport = false;
    // }
  }
}
