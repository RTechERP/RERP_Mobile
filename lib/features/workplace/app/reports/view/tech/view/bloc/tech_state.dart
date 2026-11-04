part of 'tech_bloc.dart';

@CopyWith()
class TechState extends BaseBlocState {
  final List<ReportResponse> reports;
  final List<TechProject> projects;

  final List<DepartResponse> departs;

  final List<ProjectResponse> rtcProject;

  final DetailReportResponse? detailReport;


  final List<ProjectItemResponse> projectItem;

  final List<TechWork> works;

  final TechProject? selectedProject;

  final ProjectItemResponse? selectedProjectItem;

  final int? expandedProjectIndex;
  final int? expandedWorkIndex;

  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? keyword;

  /// Lựa chọn "Nơi làm việc" hiện tại (một trong [TechLocation.options]).
  final String locationType;

  /// Địa chỉ cụ thể do người dùng nhập khi chọn "Địa điểm công tác".
  final String siteLocation;

  /// Giá trị nơi làm việc gửi lên BE.
  ///
  /// Với lựa chọn cố định → đúng text hiển thị (VD: "Văn phòng").
  /// Với "Địa điểm công tác" → địa chỉ đã nhập.
  final String? location;

  final String? backlog;
  final String? problem;
  final String? problemSolve;
  final String? note;
  final String? planNextDay;

  final int? id;

  final String? fullName;

  final bool isSubmitting;
  final bool submitSuccess;

  final String? projectError;
  final String? workItemError;
  final String? totalHoursError;
  final String? percentError;

  final int? userId;

  final bool sendMailSuccess;
  final DateTime? pendingMailDate;
  final String? pendingShareText;
  final DateTime? lastPickedDate;

  final bool isLoadingDetail;
  final DetailReportResponse? selectedReportDetail;

  final DateTime? dateReport;

  final bool isSaving;
  final bool saveSuccess;

  final bool isDeleting;
  final bool deleteSuccess;

  final List<CopyNullResponse> copyReports;
  final bool isCopyLoading;

  final String? copyError;

  final int? teamId;
  final int? departmentId;

  final int? employeeID;

  /// Ca làm thêm đã đăng ký trong ngày đang báo cáo (cache từ API 4.4).
  final List<OvertimeSession> dailyOvertimes;

  /// Ca làm thêm đã bị xoá mềm trên form — cần gửi `IsDeleted = true` khi lưu.
  final List<OvertimeSession> deletedOvertimes;

  /// Người duyệt mặc định của nhân viên (trưởng phòng / đội trưởng).
  final int? defaultApproveId;

  /// Danh sách người duyệt (trưởng phòng / đội trưởng) để chọn trong sheet.
  final List<ApproverItem> approvers;

  /// Danh sách loại làm thêm (từ `/EmployeeTypeOverTime`).
  final List<OvertimeType> overtimeTypes;
  /// `true` khi phòng ban của nhân viên bắt buộc chọn Dự án + Hạng mục.
  final bool isProjectItemRequired;

  /// Ngày báo cáo đang chỉnh sửa trong form (dùng làm mốc cho ca làm thêm).
  final DateTime? currentReportDate;

  /// Danh sách hạng mục công việc chưa đủ thông tin để báo cáo
  /// (thiếu ngày kế hoạch / actual) — không được phép báo cáo trên các hạng mục này.
  final Set<int> ineligibleProjectItemIds;

  const TechState({
    required super.status,
    super.message,
    this.reports = const [],
    this.projects = const [],
    this.departs = const [],
    this.rtcProject = const [],
    this.projectItem = const [],
    this.works = const [],
    this.detailReport,
    this.selectedProject,
    this.expandedProjectIndex,
    this.expandedWorkIndex,
    this.dateStart,
    this.dateEnd,
    this.keyword,
    required this.locationType,
    this.siteLocation = '',
    this.location,
    this.backlog,
    this.problem,
    this.problemSolve,
    this.note,
    this.planNextDay,
    this.id,
    this.fullName,
    this.selectedProjectItem,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.projectError,
    this.workItemError,
    this.totalHoursError,
    this.percentError,
    this.userId,
    this.sendMailSuccess = false,
    this.pendingMailDate,
    this.pendingShareText,
    this.lastPickedDate,
    this.isLoadingDetail = false,
    this.selectedReportDetail,
    this.dateReport,
    this.isSaving = false,
    this.saveSuccess = false,
    this.isDeleting = false,
    this.deleteSuccess = false,
    this.copyReports = const [],
    this.isCopyLoading = false,
    this.teamId,
    this.departmentId,
    this.employeeID,
    this.copyError,
    this.dailyOvertimes = const [],
    this.deletedOvertimes = const [],
    this.defaultApproveId,
    this.approvers = const [],
    this.overtimeTypes = const [],
    this.isProjectItemRequired = false,
    this.currentReportDate,
    this.ineligibleProjectItemIds = const {},
  });

  factory TechState.init() => const TechState(
    status: BaseStateStatus.init,
    projects: [],
    reports: [],
    departs: [],
    rtcProject: [],
    projectItem: [],
    works: [],
    detailReport: null,
    selectedProject: null,
    expandedProjectIndex: 0,
    expandedWorkIndex: null,
    locationType: TechLocation.office,
    siteLocation: '',
    location: TechLocation.office,
    isSubmitting: false,
    submitSuccess: false,
    projectError: null,
    workItemError: null,
    totalHoursError: null,
    percentError: null,
    userId: null,
    fullName: null,
    sendMailSuccess: false,
    pendingMailDate: null,
    pendingShareText: null,
    lastPickedDate: null,
    isLoadingDetail: false,
    selectedReportDetail: null,
    dateReport: null,
    isSaving: false,
    saveSuccess: false,
    isDeleting: false,
    deleteSuccess: false,
    copyReports: [],
    isCopyLoading: false,
    teamId: null,
    departmentId: null,
    employeeID: null,
    copyError: null,
    dailyOvertimes: [],
    deletedOvertimes: [],
    defaultApproveId: null,
    approvers: [],
    overtimeTypes: [],
    isProjectItemRequired: false,
    currentReportDate: null,
    ineligibleProjectItemIds: {},
  );

  @override
  List get props => [
    status,
    message,
    reports,
    projects,
    selectedProject,
    expandedProjectIndex,
    expandedWorkIndex,
    dateStart,
    dateEnd,
    keyword,
    locationType,
    siteLocation,
    location,
    backlog,
    problem,
    problemSolve,
    note,
    planNextDay,
    id,
    fullName,
    departs,
    rtcProject,
    projectItem,
    selectedProjectItem,
    isSubmitting,
    submitSuccess,
    works,
    projectError,
    workItemError,
    totalHoursError,
    percentError,
    userId,
    sendMailSuccess,
    pendingMailDate,
    pendingShareText,
    lastPickedDate,
    isLoadingDetail,
    selectedReportDetail,
    detailReport,
    dateReport,
    isSaving,
    saveSuccess,
    isDeleting,
    deleteSuccess,
    copyReports,
    isCopyLoading,
    teamId,
    departmentId,
    employeeID,
    copyError,
    dailyOvertimes,
    deletedOvertimes,
    defaultApproveId,
    approvers,
    overtimeTypes,
    isProjectItemRequired,
    currentReportDate,
    ineligibleProjectItemIds,
  ];
}
