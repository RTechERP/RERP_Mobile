// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_plan_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeekPlanStateCWProxy {
  WeekPlanState status(BaseStateStatus status);

  WeekPlanState message(String? message);

  WeekPlanState myTasks(List<WeekPlanTaskItem> myTasks);

  WeekPlanState assignedTasks(List<WeekPlanTaskItem> assignedTasks);

  WeekPlanState searchKeyword(String searchKeyword);

  WeekPlanState selectedStatus(String selectedStatus);

  WeekPlanState dateStart(DateTime? dateStart);

  WeekPlanState dateEnd(DateTime? dateEnd);

  WeekPlanState employeeId(int? employeeId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeekPlanState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeekPlanState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeekPlanState call({
    BaseStateStatus? status,
    String? message,
    List<WeekPlanTaskItem>? myTasks,
    List<WeekPlanTaskItem>? assignedTasks,
    String? searchKeyword,
    String? selectedStatus,
    DateTime? dateStart,
    DateTime? dateEnd,
    int? employeeId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeekPlanState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeekPlanState.copyWith.fieldName(...)`
class _$WeekPlanStateCWProxyImpl implements _$WeekPlanStateCWProxy {
  const _$WeekPlanStateCWProxyImpl(this._value);

  final WeekPlanState _value;

  @override
  WeekPlanState status(BaseStateStatus status) => this(status: status);

  @override
  WeekPlanState message(String? message) => this(message: message);

  @override
  WeekPlanState myTasks(List<WeekPlanTaskItem> myTasks) =>
      this(myTasks: myTasks);

  @override
  WeekPlanState assignedTasks(List<WeekPlanTaskItem> assignedTasks) =>
      this(assignedTasks: assignedTasks);

  @override
  WeekPlanState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override
  WeekPlanState selectedStatus(String selectedStatus) =>
      this(selectedStatus: selectedStatus);

  @override
  WeekPlanState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  WeekPlanState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  WeekPlanState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeekPlanState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeekPlanState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeekPlanState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? myTasks = const $CopyWithPlaceholder(),
    Object? assignedTasks = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
    Object? selectedStatus = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
  }) {
    return WeekPlanState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      myTasks: myTasks == const $CopyWithPlaceholder() || myTasks == null
          ? _value.myTasks
          // ignore: cast_nullable_to_non_nullable
          : myTasks as List<WeekPlanTaskItem>,
      assignedTasks:
          assignedTasks == const $CopyWithPlaceholder() || assignedTasks == null
              ? _value.assignedTasks
              // ignore: cast_nullable_to_non_nullable
              : assignedTasks as List<WeekPlanTaskItem>,
      searchKeyword:
          searchKeyword == const $CopyWithPlaceholder() || searchKeyword == null
              ? _value.searchKeyword
              // ignore: cast_nullable_to_non_nullable
              : searchKeyword as String,
      selectedStatus: selectedStatus == const $CopyWithPlaceholder() ||
              selectedStatus == null
          ? _value.selectedStatus
          // ignore: cast_nullable_to_non_nullable
          : selectedStatus as String,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
    );
  }
}

extension $WeekPlanStateCopyWith on WeekPlanState {
  /// Returns a callable class that can be used as follows: `instanceOfWeekPlanState.copyWith(...)` or like so:`instanceOfWeekPlanState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeekPlanStateCWProxy get copyWith => _$WeekPlanStateCWProxyImpl(this);
}
