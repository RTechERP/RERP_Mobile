part of 'agv_bloc.dart';

@CopyWith()
class AgvState extends BaseBlocState {
  final List<dynamic>? list;

  final List<ReportResponse> reports;
  final List<DepartResponse> departs;

  final DetailReportResponse? detailReport;

  final List<ProjectResponse> projects;

  final List<ProjectItemResponse> projectItem;

  final int? expandedWorkIndex;

  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? keyword;

  final String? backlog;
  final String? problem;
  final String? problemSolve;
  final String? note;
  final String? planNextDay;

  final int? id;

  final String? fullName;

  final bool isSubmitting;
  final bool submitSuccess;

  final String? workItemError;
  final String? totalHoursError;
  final String? percentError;

  final int? userId;

  final bool isLoadingDetail;
  final DetailReportNullResponse? selectedReportDetail;

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

  final String? positionName;

  final String? departmentName;

  final String? content;

  final String? results;
  final int? positionId;

  final ProjectResponse? selectedProject;

  final ProjectItemResponse? selectedProjectItem;

  final List<AgvWork> works;

  final String locationType;
  final String? location;

  final int? projectId;

  const AgvState({
    required super.status,
    super.message,
    this.list,
    this.reports = const [],
    this.departs = const [],
    this.projects = const [],
    this.projectItem = const [],
    this.detailReport,
    this.expandedWorkIndex,
    this.dateStart,
    this.dateEnd,
    this.keyword,
    this.backlog,
    this.problem,
    this.problemSolve,
    this.note,
    this.planNextDay,
    this.id,
    this.fullName,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.workItemError,
    this.totalHoursError,
    this.percentError,
    this.userId,
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
    this.positionName,
    this.departmentName,
    this.content,
    this.results,
    this.positionId,
    this.works = const [],
    this.locationType = 'rtc',
    this.location = 'VP RTC',
    this.projectId,
    this.selectedProject,
    this.selectedProjectItem,
  });

  factory AgvState.init() => const AgvState(
    status: BaseStateStatus.init,
    list: null,
    reports: [],
    departs: [],
    projects: [],
    projectItem: [],
    detailReport: null,
    expandedWorkIndex: null,
    isSubmitting: false,
    submitSuccess: false,
    workItemError: null,
    totalHoursError: null,
    percentError: null,
    userId: null,
    fullName: null,
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
    positionName: null,
    departmentName: null,
    content: null,
    results: null,
    positionId: null,
    works: [],
    locationType: 'rtc',
    location: 'VP RTC',
    projectId: null,
    selectedProject: null,
    selectedProjectItem: null,
  );

  @override
  List get props => [
    status,
    message,
    list,
    reports,
    expandedWorkIndex,
    dateStart,
    dateEnd,
    keyword,
    backlog,
    problem,
    problemSolve,
    note,
    planNextDay,
    id,
    fullName,
    departs,
    isSubmitting,
    submitSuccess,
    workItemError,
    totalHoursError,
    percentError,
    userId,
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
    positionName,
    departmentName,
    content,
    results,
    positionId,
    works,
    locationType,
    location,
    projects,
    projectId,
    selectedProject,
    projectItem,
    selectedProjectItem,
  ];
}
