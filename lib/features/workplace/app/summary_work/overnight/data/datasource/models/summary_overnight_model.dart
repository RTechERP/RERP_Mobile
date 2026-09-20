import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_overnight_model.freezed.dart';
part 'summary_overnight_model.g.dart';

/// Model cho một phiếu làm đêm trong danh sách summary.
@freezed
class SummaryOvernightItem with _$SummaryOvernightItem {
  const factory SummaryOvernightItem({
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
    @JsonKey(name: 'DateRegister') String? dateRegister,
    @JsonKey(name: 'DateStart') String? dateStart,
    @JsonKey(name: 'DateEnd') String? dateEnd,
    @JsonKey(name: 'TotalHours') double? totalHours,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'RowNum') int? rowNum,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'WorkTime') double? workTime,
    @JsonKey(name: 'BreaksTime') double? breaksTime,
  }) = _SummaryOvernightItem;

  factory SummaryOvernightItem.fromJson(Map<String, dynamic> json) =>
      _$SummaryOvernightItemFromJson(json);
}

/// Model cho phòng ban dùng trong dropdown bộ lọc.
@freezed
class SummaryOvernightDepartment with _$SummaryOvernightDepartment {
  const factory SummaryOvernightDepartment({
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
  }) = _SummaryOvernightDepartment;

  factory SummaryOvernightDepartment.fromJson(Map<String, dynamic> json) =>
      _$SummaryOvernightDepartmentFromJson(json);
}