// ignore_for_file: type=lint, unused_element, deprecated_member_use,
// deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters,
// unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named,
// prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target,
// unnecessary_question_mark

import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_model.freezed.dart';
part 'salary_model.g.dart';

//---(SummarySalaryResponse)---//

@freezed
class SummarySalaryResponse with _$SummarySalaryResponse {
  const factory SummarySalaryResponse({
    @JsonKey(name: 'listSummary') List<List<SalarySummaryItem>>? listSummary,
    @JsonKey(name: 'fingers') SalaryFingers? fingers,
    @JsonKey(name: 'payroll') List<SalaryPayrollItem>? payroll,
    @JsonKey(name: 'listChamcong') SalaryListChamCong? listChamcong,
  }) = _SummarySalaryResponse;

  factory SummarySalaryResponse.fromJson(Map<String, dynamic> json) =>
      _$SummarySalaryResponseFromJson(json);
}

//---(listSummary)---//

@freezed
class SalarySummaryItem with _$SalarySummaryItem {
  const factory SalarySummaryItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'TypeTable') int? typeTable,
    @JsonKey(name: 'Typetext') String? typeText,
    @JsonKey(name: 'HangMuc') String? hangMuc,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'Value') double? value,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'ValueText') String? valueText,
    @JsonKey(name: 'HRApproved') String? hrApproved,
    @JsonKey(name: 'TBPApproved') String? tbpApproved,
    @JsonKey(name: 'HRCancel') String? hrCancel,
    @JsonKey(name: 'TBPCancel') String? tbpCancel,
    @JsonKey(name: 'ValueReal') double? valueReal,
    @JsonKey(name: 'ValueTextReal') String? valueTextReal,
  }) = _SalarySummaryItem;

  factory SalarySummaryItem.fromJson(Map<String, dynamic> json) =>
      _$SalarySummaryItemFromJson(json);
}

//---(fingers)---//

@freezed
class SalaryFingers with _$SalaryFingers {
  const factory SalaryFingers({
    @JsonKey(name: 'data') SalaryFingerData? data,
    @JsonKey(name: 'details') List<SalaryFingerDetail>? details,
  }) = _SalaryFingers;

  factory SalaryFingers.fromJson(Map<String, dynamic> json) =>
      _$SalaryFingersFromJson(json);
}

@freezed
class SalaryFingerData with _$SalaryFingerData {
  const factory SalaryFingerData({
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'TotalLate') int? totalLate,
    @JsonKey(name: 'TotalLateCty') int? totalLateCty,
    @JsonKey(name: 'TotalEarly') int? totalEarly,
    @JsonKey(name: 'TotalEarlyCty') int? totalEarlyCty,
    @JsonKey(name: 'TotalRegisterCheckin') int? totalRegisterCheckin,
    @JsonKey(name: 'TotalRegisterCheckout') int? totalRegisterCheckout,
    @JsonKey(name: 'TotalNoCheckIn') int? totalNoCheckIn,
    @JsonKey(name: 'TotalNoCheckOut') int? totalNoCheckOut,
    @JsonKey(name: 'TotalDayNoSalary') double? totalDayNoSalary,
    @JsonKey(name: 'TotalDaySalary') double? totalDaySalary,
  }) = _SalaryFingerData;

  factory SalaryFingerData.fromJson(Map<String, dynamic> json) =>
      _$SalaryFingerDataFromJson(json);
}

@freezed
class SalaryFingerDetail with _$SalaryFingerDetail {
  const factory SalaryFingerDetail({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'CheckIn') String? checkIn,
    @JsonKey(name: 'CheckOut') String? checkOut,
    @JsonKey(name: 'IsLate') bool? isLate,
    @JsonKey(name: 'TimeLate') double? timeLate,
    @JsonKey(name: 'IsEarly') bool? isEarly,
    @JsonKey(name: 'TimeEarly') double? timeEarly,
    @JsonKey(name: 'AttendanceDate') DateTime? attendanceDate,
    @JsonKey(name: 'DayWeek') String? dayWeek,
    @JsonKey(name: 'Interval') String? interval,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'ToChuc') String? toChuc,
    @JsonKey(name: 'ChucVu') String? chucVu,
    @JsonKey(name: 'IsLunch') bool? isLunch,
    @JsonKey(name: 'Overtime') bool? overtime,
    @JsonKey(name: 'Bussiness') bool? bussiness,
    @JsonKey(name: 'NoFingerprint') bool? noFingerprint,
    @JsonKey(name: 'OnLeave') bool? onLeave,
    @JsonKey(name: 'WFH') bool? wfh,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'IsLateRegister') bool? isLateRegister,
    @JsonKey(name: 'IsEarlyRegister') bool? isEarlyRegister,
    @JsonKey(name: 'TotalDay') double? totalDay,
    @JsonKey(name: 'HolidayDay') int? holidayDay,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentSTT') int? departmentStt,
    @JsonKey(name: 'OvertimeLate') int? overtimeLate,
    @JsonKey(name: 'OvertimeEarly') int? overtimeEarly,
    @JsonKey(name: 'IsOverEarly') bool? isOverEarly,
    @JsonKey(name: 'IsOverLate') bool? isOverLate,
    @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
    @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate,
    @JsonKey(name: 'TypeLate') int? typeLate,
    @JsonKey(name: 'TypeEarly') int? typeEarly,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'IsLateActual') int? isLateActual,
    @JsonKey(name: 'IsEarlyActual') int? isEarlyActual,
    @JsonKey(name: 'TotalProblem') int? totalProblem,
    @JsonKey(name: 'MaxIsLate') int? maxIsLate,
    @JsonKey(name: 'MaxIsEarly') int? maxIsEarly,
    @JsonKey(name: 'IsNoFinger') int? isNoFinger,
    @JsonKey(name: 'IsNoCheckIn') int? isNoCheckIn,
    @JsonKey(name: 'IsNoCheckOut') int? isNoCheckOut,
  }) = _SalaryFingerDetail;

  factory SalaryFingerDetail.fromJson(Map<String, dynamic> json) =>
      _$SalaryFingerDetailFromJson(json);
}

//---(listChamcong)---//

@freezed
class SalaryListChamCong with _$SalaryListChamCong {
  const factory SalaryListChamCong({
    @JsonKey(name: 'header') List<SalaryListChamCongHeader>? header,
    @JsonKey(name: 'data') SalaryListChamCongData? data,
    @JsonKey(name: 'totalworkday') int? totalworkday,
    @JsonKey(name: 'detail') List<SalaryListChamCongDetail>? detail,
  }) = _SalaryListChamCong;

  factory SalaryListChamCong.fromJson(Map<String, dynamic> json) =>
      _$SalaryListChamCongFromJson(json);
}

@freezed
class SalaryListChamCongHeader with _$SalaryListChamCongHeader {
  const factory SalaryListChamCongHeader({
    @JsonKey(name: 'fieldname') String? fieldname,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'statuswork') int? statuswork,
  }) = _SalaryListChamCongHeader;

  factory SalaryListChamCongHeader.fromJson(Map<String, dynamic> json) =>
      _$SalaryListChamCongHeaderFromJson(json);
}

@freezed
class SalaryListChamCongData with _$SalaryListChamCongData {
  const factory SalaryListChamCongData({
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'PositionName') String? positionName,
    @JsonKey(name: 'PriorityOrder') int? priorityOrder,
    @JsonKey(name: 'D1') String? d1,
    @JsonKey(name: 'D2') String? d2,
    @JsonKey(name: 'D3') String? d3,
    @JsonKey(name: 'D4') String? d4,
    @JsonKey(name: 'D5') String? d5,
    @JsonKey(name: 'D6') String? d6,
    @JsonKey(name: 'D7') String? d7,
    @JsonKey(name: 'D8') String? d8,
    @JsonKey(name: 'D9') String? d9,
    @JsonKey(name: 'D10') String? d10,
    @JsonKey(name: 'D11') String? d11,
    @JsonKey(name: 'D12') String? d12,
    @JsonKey(name: 'D13') String? d13,
    @JsonKey(name: 'D14') String? d14,
    @JsonKey(name: 'D15') String? d15,
    @JsonKey(name: 'D16') String? d16,
    @JsonKey(name: 'D17') String? d17,
    @JsonKey(name: 'D18') String? d18,
    @JsonKey(name: 'D19') String? d19,
    @JsonKey(name: 'D20') String? d20,
    @JsonKey(name: 'D21') String? d21,
    @JsonKey(name: 'D22') String? d22,
    @JsonKey(name: 'D23') String? d23,
    @JsonKey(name: 'D24') String? d24,
    @JsonKey(name: 'D25') String? d25,
    @JsonKey(name: 'D26') String? d26,
    @JsonKey(name: 'D27') String? d27,
    @JsonKey(name: 'D28') String? d28,
    @JsonKey(name: 'D29') String? d29,
    @JsonKey(name: 'D30') String? d30,
    @JsonKey(name: 'D31') String? d31,
    @JsonKey(name: 'TotalDayActual') double? totalDayActual,
    @JsonKey(name: 'TotalHoliday') int? totalHoliday,
    @JsonKey(name: 'TotalDayOnleave2') double? totalDayOnleave2,
    @JsonKey(name: 'TotalDayOnleave3') double? totalDayOnleave3,
    @JsonKey(name: 'TotalDayWFH') double? totalDayWfh,
    @JsonKey(name: 'TotalDayGet') double? totalDayGet,
    @JsonKey(name: 'TotalDayOnleave1') double? totalDayOnleave1,
    @JsonKey(name: 'TotalDay') double? totalDay,
    @JsonKey(name: 'DepartmentSTT') int? departmentStt,
    @JsonKey(name: 'STT') int? stt,
  }) = _SalaryListChamCongData;

  factory SalaryListChamCongData.fromJson(Map<String, dynamic> json) =>
      _$SalaryListChamCongDataFromJson(json);
}

@freezed
class SalaryListChamCongDetail with _$SalaryListChamCongDetail {
  const factory SalaryListChamCongDetail({
    @JsonKey(name: 'value') DateTime? value,
    @JsonKey(name: 'fieldname') String? fieldname,
    @JsonKey(name: 'text') int? text,
    @JsonKey(name: 'disabled') bool? disabled,
    @JsonKey(name: 'statuswork') int? statuswork,
  }) = _SalaryListChamCongDetail;

  factory SalaryListChamCongDetail.fromJson(Map<String, dynamic> json) =>
      _$SalaryListChamCongDetailFromJson(json);
}

//---(payroll)---//

@freezed
class SalaryPayrollItem with _$SalaryPayrollItem {
  const factory SalaryPayrollItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Sign') bool? sign,
    @JsonKey(name: 'PayrollID') int? payrollId,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentSTT') int? departmentSTT,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'PriorityOrder') int? priorityOrder,
    @JsonKey(name: 'PositionName') String? positionName,
    @JsonKey(name: 'BasicSalary') double? basicSalary,
    @JsonKey(name: 'TotalWorkday') double? totalWorkday,
    @JsonKey(name: 'TotalMerit') double? totalMerit,
    @JsonKey(name: 'TotalSalaryByDay') double? totalSalaryByDay,
    @JsonKey(name: 'SalaryOneHour') double? salaryOneHour,
    @JsonKey(name: 'OT_Hour_WD') double? otHourWD,
    @JsonKey(name: 'OT_Money_WD') double? otMoneyWD,
    @JsonKey(name: 'OT_Hour_WK') double? otHourWK,
    @JsonKey(name: 'OT_Money_WK') double? otMoneyWK,
    @JsonKey(name: 'OT_Hour_HD') double? otHourHD,
    @JsonKey(name: 'OT_Money_HD') double? otMoneyHD,
    @JsonKey(name: 'OT_TotalSalary') double? otTotalSalary,
    @JsonKey(name: 'ReferenceIndustry') double? referenceIndustry,
    @JsonKey(name: 'RealIndustry') double? realIndustry,
    @JsonKey(name: 'AllowanceMeal') double? allowanceMeal,
    @JsonKey(name: 'Allowance_OT_Early') double? allowanceOTEarly,
    @JsonKey(name: 'TotalAllowance') double? totalAllowance,
    @JsonKey(name: 'BussinessMoney') double? bussinessMoney,
    @JsonKey(name: 'NightShiftMoney') double? nightShiftMoney,
    @JsonKey(name: 'CostVehicleBussiness') double? costVehicleBussiness,
    @JsonKey(name: 'Bonus') double? bonus,
    @JsonKey(name: 'Other') double? other,
    @JsonKey(name: 'TotalBonus') double? totalBonus,
    @JsonKey(name: 'SocialInsurance') double? socialInsurance,
    @JsonKey(name: 'Insurances') double? insurances,
    @JsonKey(name: 'UnionFees') double? unionFees,
    @JsonKey(name: 'AdvancePayment') double? advancePayment,
    @JsonKey(name: 'DepartmentalFees') double? departmentalFees,
    @JsonKey(name: 'ParkingMoney') double? parkingMoney,
    @JsonKey(name: 'Punish5S') double? punish5S,
    @JsonKey(name: 'OtherDeduction') double? otherDeduction,
    @JsonKey(name: 'TotalDeduction') double? totalDeduction,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsPublish') bool? isPublish,
    @JsonKey(name: 'StartWorking') DateTime? startWorking,
    @JsonKey(name: 'MealUse') int? mealUse,
    @JsonKey(name: 'TaxSalaryOT') double? taxSalaryOT,
    @JsonKey(name: 'TaxSalaryMeal') double? taxSalaryMeal,
    @JsonKey(name: 'TaxSalaryPhone') double? taxSalaryPhone,
    @JsonKey(name: 'TaxPersonalDeduction') double? taxPersonalDeduction,
    @JsonKey(name: 'TaxDependentsDeduction') double? taxDependentsDeduction,
    @JsonKey(name: 'TotalTaxDeduction') double? totalTaxDeduction,
    @JsonKey(name: 'TaxAbleIncome') double? taxAbleIncome,
    @JsonKey(name: 'TaxCompanyName') String? taxCompanyName,
    @JsonKey(name: 'StatusContract') String? statusContract,
    @JsonKey(name: 'TaxDeduction') double? taxDeduction,
    @JsonKey(name: 'PenaltyLateEarlyQty') int? penaltyLateEarlyQty,
    @JsonKey(name: 'PenaltyLateEarlyAmount') double? penaltyLateEarlyAmount,
    @JsonKey(name: 'PenaltyMissingAttendanceQty')
    int? penaltyMissingAttendanceQty,
    @JsonKey(name: 'PenaltyMissingAttendanceAmount')
    double? penaltyMissingAttendanceAmount,
    @JsonKey(name: 'PenaltyLeaveOver2DaysQty') int? penaltyLeaveOver2DaysQty,
    @JsonKey(name: 'PenaltyLeaveOver2DaysAmount')
    double? penaltyLeaveOver2DaysAmount,
    @JsonKey(name: 'PenaltyTotalAmount') double? penaltyTotalAmount,
    @JsonKey(name: 'RegulationViolation') double? regulationViolation,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'RealSalary') double? realSalary,
    @JsonKey(name: 'ActualAmountReceived') double? actualAmountReceived,
  }) = _SalaryPayrollItem;

  factory SalaryPayrollItem.fromJson(Map<String, dynamic> json) =>
      _$SalaryPayrollItemFromJson(json);
}

//---(TimekeepingDayItem)---//

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
