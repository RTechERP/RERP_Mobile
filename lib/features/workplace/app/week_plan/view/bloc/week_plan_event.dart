part of 'week_plan_bloc.dart';

@freezed
class WeekPlanEvent with _$WeekPlanEvent {
  const factory WeekPlanEvent.init() = _Init;

  const factory WeekPlanEvent.refresh() = _Refresh;

  const factory WeekPlanEvent.search(String keyword) = _Search;

  const factory WeekPlanEvent.clearSearch() = _ClearSearch;

  const factory WeekPlanEvent.filterByStatus(String status) = _FilterByStatus;

  const factory WeekPlanEvent.clearStatusFilter() = _ClearStatusFilter;

  const factory WeekPlanEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory WeekPlanEvent.clearDateFilter() = _ClearDateFilter;

  const factory WeekPlanEvent.checkIn(int taskId) = _CheckIn;

  const factory WeekPlanEvent.initAdd() = _InitAdd;

  const factory WeekPlanEvent.createTask({
    required String taskName,
    required String projectName,
    required String content,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime deadline,
    required int priority,
    String? description,
  }) = _CreateTask;

  const factory WeekPlanEvent.clearSubmitState() = _ClearSubmitState;

  const factory WeekPlanEvent.updateHeaderProject({
    required int projectId,
    required String projectName,
  }) = _UpdateHeaderProject;

  const factory WeekPlanEvent.updateHeaderParentTask({
    required int parentTaskId,
    required String parentTaskName,
  }) = _UpdateHeaderParentTask;

  const factory WeekPlanEvent.updateHeaderPersonalTask(bool isPersonal) =
      _UpdateHeaderPersonalTask;

  const factory WeekPlanEvent.updateHeaderComplexity(int complexity) =
      _UpdateHeaderComplexity;

  const factory WeekPlanEvent.updateHeaderTaskCategory({
    required int categoryId,
    required String categoryName,
  }) = _UpdateHeaderTaskCategory;

  const factory WeekPlanEvent.updateHeaderWorkTypeAndStatus({
    required int workTypeId,
    required String workTypeName,
    required int statusId,
    required String statusName,
  }) = _UpdateHeaderWorkTypeAndStatus;
}
