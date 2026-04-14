// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int typeLinkId, int notificationTypeId, bool isSelected)
        toggleNotification,
    required TResult Function(bool value) toggleSystemPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int typeLinkId, int notificationTypeId, bool isSelected)?
        toggleNotification,
    TResult? Function(bool value)? toggleSystemPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int typeLinkId, int notificationTypeId, bool isSelected)?
        toggleNotification,
    TResult Function(bool value)? toggleSystemPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ToggleNotification value) toggleNotification,
    required TResult Function(_ToggleSystemPermission value)
        toggleSystemPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ToggleNotification value)? toggleNotification,
    TResult? Function(_ToggleSystemPermission value)? toggleSystemPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ToggleNotification value)? toggleNotification,
    TResult Function(_ToggleSystemPermission value)? toggleSystemPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

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
    extends _$NotificationEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'NotificationEvent.init()';
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
            int typeLinkId, int notificationTypeId, bool isSelected)
        toggleNotification,
    required TResult Function(bool value) toggleSystemPermission,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int typeLinkId, int notificationTypeId, bool isSelected)?
        toggleNotification,
    TResult? Function(bool value)? toggleSystemPermission,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int typeLinkId, int notificationTypeId, bool isSelected)?
        toggleNotification,
    TResult Function(bool value)? toggleSystemPermission,
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
    required TResult Function(_ToggleNotification value) toggleNotification,
    required TResult Function(_ToggleSystemPermission value)
        toggleSystemPermission,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ToggleNotification value)? toggleNotification,
    TResult? Function(_ToggleSystemPermission value)? toggleSystemPermission,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ToggleNotification value)? toggleNotification,
    TResult Function(_ToggleSystemPermission value)? toggleSystemPermission,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements NotificationEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$ToggleNotificationImplCopyWith<$Res> {
  factory _$$ToggleNotificationImplCopyWith(_$ToggleNotificationImpl value,
          $Res Function(_$ToggleNotificationImpl) then) =
      __$$ToggleNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int typeLinkId, int notificationTypeId, bool isSelected});
}

/// @nodoc
class __$$ToggleNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$ToggleNotificationImpl>
    implements _$$ToggleNotificationImplCopyWith<$Res> {
  __$$ToggleNotificationImplCopyWithImpl(_$ToggleNotificationImpl _value,
      $Res Function(_$ToggleNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeLinkId = null,
    Object? notificationTypeId = null,
    Object? isSelected = null,
  }) {
    return _then(_$ToggleNotificationImpl(
      typeLinkId: null == typeLinkId
          ? _value.typeLinkId
          : typeLinkId // ignore: cast_nullable_to_non_nullable
              as int,
      notificationTypeId: null == notificationTypeId
          ? _value.notificationTypeId
          : notificationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleNotificationImpl implements _ToggleNotification {
  const _$ToggleNotificationImpl(
      {required this.typeLinkId,
      required this.notificationTypeId,
      required this.isSelected});

  @override
  final int typeLinkId;
  @override
  final int notificationTypeId;
  @override
  final bool isSelected;

  @override
  String toString() {
    return 'NotificationEvent.toggleNotification(typeLinkId: $typeLinkId, notificationTypeId: $notificationTypeId, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleNotificationImpl &&
            (identical(other.typeLinkId, typeLinkId) ||
                other.typeLinkId == typeLinkId) &&
            (identical(other.notificationTypeId, notificationTypeId) ||
                other.notificationTypeId == notificationTypeId) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, typeLinkId, notificationTypeId, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleNotificationImplCopyWith<_$ToggleNotificationImpl> get copyWith =>
      __$$ToggleNotificationImplCopyWithImpl<_$ToggleNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int typeLinkId, int notificationTypeId, bool isSelected)
        toggleNotification,
    required TResult Function(bool value) toggleSystemPermission,
  }) {
    return toggleNotification(typeLinkId, notificationTypeId, isSelected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int typeLinkId, int notificationTypeId, bool isSelected)?
        toggleNotification,
    TResult? Function(bool value)? toggleSystemPermission,
  }) {
    return toggleNotification?.call(typeLinkId, notificationTypeId, isSelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int typeLinkId, int notificationTypeId, bool isSelected)?
        toggleNotification,
    TResult Function(bool value)? toggleSystemPermission,
    required TResult orElse(),
  }) {
    if (toggleNotification != null) {
      return toggleNotification(typeLinkId, notificationTypeId, isSelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ToggleNotification value) toggleNotification,
    required TResult Function(_ToggleSystemPermission value)
        toggleSystemPermission,
  }) {
    return toggleNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ToggleNotification value)? toggleNotification,
    TResult? Function(_ToggleSystemPermission value)? toggleSystemPermission,
  }) {
    return toggleNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ToggleNotification value)? toggleNotification,
    TResult Function(_ToggleSystemPermission value)? toggleSystemPermission,
    required TResult orElse(),
  }) {
    if (toggleNotification != null) {
      return toggleNotification(this);
    }
    return orElse();
  }
}

abstract class _ToggleNotification implements NotificationEvent {
  const factory _ToggleNotification(
      {required final int typeLinkId,
      required final int notificationTypeId,
      required final bool isSelected}) = _$ToggleNotificationImpl;

  int get typeLinkId;
  int get notificationTypeId;
  bool get isSelected;
  @JsonKey(ignore: true)
  _$$ToggleNotificationImplCopyWith<_$ToggleNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleSystemPermissionImplCopyWith<$Res> {
  factory _$$ToggleSystemPermissionImplCopyWith(
          _$ToggleSystemPermissionImpl value,
          $Res Function(_$ToggleSystemPermissionImpl) then) =
      __$$ToggleSystemPermissionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$ToggleSystemPermissionImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$ToggleSystemPermissionImpl>
    implements _$$ToggleSystemPermissionImplCopyWith<$Res> {
  __$$ToggleSystemPermissionImplCopyWithImpl(
      _$ToggleSystemPermissionImpl _value,
      $Res Function(_$ToggleSystemPermissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ToggleSystemPermissionImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleSystemPermissionImpl implements _ToggleSystemPermission {
  const _$ToggleSystemPermissionImpl({required this.value});

  @override
  final bool value;

  @override
  String toString() {
    return 'NotificationEvent.toggleSystemPermission(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSystemPermissionImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSystemPermissionImplCopyWith<_$ToggleSystemPermissionImpl>
      get copyWith => __$$ToggleSystemPermissionImplCopyWithImpl<
          _$ToggleSystemPermissionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int typeLinkId, int notificationTypeId, bool isSelected)
        toggleNotification,
    required TResult Function(bool value) toggleSystemPermission,
  }) {
    return toggleSystemPermission(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int typeLinkId, int notificationTypeId, bool isSelected)?
        toggleNotification,
    TResult? Function(bool value)? toggleSystemPermission,
  }) {
    return toggleSystemPermission?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int typeLinkId, int notificationTypeId, bool isSelected)?
        toggleNotification,
    TResult Function(bool value)? toggleSystemPermission,
    required TResult orElse(),
  }) {
    if (toggleSystemPermission != null) {
      return toggleSystemPermission(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ToggleNotification value) toggleNotification,
    required TResult Function(_ToggleSystemPermission value)
        toggleSystemPermission,
  }) {
    return toggleSystemPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ToggleNotification value)? toggleNotification,
    TResult? Function(_ToggleSystemPermission value)? toggleSystemPermission,
  }) {
    return toggleSystemPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ToggleNotification value)? toggleNotification,
    TResult Function(_ToggleSystemPermission value)? toggleSystemPermission,
    required TResult orElse(),
  }) {
    if (toggleSystemPermission != null) {
      return toggleSystemPermission(this);
    }
    return orElse();
  }
}

abstract class _ToggleSystemPermission implements NotificationEvent {
  const factory _ToggleSystemPermission({required final bool value}) =
      _$ToggleSystemPermissionImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$ToggleSystemPermissionImplCopyWith<_$ToggleSystemPermissionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
