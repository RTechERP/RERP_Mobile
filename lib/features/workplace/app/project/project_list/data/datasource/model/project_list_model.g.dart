// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectListDataImpl _$$ProjectListDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectListDataImpl(
      project: (json['project'] as List<dynamic>?)
          ?.map((e) => ProjectItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPage: (json['totalPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectListDataImplToJson(
        _$ProjectListDataImpl instance) =>
    <String, dynamic>{
      'project': instance.project,
      'totalPage': instance.totalPage,
    };

_$ProjectItemImpl _$$ProjectItemImplFromJson(Map<String, dynamic> json) =>
    _$ProjectItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectShortName: json['ProjectShortName'] as String?,
      projectStatus: (json['ProjectStatus'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      userTechnicalId: (json['UserTechnicalID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      isApproved: json['IsApproved'],
      contactId: json['ContactID'],
      po: json['PO'],
      projectType: json['ProjectType'],
      listCostId: json['ListCostID'],
      planDateStart: json['PlanDateStart'],
      planDateEnd: json['PlanDateEnd'],
      actualDateStart: json['ActualDateStart'],
      actualDateEnd: json['ActualDateEnd'],
      eu: json['EU'],
      projectManager: (json['ProjectManager'] as num?)?.toInt(),
      currentState: json['CurrentState'] as String?,
      priotity: (json['Priotity'] as num?)?.toDouble(),
      poDate: json['PODate'],
      endUser: (json['EndUser'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      businessFieldId: (json['BusinessFieldID'] as num?)?.toInt(),
      typeProject: (json['TypeProject'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      customerCode: json['CustomerCode'] as String?,
      customerName: json['CustomerName'] as String?,
      fullNameSale: json['FullNameSale'] as String?,
      contactName: json['ContactName'],
      contactPhone: json['ContactPhone'],
      contactEmail: json['ContactEmail'],
      fullNameTech: json['FullNameTech'] as String?,
      projectStatusText: json['ProjectStatusText'] as String?,
      fullNamePM: json['FullNamePM'] as String?,
      personalPriotity: (json['PersonalPriotity'] as num?)?.toInt(),
      projectStatusName: json['ProjectStatusName'] as String?,
      pmId: (json['PMID'] as num?)?.toInt(),
      endUserName: json['EndUserName'] as String?,
      dateLog: json['DateLog'],
      expectedPlanDate: json['ExpectedPlanDate'] as String?,
      expectedQuotationDate: json['ExpectedQuotationDate'] as String?,
      realityPlanDate: json['RealityPlanDate'],
      realityProjectEndDate: json['RealityProjectEndDate'],
      rowNum: (json['RowNum'] as num?)?.toInt(),
      priotityText: (json['PriotityText'] as num?)?.toDouble(),
      projectRequestId: (json['ProjectRequestID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectItemImplToJson(_$ProjectItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectShortName': instance.projectShortName,
      'ProjectStatus': instance.projectStatus,
      'UserID': instance.userId,
      'UserTechnicalID': instance.userTechnicalId,
      'Note': instance.note,
      'IsApproved': instance.isApproved,
      'ContactID': instance.contactId,
      'PO': instance.po,
      'ProjectType': instance.projectType,
      'ListCostID': instance.listCostId,
      'PlanDateStart': instance.planDateStart,
      'PlanDateEnd': instance.planDateEnd,
      'ActualDateStart': instance.actualDateStart,
      'ActualDateEnd': instance.actualDateEnd,
      'EU': instance.eu,
      'ProjectManager': instance.projectManager,
      'CurrentState': instance.currentState,
      'Priotity': instance.priotity,
      'PODate': instance.poDate,
      'EndUser': instance.endUser,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate,
      'BusinessFieldID': instance.businessFieldId,
      'TypeProject': instance.typeProject,
      'IsDeleted': instance.isDeleted,
      'CustomerCode': instance.customerCode,
      'CustomerName': instance.customerName,
      'FullNameSale': instance.fullNameSale,
      'ContactName': instance.contactName,
      'ContactPhone': instance.contactPhone,
      'ContactEmail': instance.contactEmail,
      'FullNameTech': instance.fullNameTech,
      'ProjectStatusText': instance.projectStatusText,
      'FullNamePM': instance.fullNamePM,
      'PersonalPriotity': instance.personalPriotity,
      'ProjectStatusName': instance.projectStatusName,
      'PMID': instance.pmId,
      'EndUserName': instance.endUserName,
      'DateLog': instance.dateLog,
      'ExpectedPlanDate': instance.expectedPlanDate,
      'ExpectedQuotationDate': instance.expectedQuotationDate,
      'RealityPlanDate': instance.realityPlanDate,
      'RealityProjectEndDate': instance.realityProjectEndDate,
      'RowNum': instance.rowNum,
      'PriotityText': instance.priotityText,
      'ProjectRequestID': instance.projectRequestId,
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
      industriesId: (json['CustomerIndustriesID'] as num?)?.toInt(),
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
      'CustomerIndustriesID': instance.industriesId,
    };

_$ProjectTypeItemImpl _$$ProjectTypeItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectTypeItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['ProjectTypeCode'] as String?,
      name: json['ProjectTypeName'] as String?,
      parentId: (json['ParentID'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      isHide: json['IsHide'] as bool?,
    );

Map<String, dynamic> _$$ProjectTypeItemImplToJson(
        _$ProjectTypeItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectTypeCode': instance.code,
      'ProjectTypeName': instance.name,
      'ParentID': instance.parentId,
      'DepartmentID': instance.departmentId,
      'IsDeleted': instance.isDeleted,
      'IsHide': instance.isHide,
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
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PmItemImplToJson(_$PmItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentName': instance.departmentName,
      'EmployeeID': instance.employeeId,
      'TaxCompanyID': instance.taxCompanyId,
      'DepartmentID': instance.departmentId,
    };

_$UserItemImpl _$$UserItemImplFromJson(Map<String, dynamic> json) =>
    _$UserItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserItemImplToJson(_$UserItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentName': instance.departmentName,
      'EmployeeID': instance.employeeId,
      'DepartmentID': instance.departmentId,
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

_$BusinessFieldItemImpl _$$BusinessFieldItemImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessFieldItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      note: json['Note'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$BusinessFieldItemImplToJson(
        _$BusinessFieldItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'STT': instance.stt,
      'Code': instance.code,
      'Name': instance.name,
      'Note': instance.note,
      'IsDeleted': instance.isDeleted,
    };

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

_$ProjectPriorityTypeImpl _$$ProjectPriorityTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectPriorityTypeImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      checkpoint: json['ProjectCheckpoint'] as String?,
      rate: (json['Rate'] as num?)?.toDouble(),
      score: (json['Score'] as num?)?.toInt(),
      priority: (json['Priority'] as num?)?.toDouble(),
      parentId: (json['ParentID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectPriorityTypeImplToJson(
        _$ProjectPriorityTypeImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'ProjectCheckpoint': instance.checkpoint,
      'Rate': instance.rate,
      'Score': instance.score,
      'Priority': instance.priority,
      'ParentID': instance.parentId,
    };
