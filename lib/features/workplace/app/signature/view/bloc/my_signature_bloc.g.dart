// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_signature_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MySignatureStateCWProxy {
  MySignatureState status(BaseStateStatus status);

  MySignatureState message(String? message);

  MySignatureState employeeId(int? employeeId);

  MySignatureState employeeSignature(Uint8List? employeeSignature);

  MySignatureState isSaving(bool isSaving);

  MySignatureState saveSuccess(bool saveSuccess);

  MySignatureState deleteSuccess(bool deleteSuccess);

  MySignatureState isDeleting(bool isDeleting);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MySignatureState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MySignatureState(...).copyWith(id: 12, name: "My name")
  /// ````
  MySignatureState call({
    BaseStateStatus? status,
    String? message,
    int? employeeId,
    Uint8List? employeeSignature,
    bool? isSaving,
    bool? saveSuccess,
    bool? deleteSuccess,
    bool? isDeleting,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMySignatureState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMySignatureState.copyWith.fieldName(...)`
class _$MySignatureStateCWProxyImpl implements _$MySignatureStateCWProxy {
  const _$MySignatureStateCWProxyImpl(this._value);

  final MySignatureState _value;

  @override
  MySignatureState status(BaseStateStatus status) => this(status: status);

  @override
  MySignatureState message(String? message) => this(message: message);

  @override
  MySignatureState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  MySignatureState employeeSignature(Uint8List? employeeSignature) =>
      this(employeeSignature: employeeSignature);

  @override
  MySignatureState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  MySignatureState saveSuccess(bool saveSuccess) =>
      this(saveSuccess: saveSuccess);

  @override
  MySignatureState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  MySignatureState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MySignatureState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MySignatureState(...).copyWith(id: 12, name: "My name")
  /// ````
  MySignatureState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? employeeSignature = const $CopyWithPlaceholder(),
    Object? isSaving = const $CopyWithPlaceholder(),
    Object? saveSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
  }) {
    return MySignatureState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      employeeSignature: employeeSignature == const $CopyWithPlaceholder()
          ? _value.employeeSignature
          // ignore: cast_nullable_to_non_nullable
          : employeeSignature as Uint8List?,
      isSaving: isSaving == const $CopyWithPlaceholder() || isSaving == null
          ? _value.isSaving
          // ignore: cast_nullable_to_non_nullable
          : isSaving as bool,
      saveSuccess:
          saveSuccess == const $CopyWithPlaceholder() || saveSuccess == null
              ? _value.saveSuccess
              // ignore: cast_nullable_to_non_nullable
              : saveSuccess as bool,
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
    );
  }
}

extension $MySignatureStateCopyWith on MySignatureState {
  /// Returns a callable class that can be used as follows: `instanceOfMySignatureState.copyWith(...)` or like so:`instanceOfMySignatureState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MySignatureStateCWProxy get copyWith => _$MySignatureStateCWProxyImpl(this);
}
