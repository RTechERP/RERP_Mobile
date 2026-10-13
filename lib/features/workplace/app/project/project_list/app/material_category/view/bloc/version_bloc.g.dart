// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionStateCWProxy {
  VersionState status(BaseStateStatus status);

  VersionState message(String? message);

  VersionState versions(List<VersionItem> versions);

  VersionState projectSolutionId(int? projectSolutionId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionState(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionState call({
    BaseStateStatus? status,
    String? message,
    List<VersionItem>? versions,
    int? projectSolutionId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionState.copyWith.fieldName(...)`
class _$VersionStateCWProxyImpl implements _$VersionStateCWProxy {
  const _$VersionStateCWProxyImpl(this._value);

  final VersionState _value;

  @override
  VersionState status(BaseStateStatus status) => this(status: status);

  @override
  VersionState message(String? message) => this(message: message);

  @override
  VersionState versions(List<VersionItem> versions) => this(versions: versions);

  @override
  VersionState projectSolutionId(int? projectSolutionId) =>
      this(projectSolutionId: projectSolutionId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionState(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? versions = const $CopyWithPlaceholder(),
    Object? projectSolutionId = const $CopyWithPlaceholder(),
  }) {
    return VersionState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      versions: versions == const $CopyWithPlaceholder() || versions == null
          ? _value.versions
          // ignore: cast_nullable_to_non_nullable
          : versions as List<VersionItem>,
      projectSolutionId: projectSolutionId == const $CopyWithPlaceholder()
          ? _value.projectSolutionId
          // ignore: cast_nullable_to_non_nullable
          : projectSolutionId as int?,
    );
  }
}

extension $VersionStateCopyWith on VersionState {
  /// Returns a callable class that can be used as follows: `instanceOfVersionState.copyWith(...)` or like so:`instanceOfVersionState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionStateCWProxy get copyWith => _$VersionStateCWProxyImpl(this);
}
