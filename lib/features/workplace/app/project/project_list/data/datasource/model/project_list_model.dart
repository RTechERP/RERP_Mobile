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

    /// ID lĩnh vực khách hàng - dùng để map tự động lĩnh vực khi tạo dự án.
    @JsonKey(name: 'CustomerIndustriesID') int? industriesId,
  }) = _CustomerItem;

  factory CustomerItem.fromJson(Map<String, dynamic> json) =>
      _$CustomerItemFromJson(json);
}

/// Hiển thị khách hàng.
extension CustomerItemDisplay on CustomerItem {
  /// Tên hiển thị gọn: `CustomerShortName - CustomerName`.
  ///
  /// Bỏ qua phần nào bị trống.
  String get displayLabel {
    final short = (shortName ?? '').trim();
    final full = (name ?? '').trim();
    if (short.isEmpty) return full;
    if (full.isEmpty) return short;
    return '$short - $full';
  }
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

/// Kiểu dự án (danh sách cơ bản). API: GET /project/get-project-type-bases
///
/// ID của danh sách này là tham số `projectType` dùng để sinh mã dự án
/// (POST /project/get-project-code-modal).
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

/// Danh sách kiểu dự án dùng cố định trong form tạo dự án.
///
/// ID gán theo thứ tự trong danh sách và là tham số `projectType` khi gọi
/// API sinh mã dự án (POST /project/get-project-code-modal).
class ProjectTypeOption {
  final int id;
  final String name;

  const ProjectTypeOption({required this.id, required this.name});
}

/// Danh sách kiểu dự án cố định.
const List<ProjectTypeOption> kProjectTypeOptions = [
  ProjectTypeOption(id: 1, name: 'Dự án'),
  ProjectTypeOption(id: 2, name: 'Thương mại'),
  ProjectTypeOption(id: 3, name: 'Phim'),
  ProjectTypeOption(id: 4, name: 'Nội bộ'),
  ProjectTypeOption(id: 5, name: 'Training'),
  ProjectTypeOption(id: 6, name: 'Nghiên cứu & phát triển'),
  ProjectTypeOption(id: 7, name: 'Khác'),
];

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

  factory PmItem.fromJson(Map<String, dynamic> json) => _$PmItemFromJson(json);
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

/// Mốc ưu tiên của dự án (dạng cây cha - con).
/// API: GET /project/get-project-priority-modal?projectId=0
@freezed
class ProjectPriorityType with _$ProjectPriorityType {
  const factory ProjectPriorityType({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'ProjectCheckpoint') String? checkpoint,
    @JsonKey(name: 'Rate') double? rate,
    @JsonKey(name: 'Score') int? score,
    @JsonKey(name: 'Priority') double? priority,
    @JsonKey(name: 'ParentID') int? parentId,
  }) = _ProjectPriorityType;

  factory ProjectPriorityType.fromJson(Map<String, dynamic> json) =>
      _$ProjectPriorityTypeFromJson(json);
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
