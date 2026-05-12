import 'package:freezed_annotation/freezed_annotation.dart';

part 'timekeeping_model.freezed.dart';
part 'timekeeping_model.g.dart';

@freezed
class TimekeepingItem with _$TimekeepingItem {
  const factory TimekeepingItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'EmployeeCode') String? employeeCode,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'Month') int? month,
    @JsonKey(name: 'Year') int? year,
    @JsonKey(name: 'WorkDays') double? workDays,
    @JsonKey(name: 'HolidayDays') double? holidayDays,
    @JsonKey(name: 'TetDays') double? tetDays,
    @JsonKey(name: 'LeaveDays') double? leaveDays,
    @JsonKey(name: 'PrivateDays') double? privateDays,
    @JsonKey(name: 'WfhDays') double? wfhDays,
    @JsonKey(name: 'UnpaidLeaveDays') double? unpaidLeaveDays,
    @JsonKey(name: 'TotalWorkDays') double? totalWorkDays,
    @JsonKey(name: 'PaidWorkDays') double? paidWorkDays,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
  }) = _TimekeepingItem;

  factory TimekeepingItem.fromJson(Map<String, dynamic> json) =>
      _$TimekeepingItemFromJson(json);
}

@freezed
class TimekeepingDayItem with _$TimekeepingDayItem {
  const factory TimekeepingDayItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'Date') DateTime? date,
    @JsonKey(name: 'DayOfWeek') int? dayOfWeek,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'CheckIn') String? checkIn,
    @JsonKey(name: 'CheckOut') String? checkOut,
    @JsonKey(name: 'WorkHours') double? workHours,
    @JsonKey(name: 'OvertimeHours') double? overtimeHours,
    @JsonKey(name: 'IsLate') bool? isLate,
    @JsonKey(name: 'IsEarlyLeave') bool? isEarlyLeave,
    @JsonKey(name: 'Note') String? note,
  }) = _TimekeepingDayItem;

  factory TimekeepingDayItem.fromJson(Map<String, dynamic> json) =>
      _$TimekeepingDayItemFromJson(json);
}

@freezed
class TimekeepingSummary with _$TimekeepingSummary {
  const factory TimekeepingSummary({
    @JsonKey(name: 'ActualWorkDays') double? actualWorkDays,
    @JsonKey(name: 'HolidayDays') double? holidayDays,
    @JsonKey(name: 'TetDays') double? tetDays,
    @JsonKey(name: 'LeaveDays') double? leaveDays,
    @JsonKey(name: 'PrivatePaidDays') double? privatePaidDays,
    @JsonKey(name: 'WfhDays') double? wfhDays,
    @JsonKey(name: 'PaidWorkDays') double? paidWorkDays,
    @JsonKey(name: 'UnpaidLeaveDays') double? unpaidLeaveDays,
    @JsonKey(name: 'TotalDays') double? totalDays,
  }) = _TimekeepingSummary;

  factory TimekeepingSummary.fromJson(Map<String, dynamic> json) =>
      _$TimekeepingSummaryFromJson(json);
}
