// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthStateCWProxy {
  AuthState status(BaseStateStatus status);

  AuthState message(String? message);

  AuthState loginResponse(LoginResponse? loginResponse);

  AuthState user(User? user);

  AuthState rememberMe(bool rememberMe);

  AuthState savedUsername(String? savedUsername);

  AuthState savedPassword(String? savedPassword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthState call({
    BaseStateStatus? status,
    String? message,
    LoginResponse? loginResponse,
    User? user,
    bool? rememberMe,
    String? savedUsername,
    String? savedPassword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthState.copyWith.fieldName(...)`
class _$AuthStateCWProxyImpl implements _$AuthStateCWProxy {
  const _$AuthStateCWProxyImpl(this._value);

  final AuthState _value;

  @override
  AuthState status(BaseStateStatus status) => this(status: status);

  @override
  AuthState message(String? message) => this(message: message);

  @override
  AuthState loginResponse(LoginResponse? loginResponse) =>
      this(loginResponse: loginResponse);

  @override
  AuthState user(User? user) => this(user: user);

  @override
  AuthState rememberMe(bool rememberMe) => this(rememberMe: rememberMe);

  @override
  AuthState savedUsername(String? savedUsername) =>
      this(savedUsername: savedUsername);

  @override
  AuthState savedPassword(String? savedPassword) =>
      this(savedPassword: savedPassword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? loginResponse = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? rememberMe = const $CopyWithPlaceholder(),
    Object? savedUsername = const $CopyWithPlaceholder(),
    Object? savedPassword = const $CopyWithPlaceholder(),
  }) {
    return AuthState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      loginResponse: loginResponse == const $CopyWithPlaceholder()
          ? _value.loginResponse
          // ignore: cast_nullable_to_non_nullable
          : loginResponse as LoginResponse?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
      rememberMe:
          rememberMe == const $CopyWithPlaceholder() || rememberMe == null
              ? _value.rememberMe
              // ignore: cast_nullable_to_non_nullable
              : rememberMe as bool,
      savedUsername: savedUsername == const $CopyWithPlaceholder()
          ? _value.savedUsername
          // ignore: cast_nullable_to_non_nullable
          : savedUsername as String?,
      savedPassword: savedPassword == const $CopyWithPlaceholder()
          ? _value.savedPassword
          // ignore: cast_nullable_to_non_nullable
          : savedPassword as String?,
    );
  }
}

extension $AuthStateCopyWith on AuthState {
  /// Returns a callable class that can be used as follows: `instanceOfAuthState.copyWith(...)` or like so:`instanceOfAuthState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthStateCWProxy get copyWith => _$AuthStateCWProxyImpl(this);
}
