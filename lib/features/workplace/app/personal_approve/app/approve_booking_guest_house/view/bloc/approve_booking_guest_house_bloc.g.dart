// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_booking_guest_house_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ApproveBookingGuestHouseStateCWProxy {
  ApproveBookingGuestHouseState status(BaseStateStatus status);

  ApproveBookingGuestHouseState message(String? message);

  ApproveBookingGuestHouseState bookings(
      List<ApproveBookingGuestHouseItem> bookings);

  ApproveBookingGuestHouseState dateStart(DateTime? dateStart);

  ApproveBookingGuestHouseState dateEnd(DateTime? dateEnd);

  ApproveBookingGuestHouseState filterText(String filterText);

  ApproveBookingGuestHouseState isRefreshing(bool isRefreshing);

  ApproveBookingGuestHouseState projects(
      List<ApproveProjectFilterItem> projects);

  ApproveBookingGuestHouseState employees(
      List<ApproveEmployeeFilterItem> employees);

  ApproveBookingGuestHouseState selectedProject(
      ApproveProjectFilterItem? selectedProject);

  ApproveBookingGuestHouseState selectedEmployee(
      ApproveEmployeeFilterItem? selectedEmployee);

  ApproveBookingGuestHouseState isLoadingFilters(bool isLoadingFilters);

  ApproveBookingGuestHouseState statusFilter(int? statusFilter);

  ApproveBookingGuestHouseState selectedIds(Set<int> selectedIds);

  ApproveBookingGuestHouseState isApproving(bool isApproving);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApproveBookingGuestHouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApproveBookingGuestHouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  ApproveBookingGuestHouseState call({
    BaseStateStatus? status,
    String? message,
    List<ApproveBookingGuestHouseItem>? bookings,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? filterText,
    bool? isRefreshing,
    List<ApproveProjectFilterItem>? projects,
    List<ApproveEmployeeFilterItem>? employees,
    ApproveProjectFilterItem? selectedProject,
    ApproveEmployeeFilterItem? selectedEmployee,
    bool? isLoadingFilters,
    int? statusFilter,
    Set<int>? selectedIds,
    bool? isApproving,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfApproveBookingGuestHouseState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfApproveBookingGuestHouseState.copyWith.fieldName(...)`
class _$ApproveBookingGuestHouseStateCWProxyImpl
    implements _$ApproveBookingGuestHouseStateCWProxy {
  const _$ApproveBookingGuestHouseStateCWProxyImpl(this._value);

  final ApproveBookingGuestHouseState _value;

  @override
  ApproveBookingGuestHouseState status(BaseStateStatus status) =>
      this(status: status);

  @override
  ApproveBookingGuestHouseState message(String? message) =>
      this(message: message);

  @override
  ApproveBookingGuestHouseState bookings(
          List<ApproveBookingGuestHouseItem> bookings) =>
      this(bookings: bookings);

  @override
  ApproveBookingGuestHouseState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  ApproveBookingGuestHouseState dateEnd(DateTime? dateEnd) =>
      this(dateEnd: dateEnd);

  @override
  ApproveBookingGuestHouseState filterText(String filterText) =>
      this(filterText: filterText);

  @override
  ApproveBookingGuestHouseState isRefreshing(bool isRefreshing) =>
      this(isRefreshing: isRefreshing);

  @override
  ApproveBookingGuestHouseState projects(
          List<ApproveProjectFilterItem> projects) =>
      this(projects: projects);

  @override
  ApproveBookingGuestHouseState employees(
          List<ApproveEmployeeFilterItem> employees) =>
      this(employees: employees);

  @override
  ApproveBookingGuestHouseState selectedProject(
          ApproveProjectFilterItem? selectedProject) =>
      this(selectedProject: selectedProject);

  @override
  ApproveBookingGuestHouseState selectedEmployee(
          ApproveEmployeeFilterItem? selectedEmployee) =>
      this(selectedEmployee: selectedEmployee);

  @override
  ApproveBookingGuestHouseState isLoadingFilters(bool isLoadingFilters) =>
      this(isLoadingFilters: isLoadingFilters);

  @override
  ApproveBookingGuestHouseState statusFilter(int? statusFilter) =>
      this(statusFilter: statusFilter);

  @override
  ApproveBookingGuestHouseState selectedIds(Set<int> selectedIds) =>
      this(selectedIds: selectedIds);

  @override
  ApproveBookingGuestHouseState isApproving(bool isApproving) =>
      this(isApproving: isApproving);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApproveBookingGuestHouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApproveBookingGuestHouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  ApproveBookingGuestHouseState call({
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
    Object? statusFilter = const $CopyWithPlaceholder(),
    Object? selectedIds = const $CopyWithPlaceholder(),
    Object? isApproving = const $CopyWithPlaceholder(),
  }) {
    return ApproveBookingGuestHouseState(
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
          : bookings as List<ApproveBookingGuestHouseItem>,
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
          : projects as List<ApproveProjectFilterItem>,
      employees: employees == const $CopyWithPlaceholder() || employees == null
          ? _value.employees
          // ignore: cast_nullable_to_non_nullable
          : employees as List<ApproveEmployeeFilterItem>,
      selectedProject: selectedProject == const $CopyWithPlaceholder()
          ? _value.selectedProject
          // ignore: cast_nullable_to_non_nullable
          : selectedProject as ApproveProjectFilterItem?,
      selectedEmployee: selectedEmployee == const $CopyWithPlaceholder()
          ? _value.selectedEmployee
          // ignore: cast_nullable_to_non_nullable
          : selectedEmployee as ApproveEmployeeFilterItem?,
      isLoadingFilters: isLoadingFilters == const $CopyWithPlaceholder() ||
              isLoadingFilters == null
          ? _value.isLoadingFilters
          // ignore: cast_nullable_to_non_nullable
          : isLoadingFilters as bool,
      statusFilter: statusFilter == const $CopyWithPlaceholder()
          ? _value.statusFilter
          // ignore: cast_nullable_to_non_nullable
          : statusFilter as int?,
      selectedIds:
          selectedIds == const $CopyWithPlaceholder() || selectedIds == null
              ? _value.selectedIds
              // ignore: cast_nullable_to_non_nullable
              : selectedIds as Set<int>,
      isApproving:
          isApproving == const $CopyWithPlaceholder() || isApproving == null
              ? _value.isApproving
              // ignore: cast_nullable_to_non_nullable
              : isApproving as bool,
    );
  }
}

extension $ApproveBookingGuestHouseStateCopyWith
    on ApproveBookingGuestHouseState {
  /// Returns a callable class that can be used as follows: `instanceOfApproveBookingGuestHouseState.copyWith(...)` or like so:`instanceOfApproveBookingGuestHouseState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ApproveBookingGuestHouseStateCWProxy get copyWith =>
      _$ApproveBookingGuestHouseStateCWProxyImpl(this);
}
