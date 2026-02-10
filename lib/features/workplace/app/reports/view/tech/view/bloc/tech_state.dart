part of 'tech_bloc.dart';

@CopyWith()
class TechState extends BaseBlocState {
  final List<ReportResponse> reports;
  final List<TechProject> projects;

  final List<DepartResponse> departs;

  final List<ProjectResponse> rtcProject;

  final List<ProjectItemResponse> projectItem;

  final List<TechWork> works;

  final TechProject? selectedProject;

  final ProjectItemResponse? selectedProjectItem;

  final int? expandedProjectIndex;
  final int? expandedWorkIndex;

  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? keyword;

  final String locationType;
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

  const TechState({
    required super.status,
    super.message,
    this.reports = const [],
    this.projects = const [],
    this.departs = const [],
    this.rtcProject = const [],
    this.projectItem = const [],
    this.works = const [],
    this.selectedProject,
    this.expandedProjectIndex,
    this.expandedWorkIndex,
    this.dateStart,
    this.dateEnd,
    this.keyword,
    this.locationType = 'rtc',
    this.location = 'VP RTC',
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
  });

  factory TechState.init() => const TechState(
    status: BaseStateStatus.init,
    projects: [],
    reports: [],
    departs: [],
    rtcProject: [],
    projectItem: [],
    works: [],
    selectedProject: null,
    expandedProjectIndex: 0,
    expandedWorkIndex: null,
    locationType: 'rtc',
    location: 'VP RTC',
    isSubmitting: false,
    submitSuccess: false,
    projectError: null,
    workItemError: null,
    totalHoursError: null,
    percentError: null,
    userId: null,
    fullName: null,
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
  ];
}
