// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_summary_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PersonalSummaryStateCWProxy {
  PersonalSummaryState status(BaseStateStatus status);

  PersonalSummaryState message(String? message);

  PersonalSummaryState onLeave(List<PersonalLeaveItem> onLeave);

  PersonalSummaryState earlyLate(List<PersonalEarlyLateItem> earlyLate);

  PersonalSummaryState overTime(List<PersonalOverTimeItem> overTime);

  PersonalSummaryState bussiness(List<PersonalBussinessItem> bussiness);

  PersonalSummaryState wfh(List<PersonalWfhItem> wfh);

  PersonalSummaryState enf(List<PersonalEnfItem> enf);

  PersonalSummaryState nightShift(List<PersonalNightShiftItem> nightShift);

  PersonalSummaryState dateStart(DateTime? dateStart);

  PersonalSummaryState dateEnd(DateTime? dateEnd);

  PersonalSummaryState statusFilter(int statusFilter);

  PersonalSummaryState keyword(String keyword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonalSummaryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonalSummaryState(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonalSummaryState call({
    BaseStateStatus? status,
    String? message,
    List<PersonalLeaveItem>? onLeave,
    List<PersonalEarlyLateItem>? earlyLate,
    List<PersonalOverTimeItem>? overTime,
    List<PersonalBussinessItem>? bussiness,
    List<PersonalWfhItem>? wfh,
    List<PersonalEnfItem>? enf,
    List<PersonalNightShiftItem>? nightShift,
    DateTime? dateStart,
    DateTime? dateEnd,
    int? statusFilter,
    String? keyword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPersonalSummaryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPersonalSummaryState.copyWith.fieldName(...)`
class _$PersonalSummaryStateCWProxyImpl
    implements _$PersonalSummaryStateCWProxy {
  const _$PersonalSummaryStateCWProxyImpl(this._value);

  final PersonalSummaryState _value;

  @override
  PersonalSummaryState status(BaseStateStatus status) => this(status: status);

  @override
  PersonalSummaryState message(String? message) => this(message: message);

  @override
  PersonalSummaryState onLeave(List<PersonalLeaveItem> onLeave) =>
      this(onLeave: onLeave);

  @override
  PersonalSummaryState earlyLate(List<PersonalEarlyLateItem> earlyLate) =>
      this(earlyLate: earlyLate);

  @override
  PersonalSummaryState overTime(List<PersonalOverTimeItem> overTime) =>
      this(overTime: overTime);

  @override
  PersonalSummaryState bussiness(List<PersonalBussinessItem> bussiness) =>
      this(bussiness: bussiness);

  @override
  PersonalSummaryState wfh(List<PersonalWfhItem> wfh) => this(wfh: wfh);

  @override
  PersonalSummaryState enf(List<PersonalEnfItem> enf) => this(enf: enf);

  @override
  PersonalSummaryState nightShift(List<PersonalNightShiftItem> nightShift) =>
      this(nightShift: nightShift);

  @override
  PersonalSummaryState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  PersonalSummaryState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  PersonalSummaryState statusFilter(int statusFilter) =>
      this(statusFilter: statusFilter);

  @override
  PersonalSummaryState keyword(String keyword) => this(keyword: keyword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonalSummaryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonalSummaryState(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonalSummaryState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? onLeave = const $CopyWithPlaceholder(),
    Object? earlyLate = const $CopyWithPlaceholder(),
    Object? overTime = const $CopyWithPlaceholder(),
    Object? bussiness = const $CopyWithPlaceholder(),
    Object? wfh = const $CopyWithPlaceholder(),
    Object? enf = const $CopyWithPlaceholder(),
    Object? nightShift = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? statusFilter = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
  }) {
    return PersonalSummaryState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      onLeave: onLeave == const $CopyWithPlaceholder() || onLeave == null
          ? _value.onLeave
          // ignore: cast_nullable_to_non_nullable
          : onLeave as List<PersonalLeaveItem>,
      earlyLate: earlyLate == const $CopyWithPlaceholder() || earlyLate == null
          ? _value.earlyLate
          // ignore: cast_nullable_to_non_nullable
          : earlyLate as List<PersonalEarlyLateItem>,
      overTime: overTime == const $CopyWithPlaceholder() || overTime == null
          ? _value.overTime
          // ignore: cast_nullable_to_non_nullable
          : overTime as List<PersonalOverTimeItem>,
      bussiness: bussiness == const $CopyWithPlaceholder() || bussiness == null
          ? _value.bussiness
          // ignore: cast_nullable_to_non_nullable
          : bussiness as List<PersonalBussinessItem>,
      wfh: wfh == const $CopyWithPlaceholder() || wfh == null
          ? _value.wfh
          // ignore: cast_nullable_to_non_nullable
          : wfh as List<PersonalWfhItem>,
      enf: enf == const $CopyWithPlaceholder() || enf == null
          ? _value.enf
          // ignore: cast_nullable_to_non_nullable
          : enf as List<PersonalEnfItem>,
      nightShift:
          nightShift == const $CopyWithPlaceholder() || nightShift == null
              ? _value.nightShift
              // ignore: cast_nullable_to_non_nullable
              : nightShift as List<PersonalNightShiftItem>,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      statusFilter:
          statusFilter == const $CopyWithPlaceholder() || statusFilter == null
              ? _value.statusFilter
              // ignore: cast_nullable_to_non_nullable
              : statusFilter as int,
      keyword: keyword == const $CopyWithPlaceholder() || keyword == null
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String,
    );
  }
}

extension $PersonalSummaryStateCopyWith on PersonalSummaryState {
  /// Returns a callable class that can be used as follows: `instanceOfPersonalSummaryState.copyWith(...)` or like so:`instanceOfPersonalSummaryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PersonalSummaryStateCWProxy get copyWith =>
      _$PersonalSummaryStateCWProxyImpl(this);
}
