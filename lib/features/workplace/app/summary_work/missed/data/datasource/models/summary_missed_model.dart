import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_missed_model.freezed.dart';
part 'summary_missed_model.g.dart';

/// Model cho một phiếu quên chấm công trong danh sách summary.
@freezed
class SummaryMissedItem with _$SummaryMissedItem {
  const factory SummaryMissedItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedTP') int? approvedTP,
    @JsonKey(name: 'DayWork') String? dayWork,
    @JsonKey(name: 'IsApprovedTP') bool? isApprovedTP,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'ApprovedHR') int? approvedHR,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
    @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorID,
    @JsonKey(name: 'DateApprovedSenior') String? dateApprovedSenior,
    @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
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
  }) = _SummaryMissedItem;

  factory SummaryMissedItem.fromJson(Map<String, dynamic> json) =>
      _$SummaryMissedItemFromJson(json);
}

/// Model cho phòng ban dùng trong dropdown bộ lọc.
@freezed
class SummaryMissedDepartment with _$SummaryMissedDepartment {
  const factory SummaryMissedDepartment({
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
  }) = _SummaryMissedDepartment;

  factory SummaryMissedDepartment.fromJson(Map<String, dynamic> json) =>
      _$SummaryMissedDepartmentFromJson(json);
}