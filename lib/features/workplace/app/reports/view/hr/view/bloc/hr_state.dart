part of 'hr_bloc.dart';

@CopyWith()
class HrState extends BaseBlocState {
  final List<dynamic>? adList;
  final List<dynamic>? lxcpList;

  final List<ReportResponse> reports;

  final List<DepartResponse> departs;

  final DetailReportResponse? detailReport;

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

  final bool sendMailSuccess;

  final DateTime? lastPickedDate;

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

  const HrState({
    required super.status,
    super.message,
    this.adList,
    this.lxcpList,
    this.reports = const [],
    this.departs = const [],
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
    this.sendMailSuccess = false,
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
    this.positionName,
    this.departmentName,
    this.content,
    this.results,
  });

  factory HrState.init() => const HrState(
    status: BaseStateStatus.init,
    adList: null,
    lxcpList: null,
    reports: [],
    departs: [],
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
    sendMailSuccess: false,
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
    positionName: null,
    departmentName: null,
    content: null,
    results: null,
  );

  @override
  List get props => [
    status,
    message,
    adList,
    lxcpList,
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
    projectItem,
    isSubmitting,
    submitSuccess,
    workItemError,
    totalHoursError,
    percentError,
    userId,
    sendMailSuccess,
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
    positionName,
    departmentName,
    content,
    results,
  ];
}
