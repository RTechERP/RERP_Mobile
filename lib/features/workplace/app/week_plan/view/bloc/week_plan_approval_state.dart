part of 'week_plan_approval_bloc.dart';

@CopyWith()
class WeekPlanApprovalState extends BaseBlocState {
  const WeekPlanApprovalState({
    required super.status,
    super.message,
    this.approvalSuccess = false,
    this.approvalTaskId,
    this.approvalIsApprove,
    this.needsRefresh = false,
  });

  final bool approvalSuccess;
  final int? approvalTaskId;
  final bool? approvalIsApprove;
  final bool needsRefresh;

  factory WeekPlanApprovalState.init() => const WeekPlanApprovalState(
    status: BaseStateStatus.init,
    approvalSuccess: false,
    approvalTaskId: null,
    approvalIsApprove: null,
    needsRefresh: false,
  );

  @override
  List get props => [
    status,
    message,
    approvalSuccess,
    approvalTaskId,
    approvalIsApprove,
    needsRefresh,
  ];
}
