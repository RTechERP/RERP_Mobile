part of 'work_category_bloc.dart';

@CopyWith()
class WorkCategoryState extends BaseBlocState {
  final List<WorkCategoryItem> workCategories;
  final List<WorkAssignItem> assigners;
  final List<WorkProjectItem> projects;
  final List<WorkProjectTypeItem> projectTypes;
  final List<WorkParentItem> parents;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final int? employeeId;
  final String? loginName;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final bool isFetchingDetail;
  final bool editSuccess;
  final int? defaultAssignerId;
  final WorkCategoryDetailItem? detailItem;
  final List<WorkProblemItem> problems;
  final bool saveProblemSuccess;

  const WorkCategoryState({
    required super.status,
    super.message,
    this.workCategories = const [],
    this.assigners = const [],
    this.projects = const [],
    this.projectTypes = const [],
    this.parents = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.employeeId,
    this.loginName,
    this.dateStart,
    this.dateEnd,
    this.isFetchingDetail = false,
    this.editSuccess = false,
    this.defaultAssignerId,
    this.detailItem,
    this.problems = const [],
    this.saveProblemSuccess = false,
  });

  factory WorkCategoryState.init() => const WorkCategoryState(
        status: BaseStateStatus.init,
        workCategories: [],
        assigners: [],
        projects: [],
        projectTypes: [],
        parents: [],
        isSubmitting: false,
        submitSuccess: false,
        deleteSuccess: false,
        isDeleting: false,
        employeeId: null,
        loginName: null,
        dateStart: null,
        dateEnd: null,
        isFetchingDetail: false,
        editSuccess: false,
        defaultAssignerId: null,
        detailItem: null,
        problems: const [],
        saveProblemSuccess: false,
      );

  @override
  List get props => [
        status,
        message,
        workCategories,
        assigners,
        projects,
        projectTypes,
        parents,
        isSubmitting,
        submitSuccess,
        deleteSuccess,
        isDeleting,
        employeeId,
        loginName,
        dateStart,
        dateEnd,
        isFetchingDetail,
        editSuccess,
        defaultAssignerId,
        detailItem,
        problems,
        saveProblemSuccess,
      ];
}
