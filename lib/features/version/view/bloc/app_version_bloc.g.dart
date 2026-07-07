// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppVersionStateCWProxy {
  AppVersionState status(BaseStateStatus status);

  AppVersionState message(String? message);

  AppVersionState appVersion(AppVersion? appVersion);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppVersionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppVersionState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppVersionState call({
    BaseStateStatus? status,
    String? message,
    AppVersion? appVersion,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppVersionState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppVersionState.copyWith.fieldName(...)`
class _$AppVersionStateCWProxyImpl implements _$AppVersionStateCWProxy {
  const _$AppVersionStateCWProxyImpl(this._value);

  final AppVersionState _value;

  @override
  AppVersionState status(BaseStateStatus status) => this(status: status);

  @override
  AppVersionState message(String? message) => this(message: message);

  @override
  AppVersionState appVersion(AppVersion? appVersion) =>
      this(appVersion: appVersion);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppVersionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppVersionState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppVersionState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? appVersion = const $CopyWithPlaceholder(),
  }) {
    return AppVersionState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      appVersion: appVersion == const $CopyWithPlaceholder()
          ? _value.appVersion
          // ignore: cast_nullable_to_non_nullable
          : appVersion as AppVersion?,
    );
  }
}

extension $AppVersionStateCopyWith on AppVersionState {
  /// Returns a callable class that can be used as follows: `instanceOfAppVersionState.copyWith(...)` or like so:`instanceOfAppVersionState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppVersionStateCWProxy get copyWith => _$AppVersionStateCWProxyImpl(this);
}
