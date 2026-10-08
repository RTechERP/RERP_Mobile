// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_missed_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SummaryMissedStateCWProxy {
  SummaryMissedState status(BaseStateStatus status);

  SummaryMissedState message(String? message);

  SummaryMissedState missed(List<SummaryMissedItem> missed);

  SummaryMissedState departments(List<SummaryMissedDepartment> departments);

  SummaryMissedState dateStart(DateTime? dateStart);

  SummaryMissedState dateEnd(DateTime? dateEnd);

  SummaryMissedState keyword(String keyword);

  SummaryMissedState departmentId(int? departmentId);

  SummaryMissedState filterStatus(int? filterStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryMissedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryMissedState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryMissedState call({
    BaseStateStatus? status,
    String? message,
    List<SummaryMissedItem>? missed,
    List<SummaryMissedDepartment>? departments,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    int? departmentId,
    int? filterStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSummaryMissedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSummaryMissedState.copyWith.fieldName(...)`
class _$SummaryMissedStateCWProxyImpl implements _$SummaryMissedStateCWProxy {
  const _$SummaryMissedStateCWProxyImpl(this._value);

  final SummaryMissedState _value;

  @override
  SummaryMissedState status(BaseStateStatus status) => this(status: status);

  @override
  SummaryMissedState message(String? message) => this(message: message);

  @override
  SummaryMissedState missed(List<SummaryMissedItem> missed) =>
      this(missed: missed);

  @override
  SummaryMissedState departments(List<SummaryMissedDepartment> departments) =>
      this(departments: departments);

  @override
  SummaryMissedState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  SummaryMissedState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  SummaryMissedState keyword(String keyword) => this(keyword: keyword);

  @override
  SummaryMissedState departmentId(int? departmentId) =>
      this(departmentId: departmentId);

  @override
  SummaryMissedState filterStatus(int? filterStatus) =>
      this(filterStatus: filterStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryMissedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryMissedState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryMissedState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? missed = const $CopyWithPlaceholder(),
    Object? departments = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? filterStatus = const $CopyWithPlaceholder(),
  }) {
    return SummaryMissedState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      missed: missed == const $CopyWithPlaceholder() || missed == null
          ? _value.missed
          // ignore: cast_nullable_to_non_nullable
          : missed as List<SummaryMissedItem>,
      departments:
          departments == const $CopyWithPlaceholder() || departments == null
              ? _value.departments
              // ignore: cast_nullable_to_non_nullable
              : departments as List<SummaryMissedDepartment>,
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

extension $SummaryMissedStateCopyWith on SummaryMissedState {
  /// Returns a callable class that can be used as follows: `instanceOfSummaryMissedState.copyWith(...)` or like so:`instanceOfSummaryMissedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SummaryMissedStateCWProxy get copyWith =>
      _$SummaryMissedStateCWProxyImpl(this);
}
