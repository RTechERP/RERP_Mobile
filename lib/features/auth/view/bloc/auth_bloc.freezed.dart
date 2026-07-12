// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String loginName, String passwordHash, bool rememberMe)
        login,
    required TResult Function() logout,
    required TResult Function(bool value) toggleRememberMe,
    required TResult Function(String filePath) uploadAvatar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult? Function()? logout,
    TResult? Function(bool value)? toggleRememberMe,
    TResult? Function(String filePath)? uploadAvatar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult Function()? logout,
    TResult Function(bool value)? toggleRememberMe,
    TResult Function(String filePath)? uploadAvatar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ToggleRememberMe value) toggleRememberMe,
    required TResult Function(_UploadAvatar value) uploadAvatar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult? Function(_UploadAvatar value)? uploadAvatar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult Function(_UploadAvatar value)? uploadAvatar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'AuthEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String loginName, String passwordHash, bool rememberMe)
        login,
    required TResult Function() logout,
    required TResult Function(bool value) toggleRememberMe,
    required TResult Function(String filePath) uploadAvatar,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult? Function()? logout,
    TResult? Function(bool value)? toggleRememberMe,
    TResult? Function(String filePath)? uploadAvatar,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult Function()? logout,
    TResult Function(bool value)? toggleRememberMe,
    TResult Function(String filePath)? uploadAvatar,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ToggleRememberMe value) toggleRememberMe,
    required TResult Function(_UploadAvatar value) uploadAvatar,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult? Function(_UploadAvatar value)? uploadAvatar,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult Function(_UploadAvatar value)? uploadAvatar,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements AuthEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String loginName, String passwordHash, bool rememberMe});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginName = null,
    Object? passwordHash = null,
    Object? rememberMe = null,
  }) {
    return _then(_$LoginImpl(
      null == loginName
          ? _value.loginName
          : loginName // ignore: cast_nullable_to_non_nullable
              as String,
      null == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String,
      null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl(this.loginName, this.passwordHash, this.rememberMe);

  @override
  final String loginName;
  @override
  final String passwordHash;
  @override
  final bool rememberMe;

  @override
  String toString() {
    return 'AuthEvent.login(loginName: $loginName, passwordHash: $passwordHash, rememberMe: $rememberMe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.loginName, loginName) ||
                other.loginName == loginName) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loginName, passwordHash, rememberMe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String loginName, String passwordHash, bool rememberMe)
        login,
    required TResult Function() logout,
    required TResult Function(bool value) toggleRememberMe,
    required TResult Function(String filePath) uploadAvatar,
  }) {
    return login(loginName, passwordHash, rememberMe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult? Function()? logout,
    TResult? Function(bool value)? toggleRememberMe,
    TResult? Function(String filePath)? uploadAvatar,
  }) {
    return login?.call(loginName, passwordHash, rememberMe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult Function()? logout,
    TResult Function(bool value)? toggleRememberMe,
    TResult Function(String filePath)? uploadAvatar,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(loginName, passwordHash, rememberMe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ToggleRememberMe value) toggleRememberMe,
    required TResult Function(_UploadAvatar value) uploadAvatar,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult? Function(_UploadAvatar value)? uploadAvatar,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult Function(_UploadAvatar value)? uploadAvatar,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login(final String loginName, final String passwordHash,
      final bool rememberMe) = _$LoginImpl;

  String get loginName;
  String get passwordHash;
  bool get rememberMe;
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String loginName, String passwordHash, bool rememberMe)
        login,
    required TResult Function() logout,
    required TResult Function(bool value) toggleRememberMe,
    required TResult Function(String filePath) uploadAvatar,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult? Function()? logout,
    TResult? Function(bool value)? toggleRememberMe,
    TResult? Function(String filePath)? uploadAvatar,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult Function()? logout,
    TResult Function(bool value)? toggleRememberMe,
    TResult Function(String filePath)? uploadAvatar,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ToggleRememberMe value) toggleRememberMe,
    required TResult Function(_UploadAvatar value) uploadAvatar,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult? Function(_UploadAvatar value)? uploadAvatar,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult Function(_UploadAvatar value)? uploadAvatar,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$ToggleRememberMeImplCopyWith<$Res> {
  factory _$$ToggleRememberMeImplCopyWith(_$ToggleRememberMeImpl value,
          $Res Function(_$ToggleRememberMeImpl) then) =
      __$$ToggleRememberMeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$ToggleRememberMeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ToggleRememberMeImpl>
    implements _$$ToggleRememberMeImplCopyWith<$Res> {
  __$$ToggleRememberMeImplCopyWithImpl(_$ToggleRememberMeImpl _value,
      $Res Function(_$ToggleRememberMeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ToggleRememberMeImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleRememberMeImpl implements _ToggleRememberMe {
  const _$ToggleRememberMeImpl(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'AuthEvent.toggleRememberMe(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleRememberMeImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleRememberMeImplCopyWith<_$ToggleRememberMeImpl> get copyWith =>
      __$$ToggleRememberMeImplCopyWithImpl<_$ToggleRememberMeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String loginName, String passwordHash, bool rememberMe)
        login,
    required TResult Function() logout,
    required TResult Function(bool value) toggleRememberMe,
    required TResult Function(String filePath) uploadAvatar,
  }) {
    return toggleRememberMe(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult? Function()? logout,
    TResult? Function(bool value)? toggleRememberMe,
    TResult? Function(String filePath)? uploadAvatar,
  }) {
    return toggleRememberMe?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult Function()? logout,
    TResult Function(bool value)? toggleRememberMe,
    TResult Function(String filePath)? uploadAvatar,
    required TResult orElse(),
  }) {
    if (toggleRememberMe != null) {
      return toggleRememberMe(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ToggleRememberMe value) toggleRememberMe,
    required TResult Function(_UploadAvatar value) uploadAvatar,
  }) {
    return toggleRememberMe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult? Function(_UploadAvatar value)? uploadAvatar,
  }) {
    return toggleRememberMe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult Function(_UploadAvatar value)? uploadAvatar,
    required TResult orElse(),
  }) {
    if (toggleRememberMe != null) {
      return toggleRememberMe(this);
    }
    return orElse();
  }
}

abstract class _ToggleRememberMe implements AuthEvent {
  const factory _ToggleRememberMe(final bool value) = _$ToggleRememberMeImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$ToggleRememberMeImplCopyWith<_$ToggleRememberMeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadAvatarImplCopyWith<$Res> {
  factory _$$UploadAvatarImplCopyWith(
          _$UploadAvatarImpl value, $Res Function(_$UploadAvatarImpl) then) =
      __$$UploadAvatarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String filePath});
}

/// @nodoc
class __$$UploadAvatarImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UploadAvatarImpl>
    implements _$$UploadAvatarImplCopyWith<$Res> {
  __$$UploadAvatarImplCopyWithImpl(
      _$UploadAvatarImpl _value, $Res Function(_$UploadAvatarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_$UploadAvatarImpl(
      null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UploadAvatarImpl implements _UploadAvatar {
  const _$UploadAvatarImpl(this.filePath);

  @override
  final String filePath;

  @override
  String toString() {
    return 'AuthEvent.uploadAvatar(filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadAvatarImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadAvatarImplCopyWith<_$UploadAvatarImpl> get copyWith =>
      __$$UploadAvatarImplCopyWithImpl<_$UploadAvatarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            String loginName, String passwordHash, bool rememberMe)
        login,
    required TResult Function() logout,
    required TResult Function(bool value) toggleRememberMe,
    required TResult Function(String filePath) uploadAvatar,
  }) {
    return uploadAvatar(filePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult? Function()? logout,
    TResult? Function(bool value)? toggleRememberMe,
    TResult? Function(String filePath)? uploadAvatar,
  }) {
    return uploadAvatar?.call(filePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String loginName, String passwordHash, bool rememberMe)?
        login,
    TResult Function()? logout,
    TResult Function(bool value)? toggleRememberMe,
    TResult Function(String filePath)? uploadAvatar,
    required TResult orElse(),
  }) {
    if (uploadAvatar != null) {
      return uploadAvatar(filePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ToggleRememberMe value) toggleRememberMe,
    required TResult Function(_UploadAvatar value) uploadAvatar,
  }) {
    return uploadAvatar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult? Function(_UploadAvatar value)? uploadAvatar,
  }) {
    return uploadAvatar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_ToggleRememberMe value)? toggleRememberMe,
    TResult Function(_UploadAvatar value)? uploadAvatar,
    required TResult orElse(),
  }) {
    if (uploadAvatar != null) {
      return uploadAvatar(this);
    }
    return orElse();
  }
}

abstract class _UploadAvatar implements AuthEvent {
  const factory _UploadAvatar(final String filePath) = _$UploadAvatarImpl;

  String get filePath;
  @JsonKey(ignore: true)
  _$$UploadAvatarImplCopyWith<_$UploadAvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
