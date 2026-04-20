part of 'overnight_bloc.dart';

@CopyWith()
class OvernightState extends BaseBlocState {
  final List<OvernightItem> overnight;
  final List<ApproverItem> approvers;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final int? employeeId;
  final String? loginName;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  /// Nhân sự đã mở cổng đăng ký bổ sung hay chưa.
  final bool isSupplementaryRegistrationOpen;
  final bool isFetchingDetail;
  final bool editSuccess;

  final FillApproverItem? approveId;
  const OvernightState({
    required super.status,
    super.message,
    this.overnight = const [],
    this.approvers = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.employeeId,
    this.loginName,
    this.dateStart,
    this.dateEnd,
    this.isSupplementaryRegistrationOpen = false,
    this.isFetchingDetail = false,
    this.editSuccess = false,
    this.approveId,
  });

  factory OvernightState.init() => const OvernightState(
    status: BaseStateStatus.init,
    overnight: [],
    approvers: [],
    isSubmitting: false,
    submitSuccess: false,
    deleteSuccess: false,
    isDeleting: false,
    employeeId: null,
    loginName: null,
    dateStart: null,
    dateEnd: null,
    isSupplementaryRegistrationOpen: false,
    isFetchingDetail: false,
    editSuccess: false,
    approveId: null,
  );

  @override
  List get props => [
    status,
    message,
    overnight,
    approvers,
    isSubmitting,
    submitSuccess,
    deleteSuccess,
    isDeleting,
    employeeId,
    loginName,
    dateStart,
    dateEnd,
    isSupplementaryRegistrationOpen,
    isFetchingDetail,
    editSuccess,
    approveId,
  ];
}
