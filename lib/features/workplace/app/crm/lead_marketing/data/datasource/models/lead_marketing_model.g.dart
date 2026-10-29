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
