// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_import_export_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HistoryImportExportEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? code) setWarehouseCode,
    required TResult Function() fetch,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(HistoryTypeFilter filter) changeTypeFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
    changeDateRange,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? code)? setWarehouseCode,
    TResult? Function()? fetch,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? code)? setWarehouseCode,
    TResult Function()? fetch,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ChangeTypeFilter value) changeTypeFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryImportExportEventCopyWith<$Res> {
  factory $HistoryImportExportEventCopyWith(
    HistoryImportExportEvent value,
    $Res Function(HistoryImportExportEvent) then,
  ) = _$HistoryImportExportEventCopyWithImpl<$Res, HistoryImportExportEvent>;
}

/// @nodoc
class _$HistoryImportExportEventCopyWithImpl<
  $Res,
  $Val extends HistoryImportExportEvent
>
    implements $HistoryImportExportEventCopyWith<$Res> {
  _$HistoryImportExportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetWarehouseCodeImplCopyWith<$Res> {
  factory _$$SetWarehouseCodeImplCopyWith(
    _$SetWarehouseCodeImpl value,
    $Res Function(_$SetWarehouseCodeImpl) then,
  ) = __$$SetWarehouseCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? code});
}

/// @nodoc
class __$$SetWarehouseCodeImplCopyWithImpl<$Res>
    extends _$HistoryImportExportEventCopyWithImpl<$Res, _$SetWarehouseCodeImpl>
    implements _$$SetWarehouseCodeImplCopyWith<$Res> {
  __$$SetWarehouseCodeImplCopyWithImpl(
    _$SetWarehouseCodeImpl _value,
    $Res Function(_$SetWarehouseCodeImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? code = freezed}) {
    return _then(
      _$SetWarehouseCodeImpl(
        freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SetWarehouseCodeImpl implements _SetWarehouseCode {
  const _$SetWarehouseCodeImpl(this.code);

  @override
  final String? code;

  @override
  String toString() {
    return 'HistoryImportExportEvent.setWarehouseCode(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetWarehouseCodeImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetWarehouseCodeImplCopyWith<_$SetWarehouseCodeImpl> get copyWith =>
      __$$SetWarehouseCodeImplCopyWithImpl<_$SetWarehouseCodeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? code) setWarehouseCode,
    required TResult Function() fetch,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(HistoryTypeFilter filter) changeTypeFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
    changeDateRange,
  }) {
    return setWarehouseCode(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? code)? setWarehouseCode,
    TResult? Function()? fetch,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
  }) {
    return setWarehouseCode?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? code)? setWarehouseCode,
    TResult Function()? fetch,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    required TResult orElse(),
  }) {
    if (setWarehouseCode != null) {
      return setWarehouseCode(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ChangeTypeFilter value) changeTypeFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
  }) {
    return setWarehouseCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
  }) {
    return setWarehouseCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    required TResult orElse(),
  }) {
    if (setWarehouseCode != null) {
      return setWarehouseCode(this);
    }
    return orElse();
  }
}

abstract class _SetWarehouseCode implements HistoryImportExportEvent {
  const factory _SetWarehouseCode(final String? code) = _$SetWarehouseCodeImpl;

  String? get code;
  @JsonKey(ignore: true)
  _$$SetWarehouseCodeImplCopyWith<_$SetWarehouseCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
    _$FetchImpl value,
    $Res Function(_$FetchImpl) then,
  ) = __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$HistoryImportExportEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
    _$FetchImpl _value,
    $Res Function(_$FetchImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'HistoryImportExportEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? code) setWarehouseCode,
    required TResult Function() fetch,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(HistoryTypeFilter filter) changeTypeFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
    changeDateRange,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? code)? setWarehouseCode,
    TResult? Function()? fetch,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? code)? setWarehouseCode,
    TResult Function()? fetch,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ChangeTypeFilter value) changeTypeFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements HistoryImportExportEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
    _$SearchImpl value,
    $Res Function(_$SearchImpl) then,
  ) = __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$HistoryImportExportEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
    _$SearchImpl _value,
    $Res Function(_$SearchImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? keyword = null}) {
    return _then(
      _$SearchImpl(
        null == keyword
            ? _value.keyword
            : keyword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'HistoryImportExportEvent.search(keyword: $keyword)';
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
    required TResult Function(String? code) setWarehouseCode,
    required TResult Function() fetch,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(HistoryTypeFilter filter) changeTypeFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
    changeDateRange,
  }) {
    return search(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? code)? setWarehouseCode,
    TResult? Function()? fetch,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
  }) {
    return search?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? code)? setWarehouseCode,
    TResult Function()? fetch,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
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
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ChangeTypeFilter value) changeTypeFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements HistoryImportExportEvent {
  const factory _Search(final String keyword) = _$SearchImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
    _$ClearSearchImpl value,
    $Res Function(_$ClearSearchImpl) then,
  ) = __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$HistoryImportExportEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
    _$ClearSearchImpl _value,
    $Res Function(_$ClearSearchImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$ClearSearchImpl implements _ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'HistoryImportExportEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? code) setWarehouseCode,
    required TResult Function() fetch,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(HistoryTypeFilter filter) changeTypeFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
    changeDateRange,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? code)? setWarehouseCode,
    TResult? Function()? fetch,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? code)? setWarehouseCode,
    TResult Function()? fetch,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ChangeTypeFilter value) changeTypeFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements HistoryImportExportEvent {
  const factory _ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
abstract class _$$ChangeTypeFilterImplCopyWith<$Res> {
  factory _$$ChangeTypeFilterImplCopyWith(
    _$ChangeTypeFilterImpl value,
    $Res Function(_$ChangeTypeFilterImpl) then,
  ) = __$$ChangeTypeFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({HistoryTypeFilter filter});
}

/// @nodoc
class __$$ChangeTypeFilterImplCopyWithImpl<$Res>
    extends _$HistoryImportExportEventCopyWithImpl<$Res, _$ChangeTypeFilterImpl>
    implements _$$ChangeTypeFilterImplCopyWith<$Res> {
  __$$ChangeTypeFilterImplCopyWithImpl(
    _$ChangeTypeFilterImpl _value,
    $Res Function(_$ChangeTypeFilterImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filter = null}) {
    return _then(
      _$ChangeTypeFilterImpl(
        null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as HistoryTypeFilter,
      ),
    );
  }
}

/// @nodoc

class _$ChangeTypeFilterImpl implements _ChangeTypeFilter {
  const _$ChangeTypeFilterImpl(this.filter);

  @override
  final HistoryTypeFilter filter;

  @override
  String toString() {
    return 'HistoryImportExportEvent.changeTypeFilter(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTypeFilterImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTypeFilterImplCopyWith<_$ChangeTypeFilterImpl> get copyWith =>
      __$$ChangeTypeFilterImplCopyWithImpl<_$ChangeTypeFilterImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? code) setWarehouseCode,
    required TResult Function() fetch,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(HistoryTypeFilter filter) changeTypeFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
    changeDateRange,
  }) {
    return changeTypeFilter(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? code)? setWarehouseCode,
    TResult? Function()? fetch,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
  }) {
    return changeTypeFilter?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? code)? setWarehouseCode,
    TResult Function()? fetch,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    required TResult orElse(),
  }) {
    if (changeTypeFilter != null) {
      return changeTypeFilter(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ChangeTypeFilter value) changeTypeFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
  }) {
    return changeTypeFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
  }) {
    return changeTypeFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    required TResult orElse(),
  }) {
    if (changeTypeFilter != null) {
      return changeTypeFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeTypeFilter implements HistoryImportExportEvent {
  const factory _ChangeTypeFilter(final HistoryTypeFilter filter) =
      _$ChangeTypeFilterImpl;

  HistoryTypeFilter get filter;
  @JsonKey(ignore: true)
  _$$ChangeTypeFilterImplCopyWith<_$ChangeTypeFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDateRangeImplCopyWith<$Res> {
  factory _$$ChangeDateRangeImplCopyWith(
    _$ChangeDateRangeImpl value,
    $Res Function(_$ChangeDateRangeImpl) then,
  ) = __$$ChangeDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateStart, DateTime dateEnd});
}

/// @nodoc
class __$$ChangeDateRangeImplCopyWithImpl<$Res>
    extends _$HistoryImportExportEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
    implements _$$ChangeDateRangeImplCopyWith<$Res> {
  __$$ChangeDateRangeImplCopyWithImpl(
    _$ChangeDateRangeImpl _value,
    $Res Function(_$ChangeDateRangeImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? dateStart = null, Object? dateEnd = null}) {
    return _then(
      _$ChangeDateRangeImpl(
        dateStart: null == dateStart
            ? _value.dateStart
            : dateStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        dateEnd: null == dateEnd
            ? _value.dateEnd
            : dateEnd // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$ChangeDateRangeImpl implements _ChangeDateRange {
  const _$ChangeDateRangeImpl({required this.dateStart, required this.dateEnd});

  @override
  final DateTime dateStart;
  @override
  final DateTime dateEnd;

  @override
  String toString() {
    return 'HistoryImportExportEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDateRangeImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateStart, dateEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      __$$ChangeDateRangeImplCopyWithImpl<_$ChangeDateRangeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? code) setWarehouseCode,
    required TResult Function() fetch,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(HistoryTypeFilter filter) changeTypeFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
    changeDateRange,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? code)? setWarehouseCode,
    TResult? Function()? fetch,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? code)? setWarehouseCode,
    TResult Function()? fetch,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(HistoryTypeFilter filter)? changeTypeFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(dateStart, dateEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ChangeTypeFilter value) changeTypeFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ChangeTypeFilter value)? changeTypeFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements HistoryImportExportEvent {
  const factory _ChangeDateRange({
    required final DateTime dateStart,
    required final DateTime dateEnd,
  }) = _$ChangeDateRangeImpl;

  DateTime get dateStart;
  DateTime get dateEnd;
  @JsonKey(ignore: true)
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
