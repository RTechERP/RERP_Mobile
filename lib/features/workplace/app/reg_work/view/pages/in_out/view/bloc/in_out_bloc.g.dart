// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_out_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InOutStateCWProxy {
  InOutState status(BaseStateStatus status);

  InOutState message(String? message);

  InOutState inOut(List<InOutItem> inOut);

  InOutState approvers(List<ApproverItem> approvers);

  InOutState isSubmitting(bool isSubmitting);

  InOutState submitSuccess(bool submitSuccess);

  InOutState deleteSuccess(bool deleteSuccess);

  InOutState isDeleting(bool isDeleting);

  InOutState employeeId(int? employeeId);

  InOutState loginName(String? loginName);

  InOutState dateStart(DateTime? dateStart);

  InOutState dateEnd(DateTime? dateEnd);

  InOutState approveId(FillApproverItem? approveId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InOutState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InOutState(...).copyWith(id: 12, name: "My name")
  /// ````
  InOutState call({
    BaseStateStatus? status,
    String? message,
    List<InOutItem>? inOut,
    List<ApproverItem>? approvers,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    bool? isDeleting,
    int? employeeId,
    String? loginName,
    DateTime? dateStart,
    DateTime? dateEnd,
    FillApproverItem? approveId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInOutState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInOutState.copyWith.fieldName(...)`
class _$InOutStateCWProxyImpl implements _$InOutStateCWProxy {
  const _$InOutStateCWProxyImpl(this._value);

  final InOutState _value;

  @override
  InOutState status(BaseStateStatus status) => this(status: status);

  @override
  InOutState message(String? message) => this(message: message);

  @override
  InOutState inOut(List<InOutItem> inOut) => this(inOut: inOut);

  @override
  InOutState approvers(List<ApproverItem> approvers) =>
      this(approvers: approvers);

  @override
  InOutState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  InOutState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  InOutState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  InOutState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  InOutState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  InOutState loginName(String? loginName) => this(loginName: loginName);

  @override
  InOutState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  InOutState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  InOutState approveId(FillApproverItem? approveId) =>
      this(approveId: approveId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InOutState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InOutState(...).copyWith(id: 12, name: "My name")
  /// ````
  InOutState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? inOut = const $CopyWithPlaceholder(),
    Object? approvers = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? loginName = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? approveId = const $CopyWithPlaceholder(),
  }) {
    return InOutState(
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
          : inOut as List<InOutItem>,
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
      approveId: approveId == const $CopyWithPlaceholder()
          ? _value.approveId
          // ignore: cast_nullable_to_non_nullable
          : approveId as FillApproverItem?,
    );
  }
}

extension $InOutStateCopyWith on InOutState {
  /// Returns a callable class that can be used as follows: `instanceOfInOutState.copyWith(...)` or like so:`instanceOfInOutState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InOutStateCWProxy get copyWith => _$InOutStateCWProxyImpl(this);
}
