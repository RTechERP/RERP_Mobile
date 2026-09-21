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
