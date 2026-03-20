part of 'booking_vehicle_bloc.dart';

@CopyWith()
class BookingVehicleState extends BaseBlocState {
  final List<BookingVehicleItem> bookingVehicle;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  final int? userId;
  final int? employeeId;
  final int? driverEmployeeId;
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
    this.userId,
    this.employeeId,
    this.driverEmployeeId,
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
    userId: null,
    employeeId: null,
    driverEmployeeId: null,
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
    userId,
    employeeId,
    driverEmployeeId,
  ];
}
