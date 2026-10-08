// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_leave_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SummaryLeaveStateCWProxy {
  SummaryLeaveState status(BaseStateStatus status);

  SummaryLeaveState message(String? message);

  SummaryLeaveState leave(List<SummaryLeaveItem> leave);

  SummaryLeaveState departments(List<SummaryDepartment> departments);

  SummaryLeaveState dateStart(DateTime? dateStart);

  SummaryLeaveState dateEnd(DateTime? dateEnd);

  SummaryLeaveState keyword(String keyword);

  SummaryLeaveState departmentId(int? departmentId);

  SummaryLeaveState filterStatus(int? filterStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryLeaveState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryLeaveState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryLeaveState call({
    BaseStateStatus? status,
    String? message,
    List<SummaryLeaveItem>? leave,
    List<SummaryDepartment>? departments,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    int? departmentId,
    int? filterStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSummaryLeaveState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSummaryLeaveState.copyWith.fieldName(...)`
class _$SummaryLeaveStateCWProxyImpl implements _$SummaryLeaveStateCWProxy {
  const _$SummaryLeaveStateCWProxyImpl(this._value);

  final SummaryLeaveState _value;

  @override
  SummaryLeaveState status(BaseStateStatus status) => this(status: status);

  @override
  SummaryLeaveState message(String? message) => this(message: message);

  @override
  SummaryLeaveState leave(List<SummaryLeaveItem> leave) => this(leave: leave);

  @override
  SummaryLeaveState departments(List<SummaryDepartment> departments) =>
      this(departments: departments);

  @override
  SummaryLeaveState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  SummaryLeaveState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  SummaryLeaveState keyword(String keyword) => this(keyword: keyword);

  @override
  SummaryLeaveState departmentId(int? departmentId) =>
      this(departmentId: departmentId);

  @override
  SummaryLeaveState filterStatus(int? filterStatus) =>
      this(filterStatus: filterStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryLeaveState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryLeaveState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryLeaveState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? leave = const $CopyWithPlaceholder(),
    Object? departments = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? filterStatus = const $CopyWithPlaceholder(),
  }) {
    return SummaryLeaveState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      leave: leave == const $CopyWithPlaceholder() || leave == null
          ? _value.leave
          // ignore: cast_nullable_to_non_nullable
          : leave as List<SummaryLeaveItem>,
      departments:
          departments == const $CopyWithPlaceholder() || departments == null
              ? _value.departments
              // ignore: cast_nullable_to_non_nullable
              : departments as List<SummaryDepartment>,
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
      departmentId: departmentId == const $CopyWithPlaceholder()
          ? _value.departmentId
          // ignore: cast_nullable_to_non_nullable
          : departmentId as int?,
      filterStatus: filterStatus == const $CopyWithPlaceholder()
          ? _value.filterStatus
          // ignore: cast_nullable_to_non_nullable
          : filterStatus as int?,
    );
  }
}

extension $SummaryLeaveStateCopyWith on SummaryLeaveState {
  /// Returns a callable class that can be used as follows: `instanceOfSummaryLeaveState.copyWith(...)` or like so:`instanceOfSummaryLeaveState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SummaryLeaveStateCWProxy get copyWith =>
      _$SummaryLeaveStateCWProxyImpl(this);
}
