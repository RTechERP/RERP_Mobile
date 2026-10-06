// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_lookup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirmBaseImpl _$$FirmBaseImplFromJson(Map<String, dynamic> json) =>
    _$FirmBaseImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['FirmCode'] as String?,
      name: json['FirmName'] as String?,
    );

Map<String, dynamic> _$$FirmBaseImplToJson(_$FirmBaseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FirmCode': instance.code,
      'FirmName': instance.name,
    };

_$CustomerItemImpl _$$CustomerItemImplFromJson(Map<String, dynamic> json) =>
    _$CustomerItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['CustomerCode'] as String?,
      name: json['CustomerName'] as String?,
      shortName: json['CustomerShortName'] as String?,
      address: json['Address'] as String?,
      phone: json['Phone'] as String?,
      email: json['Email'] as String?,
      contactName: json['ContactName'] as String?,
      contactPhone: json['ContactPhone'] as String?,
      contactEmail: json['ContactEmail'] as String?,
      taxCode: json['TaxCode'] as String?,
      province: json['Province'] as String?,
    );

Map<String, dynamic> _$$CustomerItemImplToJson(_$CustomerItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerCode': instance.code,
      'CustomerName': instance.name,
      'CustomerShortName': instance.shortName,
      'Address': instance.address,
      'Phone': instance.phone,
      'Email': instance.email,
      'ContactName': instance.contactName,
      'ContactPhone': instance.contactPhone,
      'ContactEmail': instance.contactEmail,
      'TaxCode': instance.taxCode,
      'Province': instance.province,
    };

_$ProjectTypeBaseImpl _$$ProjectTypeBaseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectTypeBaseImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['ProjectTypeCode'] as String?,
      name: json['ProjectTypeName'] as String?,
    );

Map<String, dynamic> _$$ProjectTypeBaseImplToJson(
        _$ProjectTypeBaseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectTypeCode': instance.code,
      'ProjectTypeName': instance.name,
    };

_$PmItemImpl _$$PmItemImplFromJson(Map<String, dynamic> json) => _$PmItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      taxCompanyId: (json['TaxCompanyID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PmItemImplToJson(_$PmItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentName': instance.departmentName,
      'EmployeeID': instance.employeeId,
      'TaxCompanyID': instance.taxCompanyId,
    };

_$ProjectStatusItemImpl _$$ProjectStatusItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectStatusItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      name: json['StatusName'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectStatusItemImplToJson(
        _$ProjectStatusItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'StatusName': instance.name,
      'STT': instance.stt,
    };

_$CustomerIndustryImpl _$$CustomerIndustryImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerIndustryImpl(
      id: (json['ID'] as num?)?.toInt(),
      nameVI: json['IndustriesNameVI'] as String?,
      nameEN: json['IndustriesNameEN'] as String?,
      descriptions: json['Descriptions'] as String?,
      numberOrder: (json['NumberOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CustomerIndustryImplToJson(
        _$CustomerIndustryImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IndustriesNameVI': instance.nameVI,
      'IndustriesNameEN': instance.nameEN,
      'Descriptions': instance.descriptions,
      'NumberOrder': instance.numberOrder,
    };

_$UserTeamItemImpl _$$UserTeamItemImplFromJson(Map<String, dynamic> json) =>
    _$UserTeamItemImpl(
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentName: json['DepartmentName'] as String?,
    );

Map<String, dynamic> _$$UserTeamItemImplToJson(_$UserTeamItemImpl instance) =>
    <String, dynamic>{
      'EmployeeID': instance.employeeId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentName': instance.departmentName,
    };

_$ApplicationTypeImpl _$$ApplicationTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationTypeImpl(
      id: (json['ID'] as num?)?.toInt(),
      name: json['ApplicationName'] as String?,
      descriptions: json['Descriptions'] as String?,
      projectTypeId: (json['ProjectTypeID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ApplicationTypeImplToJson(
        _$ApplicationTypeImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ApplicationName': instance.name,
      'Descriptions': instance.descriptions,
      'ProjectTypeID': instance.projectTypeId,
    };

_$TechnologyImpl _$$TechnologyImplFromJson(Map<String, dynamic> json) =>
    _$TechnologyImpl(
      id: (json['ID'] as num?)?.toInt(),
      name: json['TechnologyName'] as String?,
      descriptions: json['Descriptions'] as String?,
      projectTypeId: (json['ProjectTypeID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TechnologyImplToJson(_$TechnologyImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TechnologyName': instance.name,
      'Descriptions': instance.descriptions,
      'ProjectTypeID': instance.projectTypeId,
    };

_$ProjectModalItemImpl _$$ProjectModalItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectModalItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectShortName: json['ProjectShortName'] as String?,
      projectStatus: (json['ProjectStatus'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      userTechnicalId: (json['UserTechnicalID'] as num?)?.toInt(),
      projectType: (json['ProjectType'] as num?)?.toInt(),
      projectManager: (json['ProjectManager'] as num?)?.toInt(),
      priority: (json['Priotity'] as num?)?.toDouble(),
      endUser: (json['EndUser'] as num?)?.toInt(),
      businessFieldId: (json['BusinessFieldID'] as num?)?.toInt(),
      typeProject: (json['TypeProject'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
    );

Map<String, dynamic> _$$ProjectModalItemImplToJson(
        _$ProjectModalItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectShortName': instance.projectShortName,
      'ProjectStatus': instance.projectStatus,
      'UserID': instance.userId,
      'UserTechnicalID': instance.userTechnicalId,
      'ProjectType': instance.projectType,
      'ProjectManager': instance.projectManager,
      'Priotity': instance.priority,
      'EndUser': instance.endUser,
      'BusinessFieldID': instance.businessFieldId,
      'TypeProject': instance.typeProject,
      'IsDeleted': instance.isDeleted,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate,
    };
