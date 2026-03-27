part of 'missed_bloc.dart';

@CopyWith()
class MissedState extends BaseBlocState {
  final List<MissedItem> missed;
  final List<ApproverItem> approvers;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final int? employeeId;
  final String? loginName;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  const MissedState({
    required super.status,
    super.message,
    this.missed = const [],
    this.approvers = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.employeeId,
    this.loginName,
    this.dateStart,
    this.dateEnd,
  });

  factory MissedState.init() => const MissedState(
    status: BaseStateStatus.init,
    isSubmitting: false,
    submitSuccess: false,
    deleteSuccess: false,
    isDeleting: false,
    missed: [],
    approvers: [],
    employeeId: null,
    loginName: null,
    dateStart: null,
    dateEnd: null,
  );

  @override
  List get props => [
    status,
    message,
    missed,
    approvers,
    isSubmitting,
    submitSuccess,
    deleteSuccess,
    isDeleting,
    employeeId,
    loginName,
    dateStart,
    dateEnd,
  ];
}
