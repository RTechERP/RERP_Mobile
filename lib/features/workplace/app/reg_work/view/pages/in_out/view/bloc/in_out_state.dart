part of 'in_out_bloc.dart';

@CopyWith()
class InOutState extends BaseBlocState {
  final List<InOutItem> inOut;
  final List<ApproverItem> approvers;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final int? employeeId;
  final String? loginName;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  final FillApproverItem? approveId;

  const InOutState({
    required super.status,
    super.message,
    this.inOut = const [],
    this.approvers = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.employeeId,
    this.loginName,
    this.dateStart,
    this.dateEnd,
    this.approveId,
  });

  factory InOutState.init() => const InOutState(
    status: BaseStateStatus.init,
    isSubmitting: false,
    submitSuccess: false,
    deleteSuccess: false,
    isDeleting: false,
    inOut: [],
    approvers: [],
    employeeId: null,
    loginName: null,
    dateStart: null,
    dateEnd: null,
    approveId: null,
  );

  @override
  List get props => [
    status,
    message,
    inOut,
    approvers,
    isSubmitting,
    submitSuccess,
    deleteSuccess,
    isDeleting,
    employeeId,
    loginName,
    dateStart,
    dateEnd,
    approveId,
  ];
}
