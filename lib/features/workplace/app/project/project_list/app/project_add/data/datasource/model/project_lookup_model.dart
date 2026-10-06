import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_lookup_model.freezed.dart';
part 'project_lookup_model.g.dart';

/// Hãng. API: GET /project/get-firm-bases
@freezed
class FirmBase with _$FirmBase {
  const factory FirmBase({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'FirmCode') String? code,
    @JsonKey(name: 'FirmName') String? name,
  }) = _FirmBase;

  factory FirmBase.fromJson(Map<String, dynamic> json) =>
      _$FirmBaseFromJson(json);
}

/// Khách hàng. API: GET /project/get-customers
@freezed
class CustomerItem with _$CustomerItem {
  const factory CustomerItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CustomerCode') String? code,
    @JsonKey(name: 'CustomerName') String? name,
    @JsonKey(name: 'CustomerShortName') String? shortName,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'ContactName') String? contactName,
    @JsonKey(name: 'ContactPhone') String? contactPhone,
    @JsonKey(name: 'ContactEmail') String? contactEmail,
    @JsonKey(name: 'TaxCode') String? taxCode,
    @JsonKey(name: 'Province') String? province,
  }) = _CustomerItem;

  factory CustomerItem.fromJson(Map<String, dynamic> json) =>
      _$CustomerItemFromJson(json);
}

/// Loại dự án. API: GET /get-project-type-bases
@freezed
class ProjectTypeBase with _$ProjectTypeBase {
  const factory ProjectTypeBase({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectTypeCode') String? code,
    @JsonKey(name: 'ProjectTypeName') String? name,
  }) = _ProjectTypeBase;

  factory ProjectTypeBase.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeBaseFromJson(json);
}

/// PM. API: GET /project/get-pms
@freezed
class PmItem with _$PmItem {
  const factory PmItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'TaxCompanyID') int? taxCompanyId,
  }) = _PmItem;

  factory PmItem.fromJson(Map<String, dynamic> json) =>
      _$PmItemFromJson(json);
}

/// Trạng thái dự án. API: GET /project/get-project-status
@freezed
class ProjectStatusItem with _$ProjectStatusItem {
  const factory ProjectStatusItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'StatusName') String? name,
    @JsonKey(name: 'STT') int? stt,
  }) = _ProjectStatusItem;

  factory ProjectStatusItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectStatusItemFromJson(json);
}

/// Lĩnh vực khách hàng. API: GET /project/get-customer-industries
@freezed
class CustomerIndustry with _$CustomerIndustry {
  const factory CustomerIndustry({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'IndustriesNameVI') String? nameVI,
    @JsonKey(name: 'IndustriesNameEN') String? nameEN,
    @JsonKey(name: 'Descriptions') String? descriptions,
    @JsonKey(name: 'NumberOrder') int? numberOrder,
  }) = _CustomerIndustry;

  factory CustomerIndustry.fromJson(Map<String, dynamic> json) =>
      _$CustomerIndustryFromJson(json);
}

/// User-team. API: GET /project/get-user-teams
@freezed
class UserTeamItem with _$UserTeamItem {
  const factory UserTeamItem({
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
  }) = _UserTeamItem;

  factory UserTeamItem.fromJson(Map<String, dynamic> json) =>
      _$UserTeamItemFromJson(json);
}

/// Loại ứng dụng. API: GET /project/get-application-types
@freezed
class ApplicationType with _$ApplicationType {
  const factory ApplicationType({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ApplicationName') String? name,
    @JsonKey(name: 'Descriptions') String? descriptions,
    @JsonKey(name: 'ProjectTypeID') int? projectTypeId,
  }) = _ApplicationType;

  factory ApplicationType.fromJson(Map<String, dynamic> json) =>
      _$ApplicationTypeFromJson(json);
}

/// Công nghệ. API: GET /project/get-technologies
@freezed
class Technology with _$Technology {
  const factory Technology({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'TechnologyName') String? name,
    @JsonKey(name: 'Descriptions') String? descriptions,
    @JsonKey(name: 'ProjectTypeID') int? projectTypeId,
  }) = _Technology;

  factory Technology.fromJson(Map<String, dynamic> json) =>
      _$TechnologyFromJson(json);
}

/// Dự án (modal). API: GET /project/get-project-modal
@freezed
class ProjectModalItem with _$ProjectModalItem {
  const factory ProjectModalItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ProjectShortName') String? projectShortName,
    @JsonKey(name: 'ProjectStatus') int? projectStatus,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,
    @JsonKey(name: 'ProjectType') int? projectType,
    @JsonKey(name: 'ProjectManager') int? projectManager,
    @JsonKey(name: 'Priotity') double? priority,
    @JsonKey(name: 'EndUser') int? endUser,
    @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
    @JsonKey(name: 'TypeProject') int? typeProject,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
  }) = _ProjectModalItem;

  factory ProjectModalItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectModalItemFromJson(json);
}
