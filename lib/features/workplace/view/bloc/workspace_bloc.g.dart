// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkspaceStateCWProxy {
  WorkspaceState status(BaseStateStatus status);

  WorkspaceState message(String? message);

  WorkspaceState user(User? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkspaceState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkspaceState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkspaceState call({
    BaseStateStatus? status,
    String? message,
    User? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkspaceState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkspaceState.copyWith.fieldName(...)`
class _$WorkspaceStateCWProxyImpl implements _$WorkspaceStateCWProxy {
  const _$WorkspaceStateCWProxyImpl(this._value);

  final WorkspaceState _value;

  @override
  WorkspaceState status(BaseStateStatus status) => this(status: status);

  @override
  WorkspaceState message(String? message) => this(message: message);

  @override
  WorkspaceState user(User? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkspaceState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkspaceState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkspaceState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return WorkspaceState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
    );
  }
}

extension $WorkspaceStateCopyWith on WorkspaceState {
  /// Returns a callable class that can be used as follows: `instanceOfWorkspaceState.copyWith(...)` or like so:`instanceOfWorkspaceState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkspaceStateCWProxy get copyWith => _$WorkspaceStateCWProxyImpl(this);
}
