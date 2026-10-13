// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_booking_guest_house_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApproveBookingGuestHouseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ApproveProjectFilterItem? project)
        changeProjectFilter,
    required TResult Function(ApproveEmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(int? status) changeStatusFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(ApproveEmployeeFilterItem? employee)?
        changeEmployeeFilter,
    TResult? Function(int? status)? changeStatusFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult Function(ApproveEmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(int? status)? changeStatusFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_ChangeStatusFilter value) changeStatusFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_ChangeStatusFilter value)? changeStatusFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_ChangeStatusFilter value)? changeStatusFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingGuestHouseEventCopyWith<$Res> {
  factory $ApproveBookingGuestHouseEventCopyWith(
          ApproveBookingGuestHouseEvent value,
          $Res Function(ApproveBookingGuestHouseEvent) then) =
      _$ApproveBookingGuestHouseEventCopyWithImpl<$Res,
          ApproveBookingGuestHouseEvent>;
}

/// @nodoc
class _$ApproveBookingGuestHouseEventCopyWithImpl<$Res,
        $Val extends ApproveBookingGuestHouseEvent>
    implements $ApproveBookingGuestHouseEventCopyWith<$Res> {
  _$ApproveBookingGuestHouseEventCopyWithImpl(this._value, this._then);

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
  $Res call({DateTime? dateStart, DateTime? dateEnd});
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$ApproveBookingGuestHouseEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
  }) {
    return _then(_$InitImpl(
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl({this.dateStart, this.dateEnd});

  @override
  final DateTime? dateStart;
  @override
  final DateTime? dateEnd;

  @override
  String toString() {
    return 'ApproveBookingGuestHouseEvent.init(dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateStart, dateEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      __$$InitImplCopyWithImpl<_$InitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ApproveProjectFilterItem? project)
        changeProjectFilter,
    required TResult Function(ApproveEmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(int? status) changeStatusFilter,
  }) {
    return init(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(ApproveEmployeeFilterItem? employee)?
        changeEmployeeFilter,
    TResult? Function(int? status)? changeStatusFilter,
  }) {
    return init?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult Function(ApproveEmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(int? status)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(dateStart, dateEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_ChangeStatusFilter value) changeStatusFilter,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_ChangeStatusFilter value)? changeStatusFilter,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_ChangeStatusFilter value)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements ApproveBookingGuestHouseEvent {
  const factory _Init({final DateTime? dateStart, final DateTime? dateEnd}) =
      _$InitImpl;

  DateTime? get dateStart;
  DateTime? get dateEnd;
  @JsonKey(ignore: true)
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$ApproveBookingGuestHouseEventCopyWithImpl<$Res,
        _$ChangeDateRangeImpl> implements _$$ChangeDateRangeImplCopyWith<$Res> {
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
    return 'ApproveBookingGuestHouseEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ApproveProjectFilterItem? project)
        changeProjectFilter,
    required TResult Function(ApproveEmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(int? status) changeStatusFilter,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(ApproveEmployeeFilterItem? employee)?
        changeEmployeeFilter,
    TResult? Function(int? status)? changeStatusFilter,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult Function(ApproveEmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(int? status)? changeStatusFilter,
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
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_ChangeStatusFilter value) changeStatusFilter,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_ChangeStatusFilter value)? changeStatusFilter,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_ChangeStatusFilter value)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements ApproveBookingGuestHouseEvent {
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
abstract class _$$ChangeFilterTextImplCopyWith<$Res> {
  factory _$$ChangeFilterTextImplCopyWith(_$ChangeFilterTextImpl value,
          $Res Function(_$ChangeFilterTextImpl) then) =
      __$$ChangeFilterTextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String filterText});
}

/// @nodoc
class __$$ChangeFilterTextImplCopyWithImpl<$Res>
    extends _$ApproveBookingGuestHouseEventCopyWithImpl<$Res,
        _$ChangeFilterTextImpl>
    implements _$$ChangeFilterTextImplCopyWith<$Res> {
  __$$ChangeFilterTextImplCopyWithImpl(_$ChangeFilterTextImpl _value,
      $Res Function(_$ChangeFilterTextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterText = null,
  }) {
    return _then(_$ChangeFilterTextImpl(
      filterText: null == filterText
          ? _value.filterText
          : filterText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeFilterTextImpl implements _ChangeFilterText {
  const _$ChangeFilterTextImpl({required this.filterText});

  @override
  final String filterText;

  @override
  String toString() {
    return 'ApproveBookingGuestHouseEvent.changeFilterText(filterText: $filterText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeFilterTextImpl &&
            (identical(other.filterText, filterText) ||
                other.filterText == filterText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeFilterTextImplCopyWith<_$ChangeFilterTextImpl> get copyWith =>
      __$$ChangeFilterTextImplCopyWithImpl<_$ChangeFilterTextImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ApproveProjectFilterItem? project)
        changeProjectFilter,
    required TResult Function(ApproveEmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(int? status) changeStatusFilter,
  }) {
    return changeFilterText(filterText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(ApproveEmployeeFilterItem? employee)?
        changeEmployeeFilter,
    TResult? Function(int? status)? changeStatusFilter,
  }) {
    return changeFilterText?.call(filterText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult Function(ApproveEmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(int? status)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (changeFilterText != null) {
      return changeFilterText(filterText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_ChangeStatusFilter value) changeStatusFilter,
  }) {
    return changeFilterText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_ChangeStatusFilter value)? changeStatusFilter,
  }) {
    return changeFilterText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_ChangeStatusFilter value)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (changeFilterText != null) {
      return changeFilterText(this);
    }
    return orElse();
  }
}

abstract class _ChangeFilterText implements ApproveBookingGuestHouseEvent {
  const factory _ChangeFilterText({required final String filterText}) =
      _$ChangeFilterTextImpl;

  String get filterText;
  @JsonKey(ignore: true)
  _$$ChangeFilterTextImplCopyWith<_$ChangeFilterTextImpl> get copyWith =>
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
    extends _$ApproveBookingGuestHouseEventCopyWithImpl<$Res, _$RefreshImpl>
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
    return 'ApproveBookingGuestHouseEvent.refresh()';
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
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ApproveProjectFilterItem? project)
        changeProjectFilter,
    required TResult Function(ApproveEmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(int? status) changeStatusFilter,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(ApproveEmployeeFilterItem? employee)?
        changeEmployeeFilter,
    TResult? Function(int? status)? changeStatusFilter,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult Function(ApproveEmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(int? status)? changeStatusFilter,
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
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_ChangeStatusFilter value) changeStatusFilter,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_ChangeStatusFilter value)? changeStatusFilter,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_ChangeStatusFilter value)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements ApproveBookingGuestHouseEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$LoadFiltersImplCopyWith<$Res> {
  factory _$$LoadFiltersImplCopyWith(
          _$LoadFiltersImpl value, $Res Function(_$LoadFiltersImpl) then) =
      __$$LoadFiltersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFiltersImplCopyWithImpl<$Res>
    extends _$ApproveBookingGuestHouseEventCopyWithImpl<$Res, _$LoadFiltersImpl>
    implements _$$LoadFiltersImplCopyWith<$Res> {
  __$$LoadFiltersImplCopyWithImpl(
      _$LoadFiltersImpl _value, $Res Function(_$LoadFiltersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadFiltersImpl implements _LoadFilters {
  const _$LoadFiltersImpl();

  @override
  String toString() {
    return 'ApproveBookingGuestHouseEvent.loadFilters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFiltersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ApproveProjectFilterItem? project)
        changeProjectFilter,
    required TResult Function(ApproveEmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(int? status) changeStatusFilter,
  }) {
    return loadFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(ApproveEmployeeFilterItem? employee)?
        changeEmployeeFilter,
    TResult? Function(int? status)? changeStatusFilter,
  }) {
    return loadFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult Function(ApproveEmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(int? status)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (loadFilters != null) {
      return loadFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_ChangeStatusFilter value) changeStatusFilter,
  }) {
    return loadFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_ChangeStatusFilter value)? changeStatusFilter,
  }) {
    return loadFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_ChangeStatusFilter value)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (loadFilters != null) {
      return loadFilters(this);
    }
    return orElse();
  }
}

abstract class _LoadFilters implements ApproveBookingGuestHouseEvent {
  const factory _LoadFilters() = _$LoadFiltersImpl;
}

/// @nodoc
abstract class _$$ChangeProjectFilterImplCopyWith<$Res> {
  factory _$$ChangeProjectFilterImplCopyWith(_$ChangeProjectFilterImpl value,
          $Res Function(_$ChangeProjectFilterImpl) then) =
      __$$ChangeProjectFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApproveProjectFilterItem? project});

  $ApproveProjectFilterItemCopyWith<$Res>? get project;
}

/// @nodoc
class __$$ChangeProjectFilterImplCopyWithImpl<$Res>
    extends _$ApproveBookingGuestHouseEventCopyWithImpl<$Res,
        _$ChangeProjectFilterImpl>
    implements _$$ChangeProjectFilterImplCopyWith<$Res> {
  __$$ChangeProjectFilterImplCopyWithImpl(_$ChangeProjectFilterImpl _value,
      $Res Function(_$ChangeProjectFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$ChangeProjectFilterImpl(
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ApproveProjectFilterItem?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ApproveProjectFilterItemCopyWith<$Res>? get project {
    if (_value.project == null) {
      return null;
    }

    return $ApproveProjectFilterItemCopyWith<$Res>(_value.project!, (value) {
      return _then(_value.copyWith(project: value));
    });
  }
}

/// @nodoc

class _$ChangeProjectFilterImpl implements _ChangeProjectFilter {
  const _$ChangeProjectFilterImpl({required this.project});

  @override
  final ApproveProjectFilterItem? project;

  @override
  String toString() {
    return 'ApproveBookingGuestHouseEvent.changeProjectFilter(project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeProjectFilterImpl &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeProjectFilterImplCopyWith<_$ChangeProjectFilterImpl> get copyWith =>
      __$$ChangeProjectFilterImplCopyWithImpl<_$ChangeProjectFilterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ApproveProjectFilterItem? project)
        changeProjectFilter,
    required TResult Function(ApproveEmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(int? status) changeStatusFilter,
  }) {
    return changeProjectFilter(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(ApproveEmployeeFilterItem? employee)?
        changeEmployeeFilter,
    TResult? Function(int? status)? changeStatusFilter,
  }) {
    return changeProjectFilter?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult Function(ApproveEmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(int? status)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (changeProjectFilter != null) {
      return changeProjectFilter(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_ChangeStatusFilter value) changeStatusFilter,
  }) {
    return changeProjectFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_ChangeStatusFilter value)? changeStatusFilter,
  }) {
    return changeProjectFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_ChangeStatusFilter value)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (changeProjectFilter != null) {
      return changeProjectFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeProjectFilter implements ApproveBookingGuestHouseEvent {
  const factory _ChangeProjectFilter(
          {required final ApproveProjectFilterItem? project}) =
      _$ChangeProjectFilterImpl;

  ApproveProjectFilterItem? get project;
  @JsonKey(ignore: true)
  _$$ChangeProjectFilterImplCopyWith<_$ChangeProjectFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeEmployeeFilterImplCopyWith<$Res> {
  factory _$$ChangeEmployeeFilterImplCopyWith(_$ChangeEmployeeFilterImpl value,
          $Res Function(_$ChangeEmployeeFilterImpl) then) =
      __$$ChangeEmployeeFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApproveEmployeeFilterItem? employee});

  $ApproveEmployeeFilterItemCopyWith<$Res>? get employee;
}

/// @nodoc
class __$$ChangeEmployeeFilterImplCopyWithImpl<$Res>
    extends _$ApproveBookingGuestHouseEventCopyWithImpl<$Res,
        _$ChangeEmployeeFilterImpl>
    implements _$$ChangeEmployeeFilterImplCopyWith<$Res> {
  __$$ChangeEmployeeFilterImplCopyWithImpl(_$ChangeEmployeeFilterImpl _value,
      $Res Function(_$ChangeEmployeeFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employee = freezed,
  }) {
    return _then(_$ChangeEmployeeFilterImpl(
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as ApproveEmployeeFilterItem?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ApproveEmployeeFilterItemCopyWith<$Res>? get employee {
    if (_value.employee == null) {
      return null;
    }

    return $ApproveEmployeeFilterItemCopyWith<$Res>(_value.employee!, (value) {
      return _then(_value.copyWith(employee: value));
    });
  }
}

/// @nodoc

class _$ChangeEmployeeFilterImpl implements _ChangeEmployeeFilter {
  const _$ChangeEmployeeFilterImpl({required this.employee});

  @override
  final ApproveEmployeeFilterItem? employee;

  @override
  String toString() {
    return 'ApproveBookingGuestHouseEvent.changeEmployeeFilter(employee: $employee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeEmployeeFilterImpl &&
            (identical(other.employee, employee) ||
                other.employee == employee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeEmployeeFilterImplCopyWith<_$ChangeEmployeeFilterImpl>
      get copyWith =>
          __$$ChangeEmployeeFilterImplCopyWithImpl<_$ChangeEmployeeFilterImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ApproveProjectFilterItem? project)
        changeProjectFilter,
    required TResult Function(ApproveEmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(int? status) changeStatusFilter,
  }) {
    return changeEmployeeFilter(employee);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(ApproveEmployeeFilterItem? employee)?
        changeEmployeeFilter,
    TResult? Function(int? status)? changeStatusFilter,
  }) {
    return changeEmployeeFilter?.call(employee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult Function(ApproveEmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(int? status)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (changeEmployeeFilter != null) {
      return changeEmployeeFilter(employee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_ChangeStatusFilter value) changeStatusFilter,
  }) {
    return changeEmployeeFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_ChangeStatusFilter value)? changeStatusFilter,
  }) {
    return changeEmployeeFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_ChangeStatusFilter value)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (changeEmployeeFilter != null) {
      return changeEmployeeFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeEmployeeFilter implements ApproveBookingGuestHouseEvent {
  const factory _ChangeEmployeeFilter(
          {required final ApproveEmployeeFilterItem? employee}) =
      _$ChangeEmployeeFilterImpl;

  ApproveEmployeeFilterItem? get employee;
  @JsonKey(ignore: true)
  _$$ChangeEmployeeFilterImplCopyWith<_$ChangeEmployeeFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeStatusFilterImplCopyWith<$Res> {
  factory _$$ChangeStatusFilterImplCopyWith(_$ChangeStatusFilterImpl value,
          $Res Function(_$ChangeStatusFilterImpl) then) =
      __$$ChangeStatusFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? status});
}

/// @nodoc
class __$$ChangeStatusFilterImplCopyWithImpl<$Res>
    extends _$ApproveBookingGuestHouseEventCopyWithImpl<$Res,
        _$ChangeStatusFilterImpl>
    implements _$$ChangeStatusFilterImplCopyWith<$Res> {
  __$$ChangeStatusFilterImplCopyWithImpl(_$ChangeStatusFilterImpl _value,
      $Res Function(_$ChangeStatusFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$ChangeStatusFilterImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ChangeStatusFilterImpl implements _ChangeStatusFilter {
  const _$ChangeStatusFilterImpl({required this.status});

  @override
  final int? status;

  @override
  String toString() {
    return 'ApproveBookingGuestHouseEvent.changeStatusFilter(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStatusFilterImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeStatusFilterImplCopyWith<_$ChangeStatusFilterImpl> get copyWith =>
      __$$ChangeStatusFilterImplCopyWithImpl<_$ChangeStatusFilterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ApproveProjectFilterItem? project)
        changeProjectFilter,
    required TResult Function(ApproveEmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(int? status) changeStatusFilter,
  }) {
    return changeStatusFilter(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(ApproveEmployeeFilterItem? employee)?
        changeEmployeeFilter,
    TResult? Function(int? status)? changeStatusFilter,
  }) {
    return changeStatusFilter?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ApproveProjectFilterItem? project)? changeProjectFilter,
    TResult Function(ApproveEmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(int? status)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (changeStatusFilter != null) {
      return changeStatusFilter(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_ChangeStatusFilter value) changeStatusFilter,
  }) {
    return changeStatusFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_ChangeStatusFilter value)? changeStatusFilter,
  }) {
    return changeStatusFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_ChangeStatusFilter value)? changeStatusFilter,
    required TResult orElse(),
  }) {
    if (changeStatusFilter != null) {
      return changeStatusFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeStatusFilter implements ApproveBookingGuestHouseEvent {
  const factory _ChangeStatusFilter({required final int? status}) =
      _$ChangeStatusFilterImpl;

  int? get status;
  @JsonKey(ignore: true)
  _$$ChangeStatusFilterImplCopyWith<_$ChangeStatusFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
