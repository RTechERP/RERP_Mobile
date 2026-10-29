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

/// Chi tiết một phiếu lead.
///
/// API: GET /Lead/get-detail?id=X.
/// Response: `{ data: { lead: {...}, activities: [...], logs: [...], actions: {...} } }`.
@freezed
class LeadDetail with _$LeadDetail {
  const factory LeadDetail({
    /// Thông tin phiếu lead.
    @JsonKey(name: 'lead') LeadDetailLead? lead,

    /// Danh sách hoạt động đã ghi nhận trên phiếu.
    @JsonKey(name: 'activities') List<LeadActivity>? activities,

    /// Lịch sử chuyển giai đoạn / phân công của phiếu.
    @JsonKey(name: 'logs') List<LeadLog>? logs,

    /// Các hành động người dùng hiện tại được phép thực hiện.
    @JsonKey(name: 'actions') LeadActions? actions,
  }) = _LeadDetail;

  factory LeadDetail.fromJson(Map<String, dynamic> json) =>
      _$LeadDetailFromJson(json);
}

/// Thông tin phiếu lead trong response chi tiết.
///
/// Khác với [LeadMarketingItem] ở chỗ một số trường được trả về dạng null
/// và bổ sung các trường riêng của màn chi tiết.
@freezed
class LeadDetailLead with _$LeadDetailLead {
  const factory LeadDetailLead({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'LeadCode') String? leadCode,
    @JsonKey(name: 'LeadType') int? leadType,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'CustomerTeam') String? customerTeam,
    @JsonKey(name: 'CustomerPart') String? customerPart,
    @JsonKey(name: 'CustomerPosition') String? customerPosition,
    @JsonKey(name: 'CustomerType') int? customerType,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'ContactName') String? contactName,
    @JsonKey(name: 'ContactPosition') String? contactPosition,
    @JsonKey(name: 'ContactPhone') String? contactPhone,
    @JsonKey(name: 'ContactEmail') String? contactEmail,
    @JsonKey(name: 'ContactAppointmentDate') String? contactAppointmentDate,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'CollectedDate') String? collectedDate,
    @JsonKey(name: 'LeadSourceID') int? leadSourceId,
    @JsonKey(name: 'CampaignName') String? campaignName,
    @JsonKey(name: 'Rating') int? rating,
    @JsonKey(name: 'EstimatedValue') double? estimatedValue,
    @JsonKey(name: 'ProductInterest') String? productInterest,
    @JsonKey(name: 'NeedDescription') String? needDescription,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'Website') String? website,
    @JsonKey(name: 'SaleEmployeeID') int? saleEmployeeId,
    @JsonKey(name: 'MarketingEmployeeID') int? marketingEmployeeId,
    @JsonKey(name: 'Stage') int? stage,
    @JsonKey(name: 'HandoverLeaderID') int? handoverLeaderId,
    @JsonKey(name: 'AdminSaleID') int? adminSaleId,
    @JsonKey(name: 'HandoverDate') String? handoverDate,
    @JsonKey(name: 'HandoverBy') int? handoverBy,
    @JsonKey(name: 'QualifiedDate') String? qualifiedDate,
    @JsonKey(name: 'LostReason') String? lostReason,
    @JsonKey(name: 'ClosedDate') String? closedDate,
    @JsonKey(name: 'ReturnReason') String? returnReason,
    @JsonKey(name: 'AssignedDate') String? assignedDate,
    @JsonKey(name: 'AssignedBy') int? assignedBy,
    @JsonKey(name: 'NextFollowUpDate') String? nextFollowUpDate,
    @JsonKey(name: 'PoReason') String? poReason,
    @JsonKey(name: 'PoDate') String? poDate,
    @JsonKey(name: 'PoTypeID') int? poTypeId,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
  }) = _LeadDetailLead;

  factory LeadDetailLead.fromJson(Map<String, dynamic> json) =>
      _$LeadDetailLeadFromJson(json);
}

/// Một hoạt động (task/liên hệ) đã ghi nhận trên phiếu lead.
///
/// API: GET /Lead/get-detail?id=X → `data.activities`.
@freezed
class LeadActivity with _$LeadActivity {
  const factory LeadActivity({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'LeadID') int? leadId,
    @JsonKey(name: 'ActivityType') int? activityType,
    @JsonKey(name: 'ActivityTypeName') String? activityTypeName,
    @JsonKey(name: 'ActivityDate') String? activityDate,
    @JsonKey(name: 'Content') String? content,
    @JsonKey(name: 'Result') String? result,
    @JsonKey(name: 'NextAction') String? nextAction,
    @JsonKey(name: 'NextActionDate') String? nextActionDate,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
  }) = _LeadActivity;

  factory LeadActivity.fromJson(Map<String, dynamic> json) =>
      _$LeadActivityFromJson(json);
}

/// Một dòng lịch sử thay đổi giai đoạn / phân công của phiếu lead.
///
/// API: GET /Lead/get-detail?id=X → `data.logs`.
@freezed
class LeadLog with _$LeadLog {
  const factory LeadLog({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'LeadID') int? leadId,
    @JsonKey(name: 'TypeLog') int? typeLog,
    @JsonKey(name: 'TypeLogName') String? typeLogName,
    @JsonKey(name: 'FromStage') int? fromStage,
    @JsonKey(name: 'ToStage') int? toStage,
    @JsonKey(name: 'FromEmployeeID') int? fromEmployeeId,
    @JsonKey(name: 'FromEmployeeName') String? fromEmployeeName,
    @JsonKey(name: 'ToEmployeeID') int? toEmployeeId,
    @JsonKey(name: 'ToEmployeeName') String? toEmployeeName,
    @JsonKey(name: 'ContentLog') String? contentLog,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
  }) = _LeadLog;

  factory LeadLog.fromJson(Map<String, dynamic> json) =>
      _$LeadLogFromJson(json);
}

/// Một file đính kèm của phiếu lead.
///
/// API: GET /Lead/get-files?customerContactId=X&fileType=1.
@freezed
class LeadFile with _$LeadFile {
  const factory LeadFile({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'ServerPath') String? serverPath,
    @JsonKey(name: 'OriginPath') String? originPath,
    @JsonKey(name: 'CustomerContactID') int? customerContactId,
    @JsonKey(name: 'FileType') int? fileType,
  }) = _LeadFile;

  factory LeadFile.fromJson(Map<String, dynamic> json) =>
      _$LeadFileFromJson(json);
}

/// Các hành động người dùng hiện tại được phép thực hiện trên phiếu lead.
///
/// API: GET /Lead/get-detail?id=X → `data.actions`.
@freezed
class LeadActions with _$LeadActions {
  const factory LeadActions({
    @JsonKey(name: 'CanView') bool? canView,
    @JsonKey(name: 'CanEdit') bool? canEdit,
    @JsonKey(name: 'CanQualify') bool? canQualify,
    @JsonKey(name: 'CanDisqualify') bool? canDisqualify,
    @JsonKey(name: 'CanHandover') bool? canHandover,
    @JsonKey(name: 'CanAssign') bool? canAssign,
    @JsonKey(name: 'CanReturn') bool? canReturn,
    @JsonKey(name: 'CanClose') bool? canClose,
    @JsonKey(name: 'CanLinkCustomer') bool? canLinkCustomer,
    @JsonKey(name: 'CanReopen') bool? canReopen,
    @JsonKey(name: 'CanAddActivity') bool? canAddActivity,
    @JsonKey(name: 'CanDelete') bool? canDelete,
    @JsonKey(name: 'CanPO') bool? canPo,
  }) = _LeadActions;

  factory LeadActions.fromJson(Map<String, dynamic> json) =>
      _$LeadActionsFromJson(json);
}
