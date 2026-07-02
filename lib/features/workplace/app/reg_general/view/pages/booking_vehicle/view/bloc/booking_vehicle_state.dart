part of 'booking_vehicle_bloc.dart';

@CopyWith()
class BookingVehicleState extends BaseBlocState {
  final List<BookingVehicleItem> bookingVehicle;

  final List<ProvinceArrivesItem> provinceArrives;

  final List<ProvinceDepartureItem> provinceDeparture;

  final List<ApproverItem> approver;

  final List<BookingVehiclePersonalItem> employee;

  final BookingVehiclePersonalItem? currentEmployee;
  final List<BookingVehicleProjectItem> projects;

  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  final int? userId;
  final int? employeeId;
  final int? driverEmployeeId;

  /// Số dòng người đi / người về; index UI luôn `0..passengerGoLineCount-1`.
  final int passengerGoLineCount;

  /// Index dòng đang mở (null = collapse hết).
  final int? expandedPassengerGoIndex;

  /// Dòng 0 prefill user hiện tại; tắt sau khi xoá dòng 0 (dòng mới 0 = dữ liệu đã đẩy lên).
  final bool passengerGoFirstRowIsCurrentUserSlot;

  /// Tăng khi xoá dòng — tránh Flutter tái dùng [State] cũ khi index 0 đổi chủ.
  final int passengerFormGeneration;

  /// Số dòng người nhận + kiện (giao hàng thương mại); index UI 0..n-1.
  final int commercialReceiverLineCount;

  /// Index dòng đang mở (null = collapse hết).
  final int? expandedCommercialDeliveryReceiverIndex;

  /// Tăng khi xoá dòng người nhận — tránh tái dùng State cũ.
  final int commercialReceiverFormGeneration;

  /// Số dòng người giao + kiện (lấy hàng thương mại / Demo).
  final int pickupGiverLineCount;

  final int? expandedPickupGiverIndex;

  final int pickupGiverFormGeneration;

  /// Snapshot field Form chung; cập nhật qua [BookingVehicleEvent.updateForm].
  final Map<String, dynamic> formFieldValues;

  final Map<String, dynamic> infoFieldValues;

  /// Loại đặt xe: 0=passengerGo, 1=passengerReturn, 2=commercialDelivery, 3=commercialPickup.
  /// Chuyển sang bloc state để BlocBuilder biết khi nào loại đặt xe thay đổi
  /// (tránh `buildWhen` không trigger khi chỉ `setState` local ở screen).
  final int bookingTypeGroup;

  /// Approver được chọn từ bottom sheet — dùng thẳng cho ApprovedTBP payload.
  final int? selectedApproverEmployeeId;

  const BookingVehicleState({
    required super.status,
    super.message,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.dateStart,
    this.dateEnd,
    this.bookingVehicle = const [],
    this.provinceArrives = const [],
    this.provinceDeparture = const [],
    this.approver = const [],
    this.employee = const [],
    this.projects = const [],
    this.userId,
    this.employeeId,
    this.driverEmployeeId,
    this.passengerGoLineCount = 0,
    this.expandedPassengerGoIndex,
    this.passengerGoFirstRowIsCurrentUserSlot = true,
    this.passengerFormGeneration = 0,
    this.currentEmployee,

    this.commercialReceiverLineCount = 0,
    this.expandedCommercialDeliveryReceiverIndex,
    this.commercialReceiverFormGeneration = 0,

    this.pickupGiverLineCount = 0,
    this.expandedPickupGiverIndex,
    this.pickupGiverFormGeneration = 0,
    this.formFieldValues = const {},
    this.infoFieldValues = const {},
    this.bookingTypeGroup = 0,
    this.selectedApproverEmployeeId,
  });

  factory BookingVehicleState.init() => const BookingVehicleState(
    status: BaseStateStatus.init,
    isSubmitting: false,
    submitSuccess: false,
    deleteSuccess: false,
    isDeleting: false,
    dateStart: null,
    dateEnd: null,
    bookingVehicle: [],
    provinceArrives: [],
    provinceDeparture: [],
    approver: [],
    employee: [],
    projects: [],
    userId: null,
    employeeId: null,
    driverEmployeeId: null,
    passengerGoLineCount: 0,
    expandedPassengerGoIndex: null,
    passengerGoFirstRowIsCurrentUserSlot: true,
    passengerFormGeneration: 0,
    currentEmployee: null,
    commercialReceiverLineCount: 0,
    expandedCommercialDeliveryReceiverIndex: null,
    commercialReceiverFormGeneration: 0,
    pickupGiverLineCount: 0,
    expandedPickupGiverIndex: null,
    pickupGiverFormGeneration: 0,
    formFieldValues: {},
    infoFieldValues: {},
    bookingTypeGroup: 0,
    selectedApproverEmployeeId: null,
  );

  @override
  List get props => [
    status,
    message,
    isSubmitting,
    submitSuccess,
    deleteSuccess,
    isDeleting,
    dateStart,
    dateEnd,
    bookingVehicle,
    provinceArrives,
    provinceDeparture,
    approver,
    employee,
    projects,
    userId,
    employeeId,
    driverEmployeeId,
    passengerGoLineCount,
    expandedPassengerGoIndex,
    passengerGoFirstRowIsCurrentUserSlot,
    passengerFormGeneration,
    currentEmployee,
    commercialReceiverLineCount,
    expandedCommercialDeliveryReceiverIndex,
    commercialReceiverFormGeneration,
    pickupGiverLineCount,
    expandedPickupGiverIndex,
    pickupGiverFormGeneration,
    formFieldValues,
    infoFieldValues,
    bookingTypeGroup,
    selectedApproverEmployeeId,
  ];
}
