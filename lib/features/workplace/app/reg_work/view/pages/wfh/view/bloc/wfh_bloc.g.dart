// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wfh_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WfhStateCWProxy {
  WfhState status(BaseStateStatus status);

  WfhState message(String? message);

  WfhState wfh(List<WfhItem> wfh);

  WfhState approvers(List<ApproverItem> approvers);

  WfhState isSubmitting(bool isSubmitting);

  WfhState submitSuccess(bool submitSuccess);

  WfhState deleteSuccess(bool deleteSuccess);

  WfhState isDeleting(bool isDeleting);

  WfhState employeeId(int? employeeId);

  WfhState loginName(String? loginName);

  WfhState dateStart(DateTime? dateStart);

  WfhState dateEnd(DateTime? dateEnd);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WfhState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WfhState(...).copyWith(id: 12, name: "My name")
  /// ````
  WfhState call({
    BaseStateStatus? status,
    String? message,
    List<WfhItem>? wfh,
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWfhState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWfhState.copyWith.fieldName(...)`
class _$WfhStateCWProxyImpl implements _$WfhStateCWProxy {
  const _$WfhStateCWProxyImpl(this._value);

  final WfhState _value;

  @override
  WfhState status(BaseStateStatus status) => this(status: status);

  @override
  WfhState message(String? message) => this(message: message);

  @override
  WfhState wfh(List<WfhItem> wfh) => this(wfh: wfh);

  @override
  WfhState approvers(List<ApproverItem> approvers) =>
      this(approvers: approvers);

  @override
  WfhState isSubmitting(bool isSubmitting) => this(isSubmitting: isSubmitting);

  @override
  WfhState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  WfhState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  WfhState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  WfhState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  WfhState loginName(String? loginName) => this(loginName: loginName);

  @override
  WfhState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  WfhState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WfhState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WfhState(...).copyWith(id: 12, name: "My name")
  /// ````
  WfhState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? wfh = const $CopyWithPlaceholder(),
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
    return WfhState(
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
          : wfh as List<WfhItem>,
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

extension $WfhStateCopyWith on WfhState {
  /// Returns a callable class that can be used as follows: `instanceOfWfhState.copyWith(...)` or like so:`instanceOfWfhState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WfhStateCWProxy get copyWith => _$WfhStateCWProxyImpl(this);
}
