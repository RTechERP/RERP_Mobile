import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_calendar.freezed.dart';
part 'salary_calendar.g.dart';

@freezed
class SalaryCalendarItem with _$SalaryCalendarItem {
  const factory SalaryCalendarItem({
    @JsonKey(name: 'holidays') List<SalaryHolidayItem>? holidays,
    @JsonKey(name: 'scheduleWorkSaturdays') List<SalaryWorkSaturdayItem>?
        scheduleWorkSaturdays,
  }) = _SalaryCalendarItem;

  factory SalaryCalendarItem.fromJson(Map<String, dynamic> json) =>
      _$SalaryCalendarItemFromJson(json);
}

@freezed
class SalaryHolidayItem with _$SalaryHolidayItem {
  const factory SalaryHolidayItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'HolidayDate') DateTime? holidayDate,
    @JsonKey(name: 'HolidayYear') int? holidayYear,
    @JsonKey(name: 'HolidayMonth') int? holidayMonth,
    @JsonKey(name: 'HolidayDay') int? holidayDay,
    @JsonKey(name: 'DayValue') String? dayValue,
    @JsonKey(name: 'HolidayName') String? holidayName,
    @JsonKey(name: 'HolidayCode') String? holidayCode,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'TypeHoliday') int? typeHoliday,
    @JsonKey(name: 'TypeHolidayText') String? typeHolidayText,
  }) = _SalaryHolidayItem;

  factory SalaryHolidayItem.fromJson(Map<String, dynamic> json) =>
      _$SalaryHolidayItemFromJson(json);
}

@freezed
class SalaryWorkSaturdayItem with _$SalaryWorkSaturdayItem {
  const factory SalaryWorkSaturdayItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'DateValue') DateTime? dateValue,
    @JsonKey(name: 'Status') bool? status,
    @JsonKey(name: 'WorkDay') int? workDay,
    @JsonKey(name: 'WorkMonth') int? workMonth,
    @JsonKey(name: 'WorkYear') int? workYear,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'Approver') int? approver,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
  }) = _SalaryWorkSaturdayItem;

  factory SalaryWorkSaturdayItem.fromJson(Map<String, dynamic> json) =>
      _$SalaryWorkSaturdayItemFromJson(json);
}
