part of 'overtime_bloc.dart';

@CopyWith()
class OvertimeState extends BaseBlocState {
  final List<OvertimeItem> overtime;
  final List<ApproverItem> approvers;
  final List<OvertimeType> overtimeTypes;
  final List<OvertimeProject> overtimeProjects;
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
  final OvertimeDetailItem? detailItem;
  final bool isFetchingDetail;
  final bool editSuccess;

  final FillApproverItem? approveId;
  const OvertimeState({
    required super.status,
    super.message,
    this.overtime = const [],
    this.approvers = const [],
    this.overtimeTypes = const [],
    this.overtimeProjects = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.employeeId,
    this.loginName,
    this.dateStart,
    this.dateEnd,
    this.isSupplementaryRegistrationOpen = false,
    this.detailItem,
    this.isFetchingDetail = false,
    this.editSuccess = false,
    this.approveId,
  });

  factory OvertimeState.init() => const OvertimeState(
    status: BaseStateStatus.init,
    overtime: [],
    approvers: [],
    overtimeTypes: [],
    overtimeProjects: [],
    isSubmitting: false,
    submitSuccess: false,
    deleteSuccess: false,
    isDeleting: false,
    employeeId: null,
    loginName: null,
    dateStart: null,
    dateEnd: null,
    isSupplementaryRegistrationOpen: false,
    detailItem: null,
    isFetchingDetail: false,
    editSuccess: false,
    approveId: null,
  );

  @override
  List get props => [
    status,
    message,
    overtime,
    approvers,
    overtimeTypes,
    overtimeProjects,
    isSubmitting,
    submitSuccess,
    deleteSuccess,
    isDeleting,
    employeeId,
    loginName,
    dateStart,
    dateEnd,
    isSupplementaryRegistrationOpen,
    detailItem,
    isFetchingDetail,
    editSuccess,
    approveId,
  ];
}
