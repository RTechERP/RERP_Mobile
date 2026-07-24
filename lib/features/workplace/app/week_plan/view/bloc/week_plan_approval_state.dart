part of 'week_plan_approval_bloc.dart';

@CopyWith()
class WeekPlanApprovalState extends BaseBlocState {
  const WeekPlanApprovalState({
    required super.status,
    super.message,
    this.approvalSuccess = false,
    this.approvalTaskId,
    this.approvalIsApprove,
  });

  final bool approvalSuccess;
  final int? approvalTaskId;
  final bool? approvalIsApprove;

  factory WeekPlanApprovalState.init() => const WeekPlanApprovalState(
    status: BaseStateStatus.init,
    approvalSuccess: false,
    approvalTaskId: null,
    approvalIsApprove: null,
  );

  @override
  List get props => [
    status,
    message,
    approvalSuccess,
    approvalTaskId,
    approvalIsApprove,
  ];
}


