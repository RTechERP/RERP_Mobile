import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_leave_model.freezed.dart';
part 'summary_leave_model.g.dart';

@freezed
class SummaryLeaveItem with _$SummaryLeaveItem {
  const factory SummaryLeaveItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedTP') int? approvedTP,
    @JsonKey(name: 'ApprovedHR') int? approvedHR,
    @JsonKey(name: 'TimeOnLeave') int? timeOnLeave,
    @JsonKey(name: 'StartDate') String? startDate,
    @JsonKey(name: 'EndDate') String? endDate,
    @JsonKey(name: 'TotalTime') double? totalTime,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'TypeIsReal') int? typeIsReal,
    @JsonKey(name: 'TotalDay') double? totalDay,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsApprovedTP') bool? isApprovedTP,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsCancelTP') bool? isCancelTP,
    @JsonKey(name: 'IsCancelHR') bool? isCancelHR,
    @JsonKey(name: 'IsCancelRegister') bool? isCancelRegister,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'DateCancel') String? dateCancel,
    @JsonKey(name: 'DeleteFlag') bool? deleteFlag,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
    @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
    @JsonKey(name: 'DateApprovedBGD') String? dateApprovedBGD,
    @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
    @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorID,
    @JsonKey(name: 'DateApprovedSenior') String? dateApprovedSenior,
    @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
    @JsonKey(name: 'EmployeeOnLeavePhaseID') int? employeeOnLeavePhaseId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'IDApprovedTP') int? idApprovedTP,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'TimeOnLeaveText') String? timeOnLeaveText,
    @JsonKey(name: 'TypeHR') String? typeHR,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'RowNumber') int? rowNumber,
    @JsonKey(name: 'StatusNumber') int? statusNumber,
    @JsonKey(name: 'StatusHRNumber') int? statusHRNumber,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'StatusHRText') String? statusHRText,
  }) = _SummaryLeaveItem;

  factory SummaryLeaveItem.fromJson(Map<String, dynamic> json) => _$SummaryLeaveItemFromJson(json);
}

@freezed
class SummaryDepartment with _$SummaryDepartment {
  const factory SummaryDepartment({
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
  }) = _SummaryDepartment;

  factory SummaryDepartment.fromJson(Map<String, dynamic> json) => _$SummaryDepartmentFromJson(json);
}
