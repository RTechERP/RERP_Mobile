// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missed_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MissedStateCWProxy {
  MissedState status(BaseStateStatus status);

  MissedState message(String? message);

  MissedState missed(List<MissedItem> missed);

  MissedState approvers(List<ApproverItem> approvers);

  MissedState isSubmitting(bool isSubmitting);

  MissedState submitSuccess(bool submitSuccess);

  MissedState deleteSuccess(bool deleteSuccess);

  MissedState isDeleting(bool isDeleting);

  MissedState employeeId(int? employeeId);

  MissedState loginName(String? loginName);

  MissedState dateStart(DateTime? dateStart);

  MissedState dateEnd(DateTime? dateEnd);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MissedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MissedState(...).copyWith(id: 12, name: "My name")
  /// ````
  MissedState call({
    BaseStateStatus? status,
    String? message,
    List<MissedItem>? missed,
    List<ApproverItem>? approvers,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    bool? isDeleting,
    int? employeeId,
    String? loginName,
    DateTime? dateStart,
    DateTime? dateEnd,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMissedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMissedState.copyWith.fieldName(...)`
class _$MissedStateCWProxyImpl implements _$MissedStateCWProxy {
  const _$MissedStateCWProxyImpl(this._value);

  final MissedState _value;

  @override
  MissedState status(BaseStateStatus status) => this(status: status);

  @override
  MissedState message(String? message) => this(message: message);

  @override
  MissedState missed(List<MissedItem> missed) => this(missed: missed);

  @override
  MissedState approvers(List<ApproverItem> approvers) =>
      this(approvers: approvers);

  @override
  MissedState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  MissedState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  MissedState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  MissedState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  MissedState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  MissedState loginName(String? loginName) => this(loginName: loginName);

  @override
  MissedState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  MissedState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MissedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MissedState(...).copyWith(id: 12, name: "My name")
  /// ````
  MissedState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? missed = const $CopyWithPlaceholder(),
    Object? approvers = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? loginName = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
  }) {
    return MissedState(
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
          : missed as List<MissedItem>,
      approvers: approvers == const $CopyWithPlaceholder() || approvers == null
          ? _value.approvers
          // ignore: cast_nullable_to_non_nullable
          : approvers as List<ApproverItem>,
      isSubmitting:
          isSubmitting == const $CopyWithPlaceholder() || isSubmitting == null
              ? _value.isSubmitting
              // ignore: cast_nullable_to_non_nullable
              : isSubmitting as bool,
      submitSuccess:
          submitSuccess == const $CopyWithPlaceholder() || submitSuccess == null
              ? _value.submitSuccess
              // ignore: cast_nullable_to_non_nullable
              : submitSuccess as bool,
      deleteSuccess:
          deleteSuccess == const $CopyWithPlaceholder() || deleteSuccess == null
              ? _value.deleteSuccess
              // ignore: cast_nullable_to_non_nullable
              : deleteSuccess as bool,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      loginName: loginName == const $CopyWithPlaceholder()
          ? _value.loginName
          // ignore: cast_nullable_to_non_nullable
          : loginName as String?,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
    );
  }
}

extension $MissedStateCopyWith on MissedState {
  /// Returns a callable class that can be used as follows: `instanceOfMissedState.copyWith(...)` or like so:`instanceOfMissedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MissedStateCWProxy get copyWith => _$MissedStateCWProxyImpl(this);
}
