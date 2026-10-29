import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_marketing_model.freezed.dart';
part 'lead_marketing_model.g.dart';

/// Nhân viên (sale hoặc marketing) được API trả về.
///
/// Dùng chung cho cả 2 danh sách vì cấu trúc response giống nhau:
/// `{ ID, Code, FullName, DepartmentID }`.
@freezed
class LeadEmployee with _$LeadEmployee {
  const factory LeadEmployee({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
  }) = _LeadEmployee;

  factory LeadEmployee.fromJson(Map<String, dynamic> json) =>
      _$LeadEmployeeFromJson(json);
}

/// Nguồn lead.
///
/// API: GET /LeadSource?sourceGroup=0.
@freezed
class LeadSource with _$LeadSource {
  const factory LeadSource({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'SourceGroup') int? sourceGroup,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _LeadSource;

  factory LeadSource.fromJson(Map<String, dynamic> json) =>
      _$LeadSourceFromJson(json);
}

/// Quyền của người dùng hiện tại trong module Lead.
///
/// API: GET /Lead/get-role-context.
@freezed
class LeadRoleContext with _$LeadRoleContext {
  const factory LeadRoleContext({
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsAdmin') bool? isAdmin,
    @JsonKey(name: 'IsMarketing') bool? isMarketing,
    @JsonKey(name: 'IsSale') bool? isSale,
    @JsonKey(name: 'IsSaleLeader') bool? isSaleLeader,
    @JsonKey(name: 'IsSaleAdmin') bool? isSaleAdmin,
    @JsonKey(name: 'IsBod') bool? isBod,
    @JsonKey(name: 'TeamEmployeeIDs') List<int>? teamEmployeeIds,
    @JsonKey(name: 'CanViewMarketing') bool? canViewMarketing,
    @JsonKey(name: 'CanViewSale') bool? canViewSale,
    @JsonKey(name: 'CanAssign') bool? canAssign,
  }) = _LeadRoleContext;

  factory LeadRoleContext.fromJson(Map<String, dynamic> json) =>
      _$LeadRoleContextFromJson(json);
}

/// Một phiếu lead trong danh sách.
///
/// API: GET /Lead/get-data.
@freezed
class LeadMarketingItem with _$LeadMarketingItem {
  const factory LeadMarketingItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'LeadCode') String? leadCode,
    @JsonKey(name: 'LeadType') int? leadType,
    @JsonKey(name: 'LeadTypeName') String? leadTypeName,
    @JsonKey(name: 'LeadSourceID') int? leadSourceId,
    @JsonKey(name: 'LeadSourceName') String? leadSourceName,
    @JsonKey(name: 'CampaignName') String? campaignName,
    @JsonKey(name: 'CollectedDate') String? collectedDate,
    @JsonKey(name: 'CompanyName') String? companyName,
    @JsonKey(name: 'TaxCode') String? taxCode,
    @JsonKey(name: 'CustomerIndustriesID') int? customerIndustriesId,
    @JsonKey(name: 'IndustryName') String? industryName,
    @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
    @JsonKey(name: 'BusinessFieldName') String? businessFieldName,
    @JsonKey(name: 'Website') String? website,
    @JsonKey(name: 'Province') String? province,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'ContactName') String? contactName,
    @JsonKey(name: 'ContactPosition') String? contactPosition,
    @JsonKey(name: 'ContactPhone') String? contactPhone,
    @JsonKey(name: 'ContactEmail') String? contactEmail,
    @JsonKey(name: 'NeedDescription') String? needDescription,
    @JsonKey(name: 'ProductInterest') String? productInterest,
    @JsonKey(name: 'EstimatedValue') double? estimatedValue,
    @JsonKey(name: 'Rating') int? rating,
    @JsonKey(name: 'RatingName') String? ratingName,
    @JsonKey(name: 'Stage') int? stage,
    @JsonKey(name: 'StageName') String? stageName,
    @JsonKey(name: 'MarketingEmployeeID') int? marketingEmployeeId,
    @JsonKey(name: 'MarketingEmployeeName') String? marketingEmployeeName,
    @JsonKey(name: 'QualifiedDate') String? qualifiedDate,
    @JsonKey(name: 'HandoverDate') String? handoverDate,
    @JsonKey(name: 'HandoverBy') int? handoverBy,
    @JsonKey(name: 'HandoverLeaderID') int? handoverLeaderId,
    @JsonKey(name: 'HandoverLeaderName') String? handoverLeaderName,
    @JsonKey(name: 'SaleEmployeeID') int? saleEmployeeId,
    @JsonKey(name: 'SaleEmployeeName') String? saleEmployeeName,
    @JsonKey(name: 'AssignedDate') String? assignedDate,
    @JsonKey(name: 'AssignedBy') int? assignedBy,
    @JsonKey(name: 'AssignedByName') String? assignedByName,
    @JsonKey(name: 'NextFollowUpDate') String? nextFollowUpDate,
    @JsonKey(name: 'IsOverdue') bool? isOverdue,
    @JsonKey(name: 'ClosedDate') String? closedDate,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'CustomerName') String? customerName,
    @JsonKey(name: 'CustomerCode') String? customerCode,
    @JsonKey(name: 'LostReason') String? lostReason,
    @JsonKey(name: 'ReturnReason') String? returnReason,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'ActivityCount') int? activityCount,
    @JsonKey(name: 'LastActivityDate') String? lastActivityDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'PoTypeName') String? poTypeName,
    @JsonKey(name: 'CustomerType') String? customerType,
    @JsonKey(name: 'AdminSaleName') String? adminSaleName,
    @JsonKey(name: 'TotalMoneyPO') double? totalMoneyPo,
  }) = _LeadMarketingItem;

  factory LeadMarketingItem.fromJson(Map<String, dynamic> json) =>
      _$LeadMarketingItemFromJson(json);
}
