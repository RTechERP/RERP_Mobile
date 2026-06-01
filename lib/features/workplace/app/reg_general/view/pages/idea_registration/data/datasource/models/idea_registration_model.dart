import 'package:freezed_annotation/freezed_annotation.dart';

part 'idea_registration_model.freezed.dart';
part 'idea_registration_model.g.dart';

@freezed
class IdeaCatalogItem with _$IdeaCatalogItem {
  const factory IdeaCatalogItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Name') String? name,
  }) = _IdeaCatalogItem;

  factory IdeaCatalogItem.fromJson(Map<String, dynamic> json) =>
      _$IdeaCatalogItemFromJson(json);
}

@freezed
class IdeaItem with _$IdeaItem {
  const factory IdeaItem({
    @JsonKey(name: 'TotalPage') int? totalPage,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'DateRegister') DateTime? dateRegister,
    @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
    @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
    @JsonKey(name: 'ApprovedTBPID') int? approvedTBPID,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'DateApproved') DateTime? dateApproved,
    @JsonKey(name: 'ApprovedID') int? approvedID,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'RegisterIdeaTypeID') int? registerIdeaTypeID,
    @JsonKey(name: 'DepartmentOrganizationID') int? departmentOrganizationID,
    @JsonKey(name: 'CourseID') int? courseID,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'TBPName') String? tbpName,
    @JsonKey(name: 'BGDName') String? bgdName,
    @JsonKey(name: 'DepartmentScore') double? departmentScore,
    @JsonKey(name: 'TBPScore') double? tbpScore,
    @JsonKey(name: 'BGDScore') double? bgdScore,
    @JsonKey(name: 'AvgScore') double? avgScore,
    @JsonKey(name: 'RowNum') int? rowNum,
    @JsonKey(name: 'BGDScoreNew') String? bgdScoreNew,
    @JsonKey(name: 'DepartmentOrganization') String? departmentOrganization,
    @JsonKey(name: 'DateStart') DateTime? dateStart,
    @JsonKey(name: 'DateEnd') DateTime? dateEnd,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'RegisterTypeName') String? registerTypeName,
    @JsonKey(name: 'RegisterTypeCode') String? registerTypeCode,
    @JsonKey(name: 'RegisterTypeDepartmentName')
    String? registerTypeDepartmentName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
  }) = _IdeaItem;

  factory IdeaItem.fromJson(Map<String, dynamic> json) =>
      _$IdeaItemFromJson(json);
}
