part of 'week_plan_approval_bloc.dart';

@freezed
class WeekPlanApprovalEvent with _$WeekPlanApprovalEvent {
  const factory WeekPlanApprovalEvent.approveTask({
    required int taskId,
    String? review,
    int? completionRating,
  }) = _ApproveTask;

  const factory WeekPlanApprovalEvent.rejectTask({
    required int taskId,
    required String reason,
  }) = _RejectTask;

  const factory WeekPlanApprovalEvent.clearApprovalState() =
  _ClearApprovalState;
}