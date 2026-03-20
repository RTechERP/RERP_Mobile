// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_vehicle_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BookingVehicleStateCWProxy {
  BookingVehicleState status(BaseStateStatus status);

  BookingVehicleState message(String? message);

  BookingVehicleState isSubmitting(bool isSubmitting);

  BookingVehicleState submitSuccess(bool submitSuccess);

  BookingVehicleState deleteSuccess(bool deleteSuccess);

  BookingVehicleState isDeleting(bool isDeleting);

  BookingVehicleState dateStart(DateTime? dateStart);

  BookingVehicleState dateEnd(DateTime? dateEnd);

  BookingVehicleState bookingVehicle(List<BookingVehicleItem> bookingVehicle);

  BookingVehicleState provinceArrives(
      List<ProvinceArrivesItem> provinceArrives);

  BookingVehicleState provinceDeparture(
      List<ProvinceDepartureItem> provinceDeparture);

  BookingVehicleState approver(List<ApproverItem> approver);

  BookingVehicleState employee(List<BookingVehiclePersonalItem> employee);

  BookingVehicleState projects(List<BookingVehicleProjectItem> projects);

  BookingVehicleState userId(int? userId);

  BookingVehicleState employeeId(int? employeeId);

  BookingVehicleState driverEmployeeId(int? driverEmployeeId);

  BookingVehicleState passengerGoInfos(List<int> passengerGoInfos);

  BookingVehicleState expandedPassengerGoIndex(int? expandedPassengerGoIndex);

  BookingVehicleState currentEmployee(
      BookingVehiclePersonalItem? currentEmployee);

  BookingVehicleState commercialDeliveryReceiverInfos(
      List<int> commercialDeliveryReceiverInfos);

  BookingVehicleState expandedCommercialDeliveryReceiverIndex(
      int? expandedCommercialDeliveryReceiverIndex);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingVehicleState call({
    BaseStateStatus? status,
    String? message,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    bool? isDeleting,
    DateTime? dateStart,
    DateTime? dateEnd,
    List<BookingVehicleItem>? bookingVehicle,
    List<ProvinceArrivesItem>? provinceArrives,
    List<ProvinceDepartureItem>? provinceDeparture,
    List<ApproverItem>? approver,
    List<BookingVehiclePersonalItem>? employee,
    List<BookingVehicleProjectItem>? projects,
    int? userId,
    int? employeeId,
    int? driverEmployeeId,
    List<int>? passengerGoInfos,
    int? expandedPassengerGoIndex,
    BookingVehiclePersonalItem? currentEmployee,
    List<int>? commercialDeliveryReceiverInfos,
    int? expandedCommercialDeliveryReceiverIndex,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBookingVehicleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBookingVehicleState.copyWith.fieldName(...)`
class _$BookingVehicleStateCWProxyImpl implements _$BookingVehicleStateCWProxy {
  const _$BookingVehicleStateCWProxyImpl(this._value);

  final BookingVehicleState _value;

  @override
  BookingVehicleState status(BaseStateStatus status) => this(status: status);

  @override
  BookingVehicleState message(String? message) => this(message: message);

  @override
  BookingVehicleState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  BookingVehicleState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  BookingVehicleState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  BookingVehicleState isDeleting(bool isDeleting) =>
      this(isDeleting: isDeleting);

  @override
  BookingVehicleState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  BookingVehicleState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  BookingVehicleState bookingVehicle(List<BookingVehicleItem> bookingVehicle) =>
      this(bookingVehicle: bookingVehicle);

  @override
  BookingVehicleState provinceArrives(
          List<ProvinceArrivesItem> provinceArrives) =>
      this(provinceArrives: provinceArrives);

  @override
  BookingVehicleState provinceDeparture(
          List<ProvinceDepartureItem> provinceDeparture) =>
      this(provinceDeparture: provinceDeparture);

  @override
  BookingVehicleState approver(List<ApproverItem> approver) =>
      this(approver: approver);

  @override
  BookingVehicleState employee(List<BookingVehiclePersonalItem> employee) =>
      this(employee: employee);

  @override
  BookingVehicleState projects(List<BookingVehicleProjectItem> projects) =>
      this(projects: projects);

  @override
  BookingVehicleState userId(int? userId) => this(userId: userId);

  @override
  BookingVehicleState employeeId(int? employeeId) =>
      this(employeeId: employeeId);

  @override
  BookingVehicleState driverEmployeeId(int? driverEmployeeId) =>
      this(driverEmployeeId: driverEmployeeId);

  @override
  BookingVehicleState passengerGoInfos(List<int> passengerGoInfos) =>
      this(passengerGoInfos: passengerGoInfos);

  @override
  BookingVehicleState expandedPassengerGoIndex(int? expandedPassengerGoIndex) =>
      this(expandedPassengerGoIndex: expandedPassengerGoIndex);

  @override
  BookingVehicleState currentEmployee(
          BookingVehiclePersonalItem? currentEmployee) =>
      this(currentEmployee: currentEmployee);

  @override
  BookingVehicleState commercialDeliveryReceiverInfos(
          List<int> commercialDeliveryReceiverInfos) =>
      this(commercialDeliveryReceiverInfos: commercialDeliveryReceiverInfos);

  @override
  BookingVehicleState expandedCommercialDeliveryReceiverIndex(
          int? expandedCommercialDeliveryReceiverIndex) =>
      this(
          expandedCommercialDeliveryReceiverIndex:
              expandedCommercialDeliveryReceiverIndex);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingVehicleState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? bookingVehicle = const $CopyWithPlaceholder(),
    Object? provinceArrives = const $CopyWithPlaceholder(),
    Object? provinceDeparture = const $CopyWithPlaceholder(),
    Object? approver = const $CopyWithPlaceholder(),
    Object? employee = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? driverEmployeeId = const $CopyWithPlaceholder(),
    Object? passengerGoInfos = const $CopyWithPlaceholder(),
    Object? expandedPassengerGoIndex = const $CopyWithPlaceholder(),
    Object? currentEmployee = const $CopyWithPlaceholder(),
    Object? commercialDeliveryReceiverInfos = const $CopyWithPlaceholder(),
    Object? expandedCommercialDeliveryReceiverIndex =
        const $CopyWithPlaceholder(),
  }) {
    return BookingVehicleState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      isSubmitting:
          isSubmitting == const $CopyWithPlaceholder() || isSubmitting == null
              ? _value.isSubmitting
              // ignore: cast_nullable_to_non_nullable
              : isSubmitting as bool,
      submitSuccess:
          submitSuccess == const $CopyWithPlaceholder() || submitSuccess == null
              ? _value.submitSuccess
              // ignore: cast_nullable_to_non_nullable
              : submitSuccess as bool,
      deleteSuccess:
          deleteSuccess == const $CopyWithPlaceholder() || deleteSuccess == null
              ? _value.deleteSuccess
              // ignore: cast_nullable_to_non_nullable
              : deleteSuccess as bool,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      bookingVehicle: bookingVehicle == const $CopyWithPlaceholder() ||
              bookingVehicle == null
          ? _value.bookingVehicle
          // ignore: cast_nullable_to_non_nullable
          : bookingVehicle as List<BookingVehicleItem>,
      provinceArrives: provinceArrives == const $CopyWithPlaceholder() ||
              provinceArrives == null
          ? _value.provinceArrives
          // ignore: cast_nullable_to_non_nullable
          : provinceArrives as List<ProvinceArrivesItem>,
      provinceDeparture: provinceDeparture == const $CopyWithPlaceholder() ||
              provinceDeparture == null
          ? _value.provinceDeparture
          // ignore: cast_nullable_to_non_nullable
          : provinceDeparture as List<ProvinceDepartureItem>,
      approver: approver == const $CopyWithPlaceholder() || approver == null
          ? _value.approver
          // ignore: cast_nullable_to_non_nullable
          : approver as List<ApproverItem>,
      employee: employee == const $CopyWithPlaceholder() || employee == null
          ? _value.employee
          // ignore: cast_nullable_to_non_nullable
          : employee as List<BookingVehiclePersonalItem>,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<BookingVehicleProjectItem>,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as int?,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      driverEmployeeId: driverEmployeeId == const $CopyWithPlaceholder()
          ? _value.driverEmployeeId
          // ignore: cast_nullable_to_non_nullable
          : driverEmployeeId as int?,
      passengerGoInfos: passengerGoInfos == const $CopyWithPlaceholder() ||
              passengerGoInfos == null
          ? _value.passengerGoInfos
          // ignore: cast_nullable_to_non_nullable
          : passengerGoInfos as List<int>,
      expandedPassengerGoIndex:
          expandedPassengerGoIndex == const $CopyWithPlaceholder()
              ? _value.expandedPassengerGoIndex
              // ignore: cast_nullable_to_non_nullable
              : expandedPassengerGoIndex as int?,
      currentEmployee: currentEmployee == const $CopyWithPlaceholder()
          ? _value.currentEmployee
          // ignore: cast_nullable_to_non_nullable
          : currentEmployee as BookingVehiclePersonalItem?,
      commercialDeliveryReceiverInfos:
          commercialDeliveryReceiverInfos == const $CopyWithPlaceholder() ||
                  commercialDeliveryReceiverInfos == null
              ? _value.commercialDeliveryReceiverInfos
              // ignore: cast_nullable_to_non_nullable
              : commercialDeliveryReceiverInfos as List<int>,
      expandedCommercialDeliveryReceiverIndex:
          expandedCommercialDeliveryReceiverIndex ==
                  const $CopyWithPlaceholder()
              ? _value.expandedCommercialDeliveryReceiverIndex
              // ignore: cast_nullable_to_non_nullable
              : expandedCommercialDeliveryReceiverIndex as int?,
    );
  }
}

extension $BookingVehicleStateCopyWith on BookingVehicleState {
  /// Returns a callable class that can be used as follows: `instanceOfBookingVehicleState.copyWith(...)` or like so:`instanceOfBookingVehicleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BookingVehicleStateCWProxy get copyWith =>
      _$BookingVehicleStateCWProxyImpl(this);
}
