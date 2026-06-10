// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'newsfeed_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsfeedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function() loadCalendar,
    required TResult Function(int month, int year) changeCalendarMonth,
    required TResult Function() refreshCalendar,
    required TResult Function(NewsletterItem item) loadNewsfeedDetail,
    required TResult Function() clearNewsfeedDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function()? loadCalendar,
    TResult? Function(int month, int year)? changeCalendarMonth,
    TResult? Function()? refreshCalendar,
    TResult? Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult? Function()? clearNewsfeedDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function()? loadCalendar,
    TResult Function(int month, int year)? changeCalendarMonth,
    TResult Function()? refreshCalendar,
    TResult Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult Function()? clearNewsfeedDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadCalendar value) loadCalendar,
    required TResult Function(_ChangeCalendarMonth value) changeCalendarMonth,
    required TResult Function(_RefreshCalendar value) refreshCalendar,
    required TResult Function(_LoadNewsfeedDetail value) loadNewsfeedDetail,
    required TResult Function(_ClearNewsfeedDetail value) clearNewsfeedDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadCalendar value)? loadCalendar,
    TResult? Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult? Function(_RefreshCalendar value)? refreshCalendar,
    TResult? Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult? Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadCalendar value)? loadCalendar,
    TResult Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult Function(_RefreshCalendar value)? refreshCalendar,
    TResult Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsfeedEventCopyWith<$Res> {
  factory $NewsfeedEventCopyWith(
          NewsfeedEvent value, $Res Function(NewsfeedEvent) then) =
      _$NewsfeedEventCopyWithImpl<$Res, NewsfeedEvent>;
}

/// @nodoc
class _$NewsfeedEventCopyWithImpl<$Res, $Val extends NewsfeedEvent>
    implements $NewsfeedEventCopyWith<$Res> {
  _$NewsfeedEventCopyWithImpl(this._value, this._then);

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
    extends _$NewsfeedEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'NewsfeedEvent.init()';
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
    required TResult Function() loadCalendar,
    required TResult Function(int month, int year) changeCalendarMonth,
    required TResult Function() refreshCalendar,
    required TResult Function(NewsletterItem item) loadNewsfeedDetail,
    required TResult Function() clearNewsfeedDetail,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function()? loadCalendar,
    TResult? Function(int month, int year)? changeCalendarMonth,
    TResult? Function()? refreshCalendar,
    TResult? Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult? Function()? clearNewsfeedDetail,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function()? loadCalendar,
    TResult Function(int month, int year)? changeCalendarMonth,
    TResult Function()? refreshCalendar,
    TResult Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult Function()? clearNewsfeedDetail,
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
    required TResult Function(_LoadCalendar value) loadCalendar,
    required TResult Function(_ChangeCalendarMonth value) changeCalendarMonth,
    required TResult Function(_RefreshCalendar value) refreshCalendar,
    required TResult Function(_LoadNewsfeedDetail value) loadNewsfeedDetail,
    required TResult Function(_ClearNewsfeedDetail value) clearNewsfeedDetail,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadCalendar value)? loadCalendar,
    TResult? Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult? Function(_RefreshCalendar value)? refreshCalendar,
    TResult? Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult? Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadCalendar value)? loadCalendar,
    TResult Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult Function(_RefreshCalendar value)? refreshCalendar,
    TResult Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements NewsfeedEvent {
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
    extends _$NewsfeedEventCopyWithImpl<$Res, _$RefreshImpl>
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
    return 'NewsfeedEvent.refresh()';
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
    required TResult Function() loadCalendar,
    required TResult Function(int month, int year) changeCalendarMonth,
    required TResult Function() refreshCalendar,
    required TResult Function(NewsletterItem item) loadNewsfeedDetail,
    required TResult Function() clearNewsfeedDetail,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function()? loadCalendar,
    TResult? Function(int month, int year)? changeCalendarMonth,
    TResult? Function()? refreshCalendar,
    TResult? Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult? Function()? clearNewsfeedDetail,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function()? loadCalendar,
    TResult Function(int month, int year)? changeCalendarMonth,
    TResult Function()? refreshCalendar,
    TResult Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult Function()? clearNewsfeedDetail,
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
    required TResult Function(_LoadCalendar value) loadCalendar,
    required TResult Function(_ChangeCalendarMonth value) changeCalendarMonth,
    required TResult Function(_RefreshCalendar value) refreshCalendar,
    required TResult Function(_LoadNewsfeedDetail value) loadNewsfeedDetail,
    required TResult Function(_ClearNewsfeedDetail value) clearNewsfeedDetail,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadCalendar value)? loadCalendar,
    TResult? Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult? Function(_RefreshCalendar value)? refreshCalendar,
    TResult? Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult? Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadCalendar value)? loadCalendar,
    TResult Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult Function(_RefreshCalendar value)? refreshCalendar,
    TResult Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements NewsfeedEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$LoadCalendarImplCopyWith<$Res> {
  factory _$$LoadCalendarImplCopyWith(
          _$LoadCalendarImpl value, $Res Function(_$LoadCalendarImpl) then) =
      __$$LoadCalendarImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCalendarImplCopyWithImpl<$Res>
    extends _$NewsfeedEventCopyWithImpl<$Res, _$LoadCalendarImpl>
    implements _$$LoadCalendarImplCopyWith<$Res> {
  __$$LoadCalendarImplCopyWithImpl(
      _$LoadCalendarImpl _value, $Res Function(_$LoadCalendarImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadCalendarImpl implements _LoadCalendar {
  const _$LoadCalendarImpl();

  @override
  String toString() {
    return 'NewsfeedEvent.loadCalendar()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCalendarImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function() loadCalendar,
    required TResult Function(int month, int year) changeCalendarMonth,
    required TResult Function() refreshCalendar,
    required TResult Function(NewsletterItem item) loadNewsfeedDetail,
    required TResult Function() clearNewsfeedDetail,
  }) {
    return loadCalendar();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function()? loadCalendar,
    TResult? Function(int month, int year)? changeCalendarMonth,
    TResult? Function()? refreshCalendar,
    TResult? Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult? Function()? clearNewsfeedDetail,
  }) {
    return loadCalendar?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function()? loadCalendar,
    TResult Function(int month, int year)? changeCalendarMonth,
    TResult Function()? refreshCalendar,
    TResult Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult Function()? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (loadCalendar != null) {
      return loadCalendar();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadCalendar value) loadCalendar,
    required TResult Function(_ChangeCalendarMonth value) changeCalendarMonth,
    required TResult Function(_RefreshCalendar value) refreshCalendar,
    required TResult Function(_LoadNewsfeedDetail value) loadNewsfeedDetail,
    required TResult Function(_ClearNewsfeedDetail value) clearNewsfeedDetail,
  }) {
    return loadCalendar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadCalendar value)? loadCalendar,
    TResult? Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult? Function(_RefreshCalendar value)? refreshCalendar,
    TResult? Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult? Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
  }) {
    return loadCalendar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadCalendar value)? loadCalendar,
    TResult Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult Function(_RefreshCalendar value)? refreshCalendar,
    TResult Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (loadCalendar != null) {
      return loadCalendar(this);
    }
    return orElse();
  }
}

abstract class _LoadCalendar implements NewsfeedEvent {
  const factory _LoadCalendar() = _$LoadCalendarImpl;
}

/// @nodoc
abstract class _$$ChangeCalendarMonthImplCopyWith<$Res> {
  factory _$$ChangeCalendarMonthImplCopyWith(_$ChangeCalendarMonthImpl value,
          $Res Function(_$ChangeCalendarMonthImpl) then) =
      __$$ChangeCalendarMonthImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int month, int year});
}

/// @nodoc
class __$$ChangeCalendarMonthImplCopyWithImpl<$Res>
    extends _$NewsfeedEventCopyWithImpl<$Res, _$ChangeCalendarMonthImpl>
    implements _$$ChangeCalendarMonthImplCopyWith<$Res> {
  __$$ChangeCalendarMonthImplCopyWithImpl(_$ChangeCalendarMonthImpl _value,
      $Res Function(_$ChangeCalendarMonthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
  }) {
    return _then(_$ChangeCalendarMonthImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeCalendarMonthImpl implements _ChangeCalendarMonth {
  const _$ChangeCalendarMonthImpl({required this.month, required this.year});

  @override
  final int month;
  @override
  final int year;

  @override
  String toString() {
    return 'NewsfeedEvent.changeCalendarMonth(month: $month, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCalendarMonthImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, year);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCalendarMonthImplCopyWith<_$ChangeCalendarMonthImpl> get copyWith =>
      __$$ChangeCalendarMonthImplCopyWithImpl<_$ChangeCalendarMonthImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function() loadCalendar,
    required TResult Function(int month, int year) changeCalendarMonth,
    required TResult Function() refreshCalendar,
    required TResult Function(NewsletterItem item) loadNewsfeedDetail,
    required TResult Function() clearNewsfeedDetail,
  }) {
    return changeCalendarMonth(month, year);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function()? loadCalendar,
    TResult? Function(int month, int year)? changeCalendarMonth,
    TResult? Function()? refreshCalendar,
    TResult? Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult? Function()? clearNewsfeedDetail,
  }) {
    return changeCalendarMonth?.call(month, year);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function()? loadCalendar,
    TResult Function(int month, int year)? changeCalendarMonth,
    TResult Function()? refreshCalendar,
    TResult Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult Function()? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (changeCalendarMonth != null) {
      return changeCalendarMonth(month, year);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadCalendar value) loadCalendar,
    required TResult Function(_ChangeCalendarMonth value) changeCalendarMonth,
    required TResult Function(_RefreshCalendar value) refreshCalendar,
    required TResult Function(_LoadNewsfeedDetail value) loadNewsfeedDetail,
    required TResult Function(_ClearNewsfeedDetail value) clearNewsfeedDetail,
  }) {
    return changeCalendarMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadCalendar value)? loadCalendar,
    TResult? Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult? Function(_RefreshCalendar value)? refreshCalendar,
    TResult? Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult? Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
  }) {
    return changeCalendarMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadCalendar value)? loadCalendar,
    TResult Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult Function(_RefreshCalendar value)? refreshCalendar,
    TResult Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (changeCalendarMonth != null) {
      return changeCalendarMonth(this);
    }
    return orElse();
  }
}

abstract class _ChangeCalendarMonth implements NewsfeedEvent {
  const factory _ChangeCalendarMonth(
      {required final int month,
      required final int year}) = _$ChangeCalendarMonthImpl;

  int get month;
  int get year;
  @JsonKey(ignore: true)
  _$$ChangeCalendarMonthImplCopyWith<_$ChangeCalendarMonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshCalendarImplCopyWith<$Res> {
  factory _$$RefreshCalendarImplCopyWith(_$RefreshCalendarImpl value,
          $Res Function(_$RefreshCalendarImpl) then) =
      __$$RefreshCalendarImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshCalendarImplCopyWithImpl<$Res>
    extends _$NewsfeedEventCopyWithImpl<$Res, _$RefreshCalendarImpl>
    implements _$$RefreshCalendarImplCopyWith<$Res> {
  __$$RefreshCalendarImplCopyWithImpl(
      _$RefreshCalendarImpl _value, $Res Function(_$RefreshCalendarImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshCalendarImpl implements _RefreshCalendar {
  const _$RefreshCalendarImpl();

  @override
  String toString() {
    return 'NewsfeedEvent.refreshCalendar()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshCalendarImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function() loadCalendar,
    required TResult Function(int month, int year) changeCalendarMonth,
    required TResult Function() refreshCalendar,
    required TResult Function(NewsletterItem item) loadNewsfeedDetail,
    required TResult Function() clearNewsfeedDetail,
  }) {
    return refreshCalendar();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function()? loadCalendar,
    TResult? Function(int month, int year)? changeCalendarMonth,
    TResult? Function()? refreshCalendar,
    TResult? Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult? Function()? clearNewsfeedDetail,
  }) {
    return refreshCalendar?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function()? loadCalendar,
    TResult Function(int month, int year)? changeCalendarMonth,
    TResult Function()? refreshCalendar,
    TResult Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult Function()? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (refreshCalendar != null) {
      return refreshCalendar();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadCalendar value) loadCalendar,
    required TResult Function(_ChangeCalendarMonth value) changeCalendarMonth,
    required TResult Function(_RefreshCalendar value) refreshCalendar,
    required TResult Function(_LoadNewsfeedDetail value) loadNewsfeedDetail,
    required TResult Function(_ClearNewsfeedDetail value) clearNewsfeedDetail,
  }) {
    return refreshCalendar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadCalendar value)? loadCalendar,
    TResult? Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult? Function(_RefreshCalendar value)? refreshCalendar,
    TResult? Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult? Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
  }) {
    return refreshCalendar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadCalendar value)? loadCalendar,
    TResult Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult Function(_RefreshCalendar value)? refreshCalendar,
    TResult Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (refreshCalendar != null) {
      return refreshCalendar(this);
    }
    return orElse();
  }
}

abstract class _RefreshCalendar implements NewsfeedEvent {
  const factory _RefreshCalendar() = _$RefreshCalendarImpl;
}

/// @nodoc
abstract class _$$LoadNewsfeedDetailImplCopyWith<$Res> {
  factory _$$LoadNewsfeedDetailImplCopyWith(_$LoadNewsfeedDetailImpl value,
          $Res Function(_$LoadNewsfeedDetailImpl) then) =
      __$$LoadNewsfeedDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NewsletterItem item});

  $NewsletterItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$LoadNewsfeedDetailImplCopyWithImpl<$Res>
    extends _$NewsfeedEventCopyWithImpl<$Res, _$LoadNewsfeedDetailImpl>
    implements _$$LoadNewsfeedDetailImplCopyWith<$Res> {
  __$$LoadNewsfeedDetailImplCopyWithImpl(_$LoadNewsfeedDetailImpl _value,
      $Res Function(_$LoadNewsfeedDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$LoadNewsfeedDetailImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as NewsletterItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NewsletterItemCopyWith<$Res> get item {
    return $NewsletterItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$LoadNewsfeedDetailImpl implements _LoadNewsfeedDetail {
  const _$LoadNewsfeedDetailImpl({required this.item});

  @override
  final NewsletterItem item;

  @override
  String toString() {
    return 'NewsfeedEvent.loadNewsfeedDetail(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadNewsfeedDetailImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadNewsfeedDetailImplCopyWith<_$LoadNewsfeedDetailImpl> get copyWith =>
      __$$LoadNewsfeedDetailImplCopyWithImpl<_$LoadNewsfeedDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function() loadCalendar,
    required TResult Function(int month, int year) changeCalendarMonth,
    required TResult Function() refreshCalendar,
    required TResult Function(NewsletterItem item) loadNewsfeedDetail,
    required TResult Function() clearNewsfeedDetail,
  }) {
    return loadNewsfeedDetail(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function()? loadCalendar,
    TResult? Function(int month, int year)? changeCalendarMonth,
    TResult? Function()? refreshCalendar,
    TResult? Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult? Function()? clearNewsfeedDetail,
  }) {
    return loadNewsfeedDetail?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function()? loadCalendar,
    TResult Function(int month, int year)? changeCalendarMonth,
    TResult Function()? refreshCalendar,
    TResult Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult Function()? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (loadNewsfeedDetail != null) {
      return loadNewsfeedDetail(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadCalendar value) loadCalendar,
    required TResult Function(_ChangeCalendarMonth value) changeCalendarMonth,
    required TResult Function(_RefreshCalendar value) refreshCalendar,
    required TResult Function(_LoadNewsfeedDetail value) loadNewsfeedDetail,
    required TResult Function(_ClearNewsfeedDetail value) clearNewsfeedDetail,
  }) {
    return loadNewsfeedDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadCalendar value)? loadCalendar,
    TResult? Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult? Function(_RefreshCalendar value)? refreshCalendar,
    TResult? Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult? Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
  }) {
    return loadNewsfeedDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadCalendar value)? loadCalendar,
    TResult Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult Function(_RefreshCalendar value)? refreshCalendar,
    TResult Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (loadNewsfeedDetail != null) {
      return loadNewsfeedDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadNewsfeedDetail implements NewsfeedEvent {
  const factory _LoadNewsfeedDetail({required final NewsletterItem item}) =
      _$LoadNewsfeedDetailImpl;

  NewsletterItem get item;
  @JsonKey(ignore: true)
  _$$LoadNewsfeedDetailImplCopyWith<_$LoadNewsfeedDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearNewsfeedDetailImplCopyWith<$Res> {
  factory _$$ClearNewsfeedDetailImplCopyWith(_$ClearNewsfeedDetailImpl value,
          $Res Function(_$ClearNewsfeedDetailImpl) then) =
      __$$ClearNewsfeedDetailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearNewsfeedDetailImplCopyWithImpl<$Res>
    extends _$NewsfeedEventCopyWithImpl<$Res, _$ClearNewsfeedDetailImpl>
    implements _$$ClearNewsfeedDetailImplCopyWith<$Res> {
  __$$ClearNewsfeedDetailImplCopyWithImpl(_$ClearNewsfeedDetailImpl _value,
      $Res Function(_$ClearNewsfeedDetailImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearNewsfeedDetailImpl implements _ClearNewsfeedDetail {
  const _$ClearNewsfeedDetailImpl();

  @override
  String toString() {
    return 'NewsfeedEvent.clearNewsfeedDetail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearNewsfeedDetailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function() loadCalendar,
    required TResult Function(int month, int year) changeCalendarMonth,
    required TResult Function() refreshCalendar,
    required TResult Function(NewsletterItem item) loadNewsfeedDetail,
    required TResult Function() clearNewsfeedDetail,
  }) {
    return clearNewsfeedDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function()? loadCalendar,
    TResult? Function(int month, int year)? changeCalendarMonth,
    TResult? Function()? refreshCalendar,
    TResult? Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult? Function()? clearNewsfeedDetail,
  }) {
    return clearNewsfeedDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function()? loadCalendar,
    TResult Function(int month, int year)? changeCalendarMonth,
    TResult Function()? refreshCalendar,
    TResult Function(NewsletterItem item)? loadNewsfeedDetail,
    TResult Function()? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (clearNewsfeedDetail != null) {
      return clearNewsfeedDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadCalendar value) loadCalendar,
    required TResult Function(_ChangeCalendarMonth value) changeCalendarMonth,
    required TResult Function(_RefreshCalendar value) refreshCalendar,
    required TResult Function(_LoadNewsfeedDetail value) loadNewsfeedDetail,
    required TResult Function(_ClearNewsfeedDetail value) clearNewsfeedDetail,
  }) {
    return clearNewsfeedDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadCalendar value)? loadCalendar,
    TResult? Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult? Function(_RefreshCalendar value)? refreshCalendar,
    TResult? Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult? Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
  }) {
    return clearNewsfeedDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadCalendar value)? loadCalendar,
    TResult Function(_ChangeCalendarMonth value)? changeCalendarMonth,
    TResult Function(_RefreshCalendar value)? refreshCalendar,
    TResult Function(_LoadNewsfeedDetail value)? loadNewsfeedDetail,
    TResult Function(_ClearNewsfeedDetail value)? clearNewsfeedDetail,
    required TResult orElse(),
  }) {
    if (clearNewsfeedDetail != null) {
      return clearNewsfeedDetail(this);
    }
    return orElse();
  }
}

abstract class _ClearNewsfeedDetail implements NewsfeedEvent {
  const factory _ClearNewsfeedDetail() = _$ClearNewsfeedDetailImpl;
}
