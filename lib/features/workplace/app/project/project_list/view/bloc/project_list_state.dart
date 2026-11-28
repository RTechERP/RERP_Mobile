part of 'project_list_bloc.dart';

/// Tập bộ lọc đang áp dụng cho danh sách dự án.
///
/// Mỗi giá trị `null` nghĩa là không lọc theo tiêu chí đó.
@immutable
class ProjectFilters extends Equatable {
  const ProjectFilters({
    this.customerId,
    this.projectType,
    this.projectStatus,
    this.saleId,
    this.techId,
    this.pmId,
    this.businessFieldId,
  });

  /// ID khách hàng - khớp với `customerID`.
  final int? customerId;

  /// ID kiểu dự án - khớp với `projectType`.
  final int? projectType;

  /// ID trạng thái dự án - khớp với `projectStatus`.
  final int? projectStatus;

  /// ID sale phụ trách - khớp với `saleID`.
  final int? saleId;

  /// ID kỹ thuật phụ trách - khớp với `userTechID`.
  final int? techId;

  /// ID PM phụ trách - khớp với `pmID`.
  ///
  /// API nhận `EmployeeID` của PM (khớp với cột `PMID` của dự án).
  final int? pmId;

  /// ID lĩnh vực của dự án - khớp với `bussinessFieldID`.
  final int? businessFieldId;

  /// Không có tiêu chí lọc nào đang được áp dụng.
  bool get isEmpty =>
      customerId == null &&
      projectType == null &&
      projectStatus == null &&
      saleId == null &&
      techId == null &&
      pmId == null &&
      businessFieldId == null;

  /// Số tiêu chí đang được áp dụng.
  int get activeCount => [
    customerId,
    projectType,
    projectStatus,
    saleId,
    techId,
    pmId,
    businessFieldId,
  ].where((v) => v != null).length;

  /// Bản sao với các tiêu chí đã thay đổi, giữ nguyên tiêu chí còn lại.
  ProjectFilters copyWith({
    Object? customerId = _sentinel,
    Object? projectType = _sentinel,
    Object? projectStatus = _sentinel,
    Object? saleId = _sentinel,
    Object? techId = _sentinel,
    Object? pmId = _sentinel,
    Object? businessFieldId = _sentinel,
  }) {
    return ProjectFilters(
      customerId: identical(customerId, _sentinel)
          ? this.customerId
          : customerId as int?,
      projectType: identical(projectType, _sentinel)
          ? this.projectType
          : projectType as int?,
      projectStatus: identical(projectStatus, _sentinel)
          ? this.projectStatus
          : projectStatus as int?,
      saleId: identical(saleId, _sentinel) ? this.saleId : saleId as int?,
      techId: identical(techId, _sentinel) ? this.techId : techId as int?,
      pmId: identical(pmId, _sentinel) ? this.pmId : pmId as int?,
      businessFieldId: identical(businessFieldId, _sentinel)
          ? this.businessFieldId
          : businessFieldId as int?,
    );
  }

  @override
  List<Object?> get props => [
    customerId,
    projectType,
    projectStatus,
    saleId,
    techId,
    pmId,
    businessFieldId,
  ];
}

/// Marker để phân biệt "không truyền" với "truyền null" trong [ProjectFilters.copyWith].
const Object _sentinel = Object();

@CopyWith()
class ProjectListState extends BaseBlocState {
  final List<ProjectItem> projects;
  final String searchKeyword;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Bộ lọc đang áp dụng (khách hàng, kiểu dự án, trạng thái, nhân sự...).
  final ProjectFilters filters;

  /// Dữ liệu lookup cho bộ lọc và form tạo dự án.
  final List<CustomerItem> customers;
  final List<ProjectTypeItem> projectTypes;
  final List<ProjectStatusItem> statuses;
  final List<UserItem> users;
  final List<PmItem> pms;
  final List<BusinessFieldItem> businessFields;
  final List<FirmBase> firms;
  final List<CustomerIndustry> industries;

  /// Kiểu dự án cơ bản - dùng làm danh sách cho ô "Lĩnh vực".
  final List<ProjectTypeBase> projectTypeBases;

  /// Các mốc ưu tiên của dự án.
  final List<ProjectPriorityType> priorityTypes;

  /// Mã dự án vừa được sinh tự động.
  final String? generatedProjectCode;

  /// Đang gọi API sinh mã dự án hay không.
  final bool isGeneratingCode;

  /// Đang lưu dự án (và khởi tạo Gate) hay không.
  final bool isSaving;

  /// ID dự án vừa lưu thành công - dùng để điều hướng.
  final int? savedProjectId;

  /// Thông báo thành công sau khi lưu dự án.
  final String? saveSuccessMessage;

  const ProjectListState({
    required super.status,
    super.message,
    this.projects = const [],
    this.searchKeyword = '',
    this.dateStart,
    this.dateEnd,
    this.filters = const ProjectFilters(),
    this.customers = const [],
    this.projectTypes = const [],
    this.statuses = const [],
    this.users = const [],
    this.pms = const [],
    this.businessFields = const [],
    this.firms = const [],
    this.industries = const [],
    this.projectTypeBases = const [],
    this.priorityTypes = const [],
    this.generatedProjectCode,
    this.isGeneratingCode = false,
    this.isSaving = false,
    this.savedProjectId,
    this.saveSuccessMessage,
  });

  factory ProjectListState.init() => const ProjectListState(
    status: BaseStateStatus.init,
    projects: [],
    searchKeyword: '',
  );

  List<ProjectItem> get filteredProjects {
    if (searchKeyword.isEmpty) return projects;
    final keywordLower = searchKeyword.toLowerCase();
    return projects.where((item) {
      final nameMatch =
          item.projectName?.toLowerCase().contains(keywordLower) ?? false;
      final codeMatch =
          item.projectCode?.toLowerCase().contains(keywordLower) ?? false;
      final customerMatch =
          item.customerName?.toLowerCase().contains(keywordLower) ?? false;
      return nameMatch || codeMatch || customerMatch;
    }).toList();
  }

  /// Tên khách hàng đang lọc.
  String? get filteredCustomerName {
    final id = filters.customerId;
    if (id == null) return null;
    for (final c in customers) {
      if (c.id == id) return c.name;
    }
    return null;
  }

  /// Tên kiểu dự án đang lọc.
  String? get filteredProjectTypeName {
    final id = filters.projectType;
    if (id == null) return null;
    for (final t in projectTypes) {
      if (t.id == id) return t.name;
    }
    return null;
  }

  /// Tên trạng thái đang lọc.
  String? get filteredStatusName {
    final id = filters.projectStatus;
    if (id == null) return null;
    for (final s in statuses) {
      if (s.id == id) return s.name;
    }
    return null;
  }

  /// Tên sale đang lọc.
  String? get filteredSaleName {
    final id = filters.saleId;
    if (id == null) return null;
    for (final u in users) {
      if (u.id == id) return u.fullName;
    }
    return null;
  }

  /// Tên kỹ thuật đang lọc.
  String? get filteredTechName {
    final id = filters.techId;
    if (id == null) return null;
    for (final u in users) {
      if (u.id == id) return u.fullName;
    }
    return null;
  }

  /// Tên PM đang lọc.
  ///
  /// API `pmID` nhận `EmployeeID` của PM (khớp với cột `PMID` của dự án),
  /// nên tra theo cả `employeeId` lẫn `id`.
  String? get filteredPmName {
    final id = filters.pmId;
    if (id == null) return null;
    for (final p in pms) {
      if (p.employeeId == id || p.id == id) return p.fullName;
    }
    return null;
  }

  /// Tên lĩnh vực đang lọc.
  String? get filteredBusinessFieldName {
    final id = filters.businessFieldId;
    if (id == null) return null;
    for (final b in businessFields) {
      if (b.id == id) return b.name;
    }
    return null;
  }

  @override
  List get props => [
    status,
    message,
    projects,
    searchKeyword,
    dateStart,
    dateEnd,
    filters,
    customers,
    projectTypes,
    statuses,
    users,
    pms,
    businessFields,
    firms,
        industries,
        projectTypeBases,
        priorityTypes,
        generatedProjectCode,
    isGeneratingCode,
    isSaving,
    savedProjectId,
    saveSuccessMessage,
  ];
}
