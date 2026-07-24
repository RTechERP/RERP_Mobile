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
    this.selectedTaskIds = const {},
  });

  final bool approvalSuccess;
  final int? approvalTaskId;
  final bool? approvalIsApprove;
  final bool needsRefresh;
  final Set<int> selectedTaskIds;

  factory WeekPlanApprovalState.init() => const WeekPlanApprovalState(
    status: BaseStateStatus.init,
    approvalSuccess: false,
    approvalTaskId: null,
    approvalIsApprove: null,
    needsRefresh: false,
    selectedTaskIds: {},
  );

  @override
  List get props => [
    status,
    message,
    approvalSuccess,
    approvalTaskId,
    approvalIsApprove,
    needsRefresh,
    selectedTaskIds,
  ];
}
