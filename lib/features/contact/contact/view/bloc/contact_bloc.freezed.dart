// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactEvent {
  int get departmentID => throw _privateConstructorUsedError;
  String? get keyword => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int departmentID, String? keyword) init,
    required TResult Function(int departmentID, String? keyword) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int departmentID, String? keyword)? init,
    TResult? Function(int departmentID, String? keyword)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int departmentID, String? keyword)? init,
    TResult Function(int departmentID, String? keyword)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactEventCopyWith<ContactEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactEventCopyWith<$Res> {
  factory $ContactEventCopyWith(
          ContactEvent value, $Res Function(ContactEvent) then) =
      _$ContactEventCopyWithImpl<$Res, ContactEvent>;
  @useResult
  $Res call({int departmentID, String? keyword});
}

/// @nodoc
class _$ContactEventCopyWithImpl<$Res, $Val extends ContactEvent>
    implements $ContactEventCopyWith<$Res> {
  _$ContactEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departmentID = null,
    Object? keyword = freezed,
  }) {
    return _then(_value.copyWith(
      departmentID: null == departmentID
          ? _value.departmentID
          : departmentID // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res>
    implements $ContactEventCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int departmentID, String? keyword});
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$ContactEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departmentID = null,
    Object? keyword = freezed,
  }) {
    return _then(_$InitImpl(
      departmentID: null == departmentID
          ? _value.departmentID
          : departmentID // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl({this.departmentID = 0, this.keyword});

  @override
  @JsonKey()
  final int departmentID;
  @override
  final String? keyword;

  @override
  String toString() {
    return 'ContactEvent.init(departmentID: $departmentID, keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitImpl &&
            (identical(other.departmentID, departmentID) ||
                other.departmentID == departmentID) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, departmentID, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      __$$InitImplCopyWithImpl<_$InitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int departmentID, String? keyword) init,
    required TResult Function(int departmentID, String? keyword) refresh,
  }) {
    return init(departmentID, keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int departmentID, String? keyword)? init,
    TResult? Function(int departmentID, String? keyword)? refresh,
  }) {
    return init?.call(departmentID, keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int departmentID, String? keyword)? init,
    TResult Function(int departmentID, String? keyword)? refresh,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(departmentID, keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements ContactEvent {
  const factory _Init({final int departmentID, final String? keyword}) =
      _$InitImpl;

  @override
  int get departmentID;
  @override
  String? get keyword;
  @override
  @JsonKey(ignore: true)
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res>
    implements $ContactEventCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int departmentID, String? keyword});
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$ContactEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departmentID = null,
    Object? keyword = freezed,
  }) {
    return _then(_$RefreshImpl(
      departmentID: null == departmentID
          ? _value.departmentID
          : departmentID // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl({this.departmentID = 0, this.keyword});

  @override
  @JsonKey()
  final int departmentID;
  @override
  final String? keyword;

  @override
  String toString() {
    return 'ContactEvent.refresh(departmentID: $departmentID, keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshImpl &&
            (identical(other.departmentID, departmentID) ||
                other.departmentID == departmentID) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, departmentID, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      __$$RefreshImplCopyWithImpl<_$RefreshImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int departmentID, String? keyword) init,
    required TResult Function(int departmentID, String? keyword) refresh,
  }) {
    return refresh(departmentID, keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int departmentID, String? keyword)? init,
    TResult? Function(int departmentID, String? keyword)? refresh,
  }) {
    return refresh?.call(departmentID, keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int departmentID, String? keyword)? init,
    TResult Function(int departmentID, String? keyword)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(departmentID, keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements ContactEvent {
  const factory _Refresh({final int departmentID, final String? keyword}) =
      _$RefreshImpl;

  @override
  int get departmentID;
  @override
  String? get keyword;
  @override
  @JsonKey(ignore: true)
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
