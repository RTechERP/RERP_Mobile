part of 'overtime_bloc.dart';

@CopyWith()
class OvertimeState extends BaseBlocState {
  final List<OvertimeItem> overtime;
  final List<ApproverItem> approvers;
  final List<OvertimeType> overtimeTypes;
  final List<OvertimeProject> overtimeProjects;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final int? employeeId;
  final String? loginName;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  /// Nhân sự đã mở cổng đăng ký bổ sung hay chưa.
  final bool isSupplementaryRegistrationOpen;
  final OvertimeDetailItem? detailItem;
  final bool isFetchingDetail;
  final bool editSuccess;

  /// File đính kèm của phiếu đang xem (từ `overTimeFile` trong response chi tiết).
  final OvertimeFileItem? detailFile;

  /// Liên kết hạng mục công việc của phiếu đang xem (từ `overTimeProjectItem`).
  final OvertimeProjectItemLink? detailProjectItemLink;

  final FillApproverItem? approveId;

  /// Whether project field is required (based on user's department).
  final bool isProjectRequired;

  /// Whether project item (hạng mục công việc) field is required.
  ///
  /// `true` khi phòng ban nằm trong `departmentRequireProjectItem` và user
  /// không có mã quyền miễn validate (`N80`).
  final bool isProjectItemRequired;

  /// Danh sách departmentID bắt buộc chọn hạng mục lấy từ API.
  ///
  /// Bổ sung cho danh sách hardcode `departmentRequireProjectItem` phía app.
  final List<int> departmentRequireProjectItemIds;

  /// Danh sách hạng mục công việc, cache theo `projectId` (status = 2).
  ///
  /// Được tải khi người dùng chọn dự án (`loadProjectItems`) để đổ vào sheet
  /// "Chọn hạng mục công việc".
  final Map<int, List<OvertimeProjectItem>> projectItems;

  /// Danh sách hạng mục công việc, cache theo `projectId` (status = -1 — tất cả).
  ///
  /// Dùng ở màn chi tiết/sửa phiếu: hạng mục đã lưu có thể đã hoàn thành nên
  /// không nằm trong danh sách "đang thực hiện".
  final Map<int, List<OvertimeProjectItem>> projectItemsAll;

  /// Các `projectId` đang tải hạng mục công việc — tránh gọi trùng API.
  final Set<int> loadingProjectItemIds;

  /// Các `projectId` đã tải xong hạng mục công việc (thành công hoặc lỗi).
  ///
  /// Dùng để biết chắc lần tải đã kết thúc — tránh chờ vô hạn khi dự án
  /// không có hạng mục nào.
  final Set<int> loadedProjectItemIds;

  /// Các `projectId` đã tải xong danh sách hạng mục đầy đủ (status = -1).
  final Set<int> loadedProjectItemAllIds;

  const OvertimeState({
    required super.status,
    super.message,
    this.overtime = const [],
    this.approvers = const [],
    this.overtimeTypes = const [],
    this.overtimeProjects = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.employeeId,
    this.loginName,
    this.dateStart,
    this.dateEnd,
    this.isSupplementaryRegistrationOpen = false,
    this.detailItem,
    this.isFetchingDetail = false,
    this.editSuccess = false,
    this.detailFile,
    this.detailProjectItemLink,
    this.approveId,
    this.isProjectRequired = true,
    this.isProjectItemRequired = true,
    this.departmentRequireProjectItemIds = const [],
    this.projectItems = const {},
    this.projectItemsAll = const {},
    this.loadingProjectItemIds = const {},
    this.loadedProjectItemIds = const {},
    this.loadedProjectItemAllIds = const {},
  });

  factory OvertimeState.init() => const OvertimeState(
    status: BaseStateStatus.init,
    overtime: [],
    approvers: [],
    overtimeTypes: [],
    overtimeProjects: [],
    isSubmitting: false,
    submitSuccess: false,
    deleteSuccess: false,
    isDeleting: false,
    employeeId: null,
    loginName: null,
    dateStart: null,
    dateEnd: null,
    isSupplementaryRegistrationOpen: false,
    detailItem: null,
    isFetchingDetail: false,
    editSuccess: false,
    approveId: null,
    isProjectRequired: true,
    isProjectItemRequired: true,
    departmentRequireProjectItemIds: [],
    projectItems: {},
    projectItemsAll: {},
    loadingProjectItemIds: {},
    loadedProjectItemIds: {},
    loadedProjectItemAllIds: {},
  );

  /// Hạng mục công việc đã tải của một dự án (rỗng nếu chưa tải).
  List<OvertimeProjectItem> projectItemsOf(int? projectId) {
    if (projectId == null || projectId <= 0) return const [];
    return projectItems[projectId] ?? const [];
  }

  /// Danh sách hạng mục đầy đủ (status = -1) của một dự án.
  List<OvertimeProjectItem> projectItemsAllOf(int? projectId) {
    if (projectId == null || projectId <= 0) return const [];
    return projectItemsAll[projectId] ?? const [];
  }

  @override
  List get props => [
    status,
    message,
    overtime,
    approvers,
    overtimeTypes,
    overtimeProjects,
    isSubmitting,
    submitSuccess,
    deleteSuccess,
    isDeleting,
    employeeId,
    loginName,
    dateStart,
    dateEnd,
    isSupplementaryRegistrationOpen,
    detailItem,
    isFetchingDetail,
    editSuccess,
    approveId,
    isProjectRequired,
    isProjectItemRequired,
    departmentRequireProjectItemIds,
    projectItems,
    projectItemsAll,
    loadingProjectItemIds,
    loadedProjectItemIds,
    loadedProjectItemAllIds,
  ];
}
