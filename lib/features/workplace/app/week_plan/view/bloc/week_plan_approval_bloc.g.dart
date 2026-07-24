// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_plan_approval_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeekPlanApprovalStateCWProxy {
  WeekPlanApprovalState status(BaseStateStatus status);

  WeekPlanApprovalState message(String? message);

  WeekPlanApprovalState approvalSuccess(bool approvalSuccess);

  WeekPlanApprovalState approvalTaskId(int? approvalTaskId);

  WeekPlanApprovalState approvalIsApprove(bool? approvalIsApprove);

  WeekPlanApprovalState needsRefresh(bool needsRefresh);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeekPlanApprovalState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeekPlanApprovalState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeekPlanApprovalState call({
    BaseStateStatus? status,
    String? message,
    bool? approvalSuccess,
    int? approvalTaskId,
    bool? approvalIsApprove,
    bool? needsRefresh,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeekPlanApprovalState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeekPlanApprovalState.copyWith.fieldName(...)`
class _$WeekPlanApprovalStateCWProxyImpl
    implements _$WeekPlanApprovalStateCWProxy {
  const _$WeekPlanApprovalStateCWProxyImpl(this._value);

  final WeekPlanApprovalState _value;

  @override
  WeekPlanApprovalState status(BaseStateStatus status) => this(status: status);

  @override
  WeekPlanApprovalState message(String? message) => this(message: message);

  @override
  WeekPlanApprovalState approvalSuccess(bool approvalSuccess) =>
      this(approvalSuccess: approvalSuccess);

  @override
  WeekPlanApprovalState approvalTaskId(int? approvalTaskId) =>
      this(approvalTaskId: approvalTaskId);

  @override
  WeekPlanApprovalState approvalIsApprove(bool? approvalIsApprove) =>
      this(approvalIsApprove: approvalIsApprove);

  @override
  WeekPlanApprovalState needsRefresh(bool needsRefresh) =>
      this(needsRefresh: needsRefresh);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeekPlanApprovalState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeekPlanApprovalState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeekPlanApprovalState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? approvalSuccess = const $CopyWithPlaceholder(),
    Object? approvalTaskId = const $CopyWithPlaceholder(),
    Object? approvalIsApprove = const $CopyWithPlaceholder(),
    Object? needsRefresh = const $CopyWithPlaceholder(),
  }) {
    return WeekPlanApprovalState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      approvalSuccess: approvalSuccess == const $CopyWithPlaceholder() ||
              approvalSuccess == null
          ? _value.approvalSuccess
          // ignore: cast_nullable_to_non_nullable
          : approvalSuccess as bool,
      approvalTaskId: approvalTaskId == const $CopyWithPlaceholder()
          ? _value.approvalTaskId
          // ignore: cast_nullable_to_non_nullable
          : approvalTaskId as int?,
      approvalIsApprove: approvalIsApprove == const $CopyWithPlaceholder()
          ? _value.approvalIsApprove
          // ignore: cast_nullable_to_non_nullable
          : approvalIsApprove as bool?,
      needsRefresh:
          needsRefresh == const $CopyWithPlaceholder() || needsRefresh == null
              ? _value.needsRefresh
              // ignore: cast_nullable_to_non_nullable
              : needsRefresh as bool,
    );
  }
}

extension $WeekPlanApprovalStateCopyWith on WeekPlanApprovalState {
  /// Returns a callable class that can be used as follows: `instanceOfWeekPlanApprovalState.copyWith(...)` or like so:`instanceOfWeekPlanApprovalState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeekPlanApprovalStateCWProxy get copyWith =>
      _$WeekPlanApprovalStateCWProxyImpl(this);
}
