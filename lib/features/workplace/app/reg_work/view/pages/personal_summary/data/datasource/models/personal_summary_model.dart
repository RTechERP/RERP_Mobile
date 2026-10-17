// Freezed models cho API /home/get-summary-employee-person.
// Response gồm 7 nhóm phiếu, mỗi nhóm trả về dạng mảng các object phiếu
// (dataOnLeave là mảng phẳng, các nhóm còn lại là mảng-of-mảng — sẽ flatten ở bloc).
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_summary_model.freezed.dart';
part 'personal_summary_model.g.dart';

/// Payload gửi lên BE khi tải tổng hợp phiếu cá nhân.
@freezed
class PersonalSummaryRequest with _$PersonalSummaryRequest {
  const factory PersonalSummaryRequest({
    @JsonKey(name: 'DateStart') required DateTime dateStart,
    @JsonKey(name: 'DateEnd') required DateTime dateEnd,
    @JsonKey(name: 'DepartmentID') required int departmentId,
    @JsonKey(name: 'EmployeeID') required int employeeId,
    @JsonKey(name: 'IsApproved') required int isApproved,
    @JsonKey(name: 'Keyword') required String keyword,
  }) = _PersonalSummaryRequest;

  factory PersonalSummaryRequest.fromJson(Map<String, dynamic> json) =>
      _$PersonalSummaryRequestFromJson(json);
}

/// Đăng ký nghỉ (dataOnLeave) — mảng phẳng.
@freezed
class PersonalLeaveItem with _$PersonalLeaveItem {
  const factory PersonalLeaveItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'IsApprovedTP') bool? isApprovedTp,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
    @JsonKey(name: 'IsApprovedTPText') String? isApprovedTpText,
    @JsonKey(name: 'IsApprovedHRText') String? isApprovedHrText,
    @JsonKey(name: 'EmployeeLeave') String? employeeLeave,
    @JsonKey(name: 'EmployeeTP') String? employeeTp,
    @JsonKey(name: 'EmployeeHR') String? employeeHr,
    @JsonKey(name: 'TimeOnLeave') int? timeOnLeave,
    @JsonKey(name: 'TimeOnLeaveText') String? timeOnLeaveText,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'TotalTime') double? totalTime,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'TypeIsReal') int? typeIsReal,
    @JsonKey(name: 'TypeIsRealText') String? typeIsRealText,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsCancelRegister') bool? isCancelRegister,
    @JsonKey(name: 'IsCancelRegisterText') String? isCancelRegisterText,
    @JsonKey(name: 'IsCancelTP') bool? isCancelTp,
    @JsonKey(name: 'IsCancelHR') bool? isCancelHr,
    @JsonKey(name: 'IsCancelTPText') String? isCancelTpText,
    @JsonKey(name: 'IsCancelHRText') String? isCancelHrText,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'DateCancel') DateTime? dateCancel,
    @JsonKey(name: 'StatusTBP') int? statusTbp,
    @JsonKey(name: 'StatusHR') int? statusHr,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'DepartmentSTT') int? departmentStt,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'StatusTBPText') String? statusTbpText,
    @JsonKey(name: 'StatusHRText') String? statusHrText,
  }) = _PersonalLeaveItem;

  factory PersonalLeaveItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalLeaveItemFromJson(json);
}

/// Đi muộn / về sớm.
@freezed
class PersonalEarlyLateItem with _$PersonalEarlyLateItem {
  const factory PersonalEarlyLateItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'IsApprovedText') String? isApprovedText,
    @JsonKey(name: 'EmployeeEarlyLate') String? employeeEarlyLate,
    @JsonKey(name: 'EmployeeApprovedHR') String? employeeApprovedHr,
    @JsonKey(name: 'DateRegister') DateTime? dateRegister,
    @JsonKey(name: 'Unit') int? unit,
    @JsonKey(name: 'UnitText') String? unitText,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'EmployeeApprovedTP') String? employeeApprovedTp,
    @JsonKey(name: 'IsApprovedTPText') String? isApprovedTpText,
    @JsonKey(name: 'IsApprovedTP') bool? isApprovedTp,
    @JsonKey(name: 'DateStart') DateTime? dateStart,
    @JsonKey(name: 'DateEnd') DateTime? dateEnd,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'StatusTBP') int? statusTbp,
    @JsonKey(name: 'StatusHR') int? statusHr,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'TimeRegister') double? timeRegister,
    @JsonKey(name: 'StatusTBPText') String? statusTbpText,
    @JsonKey(name: 'StatusHRText') String? statusHrText,
  }) = _PersonalEarlyLateItem;

  factory PersonalEarlyLateItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalEarlyLateItemFromJson(json);
}

/// Làm thêm (OT).
@freezed
class PersonalOverTimeItem with _$PersonalOverTimeItem {
  const factory PersonalOverTimeItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTbp,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
    @JsonKey(name: 'EmployeeFullName') String? employeeFullName,
    @JsonKey(name: 'ApprovedTBP') String? approvedTbp,
    @JsonKey(name: 'ApprovedHR') String? approvedHr,
    @JsonKey(name: 'DateRegister') DateTime? dateRegister,
    @JsonKey(name: 'TypeID') int? typeId,
    @JsonKey(name: 'TimeStart') DateTime? timeStart,
    @JsonKey(name: 'EndTime') DateTime? endTime,
    @JsonKey(name: 'TimeReality') double? timeReality,
    @JsonKey(name: 'TotalTime') double? totalTime,
    @JsonKey(name: 'Location') int? location,
    @JsonKey(name: 'LocationText') String? locationText,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsApprovedText') String? isApprovedText,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'StatusHR') int? statusHr,
    @JsonKey(name: 'StatusTBP') int? statusTbp,
    @JsonKey(name: 'CostOvernight') double? costOvernight,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'Overnight') bool? overnight,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'StatusTBPText') String? statusTbpText,
    @JsonKey(name: 'StatusHRText') String? statusHrText,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'ApprovedID') int? approvedId,
  }) = _PersonalOverTimeItem;

  factory PersonalOverTimeItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalOverTimeItemFromJson(json);
}

/// Công tác.
@freezed
class PersonalBussinessItem with _$PersonalBussinessItem {
  const factory PersonalBussinessItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTbp,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
    @JsonKey(name: 'IsApprovedText') String? isApprovedText,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'ApprovedName') String? approvedName,
    @JsonKey(name: 'ApprovedHR') String? approvedHr,
    @JsonKey(name: 'DayBussiness') DateTime? dayBussiness,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'TypeBusiness') int? typeBusiness,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'CostType') double? costType,
    @JsonKey(name: 'VehicleID') int? vehicleId,
    @JsonKey(name: 'VehicleName') String? vehicleName,
    @JsonKey(name: 'NotChekIn') bool? notChekIn,
    @JsonKey(name: 'NotChekInText') String? notChekInText,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'WorkEarlyText') String? workEarlyText,
    @JsonKey(name: 'CostWorkEarly') double? costWorkEarly,
    @JsonKey(name: 'CostOvernight') double? costOvernight,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'DecilineApproveText') String? decilineApproveText,
    @JsonKey(name: 'StatusHR') int? statusHr,
    @JsonKey(name: 'StatusTBP') int? statusTbp,
    @JsonKey(name: 'CostVehicle') double? costVehicle,
    @JsonKey(name: 'TotalMoney') double? totalMoney,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'Overnight') bool? overnight,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedID') int? approvedId,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'ProjectText') String? projectText,
    @JsonKey(name: 'StatusTBPText') String? statusTbpText,
    @JsonKey(name: 'StatusHRText') String? statusHrText,
  }) = _PersonalBussinessItem;

  factory PersonalBussinessItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalBussinessItemFromJson(json);
}

/// Làm việc tại nhà (WFH).
@freezed
class PersonalWfhItem with _$PersonalWfhItem {
  const factory PersonalWfhItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'ApprovedName') String? approvedName,
    @JsonKey(name: 'ApprovedHR') String? approvedHr,
    @JsonKey(name: 'DateWFH') DateTime? dateWfh,
    @JsonKey(name: 'TimeWFH') int? timeWfh,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsApprovedText') String? isApprovedText,
    @JsonKey(name: 'TimeWFHText') String? timeWfhText,
    @JsonKey(name: 'StatusHR') int? statusHr,
    @JsonKey(name: 'StatusTBP') int? statusTbp,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ContentWork') String? contentWork,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'StatusTBPText') String? statusTbpText,
    @JsonKey(name: 'StatusHRText') String? statusHrText,
  }) = _PersonalWfhItem;

  factory PersonalWfhItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalWfhItemFromJson(json);
}

/// Quên chấm công (ENF).
@freezed
class PersonalEnfItem with _$PersonalEnfItem {
  const factory PersonalEnfItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'IsApprovedTP') bool? isApprovedTp,
    @JsonKey(name: 'ApprovedHR') int? approvedHr,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'ApprovedTPName') String? approvedTpName,
    @JsonKey(name: 'ApprovedHRName') String? approvedHrName,
    @JsonKey(name: 'DayWork') DateTime? dayWork,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'IsApprovedTPText') String? isApprovedTpText,
    @JsonKey(name: 'IsApprovedHRText') String? isApprovedHrText,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'StatusHR') int? statusHr,
    @JsonKey(name: 'StatusTBP') int? statusTbp,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'StatusTBPText') String? statusTbpText,
    @JsonKey(name: 'StatusHRText') String? statusHrText,
  }) = _PersonalEnfItem;

  factory PersonalEnfItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalEnfItemFromJson(json);
}

/// Làm đêm.
@freezed
class PersonalNightShiftItem with _$PersonalNightShiftItem {
  const factory PersonalNightShiftItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'IsApprovedTBP') int? isApprovedTbp,
    @JsonKey(name: 'IsApprovedHR') int? isApprovedHr,
    @JsonKey(name: 'IsApprovedTBPText') String? isApprovedTbpText,
    @JsonKey(name: 'IsApprovedHRText') String? isApprovedHrText,
    @JsonKey(name: 'ApprovedTBP') int? approvedTbp,
    @JsonKey(name: 'ApprovedHR') int? approvedHr,
    @JsonKey(name: 'ApprovedTBPName') String? approvedTbpName,
    @JsonKey(name: 'ApprovedHRName') String? approvedHrName,
    @JsonKey(name: 'DateRegister') DateTime? dateRegister,
    @JsonKey(name: 'DateStart') DateTime? dateStart,
    @JsonKey(name: 'DateEnd') DateTime? dateEnd,
    @JsonKey(name: 'TotalHours') double? totalHours,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'WorkTime') double? workTime,
    @JsonKey(name: 'BreaksTime') double? breaksTime,
  }) = _PersonalNightShiftItem;

  factory PersonalNightShiftItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalNightShiftItemFromJson(json);
}

/// Vân tay (chấm công) - 1 dòng = 1 nhân viên / 1 ngày.
@freezed
class PersonalAttendanceItem with _$PersonalAttendanceItem {
  const factory PersonalAttendanceItem({
    @JsonKey(name: 'ID') required int id,
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
  }) = _PersonalAttendanceItem;

  factory PersonalAttendanceItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalAttendanceItemFromJson(json);
}

/// Response wrapper — BE trả về trực tiếp 7 nhóm này trong `data`.
/// Một số nhóm (EarlyLate, OverTime, Bussiness, WFH, ENF) là `List<List<T>>`
/// (BE gom theo từng nhóm phòng ban). Bloc sẽ flatten trước khi đẩy vào state.
@freezed
class PersonalSummaryData with _$PersonalSummaryData {
  const factory PersonalSummaryData({
    @JsonKey(name: 'dataOnLeave') @Default(<PersonalLeaveItem>[])
    List<PersonalLeaveItem> dataOnLeave,
    @JsonKey(name: 'dataEarlyLate') @Default(<List<PersonalEarlyLateItem>>[])
    List<List<PersonalEarlyLateItem>> dataEarlyLate,
    @JsonKey(name: 'dataOverTime') @Default(<List<PersonalOverTimeItem>>[])
    List<List<PersonalOverTimeItem>> dataOverTime,
    @JsonKey(name: 'dataBussiness') @Default(<List<PersonalBussinessItem>>[])
    List<List<PersonalBussinessItem>> dataBussiness,
    @JsonKey(name: 'dataWFH') @Default(<List<PersonalWfhItem>>[])
    List<List<PersonalWfhItem>> dataWfh,
    @JsonKey(name: 'dataENF') @Default(<List<PersonalEnfItem>>[])
    List<List<PersonalEnfItem>> dataEnf,
    @JsonKey(name: 'dataNightShift') @Default(<PersonalNightShiftItem>[])
    List<PersonalNightShiftItem> dataNightShift,
  }) = _PersonalSummaryData;

  factory PersonalSummaryData.fromJson(Map<String, dynamic> json) =>
      _$PersonalSummaryDataFromJson(json);
}
