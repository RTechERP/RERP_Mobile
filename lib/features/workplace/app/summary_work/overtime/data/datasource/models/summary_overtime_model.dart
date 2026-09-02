import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_overtime_model.freezed.dart';
part 'summary_overtime_model.g.dart';

/// Model cho một phiếu làm thêm trong danh sách summary.
@freezed
class SummaryOvertimeItem with _$SummaryOvertimeItem {
  const factory SummaryOvertimeItem({
    @JsonKey(name: 'TotalPage') int? totalPage,
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedID') int? approvedId,
    @JsonKey(name: 'DateRegister') DateTime? dateRegister,
    @JsonKey(name: 'Location') int? location,
    @JsonKey(name: 'TypeID') int? typeId,
    @JsonKey(name: 'TimeStart') DateTime? timeStart,
    @JsonKey(name: 'EndTime') DateTime? endTime,
    @JsonKey(name: 'TimeReality') double? timeReality,
    @JsonKey(name: 'TotalTime') double? totalTime,
    @JsonKey(name: 'CostOvertime') double? costOvertime,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'Overnight') bool? overnight,
    @JsonKey(name: 'CostOvernight') double? costOvernight,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'ApprovedHR') int? approvedHr,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBgd,
    @JsonKey(name: 'ApprovedBGDID') int? approvedBgdId,
    @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBgd,
    @JsonKey(name: 'IsSeniorApproved') bool? isSeniorApproved,
    @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorId,
    @JsonKey(name: 'DateApprovedSenitor') DateTime? dateApprovedSenitor,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'RowNum') int? rowNum,
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'LocationText') String? locationText,
    @JsonKey(name: 'NguoiDuyet') String? nguoiDuyet,
    @JsonKey(name: 'StatusNumber') int? statusNumber,
    @JsonKey(name: 'StatusHRNumber') int? statusHrNumber,
    @JsonKey(name: 'IsSeniorApprovedText') String? isSeniorApprovedText,
    @JsonKey(name: 'CheckIn') String? checkIn,
    @JsonKey(name: 'CheckOut') String? checkOut,
    @JsonKey(name: 'IsNotValid') int? isNotValid,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'StatusHRText') String? statusHrText,
    @JsonKey(name: 'CostDinner') double? costDinner,
  }) = _SummaryOvertimeItem;

  factory SummaryOvertimeItem.fromJson(Map<String, dynamic> json) =>
      _$SummaryOvertimeItemFromJson(json);
}

/// Tổng hợp giờ làm thêm theo từng nhân viên.
@freezed
class SummaryOvertimePerson with _$SummaryOvertimePerson {
  const factory SummaryOvertimePerson({
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'HourSummary') double? hourSummary,
    @JsonKey(name: 'TotalBenefitPeriod') double? totalBenefitPeriod,
  }) = _SummaryOvertimePerson;

  factory SummaryOvertimePerson.fromJson(Map<String, dynamic> json) =>
      _$SummaryOvertimePersonFromJson(json);
}

/// Dữ liệu summary trả về từ API: gồm danh sách phiếu và danh sách xếp hạng.
@freezed
class SummaryOvertimePayload with _$SummaryOvertimePayload {
  const factory SummaryOvertimePayload({
    @JsonKey(name: 'data') @Default(<SummaryOvertimeItem>[]) List<SummaryOvertimeItem> items,
    @JsonKey(name: 'summaryPerson')
    @Default(<SummaryOvertimePerson>[])
    List<SummaryOvertimePerson> persons,
  }) = _SummaryOvertimePayload;

  factory SummaryOvertimePayload.fromJson(Map<String, dynamic> json) =>
      _$SummaryOvertimePayloadFromJson(json);
}

/// Model cho phòng ban dùng trong dropdown bộ lọc.
@freezed
class SummaryOvertimeDepartment with _$SummaryOvertimeDepartment {
  const factory SummaryOvertimeDepartment({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'HeadofDepartment') int? headOfDepartment,
    @JsonKey(name: 'IsShowHotline') bool? isShowHotline,
    @JsonKey(name: 'PId') String? pId,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'ParentID') int? parentID,
  }) = _SummaryOvertimeDepartment;

  factory SummaryOvertimeDepartment.fromJson(Map<String, dynamic> json) =>
      _$SummaryOvertimeDepartmentFromJson(json);
}

/// Item nhân viên dùng cho picker chọn NV trên màn tổng hợp phiếu làm thêm.
@freezed
class SummaryOvertimeEmployee with _$SummaryOvertimeEmployee {
  const factory SummaryOvertimeEmployee({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'ChucVuHD') String? chucVuHD,
  }) = _SummaryOvertimeEmployee;

  factory SummaryOvertimeEmployee.fromJson(Map<String, dynamic> json) =>
      _$SummaryOvertimeEmployeeFromJson(json);
}