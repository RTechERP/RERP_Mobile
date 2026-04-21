// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_plan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeekPlanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekPlanEventCopyWith<$Res> {
  factory $WeekPlanEventCopyWith(
          WeekPlanEvent value, $Res Function(WeekPlanEvent) then) =
      _$WeekPlanEventCopyWithImpl<$Res, WeekPlanEvent>;
}

/// @nodoc
class _$WeekPlanEventCopyWithImpl<$Res, $Val extends WeekPlanEvent>
    implements $WeekPlanEventCopyWith<$Res> {
  _$WeekPlanEventCopyWithImpl(this._value, this._then);

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
    extends _$WeekPlanEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.init()';
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
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
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
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements WeekPlanEvent {
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
    extends _$WeekPlanEventCopyWithImpl<$Res, _$RefreshImpl>
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
    return 'WeekPlanEvent.refresh()';
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
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
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
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements WeekPlanEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$SearchImpl(
      null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'WeekPlanEvent.search(keyword: $keyword)';
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
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
  }) {
    return search(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
  }) {
    return search?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
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
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements WeekPlanEvent {
  const factory _Search(final String keyword) = _$SearchImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
      _$ClearSearchImpl _value, $Res Function(_$ClearSearchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSearchImpl implements _ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.clearSearch()';
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
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
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
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements WeekPlanEvent {
  const factory _ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
abstract class _$$FilterByStatusImplCopyWith<$Res> {
  factory _$$FilterByStatusImplCopyWith(_$FilterByStatusImpl value,
          $Res Function(_$FilterByStatusImpl) then) =
      __$$FilterByStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$FilterByStatusImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$FilterByStatusImpl>
    implements _$$FilterByStatusImplCopyWith<$Res> {
  __$$FilterByStatusImplCopyWithImpl(
      _$FilterByStatusImpl _value, $Res Function(_$FilterByStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$FilterByStatusImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterByStatusImpl implements _FilterByStatus {
  const _$FilterByStatusImpl(this.status);

  @override
  final String status;

  @override
  String toString() {
    return 'WeekPlanEvent.filterByStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      __$$FilterByStatusImplCopyWithImpl<_$FilterByStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
  }) {
    return filterByStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
  }) {
    return filterByStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    required TResult orElse(),
  }) {
    if (filterByStatus != null) {
      return filterByStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
  }) {
    return filterByStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
  }) {
    return filterByStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    required TResult orElse(),
  }) {
    if (filterByStatus != null) {
      return filterByStatus(this);
    }
    return orElse();
  }
}

abstract class _FilterByStatus implements WeekPlanEvent {
  const factory _FilterByStatus(final String status) = _$FilterByStatusImpl;

  String get status;
  @JsonKey(ignore: true)
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearStatusFilterImplCopyWith<$Res> {
  factory _$$ClearStatusFilterImplCopyWith(_$ClearStatusFilterImpl value,
          $Res Function(_$ClearStatusFilterImpl) then) =
      __$$ClearStatusFilterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearStatusFilterImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$ClearStatusFilterImpl>
    implements _$$ClearStatusFilterImplCopyWith<$Res> {
  __$$ClearStatusFilterImplCopyWithImpl(_$ClearStatusFilterImpl _value,
      $Res Function(_$ClearStatusFilterImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearStatusFilterImpl implements _ClearStatusFilter {
  const _$ClearStatusFilterImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.clearStatusFilter()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearStatusFilterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
  }) {
    return clearStatusFilter();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
  }) {
    return clearStatusFilter?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    required TResult orElse(),
  }) {
    if (clearStatusFilter != null) {
      return clearStatusFilter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
  }) {
    return clearStatusFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
  }) {
    return clearStatusFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    required TResult orElse(),
  }) {
    if (clearStatusFilter != null) {
      return clearStatusFilter(this);
    }
    return orElse();
  }
}

abstract class _ClearStatusFilter implements WeekPlanEvent {
  const factory _ClearStatusFilter() = _$ClearStatusFilterImpl;
}

/// @nodoc
abstract class _$$ChangeDateRangeImplCopyWith<$Res> {
  factory _$$ChangeDateRangeImplCopyWith(_$ChangeDateRangeImpl value,
          $Res Function(_$ChangeDateRangeImpl) then) =
      __$$ChangeDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateStart, DateTime dateEnd});
}

/// @nodoc
class __$$ChangeDateRangeImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
    implements _$$ChangeDateRangeImplCopyWith<$Res> {
  __$$ChangeDateRangeImplCopyWithImpl(
      _$ChangeDateRangeImpl _value, $Res Function(_$ChangeDateRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
  }) {
    return _then(_$ChangeDateRangeImpl(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
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
    return 'WeekPlanEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
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
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements WeekPlanEvent {
  const factory _ChangeDateRange(
      {required final DateTime dateStart,
      required final DateTime dateEnd}) = _$ChangeDateRangeImpl;

  DateTime get dateStart;
  DateTime get dateEnd;
  @JsonKey(ignore: true)
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearDateFilterImplCopyWith<$Res> {
  factory _$$ClearDateFilterImplCopyWith(_$ClearDateFilterImpl value,
          $Res Function(_$ClearDateFilterImpl) then) =
      __$$ClearDateFilterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearDateFilterImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$ClearDateFilterImpl>
    implements _$$ClearDateFilterImplCopyWith<$Res> {
  __$$ClearDateFilterImplCopyWithImpl(
      _$ClearDateFilterImpl _value, $Res Function(_$ClearDateFilterImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearDateFilterImpl implements _ClearDateFilter {
  const _$ClearDateFilterImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.clearDateFilter()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearDateFilterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
  }) {
    return clearDateFilter();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
  }) {
    return clearDateFilter?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    required TResult orElse(),
  }) {
    if (clearDateFilter != null) {
      return clearDateFilter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
  }) {
    return clearDateFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
  }) {
    return clearDateFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    required TResult orElse(),
  }) {
    if (clearDateFilter != null) {
      return clearDateFilter(this);
    }
    return orElse();
  }
}

abstract class _ClearDateFilter implements WeekPlanEvent {
  const factory _ClearDateFilter() = _$ClearDateFilterImpl;
}

/// @nodoc
abstract class _$$CheckInImplCopyWith<$Res> {
  factory _$$CheckInImplCopyWith(
          _$CheckInImpl value, $Res Function(_$CheckInImpl) then) =
      __$$CheckInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int taskId});
}

/// @nodoc
class __$$CheckInImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$CheckInImpl>
    implements _$$CheckInImplCopyWith<$Res> {
  __$$CheckInImplCopyWithImpl(
      _$CheckInImpl _value, $Res Function(_$CheckInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$CheckInImpl(
      null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CheckInImpl implements _CheckIn {
  const _$CheckInImpl(this.taskId);

  @override
  final int taskId;

  @override
  String toString() {
    return 'WeekPlanEvent.checkIn(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInImplCopyWith<_$CheckInImpl> get copyWith =>
      __$$CheckInImplCopyWithImpl<_$CheckInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
  }) {
    return checkIn(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
  }) {
    return checkIn?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    required TResult orElse(),
  }) {
    if (checkIn != null) {
      return checkIn(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
  }) {
    return checkIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
  }) {
    return checkIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    required TResult orElse(),
  }) {
    if (checkIn != null) {
      return checkIn(this);
    }
    return orElse();
  }
}

abstract class _CheckIn implements WeekPlanEvent {
  const factory _CheckIn(final int taskId) = _$CheckInImpl;

  int get taskId;
  @JsonKey(ignore: true)
  _$$CheckInImplCopyWith<_$CheckInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
