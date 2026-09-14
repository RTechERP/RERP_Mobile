part of 'project_list_bloc.dart';

@CopyWith()
class ProjectListState extends BaseBlocState {
  final List<ProjectItem> projects;
  final String searchKeyword;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  const ProjectListState({
    required super.status,
    super.message,
    this.projects = const [],
    this.searchKeyword = '',
    this.dateStart,
    this.dateEnd,
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

  @override
  List get props => [
        status,
        message,
        projects,
        searchKeyword,
        dateStart,
        dateEnd,
      ];
}
