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

  BookingVehicleState passengerGoLineCount(int passengerGoLineCount);

  BookingVehicleState expandedPassengerGoIndex(int? expandedPassengerGoIndex);

  BookingVehicleState passengerGoFirstRowIsCurrentUserSlot(
      bool passengerGoFirstRowIsCurrentUserSlot);

  BookingVehicleState passengerFormGeneration(int passengerFormGeneration);

  BookingVehicleState currentEmployee(
      BookingVehiclePersonalItem? currentEmployee);

  BookingVehicleState commercialReceiverLineCount(
      int commercialReceiverLineCount);

  BookingVehicleState expandedCommercialDeliveryReceiverIndex(
      int? expandedCommercialDeliveryReceiverIndex);

  BookingVehicleState commercialReceiverFormGeneration(
      int commercialReceiverFormGeneration);

  BookingVehicleState pickupGiverLineCount(int pickupGiverLineCount);

  BookingVehicleState expandedPickupGiverIndex(int? expandedPickupGiverIndex);

  BookingVehicleState pickupGiverFormGeneration(int pickupGiverFormGeneration);

  BookingVehicleState formFieldValues(Map<String, dynamic> formFieldValues);

  BookingVehicleState infoFieldValues(Map<String, dynamic> infoFieldValues);

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
    int? passengerGoLineCount,
    int? expandedPassengerGoIndex,
    bool? passengerGoFirstRowIsCurrentUserSlot,
    int? passengerFormGeneration,
    BookingVehiclePersonalItem? currentEmployee,
    int? commercialReceiverLineCount,
    int? expandedCommercialDeliveryReceiverIndex,
    int? commercialReceiverFormGeneration,
    int? pickupGiverLineCount,
    int? expandedPickupGiverIndex,
    int? pickupGiverFormGeneration,
    Map<String, dynamic>? formFieldValues,
    Map<String, dynamic>? infoFieldValues,
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
  BookingVehicleState passengerGoLineCount(int passengerGoLineCount) =>
      this(passengerGoLineCount: passengerGoLineCount);

  @override
  BookingVehicleState expandedPassengerGoIndex(int? expandedPassengerGoIndex) =>
      this(expandedPassengerGoIndex: expandedPassengerGoIndex);

  @override
  BookingVehicleState passengerGoFirstRowIsCurrentUserSlot(
          bool passengerGoFirstRowIsCurrentUserSlot) =>
      this(
          passengerGoFirstRowIsCurrentUserSlot:
              passengerGoFirstRowIsCurrentUserSlot);

  @override
  BookingVehicleState passengerFormGeneration(int passengerFormGeneration) =>
      this(passengerFormGeneration: passengerFormGeneration);

  @override
  BookingVehicleState currentEmployee(
          BookingVehiclePersonalItem? currentEmployee) =>
      this(currentEmployee: currentEmployee);

  @override
  BookingVehicleState commercialReceiverLineCount(
          int commercialReceiverLineCount) =>
      this(commercialReceiverLineCount: commercialReceiverLineCount);

  @override
  BookingVehicleState expandedCommercialDeliveryReceiverIndex(
          int? expandedCommercialDeliveryReceiverIndex) =>
      this(
          expandedCommercialDeliveryReceiverIndex:
              expandedCommercialDeliveryReceiverIndex);

  @override
  BookingVehicleState commercialReceiverFormGeneration(
          int commercialReceiverFormGeneration) =>
      this(commercialReceiverFormGeneration: commercialReceiverFormGeneration);

  @override
  BookingVehicleState pickupGiverLineCount(int pickupGiverLineCount) =>
      this(pickupGiverLineCount: pickupGiverLineCount);

  @override
  BookingVehicleState expandedPickupGiverIndex(int? expandedPickupGiverIndex) =>
      this(expandedPickupGiverIndex: expandedPickupGiverIndex);

  @override
  BookingVehicleState pickupGiverFormGeneration(
          int pickupGiverFormGeneration) =>
      this(pickupGiverFormGeneration: pickupGiverFormGeneration);

  @override
  BookingVehicleState formFieldValues(Map<String, dynamic> formFieldValues) =>
      this(formFieldValues: formFieldValues);

  @override
  BookingVehicleState infoFieldValues(Map<String, dynamic> infoFieldValues) =>
      this(infoFieldValues: infoFieldValues);

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
    Object? passengerGoLineCount = const $CopyWithPlaceholder(),
    Object? expandedPassengerGoIndex = const $CopyWithPlaceholder(),
    Object? passengerGoFirstRowIsCurrentUserSlot = const $CopyWithPlaceholder(),
    Object? passengerFormGeneration = const $CopyWithPlaceholder(),
    Object? currentEmployee = const $CopyWithPlaceholder(),
    Object? commercialReceiverLineCount = const $CopyWithPlaceholder(),
    Object? expandedCommercialDeliveryReceiverIndex =
        const $CopyWithPlaceholder(),
    Object? commercialReceiverFormGeneration = const $CopyWithPlaceholder(),
    Object? pickupGiverLineCount = const $CopyWithPlaceholder(),
    Object? expandedPickupGiverIndex = const $CopyWithPlaceholder(),
    Object? pickupGiverFormGeneration = const $CopyWithPlaceholder(),
    Object? formFieldValues = const $CopyWithPlaceholder(),
    Object? infoFieldValues = const $CopyWithPlaceholder(),
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
      passengerGoLineCount:
          passengerGoLineCount == const $CopyWithPlaceholder() ||
                  passengerGoLineCount == null
              ? _value.passengerGoLineCount
              // ignore: cast_nullable_to_non_nullable
              : passengerGoLineCount as int,
      expandedPassengerGoIndex:
          expandedPassengerGoIndex == const $CopyWithPlaceholder()
              ? _value.expandedPassengerGoIndex
              // ignore: cast_nullable_to_non_nullable
              : expandedPassengerGoIndex as int?,
      passengerGoFirstRowIsCurrentUserSlot:
          passengerGoFirstRowIsCurrentUserSlot ==
                      const $CopyWithPlaceholder() ||
                  passengerGoFirstRowIsCurrentUserSlot == null
              ? _value.passengerGoFirstRowIsCurrentUserSlot
              // ignore: cast_nullable_to_non_nullable
              : passengerGoFirstRowIsCurrentUserSlot as bool,
      passengerFormGeneration:
          passengerFormGeneration == const $CopyWithPlaceholder() ||
                  passengerFormGeneration == null
              ? _value.passengerFormGeneration
              // ignore: cast_nullable_to_non_nullable
              : passengerFormGeneration as int,
      currentEmployee: currentEmployee == const $CopyWithPlaceholder()
          ? _value.currentEmployee
          // ignore: cast_nullable_to_non_nullable
          : currentEmployee as BookingVehiclePersonalItem?,
      commercialReceiverLineCount:
          commercialReceiverLineCount == const $CopyWithPlaceholder() ||
                  commercialReceiverLineCount == null
              ? _value.commercialReceiverLineCount
              // ignore: cast_nullable_to_non_nullable
              : commercialReceiverLineCount as int,
      expandedCommercialDeliveryReceiverIndex:
          expandedCommercialDeliveryReceiverIndex ==
                  const $CopyWithPlaceholder()
              ? _value.expandedCommercialDeliveryReceiverIndex
              // ignore: cast_nullable_to_non_nullable
              : expandedCommercialDeliveryReceiverIndex as int?,
      commercialReceiverFormGeneration:
          commercialReceiverFormGeneration == const $CopyWithPlaceholder() ||
                  commercialReceiverFormGeneration == null
              ? _value.commercialReceiverFormGeneration
              // ignore: cast_nullable_to_non_nullable
              : commercialReceiverFormGeneration as int,
      pickupGiverLineCount:
          pickupGiverLineCount == const $CopyWithPlaceholder() ||
                  pickupGiverLineCount == null
              ? _value.pickupGiverLineCount
              // ignore: cast_nullable_to_non_nullable
              : pickupGiverLineCount as int,
      expandedPickupGiverIndex:
          expandedPickupGiverIndex == const $CopyWithPlaceholder()
              ? _value.expandedPickupGiverIndex
              // ignore: cast_nullable_to_non_nullable
              : expandedPickupGiverIndex as int?,
      pickupGiverFormGeneration:
          pickupGiverFormGeneration == const $CopyWithPlaceholder() ||
                  pickupGiverFormGeneration == null
              ? _value.pickupGiverFormGeneration
              // ignore: cast_nullable_to_non_nullable
              : pickupGiverFormGeneration as int,
      formFieldValues: formFieldValues == const $CopyWithPlaceholder() ||
              formFieldValues == null
          ? _value.formFieldValues
          // ignore: cast_nullable_to_non_nullable
          : formFieldValues as Map<String, dynamic>,
      infoFieldValues: infoFieldValues == const $CopyWithPlaceholder() ||
              infoFieldValues == null
          ? _value.infoFieldValues
          // ignore: cast_nullable_to_non_nullable
          : infoFieldValues as Map<String, dynamic>,
    );
  }
}

extension $BookingVehicleStateCopyWith on BookingVehicleState {
  /// Returns a callable class that can be used as follows: `instanceOfBookingVehicleState.copyWith(...)` or like so:`instanceOfBookingVehicleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BookingVehicleStateCWProxy get copyWith =>
      _$BookingVehicleStateCWProxyImpl(this);
}
