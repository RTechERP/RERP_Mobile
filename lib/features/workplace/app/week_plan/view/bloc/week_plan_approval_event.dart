part of 'week_plan_approval_bloc.dart';

@freezed
class WeekPlanApprovalEvent with _$WeekPlanApprovalEvent {
  const factory WeekPlanApprovalEvent.toggleSelectTask(int taskId) =
      _ToggleSelectTask;

  const factory WeekPlanApprovalEvent.clearSelection() = _ClearSelection;

  const factory WeekPlanApprovalEvent.approveTask({
    required int taskId,
    String? review,
    int? completionRating,
  }) = _ApproveTask;

  const factory WeekPlanApprovalEvent.rejectTask({
    required int taskId,
    required String reason,
  }) = _RejectTask;

  const factory WeekPlanApprovalEvent.bulkApproveTasks({
    required List<int> taskIds,
    String? review,
    int? completionRating,
  }) = _BulkApproveTasks;

  const factory WeekPlanApprovalEvent.bulkRejectTasks({
    required List<int> taskIds,
    required String reason,
  }) = _BulkRejectTasks;

  const factory WeekPlanApprovalEvent.clearApprovalState() =
  _ClearApprovalState;
}