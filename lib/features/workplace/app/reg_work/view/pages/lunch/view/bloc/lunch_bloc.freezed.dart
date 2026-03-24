// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lunch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LunchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)
        submit,
    required TResult Function() clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult? Function()? clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LunchEventCopyWith<$Res> {
  factory $LunchEventCopyWith(
          LunchEvent value, $Res Function(LunchEvent) then) =
      _$LunchEventCopyWithImpl<$Res, LunchEvent>;
}

/// @nodoc
class _$LunchEventCopyWithImpl<$Res, $Val extends LunchEvent>
    implements $LunchEventCopyWith<$Res> {
  _$LunchEventCopyWithImpl(this._value, this._then);

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
    extends _$LunchEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'LunchEvent.init()';
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
            int quantity, int location, String note, DateTime? dateOrder)
        submit,
    required TResult Function() clearSubmitState,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult? Function()? clearSubmitState,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult Function()? clearSubmitState,
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
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements LunchEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int quantity, int location, String note, DateTime? dateOrder});
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$LunchEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? location = null,
    Object? note = null,
    Object? dateOrder = freezed,
  }) {
    return _then(_$SubmitImpl(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      dateOrder: freezed == dateOrder
          ? _value.dateOrder
          : dateOrder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl(
      {required this.quantity,
      required this.location,
      required this.note,
      this.dateOrder});

  @override
  final int quantity;
  @override
  final int location;
  @override
  final String note;
  @override
  final DateTime? dateOrder;

  @override
  String toString() {
    return 'LunchEvent.submit(quantity: $quantity, location: $location, note: $note, dateOrder: $dateOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.dateOrder, dateOrder) ||
                other.dateOrder == dateOrder));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, quantity, location, note, dateOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)
        submit,
    required TResult Function() clearSubmitState,
  }) {
    return submit(quantity, location, note, dateOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult? Function()? clearSubmitState,
  }) {
    return submit?.call(quantity, location, note, dateOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(quantity, location, note, dateOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements LunchEvent {
  const factory _Submit(
      {required final int quantity,
      required final int location,
      required final String note,
      final DateTime? dateOrder}) = _$SubmitImpl;

  int get quantity;
  int get location;
  String get note;
  DateTime? get dateOrder;
  @JsonKey(ignore: true)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSubmitStateImplCopyWith<$Res> {
  factory _$$ClearSubmitStateImplCopyWith(_$ClearSubmitStateImpl value,
          $Res Function(_$ClearSubmitStateImpl) then) =
      __$$ClearSubmitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSubmitStateImplCopyWithImpl<$Res>
    extends _$LunchEventCopyWithImpl<$Res, _$ClearSubmitStateImpl>
    implements _$$ClearSubmitStateImplCopyWith<$Res> {
  __$$ClearSubmitStateImplCopyWithImpl(_$ClearSubmitStateImpl _value,
      $Res Function(_$ClearSubmitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSubmitStateImpl implements _ClearSubmitState {
  const _$ClearSubmitStateImpl();

  @override
  String toString() {
    return 'LunchEvent.clearSubmitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSubmitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)
        submit,
    required TResult Function() clearSubmitState,
  }) {
    return clearSubmitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult? Function()? clearSubmitState,
  }) {
    return clearSubmitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return clearSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return clearSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState(this);
    }
    return orElse();
  }
}

abstract class _ClearSubmitState implements LunchEvent {
  const factory _ClearSubmitState() = _$ClearSubmitStateImpl;
}
