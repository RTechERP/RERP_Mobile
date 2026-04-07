part of 'wfh_bloc.dart';

@CopyWith()
class WfhState extends BaseBlocState {
  final List<WfhItem> wfh;
  final List<ApproverItem> approvers;

  final FillApproverItem? approveId;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final int? employeeId;
  final String? loginName;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  const WfhState({
    required super.status,
    super.message,
    this.wfh = const [],
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

  factory WfhState.init() => const WfhState(
    status: BaseStateStatus.init,
    isSubmitting: false,
    submitSuccess: false,
    deleteSuccess: false,
    isDeleting: false,
    wfh: [],
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
    wfh,
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
