import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_in_out_model.freezed.dart';
part 'summary_in_out_model.g.dart';

@freezed
class SummaryInOutItem with _$SummaryInOutItem {
  const factory SummaryInOutItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'TotalPage') int? totalPage,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedID') int? approvedID,
    @JsonKey(name: 'IsApprovedTP') bool? isApprovedTP,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'DateRegister') String? dateRegister,
    @JsonKey(name: 'TimeRegister') double? timeRegister,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'RowNum') int? rowNum,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
  }) = _SummaryInOutItem;

  factory SummaryInOutItem.fromJson(Map<String, dynamic> json) =>
      _$SummaryInOutItemFromJson(json);
}

@freezed
class SummaryInOutDepartment with _$SummaryInOutDepartment {
  const factory SummaryInOutDepartment({
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
  }) = _SummaryInOutDepartment;

  factory SummaryInOutDepartment.fromJson(Map<String, dynamic> json) =>
      _$SummaryInOutDepartmentFromJson(json);
}
