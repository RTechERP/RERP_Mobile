part of 'tech_bloc.dart';

@CopyWith()
class TechState extends BaseBlocState {
  final List<TechCategory> categories;
  final List<TechProject> projects;

  /// 📌 Chỉ cho phép expand 1 work tại 1 thời điểm
  final int? expandedWorkIndex;

  final int? expandedProjectIndex;

  final DateTime? reportDate;

  const TechState({
    required super.status,
    super.message,
    this.categories = const [],
    this.expandedWorkIndex,
    this.expandedProjectIndex,
    this.reportDate,
    this.projects = const [],
  });

  factory TechState.init() => const TechState(
    status: BaseStateStatus.init,
    projects: [TechProject(id: '1')],
    categories: [TechCategory()],
    expandedWorkIndex: null,
    reportDate: null,
    expandedProjectIndex: null,
  );

  @override
  List get props => [
    status,
    message,
    categories,
    expandedWorkIndex,
    reportDate,
    projects,
    expandedProjectIndex,
  ];
}
