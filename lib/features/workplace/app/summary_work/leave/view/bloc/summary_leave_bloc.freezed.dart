// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_leave_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SummaryLeaveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function() refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function()? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function()? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_Refresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_Refresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryLeaveEventCopyWith<$Res> {
  factory $SummaryLeaveEventCopyWith(
          SummaryLeaveEvent value, $Res Function(SummaryLeaveEvent) then) =
      _$SummaryLeaveEventCopyWithImpl<$Res, SummaryLeaveEvent>;
}

/// @nodoc
class _$SummaryLeaveEventCopyWithImpl<$Res, $Val extends SummaryLeaveEvent>
    implements $SummaryLeaveEventCopyWith<$Res> {
  _$SummaryLeaveEventCopyWithImpl(this._value, this._then);

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
    extends _$SummaryLeaveEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'SummaryLeaveEvent.init()';
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
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function() refresh,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function()? refresh,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function()? refresh,
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
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_Refresh value) refresh,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements SummaryLeaveEvent {
  const factory _Init() = _$InitImpl;
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
    extends _$SummaryLeaveEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
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
    return 'SummaryLeaveEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function() refresh,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function()? refresh,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function()? refresh,
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
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_Refresh value) refresh,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements SummaryLeaveEvent {
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
abstract class _$$ChangeKeywordImplCopyWith<$Res> {
  factory _$$ChangeKeywordImplCopyWith(
          _$ChangeKeywordImpl value, $Res Function(_$ChangeKeywordImpl) then) =
      __$$ChangeKeywordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$ChangeKeywordImplCopyWithImpl<$Res>
    extends _$SummaryLeaveEventCopyWithImpl<$Res, _$ChangeKeywordImpl>
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
    return 'SummaryLeaveEvent.changeKeyword(keyword: $keyword)';
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
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function() refresh,
  }) {
    return changeKeyword(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function()? refresh,
  }) {
    return changeKeyword?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function()? refresh,
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
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_Refresh value) refresh,
  }) {
    return changeKeyword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return changeKeyword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (changeKeyword != null) {
      return changeKeyword(this);
    }
    return orElse();
  }
}

abstract class _ChangeKeyword implements SummaryLeaveEvent {
  const factory _ChangeKeyword({required final String keyword}) =
      _$ChangeKeywordImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$ChangeKeywordImplCopyWith<_$ChangeKeywordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeFiltersImplCopyWith<$Res> {
  factory _$$ChangeFiltersImplCopyWith(
          _$ChangeFiltersImpl value, $Res Function(_$ChangeFiltersImpl) then) =
      __$$ChangeFiltersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? departmentId, int? status});
}

/// @nodoc
class __$$ChangeFiltersImplCopyWithImpl<$Res>
    extends _$SummaryLeaveEventCopyWithImpl<$Res, _$ChangeFiltersImpl>
    implements _$$ChangeFiltersImplCopyWith<$Res> {
  __$$ChangeFiltersImplCopyWithImpl(
      _$ChangeFiltersImpl _value, $Res Function(_$ChangeFiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departmentId = freezed,
    Object? status = freezed,
  }) {
    return _then(_$ChangeFiltersImpl(
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ChangeFiltersImpl implements _ChangeFilters {
  const _$ChangeFiltersImpl({this.departmentId, this.status});

  @override
  final int? departmentId;
  @override
  final int? status;

  @override
  String toString() {
    return 'SummaryLeaveEvent.changeFilters(departmentId: $departmentId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeFiltersImpl &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, departmentId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeFiltersImplCopyWith<_$ChangeFiltersImpl> get copyWith =>
      __$$ChangeFiltersImplCopyWithImpl<_$ChangeFiltersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function() refresh,
  }) {
    return changeFilters(departmentId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function()? refresh,
  }) {
    return changeFilters?.call(departmentId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (changeFilters != null) {
      return changeFilters(departmentId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_Refresh value) refresh,
  }) {
    return changeFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return changeFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (changeFilters != null) {
      return changeFilters(this);
    }
    return orElse();
  }
}

abstract class _ChangeFilters implements SummaryLeaveEvent {
  const factory _ChangeFilters({final int? departmentId, final int? status}) =
      _$ChangeFiltersImpl;

  int? get departmentId;
  int? get status;
  @JsonKey(ignore: true)
  _$$ChangeFiltersImplCopyWith<_$ChangeFiltersImpl> get copyWith =>
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
    extends _$SummaryLeaveEventCopyWithImpl<$Res, _$RefreshImpl>
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
    return 'SummaryLeaveEvent.refresh()';
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
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function()? refresh,
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
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements SummaryLeaveEvent {
  const factory _Refresh() = _$RefreshImpl;
}
