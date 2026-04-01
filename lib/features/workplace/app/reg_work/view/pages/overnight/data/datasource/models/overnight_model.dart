import 'package:freezed_annotation/freezed_annotation.dart';

part 'overnight_model.freezed.dart';
part 'overnight_model.g.dart';

@freezed
class OvernightItem with _$OvernightItem {
  const factory OvernightItem({
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
    @JsonKey(name: 'DateRegister') DateTime? dateRegister,
    @JsonKey(name: 'DateStart') DateTime? dateStart,
    @JsonKey(name: 'DateEnd') DateTime? dateEnd,
    @JsonKey(name: 'TotalHours') double? totalHours,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'RowNum') int? rowNum,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'WorkTime') double? workTime,
    @JsonKey(name: 'BreaksTime') double? breaksTime,
  }) = _OvernightItem;

  factory OvernightItem.fromJson(Map<String, dynamic> json) =>
      _$OvernightItemFromJson(json);
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