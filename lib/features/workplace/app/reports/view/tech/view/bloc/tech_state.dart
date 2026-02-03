part of 'tech_bloc.dart';

@CopyWith()
class TechState extends BaseBlocState {
  final List<TechCategory> categories;
  final List<TechProject> projects;

  /// 📌 Chỉ cho phép expand 1 work tại 1 thời điểm
  final int? expandedWorkIndex;
  final int? expandedProjectIndex;

  final DateTime? reportDate;

  final DateTime? createDate;

  /// ===== LOCATION =====
  final String locationType; // 'rtc' | 'other'
  final String? location;

  /// ===== EXTRA INFO =====
  final String? issue;
  final String? solution;
  final String? blocking;
  final String? blockingReason;

  /// ===== NEXT PLAN =====
  final String? nextPlan;

  const TechState({
    required super.status,
    super.message,
    this.categories = const [],
    this.projects = const [],
    this.expandedWorkIndex,
    this.expandedProjectIndex,
    this.reportDate,
    this.createDate,

    this.locationType = 'rtc',
    this.location,

    this.issue,
    this.solution,
    this.blocking,
    this.blockingReason,

    this.nextPlan,
  });

  factory TechState.init() => const TechState(
    status: BaseStateStatus.init,
    projects: [TechProject(id: '1')],
    categories: [TechCategory()],
    expandedWorkIndex: null,
    expandedProjectIndex: null,
    reportDate: null,
    createDate: null,

    locationType: 'rtc',
    location: 'VP RTC',
    issue: null,
    solution: null,
    blocking: null,
    blockingReason: null,
    nextPlan: null,
  );

  @override
  List get props => [
    status,
    message,
    categories,
    projects,
    expandedWorkIndex,
    expandedProjectIndex,
    reportDate,
    createDate,
    locationType,
    location,
    issue,
    solution,
    blocking,
    blockingReason,
    nextPlan,
  ];
}