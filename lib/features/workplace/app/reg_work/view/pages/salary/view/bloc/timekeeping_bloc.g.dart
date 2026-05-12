// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timekeeping_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TimekeepingStateCWProxy {
  TimekeepingState status(BaseStateStatus status);

  TimekeepingState message(String? message);

  TimekeepingState employeeName(String? employeeName);

  TimekeepingState employeeCode(String? employeeCode);

  TimekeepingState departmentName(String? departmentName);

  TimekeepingState selectedMonth(DateTime? selectedMonth);

  TimekeepingState actualWorkDays(double actualWorkDays);

  TimekeepingState holidayDays(double holidayDays);

  TimekeepingState tetDays(double tetDays);

  TimekeepingState leaveDays(double leaveDays);

  TimekeepingState privatePaidDays(double privatePaidDays);

  TimekeepingState wfhDays(double wfhDays);

  TimekeepingState paidWorkDays(double paidWorkDays);

  TimekeepingState unpaidLeaveDays(double unpaidLeaveDays);

  TimekeepingState totalDays(double totalDays);

  TimekeepingState days(List<TimekeepingDayItem> days);

  TimekeepingState firstDayOfMonth(DateTime? firstDayOfMonth);

  TimekeepingState lastDayOfMonth(DateTime? lastDayOfMonth);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimekeepingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimekeepingState(...).copyWith(id: 12, name: "My name")
  /// ````
  TimekeepingState call({
    BaseStateStatus? status,
    String? message,
    String? employeeName,
    String? employeeCode,
    String? departmentName,
    DateTime? selectedMonth,
    double? actualWorkDays,
    double? holidayDays,
    double? tetDays,
    double? leaveDays,
    double? privatePaidDays,
    double? wfhDays,
    double? paidWorkDays,
    double? unpaidLeaveDays,
    double? totalDays,
    List<TimekeepingDayItem>? days,
    DateTime? firstDayOfMonth,
    DateTime? lastDayOfMonth,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTimekeepingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTimekeepingState.copyWith.fieldName(...)`
class _$TimekeepingStateCWProxyImpl implements _$TimekeepingStateCWProxy {
  const _$TimekeepingStateCWProxyImpl(this._value);

  final TimekeepingState _value;

  @override
  TimekeepingState status(BaseStateStatus status) => this(status: status);

  @override
  TimekeepingState message(String? message) => this(message: message);

  @override
  TimekeepingState employeeName(String? employeeName) =>
      this(employeeName: employeeName);

  @override
  TimekeepingState employeeCode(String? employeeCode) =>
      this(employeeCode: employeeCode);

  @override
  TimekeepingState departmentName(String? departmentName) =>
      this(departmentName: departmentName);

  @override
  TimekeepingState selectedMonth(DateTime? selectedMonth) =>
      this(selectedMonth: selectedMonth);

  @override
  TimekeepingState actualWorkDays(double actualWorkDays) =>
      this(actualWorkDays: actualWorkDays);

  @override
  TimekeepingState holidayDays(double holidayDays) =>
      this(holidayDays: holidayDays);

  @override
  TimekeepingState tetDays(double tetDays) => this(tetDays: tetDays);

  @override
  TimekeepingState leaveDays(double leaveDays) => this(leaveDays: leaveDays);

  @override
  TimekeepingState privatePaidDays(double privatePaidDays) =>
      this(privatePaidDays: privatePaidDays);

  @override
  TimekeepingState wfhDays(double wfhDays) => this(wfhDays: wfhDays);

  @override
  TimekeepingState paidWorkDays(double paidWorkDays) =>
      this(paidWorkDays: paidWorkDays);

  @override
  TimekeepingState unpaidLeaveDays(double unpaidLeaveDays) =>
      this(unpaidLeaveDays: unpaidLeaveDays);

  @override
  TimekeepingState totalDays(double totalDays) => this(totalDays: totalDays);

  @override
  TimekeepingState days(List<TimekeepingDayItem> days) => this(days: days);

  @override
  TimekeepingState firstDayOfMonth(DateTime? firstDayOfMonth) =>
      this(firstDayOfMonth: firstDayOfMonth);

  @override
  TimekeepingState lastDayOfMonth(DateTime? lastDayOfMonth) =>
      this(lastDayOfMonth: lastDayOfMonth);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimekeepingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimekeepingState(...).copyWith(id: 12, name: "My name")
  /// ````
  TimekeepingState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? employeeName = const $CopyWithPlaceholder(),
    Object? employeeCode = const $CopyWithPlaceholder(),
    Object? departmentName = const $CopyWithPlaceholder(),
    Object? selectedMonth = const $CopyWithPlaceholder(),
    Object? actualWorkDays = const $CopyWithPlaceholder(),
    Object? holidayDays = const $CopyWithPlaceholder(),
    Object? tetDays = const $CopyWithPlaceholder(),
    Object? leaveDays = const $CopyWithPlaceholder(),
    Object? privatePaidDays = const $CopyWithPlaceholder(),
    Object? wfhDays = const $CopyWithPlaceholder(),
    Object? paidWorkDays = const $CopyWithPlaceholder(),
    Object? unpaidLeaveDays = const $CopyWithPlaceholder(),
    Object? totalDays = const $CopyWithPlaceholder(),
    Object? days = const $CopyWithPlaceholder(),
    Object? firstDayOfMonth = const $CopyWithPlaceholder(),
    Object? lastDayOfMonth = const $CopyWithPlaceholder(),
  }) {
    return TimekeepingState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      employeeName: employeeName == const $CopyWithPlaceholder()
          ? _value.employeeName
          // ignore: cast_nullable_to_non_nullable
          : employeeName as String?,
      employeeCode: employeeCode == const $CopyWithPlaceholder()
          ? _value.employeeCode
          // ignore: cast_nullable_to_non_nullable
          : employeeCode as String?,
      departmentName: departmentName == const $CopyWithPlaceholder()
          ? _value.departmentName
          // ignore: cast_nullable_to_non_nullable
          : departmentName as String?,
      selectedMonth: selectedMonth == const $CopyWithPlaceholder()
          ? _value.selectedMonth
          // ignore: cast_nullable_to_non_nullable
          : selectedMonth as DateTime?,
      actualWorkDays: actualWorkDays == const $CopyWithPlaceholder() ||
              actualWorkDays == null
          ? _value.actualWorkDays
          // ignore: cast_nullable_to_non_nullable
          : actualWorkDays as double,
      holidayDays:
          holidayDays == const $CopyWithPlaceholder() || holidayDays == null
              ? _value.holidayDays
              // ignore: cast_nullable_to_non_nullable
              : holidayDays as double,
      tetDays: tetDays == const $CopyWithPlaceholder() || tetDays == null
          ? _value.tetDays
          // ignore: cast_nullable_to_non_nullable
          : tetDays as double,
      leaveDays: leaveDays == const $CopyWithPlaceholder() || leaveDays == null
          ? _value.leaveDays
          // ignore: cast_nullable_to_non_nullable
          : leaveDays as double,
      privatePaidDays: privatePaidDays == const $CopyWithPlaceholder() ||
              privatePaidDays == null
          ? _value.privatePaidDays
          // ignore: cast_nullable_to_non_nullable
          : privatePaidDays as double,
      wfhDays: wfhDays == const $CopyWithPlaceholder() || wfhDays == null
          ? _value.wfhDays
          // ignore: cast_nullable_to_non_nullable
          : wfhDays as double,
      paidWorkDays:
          paidWorkDays == const $CopyWithPlaceholder() || paidWorkDays == null
              ? _value.paidWorkDays
              // ignore: cast_nullable_to_non_nullable
              : paidWorkDays as double,
      unpaidLeaveDays: unpaidLeaveDays == const $CopyWithPlaceholder() ||
              unpaidLeaveDays == null
          ? _value.unpaidLeaveDays
          // ignore: cast_nullable_to_non_nullable
          : unpaidLeaveDays as double,
      totalDays: totalDays == const $CopyWithPlaceholder() || totalDays == null
          ? _value.totalDays
          // ignore: cast_nullable_to_non_nullable
          : totalDays as double,
      days: days == const $CopyWithPlaceholder() || days == null
          ? _value.days
          // ignore: cast_nullable_to_non_nullable
          : days as List<TimekeepingDayItem>,
      firstDayOfMonth: firstDayOfMonth == const $CopyWithPlaceholder()
          ? _value.firstDayOfMonth
          // ignore: cast_nullable_to_non_nullable
          : firstDayOfMonth as DateTime?,
      lastDayOfMonth: lastDayOfMonth == const $CopyWithPlaceholder()
          ? _value.lastDayOfMonth
          // ignore: cast_nullable_to_non_nullable
          : lastDayOfMonth as DateTime?,
    );
  }
}

extension $TimekeepingStateCopyWith on TimekeepingState {
  /// Returns a callable class that can be used as follows: `instanceOfTimekeepingState.copyWith(...)` or like so:`instanceOfTimekeepingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TimekeepingStateCWProxy get copyWith => _$TimekeepingStateCWProxyImpl(this);
}
