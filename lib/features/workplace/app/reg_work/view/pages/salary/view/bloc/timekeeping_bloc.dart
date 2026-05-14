import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/salary_model.dart';
import '../../data/repository/salary_repo.dart';

part 'timekeeping_event.dart';
part 'timekeeping_state.dart';
part 'timekeeping_bloc.g.dart';
part 'timekeeping_bloc.freezed.dart';

@injectable
class TimekeepingBloc extends BaseBloc<TimekeepingEvent, TimekeepingState> {
  final SalaryRepo _salaryRepo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  TimekeepingBloc(
    this._salaryRepo,
    this._authRepo,
    this._log,
  ) : super(TimekeepingState.init()) {
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
          status: BaseStateStatus.loading,
          employeeName: user?.fullName,
          employeeCode: user?.code,
          departmentName: user?.departmentName,
          selectedMonth: now,
          firstDayOfMonth: firstDay,
          lastDayOfMonth: lastDay,
        ));

        await _fetchChamCong(emit, now.year, now.month);
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

    emit(state.copyWith(
      selectedMonth: month,
      firstDayOfMonth: firstDay,
      lastDayOfMonth: lastDay,
    ));

    await _fetchChamCong(emit, month.year, month.month);
  }

  Future<void> _onRefresh(Emitter<TimekeepingState> emit) async {
    final month = state.selectedMonth ?? DateTime.now();
    await _onChangeMonth(emit, month);
  }

  //---(Helper)---//
  Future<void> _fetchChamCong(
    Emitter<TimekeepingState> emit,
    int year,
    int month,
  ) async {
    final res = await _salaryRepo.getPersonalSyntheticByMonth(
      year: year,
      month: month,
    );

    await res.fold(
      (err) async {
        _log.logE('Get cham cong failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (data) async {
        _log.logI('Get cham cong success');

        final chamCong = data.listChamcong;
        final chamData = chamCong?.data;
        final chamDetails = chamCong?.detail;

        emit(state.copyWith(
          status: BaseStateStatus.success,
          chamCongData: chamData,
          chamCongDetails: chamDetails,
          totalDayActual: chamData?.totalDayActual?.toInt(),
          totalHoliday: chamData?.totalHoliday?.toDouble(),
          totalDayOnleave2: chamData?.totalDayOnleave2,
          totalDayWfh: chamData?.totalDayWfh,
          totalDayGet: chamData?.totalDayGet,
          totalDayOnleave1: chamData?.totalDayOnleave1,
          totalDay: chamData?.totalDay,
          totalDayOnleave3: chamData?.totalDayOnleave3,
          days: _buildDaysFromDetails(chamData, chamDetails),
        ));
      },
    );
  }

  List<TimekeepingDayItem> _buildDaysFromDetails(
    SalaryListChamCongData? chamData,
    List<SalaryListChamCongDetail>? details,
  ) {
    final month = state.selectedMonth?.month ?? DateTime.now().month;
    final year = state.selectedMonth?.year ?? DateTime.now().year;
    final lastDay = DateTime(year, month + 1, 0).day;

    final detailsByDay = <int, SalaryListChamCongDetail>{};
    if (details != null) {
      for (final d in details) {
        if (d.value != null) {
          detailsByDay[d.value!.day] = d;
        }
      }
    }

    final days = <TimekeepingDayItem>[];
    for (int day = 1; day <= lastDay; day++) {
      final detail = detailsByDay[day];
      final date = DateTime(year, month, day);
      final dow = date.weekday;

      days.add(TimekeepingDayItem(
        date: date,
        dayOfWeek: dow,
        status: detail?.statuswork,
        statusText: _statusTextFromDetail(detail),
        checkIn: _getDayValue(chamData, day),
        checkOut: null,
      ));
    }
    return days;
  }

  String? _getDayValue(SalaryListChamCongData? data, int day) {
    if (data == null) return null;
    switch (day) {
      case 1: return data.d1;
      case 2: return data.d2;
      case 3: return data.d3;
      case 4: return data.d4;
      case 5: return data.d5;
      case 6: return data.d6;
      case 7: return data.d7;
      case 8: return data.d8;
      case 9: return data.d9;
      case 10: return data.d10;
      case 11: return data.d11;
      case 12: return data.d12;
      case 13: return data.d13;
      case 14: return data.d14;
      case 15: return data.d15;
      case 16: return data.d16;
      case 17: return data.d17;
      case 18: return data.d18;
      case 19: return data.d19;
      case 20: return data.d20;
      case 21: return data.d21;
      case 22: return data.d22;
      case 23: return data.d23;
      case 24: return data.d24;
      case 25: return data.d25;
      case 26: return data.d26;
      case 27: return data.d27;
      case 28: return data.d28;
      case 29: return data.d29;
      case 30: return data.d30;
      case 31: return data.d31;
      default: return null;
    }
  }

  String? _statusTextFromDetail(SalaryListChamCongDetail? d) {
    if (d == null) return null;
    switch (d.statuswork) {
      case 1:
        return 'Di lam';
      case 2:
        return 'Nghi phep';
      case 3:
        return 'Nghi khong luong';
      case 4:
        return 'WFH';
      case 5:
        return 'Cong tac';
      case 6:
        return 'Le/Tet';
      default:
        return null;
    }
  }
}
