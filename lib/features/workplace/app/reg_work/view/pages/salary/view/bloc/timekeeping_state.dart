part of 'timekeeping_bloc.dart';

@CopyWith()
class TimekeepingState extends BaseBlocState {
  // Employee info
  final String? employeeName;
  final String? employeeCode;
  final String? departmentName;
  final DateTime? selectedMonth;

  // Summary totals
  final double actualWorkDays;
  final double holidayDays;
  final double tetDays;
  final double leaveDays;
  final double privatePaidDays;
  final double wfhDays;
  final double paidWorkDays;
  final double unpaidLeaveDays;
  final double totalDays;

  // Daily timekeeping
  final List<TimekeepingDayItem> days;

  // First/last day of month
  final DateTime? firstDayOfMonth;
  final DateTime? lastDayOfMonth;

  const TimekeepingState({
    required super.status,
    super.message,
    this.employeeName,
    this.employeeCode,
    this.departmentName,
    this.selectedMonth,
    this.actualWorkDays = 0,
    this.holidayDays = 0,
    this.tetDays = 0,
    this.leaveDays = 0,
    this.privatePaidDays = 0,
    this.wfhDays = 0,
    this.paidWorkDays = 0,
    this.unpaidLeaveDays = 0,
    this.totalDays = 0,
    this.days = const [],
    this.firstDayOfMonth,
    this.lastDayOfMonth,
  });

  factory TimekeepingState.init() => TimekeepingState(
        status: BaseStateStatus.init,
      );

  @override
  List get props => [
        status,
        message,
        employeeName,
        employeeCode,
        departmentName,
        selectedMonth,
        actualWorkDays,
        holidayDays,
        tetDays,
        leaveDays,
        privatePaidDays,
        wfhDays,
        paidWorkDays,
        unpaidLeaveDays,
        totalDays,
        days,
        firstDayOfMonth,
        lastDayOfMonth,
      ];
}
