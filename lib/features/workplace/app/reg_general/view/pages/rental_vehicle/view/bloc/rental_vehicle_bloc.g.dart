// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_vehicle_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RentalVehicleStateCWProxy {
  RentalVehicleState status(BaseStateStatus status);

  RentalVehicleState message(String? message);

  RentalVehicleState rentalVehicles(List<RentalVehicleItem> rentalVehicles);

  RentalVehicleState dateStart(DateTime? dateStart);

  RentalVehicleState dateEnd(DateTime? dateEnd);

  RentalVehicleState keyword(String keyword);

  RentalVehicleState employees(List<RentalVehicleEmployee> employees);

  RentalVehicleState departments(List<RentalVehicleDepartment> departments);

  RentalVehicleState selectedDepartmentId(int selectedDepartmentId);

  RentalVehicleState selectedRequesterId(int selectedRequesterId);

  RentalVehicleState selectedBookerId(int selectedBookerId);

  RentalVehicleState projects(List<RentalVehicleProject> projects);

  RentalVehicleState selectedVehicleTypeId(int? selectedVehicleTypeId);

  RentalVehicleState selectedRequesterIdOnAdd(int? selectedRequesterIdOnAdd);

  RentalVehicleState nextStt(int nextStt);

  RentalVehicleState isSubmitting(bool isSubmitting);

  RentalVehicleState submitSuccess(bool submitSuccess);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RentalVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RentalVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  RentalVehicleState call({
    BaseStateStatus? status,
    String? message,
    List<RentalVehicleItem>? rentalVehicles,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    List<RentalVehicleEmployee>? employees,
    List<RentalVehicleDepartment>? departments,
    int? selectedDepartmentId,
    int? selectedRequesterId,
    int? selectedBookerId,
    List<RentalVehicleProject>? projects,
    int? selectedVehicleTypeId,
    int? selectedRequesterIdOnAdd,
    int? nextStt,
    bool? isSubmitting,
    bool? submitSuccess,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRentalVehicleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRentalVehicleState.copyWith.fieldName(...)`
class _$RentalVehicleStateCWProxyImpl implements _$RentalVehicleStateCWProxy {
  const _$RentalVehicleStateCWProxyImpl(this._value);

  final RentalVehicleState _value;

  @override
  RentalVehicleState status(BaseStateStatus status) => this(status: status);

  @override
  RentalVehicleState message(String? message) => this(message: message);

  @override
  RentalVehicleState rentalVehicles(List<RentalVehicleItem> rentalVehicles) =>
      this(rentalVehicles: rentalVehicles);

  @override
  RentalVehicleState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  RentalVehicleState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  RentalVehicleState keyword(String keyword) => this(keyword: keyword);

  @override
  RentalVehicleState employees(List<RentalVehicleEmployee> employees) =>
      this(employees: employees);

  @override
  RentalVehicleState departments(List<RentalVehicleDepartment> departments) =>
      this(departments: departments);

  @override
  RentalVehicleState selectedDepartmentId(int selectedDepartmentId) =>
      this(selectedDepartmentId: selectedDepartmentId);

  @override
  RentalVehicleState selectedRequesterId(int selectedRequesterId) =>
      this(selectedRequesterId: selectedRequesterId);

  @override
  RentalVehicleState selectedBookerId(int selectedBookerId) =>
      this(selectedBookerId: selectedBookerId);

  @override
  RentalVehicleState projects(List<RentalVehicleProject> projects) =>
      this(projects: projects);

  @override
  RentalVehicleState selectedVehicleTypeId(int? selectedVehicleTypeId) =>
      this(selectedVehicleTypeId: selectedVehicleTypeId);

  @override
  RentalVehicleState selectedRequesterIdOnAdd(int? selectedRequesterIdOnAdd) =>
      this(selectedRequesterIdOnAdd: selectedRequesterIdOnAdd);

  @override
  RentalVehicleState nextStt(int nextStt) => this(nextStt: nextStt);

  @override
  RentalVehicleState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  RentalVehicleState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RentalVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RentalVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  RentalVehicleState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? rentalVehicles = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? employees = const $CopyWithPlaceholder(),
    Object? departments = const $CopyWithPlaceholder(),
    Object? selectedDepartmentId = const $CopyWithPlaceholder(),
    Object? selectedRequesterId = const $CopyWithPlaceholder(),
    Object? selectedBookerId = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? selectedVehicleTypeId = const $CopyWithPlaceholder(),
    Object? selectedRequesterIdOnAdd = const $CopyWithPlaceholder(),
    Object? nextStt = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
  }) {
    return RentalVehicleState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      rentalVehicles: rentalVehicles == const $CopyWithPlaceholder() ||
              rentalVehicles == null
          ? _value.rentalVehicles
          // ignore: cast_nullable_to_non_nullable
          : rentalVehicles as List<RentalVehicleItem>,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      keyword: keyword == const $CopyWithPlaceholder() || keyword == null
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String,
      employees: employees == const $CopyWithPlaceholder() || employees == null
          ? _value.employees
          // ignore: cast_nullable_to_non_nullable
          : employees as List<RentalVehicleEmployee>,
      departments:
          departments == const $CopyWithPlaceholder() || departments == null
              ? _value.departments
              // ignore: cast_nullable_to_non_nullable
              : departments as List<RentalVehicleDepartment>,
      selectedDepartmentId:
          selectedDepartmentId == const $CopyWithPlaceholder() ||
                  selectedDepartmentId == null
              ? _value.selectedDepartmentId
              // ignore: cast_nullable_to_non_nullable
              : selectedDepartmentId as int,
      selectedRequesterId:
          selectedRequesterId == const $CopyWithPlaceholder() ||
                  selectedRequesterId == null
              ? _value.selectedRequesterId
              // ignore: cast_nullable_to_non_nullable
              : selectedRequesterId as int,
      selectedBookerId: selectedBookerId == const $CopyWithPlaceholder() ||
              selectedBookerId == null
          ? _value.selectedBookerId
          // ignore: cast_nullable_to_non_nullable
          : selectedBookerId as int,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<RentalVehicleProject>,
      selectedVehicleTypeId:
          selectedVehicleTypeId == const $CopyWithPlaceholder()
              ? _value.selectedVehicleTypeId
              // ignore: cast_nullable_to_non_nullable
              : selectedVehicleTypeId as int?,
      selectedRequesterIdOnAdd:
          selectedRequesterIdOnAdd == const $CopyWithPlaceholder()
              ? _value.selectedRequesterIdOnAdd
              // ignore: cast_nullable_to_non_nullable
              : selectedRequesterIdOnAdd as int?,
      nextStt: nextStt == const $CopyWithPlaceholder() || nextStt == null
          ? _value.nextStt
          // ignore: cast_nullable_to_non_nullable
          : nextStt as int,
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
    );
  }
}

extension $RentalVehicleStateCopyWith on RentalVehicleState {
  /// Returns a callable class that can be used as follows: `instanceOfRentalVehicleState.copyWith(...)` or like so:`instanceOfRentalVehicleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RentalVehicleStateCWProxy get copyWith =>
      _$RentalVehicleStateCWProxyImpl(this);
}
