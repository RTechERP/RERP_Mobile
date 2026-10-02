// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_guest_house_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BookingGuestHouseStateCWProxy {
  BookingGuestHouseState status(BaseStateStatus status);

  BookingGuestHouseState message(String? message);

  BookingGuestHouseState bookings(List<BookingGuestHouseItem> bookings);

  BookingGuestHouseState dateStart(DateTime? dateStart);

  BookingGuestHouseState dateEnd(DateTime? dateEnd);

  BookingGuestHouseState filterText(String filterText);

  BookingGuestHouseState isRefreshing(bool isRefreshing);

  BookingGuestHouseState projects(List<ProjectFilterItem> projects);

  BookingGuestHouseState employees(List<EmployeeFilterItem> employees);

  BookingGuestHouseState selectedProject(ProjectFilterItem? selectedProject);

  BookingGuestHouseState selectedEmployee(EmployeeFilterItem? selectedEmployee);

  BookingGuestHouseState isLoadingFilters(bool isLoadingFilters);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingGuestHouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingGuestHouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingGuestHouseState call({
    BaseStateStatus? status,
    String? message,
    List<BookingGuestHouseItem>? bookings,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? filterText,
    bool? isRefreshing,
    List<ProjectFilterItem>? projects,
    List<EmployeeFilterItem>? employees,
    ProjectFilterItem? selectedProject,
    EmployeeFilterItem? selectedEmployee,
    bool? isLoadingFilters,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBookingGuestHouseState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBookingGuestHouseState.copyWith.fieldName(...)`
class _$BookingGuestHouseStateCWProxyImpl
    implements _$BookingGuestHouseStateCWProxy {
  const _$BookingGuestHouseStateCWProxyImpl(this._value);

  final BookingGuestHouseState _value;

  @override
  BookingGuestHouseState status(BaseStateStatus status) => this(status: status);

  @override
  BookingGuestHouseState message(String? message) => this(message: message);

  @override
  BookingGuestHouseState bookings(List<BookingGuestHouseItem> bookings) =>
      this(bookings: bookings);

  @override
  BookingGuestHouseState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  BookingGuestHouseState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  BookingGuestHouseState filterText(String filterText) =>
      this(filterText: filterText);

  @override
  BookingGuestHouseState isRefreshing(bool isRefreshing) =>
      this(isRefreshing: isRefreshing);

  @override
  BookingGuestHouseState projects(List<ProjectFilterItem> projects) =>
      this(projects: projects);

  @override
  BookingGuestHouseState employees(List<EmployeeFilterItem> employees) =>
      this(employees: employees);

  @override
  BookingGuestHouseState selectedProject(ProjectFilterItem? selectedProject) =>
      this(selectedProject: selectedProject);

  @override
  BookingGuestHouseState selectedEmployee(
          EmployeeFilterItem? selectedEmployee) =>
      this(selectedEmployee: selectedEmployee);

  @override
  BookingGuestHouseState isLoadingFilters(bool isLoadingFilters) =>
      this(isLoadingFilters: isLoadingFilters);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingGuestHouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingGuestHouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingGuestHouseState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? bookings = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? filterText = const $CopyWithPlaceholder(),
    Object? isRefreshing = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? employees = const $CopyWithPlaceholder(),
    Object? selectedProject = const $CopyWithPlaceholder(),
    Object? selectedEmployee = const $CopyWithPlaceholder(),
    Object? isLoadingFilters = const $CopyWithPlaceholder(),
  }) {
    return BookingGuestHouseState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      bookings: bookings == const $CopyWithPlaceholder() || bookings == null
          ? _value.bookings
          // ignore: cast_nullable_to_non_nullable
          : bookings as List<BookingGuestHouseItem>,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      filterText:
          filterText == const $CopyWithPlaceholder() || filterText == null
              ? _value.filterText
              // ignore: cast_nullable_to_non_nullable
              : filterText as String,
      isRefreshing:
          isRefreshing == const $CopyWithPlaceholder() || isRefreshing == null
              ? _value.isRefreshing
              // ignore: cast_nullable_to_non_nullable
              : isRefreshing as bool,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<ProjectFilterItem>,
      employees: employees == const $CopyWithPlaceholder() || employees == null
          ? _value.employees
          // ignore: cast_nullable_to_non_nullable
          : employees as List<EmployeeFilterItem>,
      selectedProject: selectedProject == const $CopyWithPlaceholder()
          ? _value.selectedProject
          // ignore: cast_nullable_to_non_nullable
          : selectedProject as ProjectFilterItem?,
      selectedEmployee: selectedEmployee == const $CopyWithPlaceholder()
          ? _value.selectedEmployee
          // ignore: cast_nullable_to_non_nullable
          : selectedEmployee as EmployeeFilterItem?,
      isLoadingFilters: isLoadingFilters == const $CopyWithPlaceholder() ||
              isLoadingFilters == null
          ? _value.isLoadingFilters
          // ignore: cast_nullable_to_non_nullable
          : isLoadingFilters as bool,
    );
  }
}

extension $BookingGuestHouseStateCopyWith on BookingGuestHouseState {
  /// Returns a callable class that can be used as follows: `instanceOfBookingGuestHouseState.copyWith(...)` or like so:`instanceOfBookingGuestHouseState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BookingGuestHouseStateCWProxy get copyWith =>
      _$BookingGuestHouseStateCWProxyImpl(this);
}
