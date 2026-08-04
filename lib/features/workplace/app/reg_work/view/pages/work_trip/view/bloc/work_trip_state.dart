part of 'work_trip_bloc.dart';

@CopyWith()
class WorkTripState extends BaseBlocState {
  final List<WorkTripItem> workTrips;
  final List<ApproverItem> approvers;
  final List<WorkTripTypeItem> workTripTypes;
  final List<WorkTripTypeVehicle> workTripVehicles;
  final List<WorkTripProject> workTripProjects;
  final List<BookingVehicleSummaryItem> bookingVehicleList;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final int? employeeId;
  final String? loginName;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final WorkTripDetailItem? detailItem;
  final bool isFetchingDetail;

  /// Nhân sự đã mở cổng đăng ký bổ sung hay chưa.
  final bool isSupplementaryRegistrationOpen;

  /// Cập nhật đơn thành công.
  final bool editSuccess;

  /// Đang cập nhật đơn.
  final bool isEditing;

  /// Dữ liệu chi tiết để sao chép sang trang thêm mới.
  final WorkTripDetailItem? copyData;

  /// Đang tải dữ liệu sao chép.
  final bool isFetchingCopy;

  final FillApproverItem? approveId;

  /// Thông tin user đang đăng nhập (lấy từ AuthRepo trong initAdd).
  /// Dùng để xác định user thuộc phòng ban nào — vd: check Sale department.
  final User? currentEmployee;

  const WorkTripState({
    required super.status,
    super.message,
    this.workTrips = const [],
    this.approvers = const [],
    this.workTripTypes = const [],
    this.workTripVehicles = const [],
    this.workTripProjects = const [],
    this.bookingVehicleList = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.employeeId,
    this.loginName,
    this.dateStart,
    this.dateEnd,
    this.detailItem,
    this.isFetchingDetail = false,
    this.isSupplementaryRegistrationOpen = false,
    this.editSuccess = false,
    this.isEditing = false,
    this.copyData,
    this.isFetchingCopy = false,
    this.approveId,
    this.currentEmployee,
  });

  factory WorkTripState.init() => const WorkTripState(
        status: BaseStateStatus.init,
        workTrips: [],
        approvers: [],
        workTripTypes: [],
        workTripVehicles: [],
        workTripProjects: [],
        bookingVehicleList: const [],
        isSubmitting: false,
        submitSuccess: false,
        deleteSuccess: false,
        isDeleting: false,
        employeeId: null,
        loginName: null,
        dateStart: null,
        dateEnd: null,
        detailItem: null,
        isFetchingDetail: false,
        isSupplementaryRegistrationOpen: false,
        editSuccess: false,
        isEditing: false,
        copyData: null,
        isFetchingCopy: false,
        approveId: null,
        currentEmployee: null,
      );

  @override
  List get props => [
        status,
        message,
        workTrips,
        approvers,
        workTripTypes,
        workTripVehicles,
        workTripProjects,
        bookingVehicleList,
        isSubmitting,
        submitSuccess,
        deleteSuccess,
        isDeleting,
        employeeId,
        loginName,
        dateStart,
        dateEnd,
        detailItem,
        isFetchingDetail,
        isSupplementaryRegistrationOpen,
        editSuccess,
        isEditing,
        copyData,
        isFetchingCopy,
        approveId,
        currentEmployee,
      ];
}
