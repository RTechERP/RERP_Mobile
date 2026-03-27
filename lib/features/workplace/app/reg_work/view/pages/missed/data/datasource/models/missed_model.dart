import 'package:freezed_annotation/freezed_annotation.dart';

part 'missed_model.freezed.dart';
part 'missed_model.g.dart';

@freezed
class MissedItem with _$MissedItem {
  const factory MissedItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedTP') int? approvedTP,
    @JsonKey(name: 'DayWork') DateTime? dayWork,
    @JsonKey(name: 'IsApprovedTP') bool? isApprovedTP,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'ApprovedHR') int? approvedHR,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
    @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorID,
    @JsonKey(name: 'DateApprovedSenior') DateTime? dateApprovedSenior,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
    @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'RowNumber') int? rowNumber,
    @JsonKey(name: 'ApprovedName') String? approvedName,
    @JsonKey(name: 'StatusNumber') int? statusNumber,
    @JsonKey(name: 'StatusHRNumber') int? statusHRNumber,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'StatusHRText') String? statusHRText,
  }) = _MissedItem;

  factory MissedItem.fromJson(Map<String, dynamic> json) =>
      _$MissedItemFromJson(json);
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