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

  /// Màn chi tiết: đang tải get-multi.
  final bool isDetailLoading;
  final int? detailPhaseId;
  final DateTime? detailPhaseDateRegister;
  final int? detailApprovedTP;
  final List<LeaveEditSlip> detailEditSlips;
  /// Toàn bộ phiếu trong phase (get-multi) — dùng merge khi gửi [onEditSubmit].
  final List<LeaveEditSlip> detailPhaseAllSlips;
  /// Phiếu đang mở (ID detail).
  final int? detailFocusDetailId;
  /// Cờ cấp phase từ get-multi (khi detail không có field).
  final bool? detailPhaseIsApprovedBGD;
  final bool? detailPhaseIsApprovedTP;
  final bool? detailPhaseIsApprovedHR;
  final int? detailPhaseStatusHRNumber;
  final String? detailPhaseStatusHRText;

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
    this.isDetailLoading = false,
    this.detailPhaseId,
    this.detailPhaseDateRegister,
    this.detailApprovedTP,
    this.detailEditSlips = const [],
    this.detailPhaseAllSlips = const [],
    this.detailFocusDetailId,
    this.detailPhaseIsApprovedBGD,
    this.detailPhaseIsApprovedTP,
    this.detailPhaseIsApprovedHR,
    this.detailPhaseStatusHRNumber,
    this.detailPhaseStatusHRText,
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
    isDetailLoading: false,
    detailPhaseId: null,
    detailPhaseDateRegister: null,
    detailApprovedTP: null,
    detailEditSlips: [],
    detailPhaseAllSlips: [],
    detailFocusDetailId: null,
    detailPhaseIsApprovedBGD: null,
    detailPhaseIsApprovedTP: null,
    detailPhaseIsApprovedHR: null,
    detailPhaseStatusHRNumber: null,
    detailPhaseStatusHRText: null,
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
    isDetailLoading,
    detailPhaseId,
    detailPhaseDateRegister,
    detailApprovedTP,
    detailEditSlips,
    detailPhaseAllSlips,
    detailFocusDetailId,
    detailPhaseIsApprovedBGD,
    detailPhaseIsApprovedTP,
    detailPhaseIsApprovedHR,
    detailPhaseStatusHRNumber,
    detailPhaseStatusHRText,
  ];
}
