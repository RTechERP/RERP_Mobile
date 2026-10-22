// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PersonalSummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function() loadEmployees,
    required TResult Function(int? employeeId) selectEmployee,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function()? loadEmployees,
    TResult? Function(int? employeeId)? selectEmployee,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function()? loadEmployees,
    TResult Function(int? employeeId)? selectEmployee,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadEmployees value) loadEmployees,
    required TResult Function(_SelectEmployee value) selectEmployee,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadEmployees value)? loadEmployees,
    TResult? Function(_SelectEmployee value)? selectEmployee,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadEmployees value)? loadEmployees,
    TResult Function(_SelectEmployee value)? selectEmployee,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalSummaryEventCopyWith<$Res> {
  factory $PersonalSummaryEventCopyWith(PersonalSummaryEvent value,
          $Res Function(PersonalSummaryEvent) then) =
      _$PersonalSummaryEventCopyWithImpl<$Res, PersonalSummaryEvent>;
}

/// @nodoc
class _$PersonalSummaryEventCopyWithImpl<$Res,
        $Val extends PersonalSummaryEvent>
    implements $PersonalSummaryEventCopyWith<$Res> {
  _$PersonalSummaryEventCopyWithImpl(this._value, this._then);

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
    extends _$PersonalSummaryEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'PersonalSummaryEvent.init()';
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
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function() loadEmployees,
    required TResult Function(int? employeeId) selectEmployee,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function()? loadEmployees,
    TResult? Function(int? employeeId)? selectEmployee,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function()? loadEmployees,
    TResult Function(int? employeeId)? selectEmployee,
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
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadEmployees value) loadEmployees,
    required TResult Function(_SelectEmployee value) selectEmployee,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadEmployees value)? loadEmployees,
    TResult? Function(_SelectEmployee value)? selectEmployee,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadEmployees value)? loadEmployees,
    TResult Function(_SelectEmployee value)? selectEmployee,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements PersonalSummaryEvent {
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
    extends _$PersonalSummaryEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
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
    return 'PersonalSummaryEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function() loadEmployees,
    required TResult Function(int? employeeId) selectEmployee,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function()? loadEmployees,
    TResult? Function(int? employeeId)? selectEmployee,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function()? loadEmployees,
    TResult Function(int? employeeId)? selectEmployee,
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
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadEmployees value) loadEmployees,
    required TResult Function(_SelectEmployee value) selectEmployee,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadEmployees value)? loadEmployees,
    TResult? Function(_SelectEmployee value)? selectEmployee,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadEmployees value)? loadEmployees,
    TResult Function(_SelectEmployee value)? selectEmployee,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements PersonalSummaryEvent {
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
abstract class _$$ChangeFiltersImplCopyWith<$Res> {
  factory _$$ChangeFiltersImplCopyWith(
          _$ChangeFiltersImpl value, $Res Function(_$ChangeFiltersImpl) then) =
      __$$ChangeFiltersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? departmentId, int? status});
}

/// @nodoc
class __$$ChangeFiltersImplCopyWithImpl<$Res>
    extends _$PersonalSummaryEventCopyWithImpl<$Res, _$ChangeFiltersImpl>
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
    return 'PersonalSummaryEvent.changeFilters(departmentId: $departmentId, status: $status)';
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
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function() loadEmployees,
    required TResult Function(int? employeeId) selectEmployee,
  }) {
    return changeFilters(departmentId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function()? loadEmployees,
    TResult? Function(int? employeeId)? selectEmployee,
  }) {
    return changeFilters?.call(departmentId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function()? loadEmployees,
    TResult Function(int? employeeId)? selectEmployee,
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
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadEmployees value) loadEmployees,
    required TResult Function(_SelectEmployee value) selectEmployee,
  }) {
    return changeFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadEmployees value)? loadEmployees,
    TResult? Function(_SelectEmployee value)? selectEmployee,
  }) {
    return changeFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadEmployees value)? loadEmployees,
    TResult Function(_SelectEmployee value)? selectEmployee,
    required TResult orElse(),
  }) {
    if (changeFilters != null) {
      return changeFilters(this);
    }
    return orElse();
  }
}

abstract class _ChangeFilters implements PersonalSummaryEvent {
  const factory _ChangeFilters({final int? departmentId, final int? status}) =
      _$ChangeFiltersImpl;

  int? get departmentId;
  int? get status;
  @JsonKey(ignore: true)
  _$$ChangeFiltersImplCopyWith<_$ChangeFiltersImpl> get copyWith =>
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
    extends _$PersonalSummaryEventCopyWithImpl<$Res, _$ChangeKeywordImpl>
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
    return 'PersonalSummaryEvent.changeKeyword(keyword: $keyword)';
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
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function() loadEmployees,
    required TResult Function(int? employeeId) selectEmployee,
  }) {
    return changeKeyword(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function()? loadEmployees,
    TResult? Function(int? employeeId)? selectEmployee,
  }) {
    return changeKeyword?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function()? loadEmployees,
    TResult Function(int? employeeId)? selectEmployee,
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
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadEmployees value) loadEmployees,
    required TResult Function(_SelectEmployee value) selectEmployee,
  }) {
    return changeKeyword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadEmployees value)? loadEmployees,
    TResult? Function(_SelectEmployee value)? selectEmployee,
  }) {
    return changeKeyword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadEmployees value)? loadEmployees,
    TResult Function(_SelectEmployee value)? selectEmployee,
    required TResult orElse(),
  }) {
    if (changeKeyword != null) {
      return changeKeyword(this);
    }
    return orElse();
  }
}

abstract class _ChangeKeyword implements PersonalSummaryEvent {
  const factory _ChangeKeyword({required final String keyword}) =
      _$ChangeKeywordImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$ChangeKeywordImplCopyWith<_$ChangeKeywordImpl> get copyWith =>
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
    extends _$PersonalSummaryEventCopyWithImpl<$Res, _$RefreshImpl>
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
    return 'PersonalSummaryEvent.refresh()';
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
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function() loadEmployees,
    required TResult Function(int? employeeId) selectEmployee,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function()? loadEmployees,
    TResult? Function(int? employeeId)? selectEmployee,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function()? loadEmployees,
    TResult Function(int? employeeId)? selectEmployee,
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
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadEmployees value) loadEmployees,
    required TResult Function(_SelectEmployee value) selectEmployee,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadEmployees value)? loadEmployees,
    TResult? Function(_SelectEmployee value)? selectEmployee,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadEmployees value)? loadEmployees,
    TResult Function(_SelectEmployee value)? selectEmployee,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements PersonalSummaryEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$LoadEmployeesImplCopyWith<$Res> {
  factory _$$LoadEmployeesImplCopyWith(
          _$LoadEmployeesImpl value, $Res Function(_$LoadEmployeesImpl) then) =
      __$$LoadEmployeesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadEmployeesImplCopyWithImpl<$Res>
    extends _$PersonalSummaryEventCopyWithImpl<$Res, _$LoadEmployeesImpl>
    implements _$$LoadEmployeesImplCopyWith<$Res> {
  __$$LoadEmployeesImplCopyWithImpl(
      _$LoadEmployeesImpl _value, $Res Function(_$LoadEmployeesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadEmployeesImpl implements _LoadEmployees {
  const _$LoadEmployeesImpl();

  @override
  String toString() {
    return 'PersonalSummaryEvent.loadEmployees()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadEmployeesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function() loadEmployees,
    required TResult Function(int? employeeId) selectEmployee,
  }) {
    return loadEmployees();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function()? loadEmployees,
    TResult? Function(int? employeeId)? selectEmployee,
  }) {
    return loadEmployees?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function()? loadEmployees,
    TResult Function(int? employeeId)? selectEmployee,
    required TResult orElse(),
  }) {
    if (loadEmployees != null) {
      return loadEmployees();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadEmployees value) loadEmployees,
    required TResult Function(_SelectEmployee value) selectEmployee,
  }) {
    return loadEmployees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadEmployees value)? loadEmployees,
    TResult? Function(_SelectEmployee value)? selectEmployee,
  }) {
    return loadEmployees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadEmployees value)? loadEmployees,
    TResult Function(_SelectEmployee value)? selectEmployee,
    required TResult orElse(),
  }) {
    if (loadEmployees != null) {
      return loadEmployees(this);
    }
    return orElse();
  }
}

abstract class _LoadEmployees implements PersonalSummaryEvent {
  const factory _LoadEmployees() = _$LoadEmployeesImpl;
}

/// @nodoc
abstract class _$$SelectEmployeeImplCopyWith<$Res> {
  factory _$$SelectEmployeeImplCopyWith(_$SelectEmployeeImpl value,
          $Res Function(_$SelectEmployeeImpl) then) =
      __$$SelectEmployeeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? employeeId});
}

/// @nodoc
class __$$SelectEmployeeImplCopyWithImpl<$Res>
    extends _$PersonalSummaryEventCopyWithImpl<$Res, _$SelectEmployeeImpl>
    implements _$$SelectEmployeeImplCopyWith<$Res> {
  __$$SelectEmployeeImplCopyWithImpl(
      _$SelectEmployeeImpl _value, $Res Function(_$SelectEmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
  }) {
    return _then(_$SelectEmployeeImpl(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectEmployeeImpl implements _SelectEmployee {
  const _$SelectEmployeeImpl({this.employeeId});

  @override
  final int? employeeId;

  @override
  String toString() {
    return 'PersonalSummaryEvent.selectEmployee(employeeId: $employeeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectEmployeeImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employeeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectEmployeeImplCopyWith<_$SelectEmployeeImpl> get copyWith =>
      __$$SelectEmployeeImplCopyWithImpl<_$SelectEmployeeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int? departmentId, int? status) changeFilters,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function() loadEmployees,
    required TResult Function(int? employeeId) selectEmployee,
  }) {
    return selectEmployee(employeeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int? departmentId, int? status)? changeFilters,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function()? loadEmployees,
    TResult? Function(int? employeeId)? selectEmployee,
  }) {
    return selectEmployee?.call(employeeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int? departmentId, int? status)? changeFilters,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function()? loadEmployees,
    TResult Function(int? employeeId)? selectEmployee,
    required TResult orElse(),
  }) {
    if (selectEmployee != null) {
      return selectEmployee(employeeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilters value) changeFilters,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadEmployees value) loadEmployees,
    required TResult Function(_SelectEmployee value) selectEmployee,
  }) {
    return selectEmployee(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilters value)? changeFilters,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadEmployees value)? loadEmployees,
    TResult? Function(_SelectEmployee value)? selectEmployee,
  }) {
    return selectEmployee?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilters value)? changeFilters,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadEmployees value)? loadEmployees,
    TResult Function(_SelectEmployee value)? selectEmployee,
    required TResult orElse(),
  }) {
    if (selectEmployee != null) {
      return selectEmployee(this);
    }
    return orElse();
  }
}

abstract class _SelectEmployee implements PersonalSummaryEvent {
  const factory _SelectEmployee({final int? employeeId}) = _$SelectEmployeeImpl;

  int? get employeeId;
  @JsonKey(ignore: true)
  _$$SelectEmployeeImplCopyWith<_$SelectEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
