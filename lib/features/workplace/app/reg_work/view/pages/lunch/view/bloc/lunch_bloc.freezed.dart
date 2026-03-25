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
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)
        onEditSubmit,
    required TResult Function() clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
    TResult? Function()? clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Submit value) submit,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Submit value)? submit,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
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
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)
        onEditSubmit,
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
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
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
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
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
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Submit value)? submit,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
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
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)
        onEditSubmit,
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
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
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
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
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
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Submit value)? submit,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
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
abstract class _$$OnCancelSubmitImplCopyWith<$Res> {
  factory _$$OnCancelSubmitImplCopyWith(_$OnCancelSubmitImpl value,
          $Res Function(_$OnCancelSubmitImpl) then) =
      __$$OnCancelSubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$OnCancelSubmitImplCopyWithImpl<$Res>
    extends _$LunchEventCopyWithImpl<$Res, _$OnCancelSubmitImpl>
    implements _$$OnCancelSubmitImplCopyWith<$Res> {
  __$$OnCancelSubmitImplCopyWithImpl(
      _$OnCancelSubmitImpl _value, $Res Function(_$OnCancelSubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$OnCancelSubmitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnCancelSubmitImpl implements _OnCancelSubmit {
  const _$OnCancelSubmitImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'LunchEvent.onCancelSubmit(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnCancelSubmitImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnCancelSubmitImplCopyWith<_$OnCancelSubmitImpl> get copyWith =>
      __$$OnCancelSubmitImplCopyWithImpl<_$OnCancelSubmitImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)
        submit,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)
        onEditSubmit,
    required TResult Function() clearSubmitState,
  }) {
    return onCancelSubmit(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
    TResult? Function()? clearSubmitState,
  }) {
    return onCancelSubmit?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) {
    if (onCancelSubmit != null) {
      return onCancelSubmit(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Submit value) submit,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return onCancelSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return onCancelSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Submit value)? submit,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (onCancelSubmit != null) {
      return onCancelSubmit(this);
    }
    return orElse();
  }
}

abstract class _OnCancelSubmit implements LunchEvent {
  const factory _OnCancelSubmit({required final int id}) = _$OnCancelSubmitImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$OnCancelSubmitImplCopyWith<_$OnCancelSubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnEditSubmitImplCopyWith<$Res> {
  factory _$$OnEditSubmitImplCopyWith(
          _$OnEditSubmitImpl value, $Res Function(_$OnEditSubmitImpl) then) =
      __$$OnEditSubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id, int quantity, int location, String note, DateTime? dateOrder});
}

/// @nodoc
class __$$OnEditSubmitImplCopyWithImpl<$Res>
    extends _$LunchEventCopyWithImpl<$Res, _$OnEditSubmitImpl>
    implements _$$OnEditSubmitImplCopyWith<$Res> {
  __$$OnEditSubmitImplCopyWithImpl(
      _$OnEditSubmitImpl _value, $Res Function(_$OnEditSubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? location = null,
    Object? note = null,
    Object? dateOrder = freezed,
  }) {
    return _then(_$OnEditSubmitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$OnEditSubmitImpl implements _OnEditSubmit {
  const _$OnEditSubmitImpl(
      {required this.id,
      required this.quantity,
      required this.location,
      required this.note,
      this.dateOrder});

  @override
  final int id;
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
    return 'LunchEvent.onEditSubmit(id: $id, quantity: $quantity, location: $location, note: $note, dateOrder: $dateOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnEditSubmitImpl &&
            (identical(other.id, id) || other.id == id) &&
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
      Object.hash(runtimeType, id, quantity, location, note, dateOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnEditSubmitImplCopyWith<_$OnEditSubmitImpl> get copyWith =>
      __$$OnEditSubmitImplCopyWithImpl<_$OnEditSubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)
        submit,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)
        onEditSubmit,
    required TResult Function() clearSubmitState,
  }) {
    return onEditSubmit(id, quantity, location, note, dateOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
    TResult? Function()? clearSubmitState,
  }) {
    return onEditSubmit?.call(id, quantity, location, note, dateOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int quantity, int location, String note, DateTime? dateOrder)?
        submit,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) {
    if (onEditSubmit != null) {
      return onEditSubmit(id, quantity, location, note, dateOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Submit value) submit,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return onEditSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return onEditSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Submit value)? submit,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (onEditSubmit != null) {
      return onEditSubmit(this);
    }
    return orElse();
  }
}

abstract class _OnEditSubmit implements LunchEvent {
  const factory _OnEditSubmit(
      {required final int id,
      required final int quantity,
      required final int location,
      required final String note,
      final DateTime? dateOrder}) = _$OnEditSubmitImpl;

  int get id;
  int get quantity;
  int get location;
  String get note;
  DateTime? get dateOrder;
  @JsonKey(ignore: true)
  _$$OnEditSubmitImplCopyWith<_$OnEditSubmitImpl> get copyWith =>
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
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)
        onEditSubmit,
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
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
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
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int quantity, int location, String note,
            DateTime? dateOrder)?
        onEditSubmit,
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
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return clearSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return clearSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Submit value)? submit,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
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
