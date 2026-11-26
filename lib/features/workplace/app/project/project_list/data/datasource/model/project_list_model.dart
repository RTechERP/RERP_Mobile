import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_list_model.freezed.dart';
part 'project_list_model.g.dart';

@freezed
class ProjectListData with _$ProjectListData {
  const factory ProjectListData({
    @JsonKey(name: 'project') List<ProjectItem>? project,
    @JsonKey(name: 'totalPage') int? totalPage,
  }) = _ProjectListData;

  factory ProjectListData.fromJson(Map<String, dynamic> json) =>
      _$ProjectListDataFromJson(json);
}

@freezed
class ProjectItem with _$ProjectItem {
  const factory ProjectItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ProjectShortName') String? projectShortName,
    @JsonKey(name: 'ProjectStatus') int? projectStatus,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsApproved') dynamic isApproved,
    @JsonKey(name: 'ContactID') dynamic contactId,
    @JsonKey(name: 'PO') dynamic po,
    @JsonKey(name: 'ProjectType') dynamic projectType,
    @JsonKey(name: 'ListCostID') dynamic listCostId,
    @JsonKey(name: 'PlanDateStart') dynamic planDateStart,
    @JsonKey(name: 'PlanDateEnd') dynamic planDateEnd,
    @JsonKey(name: 'ActualDateStart') dynamic actualDateStart,
    @JsonKey(name: 'ActualDateEnd') dynamic actualDateEnd,
    @JsonKey(name: 'EU') dynamic eu,
    @JsonKey(name: 'ProjectManager') int? projectManager,
    @JsonKey(name: 'CurrentState') String? currentState,
    @JsonKey(name: 'Priotity') double? priotity,
    @JsonKey(name: 'PODate') dynamic poDate,
    @JsonKey(name: 'EndUser') int? endUser,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
    @JsonKey(name: 'TypeProject') int? typeProject,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'CustomerCode') String? customerCode,
    @JsonKey(name: 'CustomerName') String? customerName,
    @JsonKey(name: 'FullNameSale') String? fullNameSale,
    @JsonKey(name: 'ContactName') dynamic contactName,
    @JsonKey(name: 'ContactPhone') dynamic contactPhone,
    @JsonKey(name: 'ContactEmail') dynamic contactEmail,
    @JsonKey(name: 'FullNameTech') String? fullNameTech,
    @JsonKey(name: 'ProjectStatusText') String? projectStatusText,
    @JsonKey(name: 'FullNamePM') String? fullNamePM,
    @JsonKey(name: 'PersonalPriotity') int? personalPriotity,
    @JsonKey(name: 'ProjectStatusName') String? projectStatusName,
    @JsonKey(name: 'PMID') int? pmId,
    @JsonKey(name: 'EndUserName') String? endUserName,
    @JsonKey(name: 'DateLog') dynamic dateLog,
    @JsonKey(name: 'ExpectedPlanDate') String? expectedPlanDate,
    @JsonKey(name: 'ExpectedQuotationDate') String? expectedQuotationDate,
    @JsonKey(name: 'RealityPlanDate') dynamic realityPlanDate,
    @JsonKey(name: 'RealityProjectEndDate') dynamic realityProjectEndDate,
    @JsonKey(name: 'RowNum') int? rowNum,
    @JsonKey(name: 'PriotityText') double? priotityText,
    /// ID của yêu cầu dự án - dùng để gọi API giải pháp.
    @JsonKey(name: 'ProjectRequestID') int? projectRequestId,
  }) = _ProjectItem;

  factory ProjectItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemFromJson(json);
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

/// Kiểu dự án. API: GET /project/get-project-types
@freezed
class ProjectTypeItem with _$ProjectTypeItem {
  const factory ProjectTypeItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectTypeCode') String? code,
    @JsonKey(name: 'ProjectTypeName') String? name,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsHide') bool? isHide,
  }) = _ProjectTypeItem;

  factory ProjectTypeItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeItemFromJson(json);
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
    @JsonKey(name: 'DepartmentID') int? departmentId,
  }) = _PmItem;

  factory PmItem.fromJson(Map<String, dynamic> json) =>
      _$PmItemFromJson(json);
}

/// Nhân sự (kỹ thuật & sale). API: GET /project/get-users
@freezed
class UserItem with _$UserItem {
  const factory UserItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'DepartmentID') int? departmentId,
  }) = _UserItem;

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      _$UserItemFromJson(json);
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

/// Lĩnh vực (business field) của dự án. API: GET /project/get-business-fields
@freezed
class BusinessFieldItem with _$BusinessFieldItem {
  const factory BusinessFieldItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _BusinessFieldItem;

  factory BusinessFieldItem.fromJson(Map<String, dynamic> json) =>
      _$BusinessFieldItemFromJson(json);
}

/// Tham số filter cho API get-projects.
///
/// Lưu ý: `projectType` và `projectStatus` phải gửi chuỗi rỗng khi không
/// lọc - API hiểu `0` là một giá trị lọc hợp lệ nên sẽ trả về tập kết quả
/// khác (chỉ dự án chưa có kiểu / chưa có trạng thái).
class ProjectListParams {
  final int page;
  final int size;
  final String dateTimeS;
  final String dateTimeE;
  final String keyword;
  final int customerId;
  final int saleId;
  final String projectType;
  final int leaderId;
  final int userTechId;
  final int pmId;
  final int globalUserId;
  final String projectStatus;

  /// ID lĩnh vực của dự án - khớp với `bussinessFieldID`.
  ///
  /// Gửi `0` khi không lọc (API hiểu `0` là "tất cả" cho param này).
  final int businessFieldId;

  final bool isAGV;

  ProjectListParams({
    this.page = 1,
    this.size = 100,
    this.dateTimeS = '2025-01-01 00:00:00',
    String? dateTimeE,
    this.keyword = '',
    this.customerId = 0,
    this.saleId = 0,
    this.projectType = '',
    this.leaderId = 0,
    this.userTechId = 0,
    this.pmId = 0,
    this.globalUserId = 0,
    this.projectStatus = '',
    this.businessFieldId = 0,
    this.isAGV = true,
  }) : dateTimeE = dateTimeE ?? _now();

  static String _now() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} 23:59:59';
  }

  Map<String, dynamic> toQueryParams() => {
        'page': page,
        'size': size,
        'dateTimeS': dateTimeS,
        'dateTimeE': dateTimeE,
        'keyword': keyword,
        'customerID': customerId,
        'saleID': saleId,
        'projectType': projectType,
        'leaderID': leaderId,
        'userTechID': userTechId,
        'pmID': pmId,
        'globalUserID': globalUserId,
        'projectStatus': projectStatus,
        'bussinessFieldID': businessFieldId,
        'isAGV': isAGV,
      };
}
