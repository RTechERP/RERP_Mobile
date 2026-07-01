import 'package:freezed_annotation/freezed_annotation.dart';

part 'in_out_model.freezed.dart';
part 'in_out_model.g.dart';

@freezed
class InOutItem with _$InOutItem {
  const factory InOutItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedID') int? approvedId,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'DateRegister') DateTime? dateRegister,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'ApprovedTP') int? approvedTP,
    @JsonKey(name: 'IsApprovedTP') bool? isApprovedTP,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'DateStart') DateTime? dateStart,
    @JsonKey(name: 'DateEnd') DateTime? dateEnd,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'RowNum') int? rowNum,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'ApprovedName') String? approvedName,
    @JsonKey(name: 'StatusNumber') int? statusNumber,
    @JsonKey(name: 'StatusHRNumber') int? statusHRNumber,
    @JsonKey(name: 'TimeRegister') int? timeRegister,
    @JsonKey(name: 'IsSeniorApprovedText') String? isSeniorApprovedText,
    @JsonKey(name: 'ApprovedSđreniorName') String? approvedSeniorName,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'FilePath') String? filePath,
    @JsonKey(name: 'CheckIn') String? checkIn,
    @JsonKey(name: 'CheckOut') String? checkOut,
    @JsonKey(name: 'IsNotValid') int? isNotValid,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'StatusHRText') String? statusHRText,
    @JsonKey(name: 'TotalPage') int? totalPage,
  }) = _InOutItem;

  factory InOutItem.fromJson(Map<String, dynamic> json) =>
      _$InOutItemFromJson(json);
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
