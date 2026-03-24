// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunch_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LunchStateCWProxy {
  LunchState status(BaseStateStatus status);

  LunchState message(String? message);

  LunchState lunch(List<LunchItem> lunch);

  LunchState isSubmitting(bool isSubmitting);

  LunchState submitSuccess(bool submitSuccess);

  LunchState deleteSuccess(bool deleteSuccess);

  LunchState isDeleting(bool isDeleting);

  LunchState employeeId(int? employeeId);

  LunchState loginName(String? loginName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LunchState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LunchState(...).copyWith(id: 12, name: "My name")
  /// ````
  LunchState call({
    BaseStateStatus? status,
    String? message,
    List<LunchItem>? lunch,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    bool? isDeleting,
    int? employeeId,
    String? loginName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLunchState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLunchState.copyWith.fieldName(...)`
class _$LunchStateCWProxyImpl implements _$LunchStateCWProxy {
  const _$LunchStateCWProxyImpl(this._value);

  final LunchState _value;

  @override
  LunchState status(BaseStateStatus status) => this(status: status);

  @override
  LunchState message(String? message) => this(message: message);

  @override
  LunchState lunch(List<LunchItem> lunch) => this(lunch: lunch);

  @override
  LunchState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  LunchState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  LunchState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  LunchState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  LunchState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  LunchState loginName(String? loginName) => this(loginName: loginName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LunchState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LunchState(...).copyWith(id: 12, name: "My name")
  /// ````
  LunchState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? lunch = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? loginName = const $CopyWithPlaceholder(),
  }) {
    return LunchState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      lunch: lunch == const $CopyWithPlaceholder() || lunch == null
          ? _value.lunch
          // ignore: cast_nullable_to_non_nullable
          : lunch as List<LunchItem>,
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
    );
  }
}

extension $LunchStateCopyWith on LunchState {
  /// Returns a callable class that can be used as follows: `instanceOfLunchState.copyWith(...)` or like so:`instanceOfLunchState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LunchStateCWProxy get copyWith => _$LunchStateCWProxyImpl(this);
}
