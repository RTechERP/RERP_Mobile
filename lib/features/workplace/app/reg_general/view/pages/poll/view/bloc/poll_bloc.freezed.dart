// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PollEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(PollItem item) initDetail,
    required TResult Function() refreshDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(PollItem item)? initDetail,
    TResult? Function()? refreshDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(PollItem item)? initDetail,
    TResult Function()? refreshDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_RefreshDetail value) refreshDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_RefreshDetail value)? refreshDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_RefreshDetail value)? refreshDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollEventCopyWith<$Res> {
  factory $PollEventCopyWith(PollEvent value, $Res Function(PollEvent) then) =
      _$PollEventCopyWithImpl<$Res, PollEvent>;
}

/// @nodoc
class _$PollEventCopyWithImpl<$Res, $Val extends PollEvent>
    implements $PollEventCopyWith<$Res> {
  _$PollEventCopyWithImpl(this._value, this._then);

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
    extends _$PollEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'PollEvent.init()';
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
    required TResult Function() refresh,
    required TResult Function(PollItem item) initDetail,
    required TResult Function() refreshDetail,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(PollItem item)? initDetail,
    TResult? Function()? refreshDetail,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(PollItem item)? initDetail,
    TResult Function()? refreshDetail,
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
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_RefreshDetail value) refreshDetail,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_RefreshDetail value)? refreshDetail,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_RefreshDetail value)? refreshDetail,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements PollEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$PollEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'PollEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(PollItem item) initDetail,
    required TResult Function() refreshDetail,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(PollItem item)? initDetail,
    TResult? Function()? refreshDetail,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(PollItem item)? initDetail,
    TResult Function()? refreshDetail,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_RefreshDetail value) refreshDetail,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_RefreshDetail value)? refreshDetail,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_RefreshDetail value)? refreshDetail,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements PollEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$InitDetailImplCopyWith<$Res> {
  factory _$$InitDetailImplCopyWith(
          _$InitDetailImpl value, $Res Function(_$InitDetailImpl) then) =
      __$$InitDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PollItem item});

  $PollItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$InitDetailImplCopyWithImpl<$Res>
    extends _$PollEventCopyWithImpl<$Res, _$InitDetailImpl>
    implements _$$InitDetailImplCopyWith<$Res> {
  __$$InitDetailImplCopyWithImpl(
      _$InitDetailImpl _value, $Res Function(_$InitDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$InitDetailImpl(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PollItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PollItemCopyWith<$Res> get item {
    return $PollItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$InitDetailImpl implements _InitDetail {
  const _$InitDetailImpl(this.item);

  @override
  final PollItem item;

  @override
  String toString() {
    return 'PollEvent.initDetail(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitDetailImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitDetailImplCopyWith<_$InitDetailImpl> get copyWith =>
      __$$InitDetailImplCopyWithImpl<_$InitDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(PollItem item) initDetail,
    required TResult Function() refreshDetail,
  }) {
    return initDetail(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(PollItem item)? initDetail,
    TResult? Function()? refreshDetail,
  }) {
    return initDetail?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(PollItem item)? initDetail,
    TResult Function()? refreshDetail,
    required TResult orElse(),
  }) {
    if (initDetail != null) {
      return initDetail(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_RefreshDetail value) refreshDetail,
  }) {
    return initDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_RefreshDetail value)? refreshDetail,
  }) {
    return initDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_RefreshDetail value)? refreshDetail,
    required TResult orElse(),
  }) {
    if (initDetail != null) {
      return initDetail(this);
    }
    return orElse();
  }
}

abstract class _InitDetail implements PollEvent {
  const factory _InitDetail(final PollItem item) = _$InitDetailImpl;

  PollItem get item;
  @JsonKey(ignore: true)
  _$$InitDetailImplCopyWith<_$InitDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshDetailImplCopyWith<$Res> {
  factory _$$RefreshDetailImplCopyWith(
          _$RefreshDetailImpl value, $Res Function(_$RefreshDetailImpl) then) =
      __$$RefreshDetailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshDetailImplCopyWithImpl<$Res>
    extends _$PollEventCopyWithImpl<$Res, _$RefreshDetailImpl>
    implements _$$RefreshDetailImplCopyWith<$Res> {
  __$$RefreshDetailImplCopyWithImpl(
      _$RefreshDetailImpl _value, $Res Function(_$RefreshDetailImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshDetailImpl implements _RefreshDetail {
  const _$RefreshDetailImpl();

  @override
  String toString() {
    return 'PollEvent.refreshDetail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshDetailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(PollItem item) initDetail,
    required TResult Function() refreshDetail,
  }) {
    return refreshDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(PollItem item)? initDetail,
    TResult? Function()? refreshDetail,
  }) {
    return refreshDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(PollItem item)? initDetail,
    TResult Function()? refreshDetail,
    required TResult orElse(),
  }) {
    if (refreshDetail != null) {
      return refreshDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_RefreshDetail value) refreshDetail,
  }) {
    return refreshDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_RefreshDetail value)? refreshDetail,
  }) {
    return refreshDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_RefreshDetail value)? refreshDetail,
    required TResult orElse(),
  }) {
    if (refreshDetail != null) {
      return refreshDetail(this);
    }
    return orElse();
  }
}

abstract class _RefreshDetail implements PollEvent {
  const factory _RefreshDetail() = _$RefreshDetailImpl;
}
