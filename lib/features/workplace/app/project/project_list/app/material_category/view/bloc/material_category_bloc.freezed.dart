// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialCategoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int projectId, int projectPartListVersionId, String? keyword)
        init,
    required TResult Function() refresh,
    required TResult Function(String? keyword) search,
    required TResult Function(String keyword) changeKeyword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int projectId, int projectPartListVersionId, String? keyword)?
        init,
    TResult? Function()? refresh,
    TResult? Function(String? keyword)? search,
    TResult? Function(String keyword)? changeKeyword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int projectId, int projectPartListVersionId, String? keyword)?
        init,
    TResult Function()? refresh,
    TResult Function(String? keyword)? search,
    TResult Function(String keyword)? changeKeyword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ChangeKeyword value) changeKeyword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialCategoryEventCopyWith<$Res> {
  factory $MaterialCategoryEventCopyWith(MaterialCategoryEvent value,
          $Res Function(MaterialCategoryEvent) then) =
      _$MaterialCategoryEventCopyWithImpl<$Res, MaterialCategoryEvent>;
}

/// @nodoc
class _$MaterialCategoryEventCopyWithImpl<$Res,
        $Val extends MaterialCategoryEvent>
    implements $MaterialCategoryEventCopyWith<$Res> {
  _$MaterialCategoryEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({int projectId, int projectPartListVersionId, String? keyword});
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$MaterialCategoryEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? projectPartListVersionId = null,
    Object? keyword = freezed,
  }) {
    return _then(_$InitImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      projectPartListVersionId: null == projectPartListVersionId
          ? _value.projectPartListVersionId
          : projectPartListVersionId // ignore: cast_nullable_to_non_nullable
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
  const _$InitImpl(
      {required this.projectId,
      required this.projectPartListVersionId,
      this.keyword});

  @override
  final int projectId;
  @override
  final int projectPartListVersionId;
  @override
  final String? keyword;

  @override
  String toString() {
    return 'MaterialCategoryEvent.init(projectId: $projectId, projectPartListVersionId: $projectPartListVersionId, keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(
                    other.projectPartListVersionId, projectPartListVersionId) ||
                other.projectPartListVersionId == projectPartListVersionId) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, projectId, projectPartListVersionId, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      __$$InitImplCopyWithImpl<_$InitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int projectId, int projectPartListVersionId, String? keyword)
        init,
    required TResult Function() refresh,
    required TResult Function(String? keyword) search,
    required TResult Function(String keyword) changeKeyword,
  }) {
    return init(projectId, projectPartListVersionId, keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int projectId, int projectPartListVersionId, String? keyword)?
        init,
    TResult? Function()? refresh,
    TResult? Function(String? keyword)? search,
    TResult? Function(String keyword)? changeKeyword,
  }) {
    return init?.call(projectId, projectPartListVersionId, keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int projectId, int projectPartListVersionId, String? keyword)?
        init,
    TResult Function()? refresh,
    TResult Function(String? keyword)? search,
    TResult Function(String keyword)? changeKeyword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(projectId, projectPartListVersionId, keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ChangeKeyword value) changeKeyword,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements MaterialCategoryEvent {
  const factory _Init(
      {required final int projectId,
      required final int projectPartListVersionId,
      final String? keyword}) = _$InitImpl;

  int get projectId;
  int get projectPartListVersionId;
  String? get keyword;
  @JsonKey(ignore: true)
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$MaterialCategoryEventCopyWithImpl<$Res, _$RefreshImpl>
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
    return 'MaterialCategoryEvent.refresh()';
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
    required TResult Function(
            int projectId, int projectPartListVersionId, String? keyword)
        init,
    required TResult Function() refresh,
    required TResult Function(String? keyword) search,
    required TResult Function(String keyword) changeKeyword,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int projectId, int projectPartListVersionId, String? keyword)?
        init,
    TResult? Function()? refresh,
    TResult? Function(String? keyword)? search,
    TResult? Function(String keyword)? changeKeyword,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int projectId, int projectPartListVersionId, String? keyword)?
        init,
    TResult Function()? refresh,
    TResult Function(String? keyword)? search,
    TResult Function(String keyword)? changeKeyword,
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
    required TResult Function(_Search value) search,
    required TResult Function(_ChangeKeyword value) changeKeyword,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements MaterialCategoryEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? keyword});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$MaterialCategoryEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
  }) {
    return _then(_$SearchImpl(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl({this.keyword});

  @override
  final String? keyword;

  @override
  String toString() {
    return 'MaterialCategoryEvent.search(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int projectId, int projectPartListVersionId, String? keyword)
        init,
    required TResult Function() refresh,
    required TResult Function(String? keyword) search,
    required TResult Function(String keyword) changeKeyword,
  }) {
    return search(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int projectId, int projectPartListVersionId, String? keyword)?
        init,
    TResult? Function()? refresh,
    TResult? Function(String? keyword)? search,
    TResult? Function(String keyword)? changeKeyword,
  }) {
    return search?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int projectId, int projectPartListVersionId, String? keyword)?
        init,
    TResult Function()? refresh,
    TResult Function(String? keyword)? search,
    TResult Function(String keyword)? changeKeyword,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ChangeKeyword value) changeKeyword,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements MaterialCategoryEvent {
  const factory _Search({final String? keyword}) = _$SearchImpl;

  String? get keyword;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeKeywordImplCopyWith<$Res> {
  factory _$$ChangeKeywordImplCopyWith(
          _$ChangeKeywordImpl value, $Res Function(_$ChangeKeywordImpl) then) =
      __$$ChangeKeywordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$ChangeKeywordImplCopyWithImpl<$Res>
    extends _$MaterialCategoryEventCopyWithImpl<$Res, _$ChangeKeywordImpl>
    implements _$$ChangeKeywordImplCopyWith<$Res> {
  __$$ChangeKeywordImplCopyWithImpl(
      _$ChangeKeywordImpl _value, $Res Function(_$ChangeKeywordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$ChangeKeywordImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeKeywordImpl implements _ChangeKeyword {
  const _$ChangeKeywordImpl({required this.keyword});

  @override
  final String keyword;

  @override
  String toString() {
    return 'MaterialCategoryEvent.changeKeyword(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeKeywordImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeKeywordImplCopyWith<_$ChangeKeywordImpl> get copyWith =>
      __$$ChangeKeywordImplCopyWithImpl<_$ChangeKeywordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int projectId, int projectPartListVersionId, String? keyword)
        init,
    required TResult Function() refresh,
    required TResult Function(String? keyword) search,
    required TResult Function(String keyword) changeKeyword,
  }) {
    return changeKeyword(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int projectId, int projectPartListVersionId, String? keyword)?
        init,
    TResult? Function()? refresh,
    TResult? Function(String? keyword)? search,
    TResult? Function(String keyword)? changeKeyword,
  }) {
    return changeKeyword?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int projectId, int projectPartListVersionId, String? keyword)?
        init,
    TResult Function()? refresh,
    TResult Function(String? keyword)? search,
    TResult Function(String keyword)? changeKeyword,
    required TResult orElse(),
  }) {
    if (changeKeyword != null) {
      return changeKeyword(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ChangeKeyword value) changeKeyword,
  }) {
    return changeKeyword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
  }) {
    return changeKeyword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    required TResult orElse(),
  }) {
    if (changeKeyword != null) {
      return changeKeyword(this);
    }
    return orElse();
  }
}

abstract class _ChangeKeyword implements MaterialCategoryEvent {
  const factory _ChangeKeyword({required final String keyword}) =
      _$ChangeKeywordImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$ChangeKeywordImplCopyWith<_$ChangeKeywordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
