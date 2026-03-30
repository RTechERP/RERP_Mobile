part of 'leave_bloc.dart';

@CopyWith()
class LeaveState extends BaseBlocState {
  final List<LeaveItem> leave;
  final List<ApproverItem> approvers;

  final List<LeaveTimeItem> leaveTime;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final int? employeeId;
  final String? loginName;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  /// Thông tin user cho form (readonly).
  final String? departmentName;
  final String? employeeDisplayLine;
  /// Admin / HR: bỏ ràng buộc chọn ngày (quá khứ, 19h ngày mai).
  final bool skipLeaveDateConstraints;
  const LeaveState({
    required super.status,
    super.message,
    this.leave = const [],
    this.approvers = const [],
    this.leaveTime = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.employeeId,
    this.loginName,
    this.dateStart,
    this.dateEnd,
    this.departmentName,
    this.employeeDisplayLine,
    this.skipLeaveDateConstraints = false,
  });

  factory LeaveState.init() => const LeaveState(
    status: BaseStateStatus.init,
    isSubmitting: false,
    submitSuccess: false,
    deleteSuccess: false,
    isDeleting: false,
    leave: [],
    approvers: [],
    leaveTime: [],
    employeeId: null,
    loginName: null,
    dateStart: null,
    dateEnd: null,
    departmentName: null,
    employeeDisplayLine: null,
    skipLeaveDateConstraints: false,
  );

  @override
  List get props => [
    status,
    message,
    leave,
    approvers,
    leaveTime,
    isSubmitting,
    submitSuccess,
    deleteSuccess,
    isDeleting,
    employeeId,
    loginName,
    dateStart,
    dateEnd,
    departmentName,
    employeeDisplayLine,
    skipLeaveDateConstraints,
  ];
}
