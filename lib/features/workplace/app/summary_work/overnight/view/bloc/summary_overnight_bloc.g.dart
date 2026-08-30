// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_overnight_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SummaryOvernightStateCWProxy {
  SummaryOvernightState status(BaseStateStatus status);

  SummaryOvernightState message(String? message);

  SummaryOvernightState overnight(List<SummaryOvernightItem> overnight);

  SummaryOvernightState departments(
      List<SummaryOvernightDepartment> departments);

  SummaryOvernightState dateStart(DateTime? dateStart);

  SummaryOvernightState dateEnd(DateTime? dateEnd);

  SummaryOvernightState keyword(String keyword);

  SummaryOvernightState departmentId(int? departmentId);

  SummaryOvernightState filterStatus(int? filterStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryOvernightState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryOvernightState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryOvernightState call({
    BaseStateStatus? status,
    String? message,
    List<SummaryOvernightItem>? overnight,
    List<SummaryOvernightDepartment>? departments,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    int? departmentId,
    int? filterStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSummaryOvernightState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSummaryOvernightState.copyWith.fieldName(...)`
class _$SummaryOvernightStateCWProxyImpl
    implements _$SummaryOvernightStateCWProxy {
  const _$SummaryOvernightStateCWProxyImpl(this._value);

  final SummaryOvernightState _value;

  @override
  SummaryOvernightState status(BaseStateStatus status) => this(status: status);

  @override
  SummaryOvernightState message(String? message) => this(message: message);

  @override
  SummaryOvernightState overnight(List<SummaryOvernightItem> overnight) =>
      this(overnight: overnight);

  @override
  SummaryOvernightState departments(
          List<SummaryOvernightDepartment> departments) =>
      this(departments: departments);

  @override
  SummaryOvernightState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  SummaryOvernightState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  SummaryOvernightState keyword(String keyword) => this(keyword: keyword);

  @override
  SummaryOvernightState departmentId(int? departmentId) =>
      this(departmentId: departmentId);

  @override
  SummaryOvernightState filterStatus(int? filterStatus) =>
      this(filterStatus: filterStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryOvernightState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryOvernightState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryOvernightState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? overnight = const $CopyWithPlaceholder(),
    Object? departments = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? filterStatus = const $CopyWithPlaceholder(),
  }) {
    return SummaryOvernightState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      overnight: overnight == const $CopyWithPlaceholder() || overnight == null
          ? _value.overnight
          // ignore: cast_nullable_to_non_nullable
          : overnight as List<SummaryOvernightItem>,
      departments:
          departments == const $CopyWithPlaceholder() || departments == null
              ? _value.departments
              // ignore: cast_nullable_to_non_nullable
              : departments as List<SummaryOvernightDepartment>,
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

extension $SummaryOvernightStateCopyWith on SummaryOvernightState {
  /// Returns a callable class that can be used as follows: `instanceOfSummaryOvernightState.copyWith(...)` or like so:`instanceOfSummaryOvernightState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SummaryOvernightStateCWProxy get copyWith =>
      _$SummaryOvernightStateCWProxyImpl(this);
}
