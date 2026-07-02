// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accountant_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountantEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountantEventCopyWith<$Res> {
  factory $AccountantEventCopyWith(
          AccountantEvent value, $Res Function(AccountantEvent) then) =
      _$AccountantEventCopyWithImpl<$Res, AccountantEvent>;
}

/// @nodoc
class _$AccountantEventCopyWithImpl<$Res, $Val extends AccountantEvent>
    implements $AccountantEventCopyWith<$Res> {
  _$AccountantEventCopyWithImpl(this._value, this._then);

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
    extends _$AccountantEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'AccountantEvent.init()';
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
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
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
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements AccountantEvent {
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
    extends _$AccountantEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
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
    return 'AccountantEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
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
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements AccountantEvent {
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
abstract class _$$SearchKeywordImplCopyWith<$Res> {
  factory _$$SearchKeywordImplCopyWith(
          _$SearchKeywordImpl value, $Res Function(_$SearchKeywordImpl) then) =
      __$$SearchKeywordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$SearchKeywordImplCopyWithImpl<$Res>
    extends _$AccountantEventCopyWithImpl<$Res, _$SearchKeywordImpl>
    implements _$$SearchKeywordImplCopyWith<$Res> {
  __$$SearchKeywordImplCopyWithImpl(
      _$SearchKeywordImpl _value, $Res Function(_$SearchKeywordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$SearchKeywordImpl(
      null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchKeywordImpl implements _SearchKeyword {
  const _$SearchKeywordImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'AccountantEvent.searchKeyword(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchKeywordImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchKeywordImplCopyWith<_$SearchKeywordImpl> get copyWith =>
      __$$SearchKeywordImplCopyWithImpl<_$SearchKeywordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return searchKeyword(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return searchKeyword?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (searchKeyword != null) {
      return searchKeyword(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return searchKeyword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return searchKeyword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (searchKeyword != null) {
      return searchKeyword(this);
    }
    return orElse();
  }
}

abstract class _SearchKeyword implements AccountantEvent {
  const factory _SearchKeyword(final String keyword) = _$SearchKeywordImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$SearchKeywordImplCopyWith<_$SearchKeywordImpl> get copyWith =>
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
    extends _$AccountantEventCopyWithImpl<$Res, _$RefreshImpl>
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
    return 'AccountantEvent.refresh()';
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
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
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
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements AccountantEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$ResetSubmitStatusImplCopyWith<$Res> {
  factory _$$ResetSubmitStatusImplCopyWith(_$ResetSubmitStatusImpl value,
          $Res Function(_$ResetSubmitStatusImpl) then) =
      __$$ResetSubmitStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetSubmitStatusImplCopyWithImpl<$Res>
    extends _$AccountantEventCopyWithImpl<$Res, _$ResetSubmitStatusImpl>
    implements _$$ResetSubmitStatusImplCopyWith<$Res> {
  __$$ResetSubmitStatusImplCopyWithImpl(_$ResetSubmitStatusImpl _value,
      $Res Function(_$ResetSubmitStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetSubmitStatusImpl implements _ResetSubmitStatus {
  const _$ResetSubmitStatusImpl();

  @override
  String toString() {
    return 'AccountantEvent.resetSubmitStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetSubmitStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return resetSubmitStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return resetSubmitStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (resetSubmitStatus != null) {
      return resetSubmitStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return resetSubmitStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return resetSubmitStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (resetSubmitStatus != null) {
      return resetSubmitStatus(this);
    }
    return orElse();
  }
}

abstract class _ResetSubmitStatus implements AccountantEvent {
  const factory _ResetSubmitStatus() = _$ResetSubmitStatusImpl;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? employeeId, List<AccountantSubmitItem> items});
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$AccountantEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? items = null,
  }) {
    return _then(_$SubmitImpl(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AccountantSubmitItem>,
    ));
  }
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl(
      {this.employeeId, required final List<AccountantSubmitItem> items})
      : _items = items;

  @override
  final int? employeeId;
  final List<AccountantSubmitItem> _items;
  @override
  List<AccountantSubmitItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AccountantEvent.submit(employeeId: $employeeId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, employeeId, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return submit(employeeId, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return submit?.call(employeeId, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(employeeId, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements AccountantEvent {
  const factory _Submit(
      {final int? employeeId,
      required final List<AccountantSubmitItem> items}) = _$SubmitImpl;

  int? get employeeId;
  List<AccountantSubmitItem> get items;
  @JsonKey(ignore: true)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteReportImplCopyWith<$Res> {
  factory _$$DeleteReportImplCopyWith(
          _$DeleteReportImpl value, $Res Function(_$DeleteReportImpl) then) =
      __$$DeleteReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteReportImplCopyWithImpl<$Res>
    extends _$AccountantEventCopyWithImpl<$Res, _$DeleteReportImpl>
    implements _$$DeleteReportImplCopyWith<$Res> {
  __$$DeleteReportImplCopyWithImpl(
      _$DeleteReportImpl _value, $Res Function(_$DeleteReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteReportImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteReportImpl implements _DeleteReport {
  const _$DeleteReportImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'AccountantEvent.deleteReport(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteReportImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteReportImplCopyWith<_$DeleteReportImpl> get copyWith =>
      __$$DeleteReportImplCopyWithImpl<_$DeleteReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return deleteReport(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return deleteReport?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (deleteReport != null) {
      return deleteReport(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return deleteReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return deleteReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (deleteReport != null) {
      return deleteReport(this);
    }
    return orElse();
  }
}

abstract class _DeleteReport implements AccountantEvent {
  const factory _DeleteReport(final int id) = _$DeleteReportImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteReportImplCopyWith<_$DeleteReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetDeleteStatusImplCopyWith<$Res> {
  factory _$$ResetDeleteStatusImplCopyWith(_$ResetDeleteStatusImpl value,
          $Res Function(_$ResetDeleteStatusImpl) then) =
      __$$ResetDeleteStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetDeleteStatusImplCopyWithImpl<$Res>
    extends _$AccountantEventCopyWithImpl<$Res, _$ResetDeleteStatusImpl>
    implements _$$ResetDeleteStatusImplCopyWith<$Res> {
  __$$ResetDeleteStatusImplCopyWithImpl(_$ResetDeleteStatusImpl _value,
      $Res Function(_$ResetDeleteStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetDeleteStatusImpl implements _ResetDeleteStatus {
  const _$ResetDeleteStatusImpl();

  @override
  String toString() {
    return 'AccountantEvent.resetDeleteStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetDeleteStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return resetDeleteStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return resetDeleteStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (resetDeleteStatus != null) {
      return resetDeleteStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return resetDeleteStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return resetDeleteStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (resetDeleteStatus != null) {
      return resetDeleteStatus(this);
    }
    return orElse();
  }
}

abstract class _ResetDeleteStatus implements AccountantEvent {
  const factory _ResetDeleteStatus() = _$ResetDeleteStatusImpl;
}

/// @nodoc
abstract class _$$GetByIdImplCopyWith<$Res> {
  factory _$$GetByIdImplCopyWith(
          _$GetByIdImpl value, $Res Function(_$GetByIdImpl) then) =
      __$$GetByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetByIdImplCopyWithImpl<$Res>
    extends _$AccountantEventCopyWithImpl<$Res, _$GetByIdImpl>
    implements _$$GetByIdImplCopyWith<$Res> {
  __$$GetByIdImplCopyWithImpl(
      _$GetByIdImpl _value, $Res Function(_$GetByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetByIdImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetByIdImpl implements _GetById {
  const _$GetByIdImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'AccountantEvent.getById(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetByIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetByIdImplCopyWith<_$GetByIdImpl> get copyWith =>
      __$$GetByIdImplCopyWithImpl<_$GetByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return getById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return getById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (getById != null) {
      return getById(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return getById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return getById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (getById != null) {
      return getById(this);
    }
    return orElse();
  }
}

abstract class _GetById implements AccountantEvent {
  const factory _GetById(final int id) = _$GetByIdImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$GetByIdImplCopyWith<_$GetByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetDetailStatusImplCopyWith<$Res> {
  factory _$$ResetDetailStatusImplCopyWith(_$ResetDetailStatusImpl value,
          $Res Function(_$ResetDetailStatusImpl) then) =
      __$$ResetDetailStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetDetailStatusImplCopyWithImpl<$Res>
    extends _$AccountantEventCopyWithImpl<$Res, _$ResetDetailStatusImpl>
    implements _$$ResetDetailStatusImplCopyWith<$Res> {
  __$$ResetDetailStatusImplCopyWithImpl(_$ResetDetailStatusImpl _value,
      $Res Function(_$ResetDetailStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetDetailStatusImpl implements _ResetDetailStatus {
  const _$ResetDetailStatusImpl();

  @override
  String toString() {
    return 'AccountantEvent.resetDetailStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetDetailStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return resetDetailStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return resetDetailStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (resetDetailStatus != null) {
      return resetDetailStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return resetDetailStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return resetDetailStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (resetDetailStatus != null) {
      return resetDetailStatus(this);
    }
    return orElse();
  }
}

abstract class _ResetDetailStatus implements AccountantEvent {
  const factory _ResetDetailStatus() = _$ResetDetailStatusImpl;
}

/// @nodoc
abstract class _$$UpdateReportImplCopyWith<$Res> {
  factory _$$UpdateReportImplCopyWith(
          _$UpdateReportImpl value, $Res Function(_$UpdateReportImpl) then) =
      __$$UpdateReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, int? employeeId, List<AccountantSubmitItem> items});
}

/// @nodoc
class __$$UpdateReportImplCopyWithImpl<$Res>
    extends _$AccountantEventCopyWithImpl<$Res, _$UpdateReportImpl>
    implements _$$UpdateReportImplCopyWith<$Res> {
  __$$UpdateReportImplCopyWithImpl(
      _$UpdateReportImpl _value, $Res Function(_$UpdateReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = freezed,
    Object? items = null,
  }) {
    return _then(_$UpdateReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AccountantSubmitItem>,
    ));
  }
}

/// @nodoc

class _$UpdateReportImpl implements _UpdateReport {
  const _$UpdateReportImpl(
      {required this.id,
      this.employeeId,
      required final List<AccountantSubmitItem> items})
      : _items = items;

  @override
  final int id;
  @override
  final int? employeeId;
  final List<AccountantSubmitItem> _items;
  @override
  List<AccountantSubmitItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AccountantEvent.updateReport(id: $id, employeeId: $employeeId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, employeeId, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateReportImplCopyWith<_$UpdateReportImpl> get copyWith =>
      __$$UpdateReportImplCopyWithImpl<_$UpdateReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return updateReport(id, employeeId, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return updateReport?.call(id, employeeId, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (updateReport != null) {
      return updateReport(id, employeeId, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return updateReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return updateReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (updateReport != null) {
      return updateReport(this);
    }
    return orElse();
  }
}

abstract class _UpdateReport implements AccountantEvent {
  const factory _UpdateReport(
      {required final int id,
      final int? employeeId,
      required final List<AccountantSubmitItem> items}) = _$UpdateReportImpl;

  int get id;
  int? get employeeId;
  List<AccountantSubmitItem> get items;
  @JsonKey(ignore: true)
  _$$UpdateReportImplCopyWith<_$UpdateReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetUpdateStatusImplCopyWith<$Res> {
  factory _$$ResetUpdateStatusImplCopyWith(_$ResetUpdateStatusImpl value,
          $Res Function(_$ResetUpdateStatusImpl) then) =
      __$$ResetUpdateStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetUpdateStatusImplCopyWithImpl<$Res>
    extends _$AccountantEventCopyWithImpl<$Res, _$ResetUpdateStatusImpl>
    implements _$$ResetUpdateStatusImplCopyWith<$Res> {
  __$$ResetUpdateStatusImplCopyWithImpl(_$ResetUpdateStatusImpl _value,
      $Res Function(_$ResetUpdateStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetUpdateStatusImpl implements _ResetUpdateStatus {
  const _$ResetUpdateStatusImpl();

  @override
  String toString() {
    return 'AccountantEvent.resetUpdateStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetUpdateStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) searchKeyword,
    required TResult Function() refresh,
    required TResult Function() resetSubmitStatus,
    required TResult Function(int? employeeId, List<AccountantSubmitItem> items)
        submit,
    required TResult Function(int id) deleteReport,
    required TResult Function() resetDeleteStatus,
    required TResult Function(int id) getById,
    required TResult Function() resetDetailStatus,
    required TResult Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)
        updateReport,
    required TResult Function() resetUpdateStatus,
  }) {
    return resetUpdateStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? searchKeyword,
    TResult? Function()? refresh,
    TResult? Function()? resetSubmitStatus,
    TResult? Function(int? employeeId, List<AccountantSubmitItem> items)?
        submit,
    TResult? Function(int id)? deleteReport,
    TResult? Function()? resetDeleteStatus,
    TResult? Function(int id)? getById,
    TResult? Function()? resetDetailStatus,
    TResult? Function(
            int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult? Function()? resetUpdateStatus,
  }) {
    return resetUpdateStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? searchKeyword,
    TResult Function()? refresh,
    TResult Function()? resetSubmitStatus,
    TResult Function(int? employeeId, List<AccountantSubmitItem> items)? submit,
    TResult Function(int id)? deleteReport,
    TResult Function()? resetDeleteStatus,
    TResult Function(int id)? getById,
    TResult Function()? resetDetailStatus,
    TResult Function(int id, int? employeeId, List<AccountantSubmitItem> items)?
        updateReport,
    TResult Function()? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (resetUpdateStatus != null) {
      return resetUpdateStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SearchKeyword value) searchKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ResetSubmitStatus value) resetSubmitStatus,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ResetDeleteStatus value) resetDeleteStatus,
    required TResult Function(_GetById value) getById,
    required TResult Function(_ResetDetailStatus value) resetDetailStatus,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_ResetUpdateStatus value) resetUpdateStatus,
  }) {
    return resetUpdateStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SearchKeyword value)? searchKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_ResetUpdateStatus value)? resetUpdateStatus,
  }) {
    return resetUpdateStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SearchKeyword value)? searchKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ResetSubmitStatus value)? resetSubmitStatus,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ResetDeleteStatus value)? resetDeleteStatus,
    TResult Function(_GetById value)? getById,
    TResult Function(_ResetDetailStatus value)? resetDetailStatus,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_ResetUpdateStatus value)? resetUpdateStatus,
    required TResult orElse(),
  }) {
    if (resetUpdateStatus != null) {
      return resetUpdateStatus(this);
    }
    return orElse();
  }
}

abstract class _ResetUpdateStatus implements AccountantEvent {
  const factory _ResetUpdateStatus() = _$ResetUpdateStatusImpl;
}
