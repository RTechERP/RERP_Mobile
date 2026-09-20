// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_wfh_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SummaryWfhStateCWProxy {
  SummaryWfhState status(BaseStateStatus status);

  SummaryWfhState message(String? message);

  SummaryWfhState wfh(List<SummaryWfhItem> wfh);

  SummaryWfhState departments(List<SummaryWfhDepartment> departments);

  SummaryWfhState dateStart(DateTime? dateStart);

  SummaryWfhState dateEnd(DateTime? dateEnd);

  SummaryWfhState keyword(String keyword);

  SummaryWfhState departmentId(int? departmentId);

  SummaryWfhState filterStatus(int? filterStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryWfhState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryWfhState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryWfhState call({
    BaseStateStatus? status,
    String? message,
    List<SummaryWfhItem>? wfh,
    List<SummaryWfhDepartment>? departments,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    int? departmentId,
    int? filterStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSummaryWfhState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSummaryWfhState.copyWith.fieldName(...)`
class _$SummaryWfhStateCWProxyImpl implements _$SummaryWfhStateCWProxy {
  const _$SummaryWfhStateCWProxyImpl(this._value);

  final SummaryWfhState _value;

  @override
  SummaryWfhState status(BaseStateStatus status) => this(status: status);

  @override
  SummaryWfhState message(String? message) => this(message: message);

  @override
  SummaryWfhState wfh(List<SummaryWfhItem> wfh) => this(wfh: wfh);

  @override
  SummaryWfhState departments(List<SummaryWfhDepartment> departments) =>
      this(departments: departments);

  @override
  SummaryWfhState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  SummaryWfhState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  SummaryWfhState keyword(String keyword) => this(keyword: keyword);

  @override
  SummaryWfhState departmentId(int? departmentId) =>
      this(departmentId: departmentId);

  @override
  SummaryWfhState filterStatus(int? filterStatus) =>
      this(filterStatus: filterStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryWfhState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryWfhState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryWfhState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? wfh = const $CopyWithPlaceholder(),
    Object? departments = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? filterStatus = const $CopyWithPlaceholder(),
  }) {
    return SummaryWfhState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      wfh: wfh == const $CopyWithPlaceholder() || wfh == null
          ? _value.wfh
          // ignore: cast_nullable_to_non_nullable
          : wfh as List<SummaryWfhItem>,
      departments:
          departments == const $CopyWithPlaceholder() || departments == null
              ? _value.departments
              // ignore: cast_nullable_to_non_nullable
              : departments as List<SummaryWfhDepartment>,
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

extension $SummaryWfhStateCopyWith on SummaryWfhState {
  /// Returns a callable class that can be used as follows: `instanceOfSummaryWfhState.copyWith(...)` or like so:`instanceOfSummaryWfhState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SummaryWfhStateCWProxy get copyWith => _$SummaryWfhStateCWProxyImpl(this);
}
