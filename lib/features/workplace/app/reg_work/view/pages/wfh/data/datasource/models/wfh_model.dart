import 'package:freezed_annotation/freezed_annotation.dart';

part 'wfh_model.freezed.dart';
part 'wfh_model.g.dart';

@freezed
class WfhItem with _$WfhItem {
  const factory WfhItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedID') int? approvedId,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'DateWFH') DateTime? dateWFH,
    @JsonKey(name: 'TimeWFH') int? timeWFH,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
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
    @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
    @JsonKey(name: 'EvaluateResults') String? evaluateResults,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
    @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorID,
    @JsonKey(name: 'DateApprovedSenior') DateTime? dateApprovedSenior,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
    @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
    @JsonKey(name: 'RowNumber') int? rowNumber,
    @JsonKey(name: 'CreatDay') DateTime? creatDay,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'ApprovedName') String? approvedName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'TimeWFHText') String? timeWFHText,
    @JsonKey(name: 'StatusNumber') int? statusNumber,
    @JsonKey(name: 'StatusHRNumber') int? statusHRNumber,
    @JsonKey(name: 'FullNameBGD') String? fullNameBGD,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'StatusHRText') String? statusHRText,
    @JsonKey(name: 'IsApprovedBGDText') String? isApprovedBGDText,
  }) = _WfhItem;

  factory WfhItem.fromJson(Map<String, dynamic> json) =>
      _$WfhItemFromJson(json);
}

@freezed
class ApproverItem with _$ApproverItem {
  const factory ApproverItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UsersID') int? usersId,
    @JsonKey(name: 'IsPassed') bool? isPassed,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _ApproverItem;

  factory ApproverItem.fromJson(Map<String, dynamic> json) =>
      _$ApproverItemFromJson(json);
}


@freezed
class FillApproverItem with _$FillApproverItem {
  const factory FillApproverItem({
    @JsonKey(name: 'ApproveID') required int approveId,
  }) = _FillApproverItem;

  factory FillApproverItem.fromJson(Map<String, dynamic> json) =>
      _$FillApproverItemFromJson(json);
}

