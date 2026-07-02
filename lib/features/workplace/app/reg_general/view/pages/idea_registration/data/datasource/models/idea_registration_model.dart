// ignore_for_file: type=lint, unused_element, deprecated_member_use,
// deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters,
// unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named,
// prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target,
// unnecessary_question_mark

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

//---(Detail API Models)---//

@freezed
class IdeaDetailMember with _$IdeaDetailMember {
  const factory IdeaDetailMember({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
  }) = _IdeaDetailMember;

  factory IdeaDetailMember.fromJson(Map<String, dynamic> json) =>
      _$IdeaDetailMemberFromJson(json);
}

@freezed
class IdeaDetailDepartment with _$IdeaDetailDepartment {
  const factory IdeaDetailDepartment({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'HeadofDepartment') int? headofDepartment,
    @JsonKey(name: 'IsShowHotline') bool? isShowHotline,
    @JsonKey(name: 'PId') String? pid,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'ParentID') int? parentId,
  }) = _IdeaDetailDepartment;

  factory IdeaDetailDepartment.fromJson(Map<String, dynamic> json) =>
      _$IdeaDetailDepartmentFromJson(json);
}

@freezed
class IdeaDetailMain with _$IdeaDetailMain {
  const factory IdeaDetailMain({
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
  }) = _IdeaDetailMain;

  factory IdeaDetailMain.fromJson(Map<String, dynamic> json) =>
      _$IdeaDetailMainFromJson(json);
}

@freezed
class IdeaDetailItem with _$IdeaDetailItem {
  const factory IdeaDetailItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'RegisterIdeaID') int? registerIdeaId,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Category') String? category,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'DateStart') DateTime? dateStart,
    @JsonKey(name: 'DateEnd') DateTime? dateEnd,
  }) = _IdeaDetailItem;

  factory IdeaDetailItem.fromJson(Map<String, dynamic> json) =>
      _$IdeaDetailItemFromJson(json);
}

@freezed
class IdeaDetail with _$IdeaDetail {
  const factory IdeaDetail({
    @JsonKey(name: 'em') List<IdeaDetailMember>? members,
    @JsonKey(name: 'de') List<IdeaDetailDepartment>? departments,
    @JsonKey(name: 'rgt') IdeaDetailMain? main,
    @JsonKey(name: 'rgtd') List<IdeaDetailItem>? details,
    @JsonKey(name: 'rgtf') List<IdeaDetailFile>? files,
    @JsonKey(name: 'rgts') List<IdeaDetailScore>? scores,
  }) = _IdeaDetail;

  factory IdeaDetail.fromJson(Map<String, dynamic> json) =>
      _$IdeaDetailFromJson(json);
}

@freezed
class IdeaDetailFile with _$IdeaDetailFile {
  const factory IdeaDetailFile({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'RegisterIdeaID') int? registerIdeaId,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'FilePath') String? filePath,
    @JsonKey(name: 'FileType') String? fileType,
    @JsonKey(name: 'FileSize') int? fileSize,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
  }) = _IdeaDetailFile;

  factory IdeaDetailFile.fromJson(Map<String, dynamic> json) =>
      _$IdeaDetailFileFromJson(json);
}

@freezed
class IdeaDetailScore with _$IdeaDetailScore {
  const factory IdeaDetailScore({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'RegisterIdeaID') int? registerIdeaId,
    @JsonKey(name: 'Score') double? score,
    @JsonKey(name: 'ScoredBy') String? scoredBy,
    @JsonKey(name: 'ScoredDate') DateTime? scoredDate,
    @JsonKey(name: 'Note') String? note,
  }) = _IdeaDetailScore;

  factory IdeaDetailScore.fromJson(Map<String, dynamic> json) =>
      _$IdeaDetailScoreFromJson(json);
}
