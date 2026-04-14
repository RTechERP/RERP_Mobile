// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_asset_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PersonalAssetStateCWProxy {
  PersonalAssetState status(BaseStateStatus status);

  PersonalAssetState message(String? message);

  PersonalAssetState personalAsset(List<PersonalAssetItem> personalAsset);

  PersonalAssetState personalProperty(
      List<PersonalPropertyItem> personalProperty);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonalAssetState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonalAssetState(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonalAssetState call({
    BaseStateStatus? status,
    String? message,
    List<PersonalAssetItem>? personalAsset,
    List<PersonalPropertyItem>? personalProperty,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPersonalAssetState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPersonalAssetState.copyWith.fieldName(...)`
class _$PersonalAssetStateCWProxyImpl implements _$PersonalAssetStateCWProxy {
  const _$PersonalAssetStateCWProxyImpl(this._value);

  final PersonalAssetState _value;

  @override
  PersonalAssetState status(BaseStateStatus status) => this(status: status);

  @override
  PersonalAssetState message(String? message) => this(message: message);

  @override
  PersonalAssetState personalAsset(List<PersonalAssetItem> personalAsset) =>
      this(personalAsset: personalAsset);

  @override
  PersonalAssetState personalProperty(
          List<PersonalPropertyItem> personalProperty) =>
      this(personalProperty: personalProperty);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonalAssetState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonalAssetState(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonalAssetState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? personalAsset = const $CopyWithPlaceholder(),
    Object? personalProperty = const $CopyWithPlaceholder(),
  }) {
    return PersonalAssetState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      personalAsset:
          personalAsset == const $CopyWithPlaceholder() || personalAsset == null
              ? _value.personalAsset
              // ignore: cast_nullable_to_non_nullable
              : personalAsset as List<PersonalAssetItem>,
      personalProperty: personalProperty == const $CopyWithPlaceholder() ||
              personalProperty == null
          ? _value.personalProperty
          // ignore: cast_nullable_to_non_nullable
          : personalProperty as List<PersonalPropertyItem>,
    );
  }
}

extension $PersonalAssetStateCopyWith on PersonalAssetState {
  /// Returns a callable class that can be used as follows: `instanceOfPersonalAssetState.copyWith(...)` or like so:`instanceOfPersonalAssetState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PersonalAssetStateCWProxy get copyWith =>
      _$PersonalAssetStateCWProxyImpl(this);
}
