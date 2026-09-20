// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_in_out_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SummaryInOutStateCWProxy {
  SummaryInOutState status(BaseStateStatus status);

  SummaryInOutState message(String? message);

  SummaryInOutState inOut(List<SummaryInOutItem> inOut);

  SummaryInOutState departments(List<SummaryInOutDepartment> departments);

  SummaryInOutState dateStart(DateTime? dateStart);

  SummaryInOutState dateEnd(DateTime? dateEnd);

  SummaryInOutState keyword(String keyword);

  SummaryInOutState departmentId(int? departmentId);

  SummaryInOutState filterStatus(int? filterStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryInOutState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryInOutState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryInOutState call({
    BaseStateStatus? status,
    String? message,
    List<SummaryInOutItem>? inOut,
    List<SummaryInOutDepartment>? departments,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    int? departmentId,
    int? filterStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSummaryInOutState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSummaryInOutState.copyWith.fieldName(...)`
class _$SummaryInOutStateCWProxyImpl implements _$SummaryInOutStateCWProxy {
  const _$SummaryInOutStateCWProxyImpl(this._value);

  final SummaryInOutState _value;

  @override
  SummaryInOutState status(BaseStateStatus status) => this(status: status);

  @override
  SummaryInOutState message(String? message) => this(message: message);

  @override
  SummaryInOutState inOut(List<SummaryInOutItem> inOut) => this(inOut: inOut);

  @override
  SummaryInOutState departments(List<SummaryInOutDepartment> departments) =>
      this(departments: departments);

  @override
  SummaryInOutState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  SummaryInOutState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  SummaryInOutState keyword(String keyword) => this(keyword: keyword);

  @override
  SummaryInOutState departmentId(int? departmentId) =>
      this(departmentId: departmentId);

  @override
  SummaryInOutState filterStatus(int? filterStatus) =>
      this(filterStatus: filterStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryInOutState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryInOutState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryInOutState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? inOut = const $CopyWithPlaceholder(),
    Object? departments = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? filterStatus = const $CopyWithPlaceholder(),
  }) {
    return SummaryInOutState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      inOut: inOut == const $CopyWithPlaceholder() || inOut == null
          ? _value.inOut
          // ignore: cast_nullable_to_non_nullable
          : inOut as List<SummaryInOutItem>,
      departments:
          departments == const $CopyWithPlaceholder() || departments == null
              ? _value.departments
              // ignore: cast_nullable_to_non_nullable
              : departments as List<SummaryInOutDepartment>,
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

extension $SummaryInOutStateCopyWith on SummaryInOutState {
  /// Returns a callable class that can be used as follows: `instanceOfSummaryInOutState.copyWith(...)` or like so:`instanceOfSummaryInOutState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SummaryInOutStateCWProxy get copyWith =>
      _$SummaryInOutStateCWProxyImpl(this);
}
