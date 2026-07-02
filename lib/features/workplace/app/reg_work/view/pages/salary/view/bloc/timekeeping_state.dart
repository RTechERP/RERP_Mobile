part of 'timekeeping_bloc.dart';

@CopyWith()
class TimekeepingState extends BaseBlocState {
  final String? employeeName;
  final String? employeeCode;
  final String? departmentName;
  final DateTime? selectedMonth;
  final DateTime? firstDayOfMonth;
  final DateTime? lastDayOfMonth;
  final SalaryListChamCongData? chamCongData;
  final List<SalaryListChamCongDetail>? chamCongDetails;
  final List<TimekeepingDayItem> days;
  final int? totalDayActual;
  final double? totalHoliday;
  final double? totalDayOnleave1;
  final double? totalDayOnleave2;
  final double? totalDayOnleave3;
  final double? totalDayWfh;
  final double? totalDayGet;
  final double? totalDay;

  const TimekeepingState({
    required super.status,
    super.message,
    this.employeeName,
    this.employeeCode,
    this.departmentName,
    this.selectedMonth,
    this.firstDayOfMonth,
    this.lastDayOfMonth,
    this.chamCongData,
    this.chamCongDetails,
    this.days = const [],
    this.totalDayActual,
    this.totalHoliday,
    this.totalDayOnleave1,
    this.totalDayOnleave2,
    this.totalDayOnleave3,
    this.totalDayWfh,
    this.totalDayGet,
    this.totalDay,
  });

  factory TimekeepingState.init() => const TimekeepingState(
        status: BaseStateStatus.init,
        days: [],
      );

  @override
  List get props => [
        status,
        message,
        employeeName,
        employeeCode,
        departmentName,
        selectedMonth,
        firstDayOfMonth,
        lastDayOfMonth,
        chamCongData,
        chamCongDetails,
        days,
        totalDayActual,
        totalHoliday,
        totalDayOnleave1,
        totalDayOnleave2,
        totalDayOnleave3,
        totalDayWfh,
        totalDayGet,
        totalDay,
      ];
}
