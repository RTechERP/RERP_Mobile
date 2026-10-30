// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_marketing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadEmployeeImpl _$$LeadEmployeeImplFromJson(Map<String, dynamic> json) =>
    _$LeadEmployeeImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LeadEmployeeImplToJson(_$LeadEmployeeImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
    };

_$LeadSourceImpl _$$LeadSourceImplFromJson(Map<String, dynamic> json) =>
    _$LeadSourceImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      sourceGroup: (json['SourceGroup'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      note: json['Note'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$LeadSourceImplToJson(_$LeadSourceImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'SourceGroup': instance.sourceGroup,
      'STT': instance.stt,
      'Note': instance.note,
      'IsDeleted': instance.isDeleted,
    };

_$LeadRoleContextImpl _$$LeadRoleContextImplFromJson(
        Map<String, dynamic> json) =>
    _$LeadRoleContextImpl(
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      isAdmin: json['IsAdmin'] as bool?,
      isMarketing: json['IsMarketing'] as bool?,
      isSale: json['IsSale'] as bool?,
      isSaleLeader: json['IsSaleLeader'] as bool?,
      isSaleAdmin: json['IsSaleAdmin'] as bool?,
      isBod: json['IsBod'] as bool?,
      teamEmployeeIds: (json['TeamEmployeeIDs'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      canViewMarketing: json['CanViewMarketing'] as bool?,
      canViewSale: json['CanViewSale'] as bool?,
      canAssign: json['CanAssign'] as bool?,
    );

Map<String, dynamic> _$$LeadRoleContextImplToJson(
        _$LeadRoleContextImpl instance) =>
    <String, dynamic>{
      'EmployeeID': instance.employeeId,
      'IsAdmin': instance.isAdmin,
      'IsMarketing': instance.isMarketing,
      'IsSale': instance.isSale,
      'IsSaleLeader': instance.isSaleLeader,
      'IsSaleAdmin': instance.isSaleAdmin,
      'IsBod': instance.isBod,
      'TeamEmployeeIDs': instance.teamEmployeeIds,
      'CanViewMarketing': instance.canViewMarketing,
      'CanViewSale': instance.canViewSale,
      'CanAssign': instance.canAssign,
    };

_$LeadPoTypeImpl _$$LeadPoTypeImplFromJson(Map<String, dynamic> json) =>
    _$LeadPoTypeImpl(
      id: (json['ID'] as num?)?.toInt(),
      mainIndex: json['MainIndex'] as String?,
      mainGroup: (json['MainGroup'] as num?)?.toInt(),
      mainIndex1: json['MainIndex1'] as String?,
    );

Map<String, dynamic> _$$LeadPoTypeImplToJson(_$LeadPoTypeImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'MainIndex': instance.mainIndex,
      'MainGroup': instance.mainGroup,
      'MainIndex1': instance.mainIndex1,
    };

_$LeadCustomerIndustryImpl _$$LeadCustomerIndustryImplFromJson(
        Map<String, dynamic> json) =>
    _$LeadCustomerIndustryImpl(
      id: (json['ID'] as num?)?.toInt(),
      industriesNameVi: json['IndustriesNameVI'] as String?,
      industriesNameEn: json['IndustriesNameEN'] as String?,
      numberOrder: (json['NumberOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LeadCustomerIndustryImplToJson(
        _$LeadCustomerIndustryImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IndustriesNameVI': instance.industriesNameVi,
      'IndustriesNameEN': instance.industriesNameEn,
      'NumberOrder': instance.numberOrder,
    };

_$LeadCustomerSpecializationImpl _$$LeadCustomerSpecializationImplFromJson(
        Map<String, dynamic> json) =>
    _$LeadCustomerSpecializationImpl(
      id: (json['ID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$$LeadCustomerSpecializationImplToJson(
        _$LeadCustomerSpecializationImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'STT': instance.stt,
      'Code': instance.code,
      'Name': instance.name,
    };

_$LeadBusinessFieldImpl _$$LeadBusinessFieldImplFromJson(
        Map<String, dynamic> json) =>
    _$LeadBusinessFieldImpl(
      id: (json['ID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$$LeadBusinessFieldImplToJson(
        _$LeadBusinessFieldImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'STT': instance.stt,
      'Code': instance.code,
      'Name': instance.name,
    };

_$LeadProvinceImpl _$$LeadProvinceImplFromJson(Map<String, dynamic> json) =>
    _$LeadProvinceImpl(
      id: (json['ID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      provinceCode: json['ProvinceCode'] as String?,
      provinceName: json['ProvinceName'] as String?,
    );

Map<String, dynamic> _$$LeadProvinceImplToJson(_$LeadProvinceImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'STT': instance.stt,
      'ProvinceCode': instance.provinceCode,
      'ProvinceName': instance.provinceName,
    };

_$LeadCustomerImpl _$$LeadCustomerImplFromJson(Map<String, dynamic> json) =>
    _$LeadCustomerImpl(
      id: (json['ID'] as num?)?.toInt(),
      customerName: json['CustomerName'] as String?,
      customerCode: json['CustomerCode'] as String?,
      customerShortName: json['CustomerShortName'] as String?,
      address: json['Address'] as String?,
      phone: json['Phone'] as String?,
      email: json['Email'] as String?,
      contactName: json['ContactName'] as String?,
      contactPhone: json['ContactPhone'] as String?,
      contactEmail: json['ContactEmail'] as String?,
      province: json['Province'] as String?,
      customerType: (json['CustomerType'] as num?)?.toInt(),
      customerIndustriesId: (json['CustomerIndustriesID'] as num?)?.toInt(),
      customerSpecializationId:
          (json['CustomerSpecializationID'] as num?)?.toInt(),
      taxCode: json['TaxCode'] as String?,
    );

Map<String, dynamic> _$$LeadCustomerImplToJson(_$LeadCustomerImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerName': instance.customerName,
      'CustomerCode': instance.customerCode,
      'CustomerShortName': instance.customerShortName,
      'Address': instance.address,
      'Phone': instance.phone,
      'Email': instance.email,
      'ContactName': instance.contactName,
      'ContactPhone': instance.contactPhone,
      'ContactEmail': instance.contactEmail,
      'Province': instance.province,
      'CustomerType': instance.customerType,
      'CustomerIndustriesID': instance.customerIndustriesId,
      'CustomerSpecializationID': instance.customerSpecializationId,
      'TaxCode': instance.taxCode,
    };

_$LeadMarketingItemImpl _$$LeadMarketingItemImplFromJson(
        Map<String, dynamic> json) =>
    _$LeadMarketingItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      leadCode: json['LeadCode'] as String?,
      leadType: (json['LeadType'] as num?)?.toInt(),
      leadTypeName: json['LeadTypeName'] as String?,
      leadSourceId: (json['LeadSourceID'] as num?)?.toInt(),
      leadSourceName: json['LeadSourceName'] as String?,
      campaignName: json['CampaignName'] as String?,
      collectedDate: json['CollectedDate'] as String?,
      companyName: json['CompanyName'] as String?,
      taxCode: json['TaxCode'] as String?,
      customerIndustriesId: (json['CustomerIndustriesID'] as num?)?.toInt(),
      industryName: json['IndustryName'] as String?,
      businessFieldId: (json['BusinessFieldID'] as num?)?.toInt(),
      businessFieldName: json['BusinessFieldName'] as String?,
      website: json['Website'] as String?,
      province: json['Province'] as String?,
      address: json['Address'] as String?,
      contactName: json['ContactName'] as String?,
      contactPosition: json['ContactPosition'] as String?,
      contactPhone: json['ContactPhone'] as String?,
      contactEmail: json['ContactEmail'] as String?,
      needDescription: json['NeedDescription'] as String?,
      productInterest: json['ProductInterest'] as String?,
      estimatedValue: (json['EstimatedValue'] as num?)?.toDouble(),
      rating: (json['Rating'] as num?)?.toInt(),
      ratingName: json['RatingName'] as String?,
      stage: (json['Stage'] as num?)?.toInt(),
      stageName: json['StageName'] as String?,
      marketingEmployeeId: (json['MarketingEmployeeID'] as num?)?.toInt(),
      marketingEmployeeName: json['MarketingEmployeeName'] as String?,
      qualifiedDate: json['QualifiedDate'] as String?,
      handoverDate: json['HandoverDate'] as String?,
      handoverBy: (json['HandoverBy'] as num?)?.toInt(),
      handoverLeaderId: (json['HandoverLeaderID'] as num?)?.toInt(),
      handoverLeaderName: json['HandoverLeaderName'] as String?,
      saleEmployeeId: (json['SaleEmployeeID'] as num?)?.toInt(),
      saleEmployeeName: json['SaleEmployeeName'] as String?,
      assignedDate: json['AssignedDate'] as String?,
      assignedBy: (json['AssignedBy'] as num?)?.toInt(),
      assignedByName: json['AssignedByName'] as String?,
      nextFollowUpDate: json['NextFollowUpDate'] as String?,
      isOverdue: json['IsOverdue'] as bool?,
      closedDate: json['ClosedDate'] as String?,
      customerId: (json['CustomerID'] as num?)?.toInt(),
      customerName: json['CustomerName'] as String?,
      customerCode: json['CustomerCode'] as String?,
      lostReason: json['LostReason'] as String?,
      returnReason: json['ReturnReason'] as String?,
      note: json['Note'] as String?,
      activityCount: (json['ActivityCount'] as num?)?.toInt(),
      lastActivityDate: json['LastActivityDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      poTypeName: json['PoTypeName'] as String?,
      customerType: json['CustomerType'] as String?,
      adminSaleName: json['AdminSaleName'] as String?,
      totalMoneyPo: (json['TotalMoneyPO'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LeadMarketingItemImplToJson(
        _$LeadMarketingItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'LeadCode': instance.leadCode,
      'LeadType': instance.leadType,
      'LeadTypeName': instance.leadTypeName,
      'LeadSourceID': instance.leadSourceId,
      'LeadSourceName': instance.leadSourceName,
      'CampaignName': instance.campaignName,
      'CollectedDate': instance.collectedDate,
      'CompanyName': instance.companyName,
      'TaxCode': instance.taxCode,
      'CustomerIndustriesID': instance.customerIndustriesId,
      'IndustryName': instance.industryName,
      'BusinessFieldID': instance.businessFieldId,
      'BusinessFieldName': instance.businessFieldName,
      'Website': instance.website,
      'Province': instance.province,
      'Address': instance.address,
      'ContactName': instance.contactName,
      'ContactPosition': instance.contactPosition,
      'ContactPhone': instance.contactPhone,
      'ContactEmail': instance.contactEmail,
      'NeedDescription': instance.needDescription,
      'ProductInterest': instance.productInterest,
      'EstimatedValue': instance.estimatedValue,
      'Rating': instance.rating,
      'RatingName': instance.ratingName,
      'Stage': instance.stage,
      'StageName': instance.stageName,
      'MarketingEmployeeID': instance.marketingEmployeeId,
      'MarketingEmployeeName': instance.marketingEmployeeName,
      'QualifiedDate': instance.qualifiedDate,
      'HandoverDate': instance.handoverDate,
      'HandoverBy': instance.handoverBy,
      'HandoverLeaderID': instance.handoverLeaderId,
      'HandoverLeaderName': instance.handoverLeaderName,
      'SaleEmployeeID': instance.saleEmployeeId,
      'SaleEmployeeName': instance.saleEmployeeName,
      'AssignedDate': instance.assignedDate,
      'AssignedBy': instance.assignedBy,
      'AssignedByName': instance.assignedByName,
      'NextFollowUpDate': instance.nextFollowUpDate,
      'IsOverdue': instance.isOverdue,
      'ClosedDate': instance.closedDate,
      'CustomerID': instance.customerId,
      'CustomerName': instance.customerName,
      'CustomerCode': instance.customerCode,
      'LostReason': instance.lostReason,
      'ReturnReason': instance.returnReason,
      'Note': instance.note,
      'ActivityCount': instance.activityCount,
      'LastActivityDate': instance.lastActivityDate,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate,
      'PoTypeName': instance.poTypeName,
      'CustomerType': instance.customerType,
      'AdminSaleName': instance.adminSaleName,
      'TotalMoneyPO': instance.totalMoneyPo,
    };

_$LeadDetailImpl _$$LeadDetailImplFromJson(Map<String, dynamic> json) =>
    _$LeadDetailImpl(
      lead: json['lead'] == null
          ? null
          : LeadDetailLead.fromJson(json['lead'] as Map<String, dynamic>),
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => LeadActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
      logs: (json['logs'] as List<dynamic>?)
          ?.map((e) => LeadLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      actions: json['actions'] == null
          ? null
          : LeadActions.fromJson(json['actions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LeadDetailImplToJson(_$LeadDetailImpl instance) =>
    <String, dynamic>{
      'lead': instance.lead,
      'activities': instance.activities,
      'logs': instance.logs,
      'actions': instance.actions,
    };

_$LeadDetailLeadImpl _$$LeadDetailLeadImplFromJson(Map<String, dynamic> json) =>
    _$LeadDetailLeadImpl(
      id: (json['ID'] as num?)?.toInt(),
      leadCode: json['LeadCode'] as String?,
      leadType: (json['LeadType'] as num?)?.toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      customerTeam: json['CustomerTeam'] as String?,
      customerPart: json['CustomerPart'] as String?,
      customerPosition: json['CustomerPosition'] as String?,
      customerType: (json['CustomerType'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      contactName: json['ContactName'] as String?,
      contactPosition: json['ContactPosition'] as String?,
      contactPhone: json['ContactPhone'] as String?,
      contactEmail: json['ContactEmail'] as String?,
      contactAppointmentDate: json['ContactAppointmentDate'] as String?,
      createdDate: json['CreatedDate'] as String?,
      collectedDate: json['CollectedDate'] as String?,
      leadSourceId: (json['LeadSourceID'] as num?)?.toInt(),
      campaignName: json['CampaignName'] as String?,
      rating: (json['Rating'] as num?)?.toInt(),
      estimatedValue: (json['EstimatedValue'] as num?)?.toDouble(),
      productInterest: json['ProductInterest'] as String?,
      needDescription: json['NeedDescription'] as String?,
      note: json['Note'] as String?,
      website: json['Website'] as String?,
      saleEmployeeId: (json['SaleEmployeeID'] as num?)?.toInt(),
      marketingEmployeeId: (json['MarketingEmployeeID'] as num?)?.toInt(),
      stage: (json['Stage'] as num?)?.toInt(),
      handoverLeaderId: (json['HandoverLeaderID'] as num?)?.toInt(),
      adminSaleId: (json['AdminSaleID'] as num?)?.toInt(),
      handoverDate: json['HandoverDate'] as String?,
      handoverBy: (json['HandoverBy'] as num?)?.toInt(),
      qualifiedDate: json['QualifiedDate'] as String?,
      lostReason: json['LostReason'] as String?,
      closedDate: json['ClosedDate'] as String?,
      returnReason: json['ReturnReason'] as String?,
      assignedDate: json['AssignedDate'] as String?,
      assignedBy: (json['AssignedBy'] as num?)?.toInt(),
      nextFollowUpDate: json['NextFollowUpDate'] as String?,
      poReason: json['PoReason'] as String?,
      poDate: json['PoDate'] as String?,
      poTypeId: (json['PoTypeID'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
    );

Map<String, dynamic> _$$LeadDetailLeadImplToJson(
        _$LeadDetailLeadImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'LeadCode': instance.leadCode,
      'LeadType': instance.leadType,
      'CustomerID': instance.customerId,
      'CustomerTeam': instance.customerTeam,
      'CustomerPart': instance.customerPart,
      'CustomerPosition': instance.customerPosition,
      'CustomerType': instance.customerType,
      'IsDeleted': instance.isDeleted,
      'ContactName': instance.contactName,
      'ContactPosition': instance.contactPosition,
      'ContactPhone': instance.contactPhone,
      'ContactEmail': instance.contactEmail,
      'ContactAppointmentDate': instance.contactAppointmentDate,
      'CreatedDate': instance.createdDate,
      'CollectedDate': instance.collectedDate,
      'LeadSourceID': instance.leadSourceId,
      'CampaignName': instance.campaignName,
      'Rating': instance.rating,
      'EstimatedValue': instance.estimatedValue,
      'ProductInterest': instance.productInterest,
      'NeedDescription': instance.needDescription,
      'Note': instance.note,
      'Website': instance.website,
      'SaleEmployeeID': instance.saleEmployeeId,
      'MarketingEmployeeID': instance.marketingEmployeeId,
      'Stage': instance.stage,
      'HandoverLeaderID': instance.handoverLeaderId,
      'AdminSaleID': instance.adminSaleId,
      'HandoverDate': instance.handoverDate,
      'HandoverBy': instance.handoverBy,
      'QualifiedDate': instance.qualifiedDate,
      'LostReason': instance.lostReason,
      'ClosedDate': instance.closedDate,
      'ReturnReason': instance.returnReason,
      'AssignedDate': instance.assignedDate,
      'AssignedBy': instance.assignedBy,
      'NextFollowUpDate': instance.nextFollowUpDate,
      'PoReason': instance.poReason,
      'PoDate': instance.poDate,
      'PoTypeID': instance.poTypeId,
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate,
    };

_$LeadActivityImpl _$$LeadActivityImplFromJson(Map<String, dynamic> json) =>
    _$LeadActivityImpl(
      id: (json['ID'] as num?)?.toInt(),
      leadId: (json['LeadID'] as num?)?.toInt(),
      activityType: (json['ActivityType'] as num?)?.toInt(),
      activityTypeName: json['ActivityTypeName'] as String?,
      activityDate: json['ActivityDate'] as String?,
      content: json['Content'] as String?,
      result: json['Result'] as String?,
      nextAction: json['NextAction'] as String?,
      nextActionDate: json['NextActionDate'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      employeeName: json['EmployeeName'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
    );

Map<String, dynamic> _$$LeadActivityImplToJson(_$LeadActivityImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'LeadID': instance.leadId,
      'ActivityType': instance.activityType,
      'ActivityTypeName': instance.activityTypeName,
      'ActivityDate': instance.activityDate,
      'Content': instance.content,
      'Result': instance.result,
      'NextAction': instance.nextAction,
      'NextActionDate': instance.nextActionDate,
      'EmployeeID': instance.employeeId,
      'EmployeeName': instance.employeeName,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
    };

_$LeadLogImpl _$$LeadLogImplFromJson(Map<String, dynamic> json) =>
    _$LeadLogImpl(
      id: (json['ID'] as num?)?.toInt(),
      leadId: (json['LeadID'] as num?)?.toInt(),
      typeLog: (json['TypeLog'] as num?)?.toInt(),
      typeLogName: json['TypeLogName'] as String?,
      fromStage: (json['FromStage'] as num?)?.toInt(),
      toStage: (json['ToStage'] as num?)?.toInt(),
      fromEmployeeId: (json['FromEmployeeID'] as num?)?.toInt(),
      fromEmployeeName: json['FromEmployeeName'] as String?,
      toEmployeeId: (json['ToEmployeeID'] as num?)?.toInt(),
      toEmployeeName: json['ToEmployeeName'] as String?,
      contentLog: json['ContentLog'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
    );

Map<String, dynamic> _$$LeadLogImplToJson(_$LeadLogImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'LeadID': instance.leadId,
      'TypeLog': instance.typeLog,
      'TypeLogName': instance.typeLogName,
      'FromStage': instance.fromStage,
      'ToStage': instance.toStage,
      'FromEmployeeID': instance.fromEmployeeId,
      'FromEmployeeName': instance.fromEmployeeName,
      'ToEmployeeID': instance.toEmployeeId,
      'ToEmployeeName': instance.toEmployeeName,
      'ContentLog': instance.contentLog,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
    };

_$LeadFileImpl _$$LeadFileImplFromJson(Map<String, dynamic> json) =>
    _$LeadFileImpl(
      id: (json['ID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      serverPath: json['ServerPath'] as String?,
      originPath: json['OriginPath'] as String?,
      customerContactId: (json['CustomerContactID'] as num?)?.toInt(),
      fileType: (json['FileType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LeadFileImplToJson(_$LeadFileImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FileName': instance.fileName,
      'ServerPath': instance.serverPath,
      'OriginPath': instance.originPath,
      'CustomerContactID': instance.customerContactId,
      'FileType': instance.fileType,
    };

_$LeadActionsImpl _$$LeadActionsImplFromJson(Map<String, dynamic> json) =>
    _$LeadActionsImpl(
      canView: json['CanView'] as bool?,
      canEdit: json['CanEdit'] as bool?,
      canQualify: json['CanQualify'] as bool?,
      canDisqualify: json['CanDisqualify'] as bool?,
      canHandover: json['CanHandover'] as bool?,
      canAssign: json['CanAssign'] as bool?,
      canReturn: json['CanReturn'] as bool?,
      canClose: json['CanClose'] as bool?,
      canLinkCustomer: json['CanLinkCustomer'] as bool?,
      canReopen: json['CanReopen'] as bool?,
      canAddActivity: json['CanAddActivity'] as bool?,
      canDelete: json['CanDelete'] as bool?,
      canPo: json['CanPO'] as bool?,
    );

Map<String, dynamic> _$$LeadActionsImplToJson(_$LeadActionsImpl instance) =>
    <String, dynamic>{
      'CanView': instance.canView,
      'CanEdit': instance.canEdit,
      'CanQualify': instance.canQualify,
      'CanDisqualify': instance.canDisqualify,
      'CanHandover': instance.canHandover,
      'CanAssign': instance.canAssign,
      'CanReturn': instance.canReturn,
      'CanClose': instance.canClose,
      'CanLinkCustomer': instance.canLinkCustomer,
      'CanReopen': instance.canReopen,
      'CanAddActivity': instance.canAddActivity,
      'CanDelete': instance.canDelete,
      'CanPO': instance.canPo,
    };
