import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_wfh_model.freezed.dart';
part 'summary_wfh_model.g.dart';

@freezed
class SummaryWfhItem with _$SummaryWfhItem {
  const factory SummaryWfhItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedID') int? approvedID,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'DateWFH') String? dateWFH,
    @JsonKey(name: 'TimeWFH') int? timeWFH,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'TotalDay') double? totalDay,
    @JsonKey(name: 'ApprovedHR') int? approvedHR,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'ContentWork') String? contentWork,
    @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
    @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
    @JsonKey(name: 'DateApprovedBGD') String? dateApprovedBGD,
    @JsonKey(name: 'EvaluateResults') String? evaluateResults,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
    @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorID,
    @JsonKey(name: 'DateApprovedSenior') String? dateApprovedSenior,
    @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
    @JsonKey(name: 'RowNumber') int? rowNumber,
    @JsonKey(name: 'CreatDay') String? creatDay,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'ApprovedName') String? approvedName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'TimeWFHText') String? timeWFHText,
    @JsonKey(name: 'IsApprovedBGDText') String? isApprovedBGDText,
    @JsonKey(name: 'DepartmentSTT') int? departmentSTT,
  }) = _SummaryWfhItem;

  factory SummaryWfhItem.fromJson(Map<String, dynamic> json) =>
      _$SummaryWfhItemFromJson(json);
}

@freezed
class SummaryWfhDepartment with _$SummaryWfhDepartment {
  const factory SummaryWfhDepartment({
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
  }) = _SummaryWfhDepartment;

  factory SummaryWfhDepartment.fromJson(Map<String, dynamic> json) =>
      _$SummaryWfhDepartmentFromJson(json);
}
