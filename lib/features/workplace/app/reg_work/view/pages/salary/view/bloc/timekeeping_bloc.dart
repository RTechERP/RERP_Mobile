import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/timekeeping_model.dart';
import '../../data/repository/timekeeping_repo.dart';

part 'timekeeping_event.dart';
part 'timekeeping_state.dart';
part 'timekeeping_bloc.g.dart';
part 'timekeeping_bloc.freezed.dart';

@injectable
class TimekeepingBloc extends BaseBloc<TimekeepingEvent, TimekeepingState> {
  final TimekeepingRepo _timekeepingRepo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  TimekeepingBloc(this._timekeepingRepo, this._authRepo, this._log)
      : super(TimekeepingState.init()) {
    on<TimekeepingEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeMonth: (month) => _onChangeMonth(emit, month),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  //---(Init)---//
  Future<void> _onInit(Emitter<TimekeepingState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final now = DateTime.now();
        final firstDay = DateTime(now.year, now.month, 1);
        final lastDay = DateTime(now.year, now.month + 1, 0);

        emit(state.copyWith(
          status: BaseStateStatus.success,
          employeeName: user?.fullName ?? 'Nguyễn Văn A',
          employeeCode: user?.code ?? 'NV001',
          departmentName: user?.departmentName ?? 'Phòng IT',
          selectedMonth: now,
          firstDayOfMonth: firstDay,
          lastDayOfMonth: lastDay,
          actualWorkDays: 22,
          holidayDays: 0,
          tetDays: 0,
          leaveDays: 2,
          privatePaidDays: 0,
          wfhDays: 1,
          paidWorkDays: 23,
          unpaidLeaveDays: 1,
          totalDays: 26,
          days: _generateMockDays(firstDay, lastDay),
        ));
      },
    );
  }

  //---(Filter)---//
  Future<void> _onChangeMonth(
    Emitter<TimekeepingState> emit,
    DateTime month,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);

    await Future.delayed(const Duration(milliseconds: 300));

    emit(state.copyWith(
      status: BaseStateStatus.success,
      selectedMonth: month,
      firstDayOfMonth: firstDay,
      lastDayOfMonth: lastDay,
      actualWorkDays: 22,
      holidayDays: 0,
      tetDays: 0,
      leaveDays: 2,
      privatePaidDays: 0,
      wfhDays: 1,
      paidWorkDays: 23,
      unpaidLeaveDays: 1,
      totalDays: 26,
      days: _generateMockDays(firstDay, lastDay),
    ));
  }

  Future<void> _onRefresh(Emitter<TimekeepingState> emit) async {
    final month = state.selectedMonth ?? DateTime.now();
    await _onChangeMonth(emit, month);
  }

  //---(Helper)---//
  List<TimekeepingDayItem> _generateMockDays(DateTime first, DateTime last) {
    final days = <TimekeepingDayItem>[];
    final leaveDays = {10, 15, 20};
    final futureDays = <int>{};
    for (var d = first;
        d.isBefore(last) || d.isAtSameMomentAs(last);
        d = d.add(const Duration(days: 1))) {
      final dow = d.weekday;
      final isWeekend = dow == 6 || dow == 7;
      final dayOfMonth = d.day;
      final now = DateTime.now();
      final isFuture = d.isAfter(DateTime(now.year, now.month, now.day));

      String? statusText;
      String? checkIn;

      if (isWeekend) {
        statusText = 'Nghỉ';
      } else if (leaveDays.contains(dayOfMonth)) {
        statusText = 'Phép';
      } else if (isFuture) {
        statusText = null;
      } else {
        checkIn = '08:02';
      }

      if (isFuture) futureDays.add(dayOfMonth);

      days.add(TimekeepingDayItem(
        date: d,
        dayOfWeek: dow,
        statusText: statusText,
        checkIn: checkIn,
        isLate: dayOfMonth == 3,
        isEarlyLeave: dayOfMonth == 18,
      ));
    }
    return days;
  }
}
