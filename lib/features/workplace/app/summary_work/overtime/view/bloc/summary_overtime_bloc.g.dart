// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_overtime_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SummaryOvertimeStateCWProxy {
  SummaryOvertimeState status(BaseStateStatus status);

  SummaryOvertimeState message(String? message);

  SummaryOvertimeState overtime(List<SummaryOvertimeItem> overtime);

  SummaryOvertimeState persons(List<SummaryOvertimePerson> persons);

  SummaryOvertimeState departments(List<SummaryOvertimeDepartment> departments);

  SummaryOvertimeState employees(List<SummaryOvertimeEmployee> employees);

  SummaryOvertimeState dateStart(DateTime? dateStart);

  SummaryOvertimeState dateEnd(DateTime? dateEnd);

  SummaryOvertimeState employeeKeyword(String employeeKeyword);

  SummaryOvertimeState keyword(String keyword);

  SummaryOvertimeState selectedEmployeeId(int? selectedEmployeeId);

  SummaryOvertimeState selectedEmployeeName(String? selectedEmployeeName);

  SummaryOvertimeState departmentId(int? departmentId);

  SummaryOvertimeState filterApprovedTp(int? filterApprovedTp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryOvertimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryOvertimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryOvertimeState call({
    BaseStateStatus? status,
    String? message,
    List<SummaryOvertimeItem>? overtime,
    List<SummaryOvertimePerson>? persons,
    List<SummaryOvertimeDepartment>? departments,
    List<SummaryOvertimeEmployee>? employees,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? employeeKeyword,
    String? keyword,
    int? selectedEmployeeId,
    String? selectedEmployeeName,
    int? departmentId,
    int? filterApprovedTp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSummaryOvertimeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSummaryOvertimeState.copyWith.fieldName(...)`
class _$SummaryOvertimeStateCWProxyImpl
    implements _$SummaryOvertimeStateCWProxy {
  const _$SummaryOvertimeStateCWProxyImpl(this._value);

  final SummaryOvertimeState _value;

  @override
  SummaryOvertimeState status(BaseStateStatus status) => this(status: status);

  @override
  SummaryOvertimeState message(String? message) => this(message: message);

  @override
  SummaryOvertimeState overtime(List<SummaryOvertimeItem> overtime) =>
      this(overtime: overtime);

  @override
  SummaryOvertimeState persons(List<SummaryOvertimePerson> persons) =>
      this(persons: persons);

  @override
  SummaryOvertimeState departments(
          List<SummaryOvertimeDepartment> departments) =>
      this(departments: departments);

  @override
  SummaryOvertimeState employees(List<SummaryOvertimeEmployee> employees) =>
      this(employees: employees);

  @override
  SummaryOvertimeState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  SummaryOvertimeState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  SummaryOvertimeState employeeKeyword(String employeeKeyword) =>
      this(employeeKeyword: employeeKeyword);

  @override
  SummaryOvertimeState keyword(String keyword) => this(keyword: keyword);

  @override
  SummaryOvertimeState selectedEmployeeId(int? selectedEmployeeId) =>
      this(selectedEmployeeId: selectedEmployeeId);

  @override
  SummaryOvertimeState selectedEmployeeName(String? selectedEmployeeName) =>
      this(selectedEmployeeName: selectedEmployeeName);

  @override
  SummaryOvertimeState departmentId(int? departmentId) =>
      this(departmentId: departmentId);

  @override
  SummaryOvertimeState filterApprovedTp(int? filterApprovedTp) =>
      this(filterApprovedTp: filterApprovedTp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryOvertimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryOvertimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryOvertimeState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? overtime = const $CopyWithPlaceholder(),
    Object? persons = const $CopyWithPlaceholder(),
    Object? departments = const $CopyWithPlaceholder(),
    Object? employees = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? employeeKeyword = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? selectedEmployeeId = const $CopyWithPlaceholder(),
    Object? selectedEmployeeName = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? filterApprovedTp = const $CopyWithPlaceholder(),
  }) {
    return SummaryOvertimeState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      overtime: overtime == const $CopyWithPlaceholder() || overtime == null
          ? _value.overtime
          // ignore: cast_nullable_to_non_nullable
          : overtime as List<SummaryOvertimeItem>,
      persons: persons == const $CopyWithPlaceholder() || persons == null
          ? _value.persons
          // ignore: cast_nullable_to_non_nullable
          : persons as List<SummaryOvertimePerson>,
      departments:
          departments == const $CopyWithPlaceholder() || departments == null
              ? _value.departments
              // ignore: cast_nullable_to_non_nullable
              : departments as List<SummaryOvertimeDepartment>,
      employees: employees == const $CopyWithPlaceholder() || employees == null
          ? _value.employees
          // ignore: cast_nullable_to_non_nullable
          : employees as List<SummaryOvertimeEmployee>,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      employeeKeyword: employeeKeyword == const $CopyWithPlaceholder() ||
              employeeKeyword == null
          ? _value.employeeKeyword
          // ignore: cast_nullable_to_non_nullable
          : employeeKeyword as String,
      keyword: keyword == const $CopyWithPlaceholder() || keyword == null
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String,
      selectedEmployeeId: selectedEmployeeId == const $CopyWithPlaceholder()
          ? _value.selectedEmployeeId
          // ignore: cast_nullable_to_non_nullable
          : selectedEmployeeId as int?,
      selectedEmployeeName: selectedEmployeeName == const $CopyWithPlaceholder()
          ? _value.selectedEmployeeName
          // ignore: cast_nullable_to_non_nullable
          : selectedEmployeeName as String?,
      departmentId: departmentId == const $CopyWithPlaceholder()
          ? _value.departmentId
          // ignore: cast_nullable_to_non_nullable
          : departmentId as int?,
      filterApprovedTp: filterApprovedTp == const $CopyWithPlaceholder()
          ? _value.filterApprovedTp
          // ignore: cast_nullable_to_non_nullable
          : filterApprovedTp as int?,
    );
  }
}

extension $SummaryOvertimeStateCopyWith on SummaryOvertimeState {
  /// Returns a callable class that can be used as follows: `instanceOfSummaryOvertimeState.copyWith(...)` or like so:`instanceOfSummaryOvertimeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SummaryOvertimeStateCWProxy get copyWith =>
      _$SummaryOvertimeStateCWProxyImpl(this);
}
