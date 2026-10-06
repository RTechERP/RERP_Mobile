// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celebration_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CelebrationStateCWProxy {
  CelebrationState status(BaseStateStatus status);

  CelebrationState message(String? message);

  CelebrationState celebrationItem(CelebrationItem? celebrationItem);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CelebrationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CelebrationState(...).copyWith(id: 12, name: "My name")
  /// ````
  CelebrationState call({
    BaseStateStatus? status,
    String? message,
    CelebrationItem? celebrationItem,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCelebrationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCelebrationState.copyWith.fieldName(...)`
class _$CelebrationStateCWProxyImpl implements _$CelebrationStateCWProxy {
  const _$CelebrationStateCWProxyImpl(this._value);

  final CelebrationState _value;

  @override
  CelebrationState status(BaseStateStatus status) => this(status: status);

  @override
  CelebrationState message(String? message) => this(message: message);

  @override
  CelebrationState celebrationItem(CelebrationItem? celebrationItem) =>
      this(celebrationItem: celebrationItem);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CelebrationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CelebrationState(...).copyWith(id: 12, name: "My name")
  /// ````
  CelebrationState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? celebrationItem = const $CopyWithPlaceholder(),
  }) {
    return CelebrationState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      celebrationItem: celebrationItem == const $CopyWithPlaceholder()
          ? _value.celebrationItem
          // ignore: cast_nullable_to_non_nullable
          : celebrationItem as CelebrationItem?,
    );
  }
}

extension $CelebrationStateCopyWith on CelebrationState {
  /// Returns a callable class that can be used as follows: `instanceOfCelebrationState.copyWith(...)` or like so:`instanceOfCelebrationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CelebrationStateCWProxy get copyWith => _$CelebrationStateCWProxyImpl(this);
}
