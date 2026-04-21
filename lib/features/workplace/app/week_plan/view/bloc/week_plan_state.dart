part of 'week_plan_bloc.dart';

@CopyWith()
class WeekPlanState extends BaseBlocState {
  final List<WeekPlanTaskItem> myTasks;
  final List<WeekPlanTaskItem> assignedTasks;

  final String searchKeyword;
  final String selectedStatus;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  final int? employeeId;
  final bool isSubmitting;
  final bool submitSuccess;

  // Header form fields (nằm trên tabs)
  final int? headerProjectId;
  final String? headerProjectName;
  final int? headerParentTaskId;
  final String? headerParentTaskName;
  final bool headerIsPersonalTask;
  final int headerComplexity;
  final int? headerTaskCategory;
  final String? headerTaskCategoryName;
  final int? headerWorkType;
  final String? headerWorkTypeName;
  final int? headerStatus;
  final String? headerStatusName;

  const WeekPlanState({
    required super.status,
    super.message,
    this.myTasks = const [],
    this.assignedTasks = const [],
    this.searchKeyword = '',
    this.selectedStatus = 'Tất cả',
    this.dateStart,
    this.dateEnd,
    this.employeeId,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.headerProjectId,
    this.headerProjectName,
    this.headerParentTaskId,
    this.headerParentTaskName,
    this.headerIsPersonalTask = false,
    this.headerComplexity = 3,
    this.headerTaskCategory,
    this.headerTaskCategoryName,
    this.headerWorkType,
    this.headerWorkTypeName,
    this.headerStatus,
    this.headerStatusName,
  });

  factory WeekPlanState.init() => const WeekPlanState(
        status: BaseStateStatus.init,
        myTasks: [],
        assignedTasks: [],
        searchKeyword: '',
        selectedStatus: 'Tất cả',
        isSubmitting: false,
        submitSuccess: false,
        headerComplexity: 3,
        headerIsPersonalTask: false,
      );

  @override
  List get props => [
        status,
        message,
        myTasks,
        assignedTasks,
        searchKeyword,
        selectedStatus,
        dateStart,
        dateEnd,
        employeeId,
        isSubmitting,
        submitSuccess,
        headerProjectId,
        headerProjectName,
        headerParentTaskId,
        headerParentTaskName,
        headerIsPersonalTask,
        headerComplexity,
        headerTaskCategory,
        headerTaskCategoryName,
        headerWorkType,
        headerWorkTypeName,
        headerStatus,
        headerStatusName,
      ];
}
