// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LeaveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function() fetchApprovers,
    required TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)
        submit,
    required TResult Function(int approvedTP, List<LeaveAddSlip> slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(
            int id,
            int type,
            int approvedTP,
            DateTime dateStart,
            DateTime dateEnd,
            int timeRegister,
            String reason)
        onEditSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function()? fetchApprovers,
    TResult? Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult? Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function()? fetchApprovers,
    TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_FetchApprovers value) fetchApprovers,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_FetchApprovers value)? fetchApprovers,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_FetchApprovers value)? fetchApprovers,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveEventCopyWith<$Res> {
  factory $LeaveEventCopyWith(
          LeaveEvent value, $Res Function(LeaveEvent) then) =
      _$LeaveEventCopyWithImpl<$Res, LeaveEvent>;
}

/// @nodoc
class _$LeaveEventCopyWithImpl<$Res, $Val extends LeaveEvent>
    implements $LeaveEventCopyWith<$Res> {
  _$LeaveEventCopyWithImpl(this._value, this._then);

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
    extends _$LeaveEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'LeaveEvent.init()';
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
    required TResult Function() initAdd,
    required TResult Function() fetchApprovers,
    required TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)
        submit,
    required TResult Function(int approvedTP, List<LeaveAddSlip> slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(
            int id,
            int type,
            int approvedTP,
            DateTime dateStart,
            DateTime dateEnd,
            int timeRegister,
            String reason)
        onEditSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function()? fetchApprovers,
    TResult? Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult? Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function()? fetchApprovers,
    TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
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
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_FetchApprovers value) fetchApprovers,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_FetchApprovers value)? fetchApprovers,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_FetchApprovers value)? fetchApprovers,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements LeaveEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$InitAddImplCopyWith<$Res> {
  factory _$$InitAddImplCopyWith(
          _$InitAddImpl value, $Res Function(_$InitAddImpl) then) =
      __$$InitAddImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitAddImplCopyWithImpl<$Res>
    extends _$LeaveEventCopyWithImpl<$Res, _$InitAddImpl>
    implements _$$InitAddImplCopyWith<$Res> {
  __$$InitAddImplCopyWithImpl(
      _$InitAddImpl _value, $Res Function(_$InitAddImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitAddImpl implements _InitAdd {
  const _$InitAddImpl();

  @override
  String toString() {
    return 'LeaveEvent.initAdd()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitAddImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function() fetchApprovers,
    required TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)
        submit,
    required TResult Function(int approvedTP, List<LeaveAddSlip> slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(
            int id,
            int type,
            int approvedTP,
            DateTime dateStart,
            DateTime dateEnd,
            int timeRegister,
            String reason)
        onEditSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
  }) {
    return initAdd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function()? fetchApprovers,
    TResult? Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult? Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
  }) {
    return initAdd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function()? fetchApprovers,
    TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) {
    if (initAdd != null) {
      return initAdd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_FetchApprovers value) fetchApprovers,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return initAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_FetchApprovers value)? fetchApprovers,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return initAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_FetchApprovers value)? fetchApprovers,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (initAdd != null) {
      return initAdd(this);
    }
    return orElse();
  }
}

abstract class _InitAdd implements LeaveEvent {
  const factory _InitAdd() = _$InitAddImpl;
}

/// @nodoc
abstract class _$$FetchApproversImplCopyWith<$Res> {
  factory _$$FetchApproversImplCopyWith(_$FetchApproversImpl value,
          $Res Function(_$FetchApproversImpl) then) =
      __$$FetchApproversImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchApproversImplCopyWithImpl<$Res>
    extends _$LeaveEventCopyWithImpl<$Res, _$FetchApproversImpl>
    implements _$$FetchApproversImplCopyWith<$Res> {
  __$$FetchApproversImplCopyWithImpl(
      _$FetchApproversImpl _value, $Res Function(_$FetchApproversImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchApproversImpl implements _FetchApprovers {
  const _$FetchApproversImpl();

  @override
  String toString() {
    return 'LeaveEvent.fetchApprovers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchApproversImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function() fetchApprovers,
    required TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)
        submit,
    required TResult Function(int approvedTP, List<LeaveAddSlip> slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(
            int id,
            int type,
            int approvedTP,
            DateTime dateStart,
            DateTime dateEnd,
            int timeRegister,
            String reason)
        onEditSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
  }) {
    return fetchApprovers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function()? fetchApprovers,
    TResult? Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult? Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
  }) {
    return fetchApprovers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function()? fetchApprovers,
    TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) {
    if (fetchApprovers != null) {
      return fetchApprovers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_FetchApprovers value) fetchApprovers,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return fetchApprovers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_FetchApprovers value)? fetchApprovers,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return fetchApprovers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_FetchApprovers value)? fetchApprovers,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (fetchApprovers != null) {
      return fetchApprovers(this);
    }
    return orElse();
  }
}

abstract class _FetchApprovers implements LeaveEvent {
  const factory _FetchApprovers() = _$FetchApproversImpl;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int type,
      int approvedTP,
      DateTime dateStart,
      DateTime dateEnd,
      int timeRegister,
      String reason});
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$LeaveEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? approvedTP = null,
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? timeRegister = null,
    Object? reason = null,
  }) {
    return _then(_$SubmitImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      approvedTP: null == approvedTP
          ? _value.approvedTP
          : approvedTP // ignore: cast_nullable_to_non_nullable
              as int,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeRegister: null == timeRegister
          ? _value.timeRegister
          : timeRegister // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl(
      {required this.type,
      required this.approvedTP,
      required this.dateStart,
      required this.dateEnd,
      required this.timeRegister,
      required this.reason});

  @override
  final int type;
  @override
  final int approvedTP;
  @override
  final DateTime dateStart;
  @override
  final DateTime dateEnd;
  @override
  final int timeRegister;
  @override
  final String reason;

  @override
  String toString() {
    return 'LeaveEvent.submit(type: $type, approvedTP: $approvedTP, dateStart: $dateStart, dateEnd: $dateEnd, timeRegister: $timeRegister, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.approvedTP, approvedTP) ||
                other.approvedTP == approvedTP) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.timeRegister, timeRegister) ||
                other.timeRegister == timeRegister) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, approvedTP, dateStart, dateEnd, timeRegister, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function() fetchApprovers,
    required TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)
        submit,
    required TResult Function(int approvedTP, List<LeaveAddSlip> slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(
            int id,
            int type,
            int approvedTP,
            DateTime dateStart,
            DateTime dateEnd,
            int timeRegister,
            String reason)
        onEditSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
  }) {
    return submit(type, approvedTP, dateStart, dateEnd, timeRegister, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function()? fetchApprovers,
    TResult? Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult? Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
  }) {
    return submit?.call(
        type, approvedTP, dateStart, dateEnd, timeRegister, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function()? fetchApprovers,
    TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(type, approvedTP, dateStart, dateEnd, timeRegister, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_FetchApprovers value) fetchApprovers,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_FetchApprovers value)? fetchApprovers,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_FetchApprovers value)? fetchApprovers,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements LeaveEvent {
  const factory _Submit(
      {required final int type,
      required final int approvedTP,
      required final DateTime dateStart,
      required final DateTime dateEnd,
      required final int timeRegister,
      required final String reason}) = _$SubmitImpl;

  int get type;
  int get approvedTP;
  DateTime get dateStart;
  DateTime get dateEnd;
  int get timeRegister;
  String get reason;
  @JsonKey(ignore: true)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitBatchImplCopyWith<$Res> {
  factory _$$SubmitBatchImplCopyWith(
          _$SubmitBatchImpl value, $Res Function(_$SubmitBatchImpl) then) =
      __$$SubmitBatchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int approvedTP, List<LeaveAddSlip> slips});
}

/// @nodoc
class __$$SubmitBatchImplCopyWithImpl<$Res>
    extends _$LeaveEventCopyWithImpl<$Res, _$SubmitBatchImpl>
    implements _$$SubmitBatchImplCopyWith<$Res> {
  __$$SubmitBatchImplCopyWithImpl(
      _$SubmitBatchImpl _value, $Res Function(_$SubmitBatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvedTP = null,
    Object? slips = null,
  }) {
    return _then(_$SubmitBatchImpl(
      approvedTP: null == approvedTP
          ? _value.approvedTP
          : approvedTP // ignore: cast_nullable_to_non_nullable
              as int,
      slips: null == slips
          ? _value._slips
          : slips // ignore: cast_nullable_to_non_nullable
              as List<LeaveAddSlip>,
    ));
  }
}

/// @nodoc

class _$SubmitBatchImpl implements _SubmitBatch {
  const _$SubmitBatchImpl(
      {required this.approvedTP, required final List<LeaveAddSlip> slips})
      : _slips = slips;

  @override
  final int approvedTP;
  final List<LeaveAddSlip> _slips;
  @override
  List<LeaveAddSlip> get slips {
    if (_slips is EqualUnmodifiableListView) return _slips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slips);
  }

  @override
  String toString() {
    return 'LeaveEvent.submitBatch(approvedTP: $approvedTP, slips: $slips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitBatchImpl &&
            (identical(other.approvedTP, approvedTP) ||
                other.approvedTP == approvedTP) &&
            const DeepCollectionEquality().equals(other._slips, _slips));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, approvedTP, const DeepCollectionEquality().hash(_slips));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitBatchImplCopyWith<_$SubmitBatchImpl> get copyWith =>
      __$$SubmitBatchImplCopyWithImpl<_$SubmitBatchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function() fetchApprovers,
    required TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)
        submit,
    required TResult Function(int approvedTP, List<LeaveAddSlip> slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(
            int id,
            int type,
            int approvedTP,
            DateTime dateStart,
            DateTime dateEnd,
            int timeRegister,
            String reason)
        onEditSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
  }) {
    return submitBatch(approvedTP, slips);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function()? fetchApprovers,
    TResult? Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult? Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
  }) {
    return submitBatch?.call(approvedTP, slips);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function()? fetchApprovers,
    TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) {
    if (submitBatch != null) {
      return submitBatch(approvedTP, slips);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_FetchApprovers value) fetchApprovers,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return submitBatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_FetchApprovers value)? fetchApprovers,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return submitBatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_FetchApprovers value)? fetchApprovers,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (submitBatch != null) {
      return submitBatch(this);
    }
    return orElse();
  }
}

abstract class _SubmitBatch implements LeaveEvent {
  const factory _SubmitBatch(
      {required final int approvedTP,
      required final List<LeaveAddSlip> slips}) = _$SubmitBatchImpl;

  int get approvedTP;
  List<LeaveAddSlip> get slips;
  @JsonKey(ignore: true)
  _$$SubmitBatchImplCopyWith<_$SubmitBatchImpl> get copyWith =>
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
    extends _$LeaveEventCopyWithImpl<$Res, _$OnCancelSubmitImpl>
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
    return 'LeaveEvent.onCancelSubmit(id: $id)';
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
    required TResult Function() initAdd,
    required TResult Function() fetchApprovers,
    required TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)
        submit,
    required TResult Function(int approvedTP, List<LeaveAddSlip> slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(
            int id,
            int type,
            int approvedTP,
            DateTime dateStart,
            DateTime dateEnd,
            int timeRegister,
            String reason)
        onEditSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
  }) {
    return onCancelSubmit(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function()? fetchApprovers,
    TResult? Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult? Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
  }) {
    return onCancelSubmit?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function()? fetchApprovers,
    TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
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
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_FetchApprovers value) fetchApprovers,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return onCancelSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_FetchApprovers value)? fetchApprovers,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return onCancelSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_FetchApprovers value)? fetchApprovers,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (onCancelSubmit != null) {
      return onCancelSubmit(this);
    }
    return orElse();
  }
}

abstract class _OnCancelSubmit implements LeaveEvent {
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
      {int id,
      int type,
      int approvedTP,
      DateTime dateStart,
      DateTime dateEnd,
      int timeRegister,
      String reason});
}

/// @nodoc
class __$$OnEditSubmitImplCopyWithImpl<$Res>
    extends _$LeaveEventCopyWithImpl<$Res, _$OnEditSubmitImpl>
    implements _$$OnEditSubmitImplCopyWith<$Res> {
  __$$OnEditSubmitImplCopyWithImpl(
      _$OnEditSubmitImpl _value, $Res Function(_$OnEditSubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? approvedTP = null,
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? timeRegister = null,
    Object? reason = null,
  }) {
    return _then(_$OnEditSubmitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      approvedTP: null == approvedTP
          ? _value.approvedTP
          : approvedTP // ignore: cast_nullable_to_non_nullable
              as int,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeRegister: null == timeRegister
          ? _value.timeRegister
          : timeRegister // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnEditSubmitImpl implements _OnEditSubmit {
  const _$OnEditSubmitImpl(
      {required this.id,
      required this.type,
      required this.approvedTP,
      required this.dateStart,
      required this.dateEnd,
      required this.timeRegister,
      required this.reason});

  @override
  final int id;
  @override
  final int type;
  @override
  final int approvedTP;
  @override
  final DateTime dateStart;
  @override
  final DateTime dateEnd;
  @override
  final int timeRegister;
  @override
  final String reason;

  @override
  String toString() {
    return 'LeaveEvent.onEditSubmit(id: $id, type: $type, approvedTP: $approvedTP, dateStart: $dateStart, dateEnd: $dateEnd, timeRegister: $timeRegister, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnEditSubmitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.approvedTP, approvedTP) ||
                other.approvedTP == approvedTP) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.timeRegister, timeRegister) ||
                other.timeRegister == timeRegister) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type, approvedTP, dateStart,
      dateEnd, timeRegister, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnEditSubmitImplCopyWith<_$OnEditSubmitImpl> get copyWith =>
      __$$OnEditSubmitImplCopyWithImpl<_$OnEditSubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function() fetchApprovers,
    required TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)
        submit,
    required TResult Function(int approvedTP, List<LeaveAddSlip> slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(
            int id,
            int type,
            int approvedTP,
            DateTime dateStart,
            DateTime dateEnd,
            int timeRegister,
            String reason)
        onEditSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
  }) {
    return onEditSubmit(
        id, type, approvedTP, dateStart, dateEnd, timeRegister, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function()? fetchApprovers,
    TResult? Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult? Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
  }) {
    return onEditSubmit?.call(
        id, type, approvedTP, dateStart, dateEnd, timeRegister, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function()? fetchApprovers,
    TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    required TResult orElse(),
  }) {
    if (onEditSubmit != null) {
      return onEditSubmit(
          id, type, approvedTP, dateStart, dateEnd, timeRegister, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_FetchApprovers value) fetchApprovers,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return onEditSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_FetchApprovers value)? fetchApprovers,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return onEditSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_FetchApprovers value)? fetchApprovers,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (onEditSubmit != null) {
      return onEditSubmit(this);
    }
    return orElse();
  }
}

abstract class _OnEditSubmit implements LeaveEvent {
  const factory _OnEditSubmit(
      {required final int id,
      required final int type,
      required final int approvedTP,
      required final DateTime dateStart,
      required final DateTime dateEnd,
      required final int timeRegister,
      required final String reason}) = _$OnEditSubmitImpl;

  int get id;
  int get type;
  int get approvedTP;
  DateTime get dateStart;
  DateTime get dateEnd;
  int get timeRegister;
  String get reason;
  @JsonKey(ignore: true)
  _$$OnEditSubmitImplCopyWith<_$OnEditSubmitImpl> get copyWith =>
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
    extends _$LeaveEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
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
    return 'LeaveEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function() initAdd,
    required TResult Function() fetchApprovers,
    required TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)
        submit,
    required TResult Function(int approvedTP, List<LeaveAddSlip> slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(
            int id,
            int type,
            int approvedTP,
            DateTime dateStart,
            DateTime dateEnd,
            int timeRegister,
            String reason)
        onEditSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function()? fetchApprovers,
    TResult? Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult? Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function()? fetchApprovers,
    TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
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
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_FetchApprovers value) fetchApprovers,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_FetchApprovers value)? fetchApprovers,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_FetchApprovers value)? fetchApprovers,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements LeaveEvent {
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
abstract class _$$ClearSubmitStateImplCopyWith<$Res> {
  factory _$$ClearSubmitStateImplCopyWith(_$ClearSubmitStateImpl value,
          $Res Function(_$ClearSubmitStateImpl) then) =
      __$$ClearSubmitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSubmitStateImplCopyWithImpl<$Res>
    extends _$LeaveEventCopyWithImpl<$Res, _$ClearSubmitStateImpl>
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
    return 'LeaveEvent.clearSubmitState()';
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
    required TResult Function() initAdd,
    required TResult Function() fetchApprovers,
    required TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)
        submit,
    required TResult Function(int approvedTP, List<LeaveAddSlip> slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(
            int id,
            int type,
            int approvedTP,
            DateTime dateStart,
            DateTime dateEnd,
            int timeRegister,
            String reason)
        onEditSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
  }) {
    return clearSubmitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function()? fetchApprovers,
    TResult? Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult? Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
  }) {
    return clearSubmitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function()? fetchApprovers,
    TResult Function(int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        submit,
    TResult Function(int approvedTP, List<LeaveAddSlip> slips)? submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(int id, int type, int approvedTP, DateTime dateStart,
            DateTime dateEnd, int timeRegister, String reason)?
        onEditSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
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
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_FetchApprovers value) fetchApprovers,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_OnEditSubmit value) onEditSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
  }) {
    return clearSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_FetchApprovers value)? fetchApprovers,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_OnEditSubmit value)? onEditSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
  }) {
    return clearSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_FetchApprovers value)? fetchApprovers,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_OnEditSubmit value)? onEditSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState(this);
    }
    return orElse();
  }
}

abstract class _ClearSubmitState implements LeaveEvent {
  const factory _ClearSubmitState() = _$ClearSubmitStateImpl;
}
