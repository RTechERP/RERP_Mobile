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

  /// Loại được auto-gợi ý khi mở màn add (theo khung giờ hiện tại).
  /// Null nếu ngoài khung giờ tự động — user phải tự chọn.
  final String? suggestedType;

  /// Khung giờ [from, to] gợi ý tương ứng với [suggestedType].
  /// Screen đọc 2 field này để auto-fill FormDateTimePicker, đảm bảo UI
  /// chắc chắn render text (vì gọi qua state → widget rebuild).
  final DateTime? suggestedFrom;
  final DateTime? suggestedTo;

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
    this.suggestedType,
    this.suggestedFrom,
    this.suggestedTo,
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
    suggestedType: null,
    suggestedFrom: null,
    suggestedTo: null,
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
    suggestedType,
    suggestedFrom,
    suggestedTo,
  ];
}
