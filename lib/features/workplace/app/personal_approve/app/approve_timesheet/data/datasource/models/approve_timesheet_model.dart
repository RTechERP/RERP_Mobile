import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_timesheet_model.freezed.dart';
part 'approve_timesheet_model.g.dart';

// Response lấy dữ liệu duyệt
@freezed
class ApproveTimesheetItem with _$ApproveTimesheetItem {
  const factory ApproveTimesheetItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'IsApprovedTP') int? isApprovedTP,
    @JsonKey(name: 'ApprovedTP') int? approvedTP,
    @JsonKey(name: 'NgayDangKy') DateTime? ngayDangKy,
    @JsonKey(name: 'NoiDung') String? noiDung,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'TableName') String? tableName,
    @JsonKey(name: 'ColumnNameUpdate') String? columnNameUpdate,
    @JsonKey(name: 'NguoiDuyet') String? nguoiDuyet,
    @JsonKey(name: 'IsCancelTP') int? isCancelTP,
    @JsonKey(name: 'IsCancelRegister') int? isCancelRegister,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'TType') int? tType,
    @JsonKey(name: 'IsApprovedHR') int? isApprovedHR,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsCancelHR') int? isCancelHR,
    @JsonKey(name: 'StatusNumber') int? statusNumber,
    @JsonKey(name: 'StatusHRNumber') int? statusHRNumber,
    @JsonKey(name: 'DeleteFlag') int? deleteFlag,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
    @JsonKey(name: 'EvaluateResults') String? evaluateResults,
    @JsonKey(name: 'IsApprovedBGD') int? isApprovedBGD,
    @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
    @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorId,
    @JsonKey(name: 'DateApprovedSenitor') DateTime? dateApprovedSenitor,
    @JsonKey(name: 'IsSeniorApprovedText') String? isSeniorApprovedText,
    @JsonKey(name: 'ApprovedSeniorName') String? approvedSeniorName,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'FilePath') String? filePath,
    @JsonKey(name: 'CheckIn') DateTime? checkIn,
    @JsonKey(name: 'CheckOut') DateTime? checkOut,
    @JsonKey(name: 'IsNotValid') int? isNotValid,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'StatusHRText') String? statusHRText,
    @JsonKey(name: 'StatusBGDText') String? statusBGDText,
    @JsonKey(name: 'SeniorID') int? seniorId,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
  }) = _ApproveTimesheetItem;

  factory ApproveTimesheetItem.fromJson(Map<String, dynamic> json) =>
      _$ApproveTimesheetItemFromJson(json);
}

// Response team của người dùng
@freezed
class UserTeamItem with _$UserTeamItem {
  const factory UserTeamItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'LeaderID') int? leaderId,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'ProjectTypeID') int? projectTypeId,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Leader') String? leader,
    @JsonKey(name: 'Department') String? department,
    @JsonKey(name: 'DepartmentName') String? departmentName,
  }) = _UserTeamItem;

  factory UserTeamItem.fromJson(Map<String, dynamic> json) =>
      _$UserTeamItemFromJson(json);
}

// Response lấy thông tin của Senior
@freezed
class SeniorInfoItem with _$SeniorInfoItem {
  const factory SeniorInfoItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'LeaderID') int? leaderId,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'ProjectTypeID') int? projectTypeId,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'PositionCode') String? positionCode,
    @JsonKey(name: 'PositionName') String? positionName,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'FullName') String? fullName,
  }) = _SeniorInfoItem;

  factory SeniorInfoItem.fromJson(Map<String, dynamic> json) =>
      _$SeniorInfoItemFromJson(json);
}