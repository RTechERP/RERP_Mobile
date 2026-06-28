// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_timesheet_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ApproveTimesheetStateCWProxy {
  ApproveTimesheetState status(BaseStateStatus status);

  ApproveTimesheetState message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApproveTimesheetState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApproveTimesheetState(...).copyWith(id: 12, name: "My name")
  /// ````
  ApproveTimesheetState call({
    BaseStateStatus? status,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfApproveTimesheetState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfApproveTimesheetState.copyWith.fieldName(...)`
class _$ApproveTimesheetStateCWProxyImpl
    implements _$ApproveTimesheetStateCWProxy {
  const _$ApproveTimesheetStateCWProxyImpl(this._value);

  final ApproveTimesheetState _value;

  @override
  ApproveTimesheetState status(BaseStateStatus status) => this(status: status);

  @override
  ApproveTimesheetState message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApproveTimesheetState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApproveTimesheetState(...).copyWith(id: 12, name: "My name")
  /// ````
  ApproveTimesheetState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return ApproveTimesheetState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $ApproveTimesheetStateCopyWith on ApproveTimesheetState {
  /// Returns a callable class that can be used as follows: `instanceOfApproveTimesheetState.copyWith(...)` or like so:`instanceOfApproveTimesheetState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ApproveTimesheetStateCWProxy get copyWith =>
      _$ApproveTimesheetStateCWProxyImpl(this);
}
