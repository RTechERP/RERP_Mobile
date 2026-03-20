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

  final List<int> passengerGoInfos;

  /// Index dòng đang expand (null nghĩa là collapse tất cả).
  final int? expandedPassengerGoIndex;

  /// Danh sách "người nhận n" cho form giao hàng thương mại.
  final List<int> commercialDeliveryReceiverInfos;

  /// Index dòng đang expand của "người nhận n" (null nghĩa là collapse tất cả).
  final int? expandedCommercialDeliveryReceiverIndex;
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
    this.passengerGoInfos = const [],
    this.expandedPassengerGoIndex,
    this.currentEmployee,

    this.commercialDeliveryReceiverInfos = const [],
    this.expandedCommercialDeliveryReceiverIndex,
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
    passengerGoInfos: [],
    expandedPassengerGoIndex: null,
    currentEmployee: null,
    commercialDeliveryReceiverInfos: [],
    expandedCommercialDeliveryReceiverIndex: null,
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
    passengerGoInfos,
    expandedPassengerGoIndex,
    currentEmployee,
    commercialDeliveryReceiverInfos,
    expandedCommercialDeliveryReceiverIndex,
  ];
}
