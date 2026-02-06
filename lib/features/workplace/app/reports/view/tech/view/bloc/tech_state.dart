part of 'tech_bloc.dart';

@CopyWith()
class TechState extends BaseBlocState {
  final List<ReportResponse> reports;
  final List<TechProject> projects;

  final TechProject? selectedProject;

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

  const TechState({
    required super.status,
    super.message,
    this.reports = const [],
    this.projects = const [],
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
  });

  factory TechState.init() => const TechState(
    status: BaseStateStatus.init,
    projects: [],
    reports: [],
    expandedProjectIndex: 0,
    expandedWorkIndex: null,
    locationType: 'rtc',
    location: 'VP RTC',
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
  ];
}
