// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_card_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BusinessCardStateCWProxy {
  BusinessCardState status(BaseStateStatus status);

  BusinessCardState message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BusinessCardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BusinessCardState(...).copyWith(id: 12, name: "My name")
  /// ````
  BusinessCardState call({
    BaseStateStatus? status,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBusinessCardState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBusinessCardState.copyWith.fieldName(...)`
class _$BusinessCardStateCWProxyImpl implements _$BusinessCardStateCWProxy {
  const _$BusinessCardStateCWProxyImpl(this._value);

  final BusinessCardState _value;

  @override
  BusinessCardState status(BaseStateStatus status) => this(status: status);

  @override
  BusinessCardState message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BusinessCardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BusinessCardState(...).copyWith(id: 12, name: "My name")
  /// ````
  BusinessCardState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return BusinessCardState(
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

extension $BusinessCardStateCopyWith on BusinessCardState {
  /// Returns a callable class that can be used as follows: `instanceOfBusinessCardState.copyWith(...)` or like so:`instanceOfBusinessCardState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BusinessCardStateCWProxy get copyWith =>
      _$BusinessCardStateCWProxyImpl(this);
}
