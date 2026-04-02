// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overnight_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OvernightEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) fetchDetail,
    required TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)
        submitEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? fetchDetail,
    TResult? Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? fetchDetail,
    TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_FetchDetail value) fetchDetail,
    required TResult Function(_SubmitEdit value) submitEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_FetchDetail value)? fetchDetail,
    TResult? Function(_SubmitEdit value)? submitEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_FetchDetail value)? fetchDetail,
    TResult Function(_SubmitEdit value)? submitEdit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvernightEventCopyWith<$Res> {
  factory $OvernightEventCopyWith(
          OvernightEvent value, $Res Function(OvernightEvent) then) =
      _$OvernightEventCopyWithImpl<$Res, OvernightEvent>;
}

/// @nodoc
class _$OvernightEventCopyWithImpl<$Res, $Val extends OvernightEvent>
    implements $OvernightEventCopyWith<$Res> {
  _$OvernightEventCopyWithImpl(this._value, this._then);

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
    extends _$OvernightEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'OvernightEvent.init()';
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
    required TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) fetchDetail,
    required TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)
        submitEdit,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? fetchDetail,
    TResult? Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? fetchDetail,
    TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
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
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_FetchDetail value) fetchDetail,
    required TResult Function(_SubmitEdit value) submitEdit,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_FetchDetail value)? fetchDetail,
    TResult? Function(_SubmitEdit value)? submitEdit,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_FetchDetail value)? fetchDetail,
    TResult Function(_SubmitEdit value)? submitEdit,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements OvernightEvent {
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
    extends _$OvernightEventCopyWithImpl<$Res, _$InitAddImpl>
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
    return 'OvernightEvent.initAdd()';
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
    required TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) fetchDetail,
    required TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)
        submitEdit,
  }) {
    return initAdd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? fetchDetail,
    TResult? Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
  }) {
    return initAdd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? fetchDetail,
    TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
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
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_FetchDetail value) fetchDetail,
    required TResult Function(_SubmitEdit value) submitEdit,
  }) {
    return initAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_FetchDetail value)? fetchDetail,
    TResult? Function(_SubmitEdit value)? submitEdit,
  }) {
    return initAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_FetchDetail value)? fetchDetail,
    TResult Function(_SubmitEdit value)? submitEdit,
    required TResult orElse(),
  }) {
    if (initAdd != null) {
      return initAdd(this);
    }
    return orElse();
  }
}

abstract class _InitAdd implements OvernightEvent {
  const factory _InitAdd() = _$InitAddImpl;
}

/// @nodoc
abstract class _$$SubmitBatchImplCopyWith<$Res> {
  factory _$$SubmitBatchImplCopyWith(
          _$SubmitBatchImpl value, $Res Function(_$SubmitBatchImpl) then) =
      __$$SubmitBatchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int approvedId,
      DateTime dateRegister,
      bool isProblem,
      List<
              ({
                double breakHours,
                DateTime endTime,
                String location,
                String reason,
                DateTime timeStart
              })>
          slips});
}

/// @nodoc
class __$$SubmitBatchImplCopyWithImpl<$Res>
    extends _$OvernightEventCopyWithImpl<$Res, _$SubmitBatchImpl>
    implements _$$SubmitBatchImplCopyWith<$Res> {
  __$$SubmitBatchImplCopyWithImpl(
      _$SubmitBatchImpl _value, $Res Function(_$SubmitBatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvedId = null,
    Object? dateRegister = null,
    Object? isProblem = null,
    Object? slips = null,
  }) {
    return _then(_$SubmitBatchImpl(
      approvedId: null == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int,
      dateRegister: null == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isProblem: null == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool,
      slips: null == slips
          ? _value._slips
          : slips // ignore: cast_nullable_to_non_nullable
              as List<
                  ({
                    double breakHours,
                    DateTime endTime,
                    String location,
                    String reason,
                    DateTime timeStart
                  })>,
    ));
  }
}

/// @nodoc

class _$SubmitBatchImpl implements _SubmitBatch {
  const _$SubmitBatchImpl(
      {required this.approvedId,
      required this.dateRegister,
      required this.isProblem,
      required final List<
              ({
                double breakHours,
                DateTime endTime,
                String location,
                String reason,
                DateTime timeStart
              })>
          slips})
      : _slips = slips;

  @override
  final int approvedId;
  @override
  final DateTime dateRegister;
  @override
  final bool isProblem;
  final List<
      ({
        double breakHours,
        DateTime endTime,
        String location,
        String reason,
        DateTime timeStart
      })> _slips;
  @override
  List<
      ({
        double breakHours,
        DateTime endTime,
        String location,
        String reason,
        DateTime timeStart
      })> get slips {
    if (_slips is EqualUnmodifiableListView) return _slips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slips);
  }

  @override
  String toString() {
    return 'OvernightEvent.submitBatch(approvedId: $approvedId, dateRegister: $dateRegister, isProblem: $isProblem, slips: $slips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitBatchImpl &&
            (identical(other.approvedId, approvedId) ||
                other.approvedId == approvedId) &&
            (identical(other.dateRegister, dateRegister) ||
                other.dateRegister == dateRegister) &&
            (identical(other.isProblem, isProblem) ||
                other.isProblem == isProblem) &&
            const DeepCollectionEquality().equals(other._slips, _slips));
  }

  @override
  int get hashCode => Object.hash(runtimeType, approvedId, dateRegister,
      isProblem, const DeepCollectionEquality().hash(_slips));

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
    required TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) fetchDetail,
    required TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)
        submitEdit,
  }) {
    return submitBatch(approvedId, dateRegister, isProblem, slips);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? fetchDetail,
    TResult? Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
  }) {
    return submitBatch?.call(approvedId, dateRegister, isProblem, slips);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? fetchDetail,
    TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
    required TResult orElse(),
  }) {
    if (submitBatch != null) {
      return submitBatch(approvedId, dateRegister, isProblem, slips);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_FetchDetail value) fetchDetail,
    required TResult Function(_SubmitEdit value) submitEdit,
  }) {
    return submitBatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_FetchDetail value)? fetchDetail,
    TResult? Function(_SubmitEdit value)? submitEdit,
  }) {
    return submitBatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_FetchDetail value)? fetchDetail,
    TResult Function(_SubmitEdit value)? submitEdit,
    required TResult orElse(),
  }) {
    if (submitBatch != null) {
      return submitBatch(this);
    }
    return orElse();
  }
}

abstract class _SubmitBatch implements OvernightEvent {
  const factory _SubmitBatch(
      {required final int approvedId,
      required final DateTime dateRegister,
      required final bool isProblem,
      required final List<
              ({
                double breakHours,
                DateTime endTime,
                String location,
                String reason,
                DateTime timeStart
              })>
          slips}) = _$SubmitBatchImpl;

  int get approvedId;
  DateTime get dateRegister;
  bool get isProblem;
  List<
      ({
        double breakHours,
        DateTime endTime,
        String location,
        String reason,
        DateTime timeStart
      })> get slips;
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
    extends _$OvernightEventCopyWithImpl<$Res, _$OnCancelSubmitImpl>
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
    return 'OvernightEvent.onCancelSubmit(id: $id)';
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
    required TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) fetchDetail,
    required TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)
        submitEdit,
  }) {
    return onCancelSubmit(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? fetchDetail,
    TResult? Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
  }) {
    return onCancelSubmit?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? fetchDetail,
    TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
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
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_FetchDetail value) fetchDetail,
    required TResult Function(_SubmitEdit value) submitEdit,
  }) {
    return onCancelSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_FetchDetail value)? fetchDetail,
    TResult? Function(_SubmitEdit value)? submitEdit,
  }) {
    return onCancelSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_FetchDetail value)? fetchDetail,
    TResult Function(_SubmitEdit value)? submitEdit,
    required TResult orElse(),
  }) {
    if (onCancelSubmit != null) {
      return onCancelSubmit(this);
    }
    return orElse();
  }
}

abstract class _OnCancelSubmit implements OvernightEvent {
  const factory _OnCancelSubmit({required final int id}) = _$OnCancelSubmitImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$OnCancelSubmitImplCopyWith<_$OnCancelSubmitImpl> get copyWith =>
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
    extends _$OvernightEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
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
    return 'OvernightEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) fetchDetail,
    required TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)
        submitEdit,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? fetchDetail,
    TResult? Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? fetchDetail,
    TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
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
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_FetchDetail value) fetchDetail,
    required TResult Function(_SubmitEdit value) submitEdit,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_FetchDetail value)? fetchDetail,
    TResult? Function(_SubmitEdit value)? submitEdit,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_FetchDetail value)? fetchDetail,
    TResult Function(_SubmitEdit value)? submitEdit,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements OvernightEvent {
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
    extends _$OvernightEventCopyWithImpl<$Res, _$ClearSubmitStateImpl>
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
    return 'OvernightEvent.clearSubmitState()';
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
    required TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) fetchDetail,
    required TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)
        submitEdit,
  }) {
    return clearSubmitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? fetchDetail,
    TResult? Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
  }) {
    return clearSubmitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? fetchDetail,
    TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
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
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_FetchDetail value) fetchDetail,
    required TResult Function(_SubmitEdit value) submitEdit,
  }) {
    return clearSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_FetchDetail value)? fetchDetail,
    TResult? Function(_SubmitEdit value)? submitEdit,
  }) {
    return clearSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_FetchDetail value)? fetchDetail,
    TResult Function(_SubmitEdit value)? submitEdit,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState(this);
    }
    return orElse();
  }
}

abstract class _ClearSubmitState implements OvernightEvent {
  const factory _ClearSubmitState() = _$ClearSubmitStateImpl;
}

/// @nodoc
abstract class _$$FetchDetailImplCopyWith<$Res> {
  factory _$$FetchDetailImplCopyWith(
          _$FetchDetailImpl value, $Res Function(_$FetchDetailImpl) then) =
      __$$FetchDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FetchDetailImplCopyWithImpl<$Res>
    extends _$OvernightEventCopyWithImpl<$Res, _$FetchDetailImpl>
    implements _$$FetchDetailImplCopyWith<$Res> {
  __$$FetchDetailImplCopyWithImpl(
      _$FetchDetailImpl _value, $Res Function(_$FetchDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchDetailImpl implements _FetchDetail {
  const _$FetchDetailImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'OvernightEvent.fetchDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDetailImplCopyWith<_$FetchDetailImpl> get copyWith =>
      __$$FetchDetailImplCopyWithImpl<_$FetchDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) fetchDetail,
    required TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)
        submitEdit,
  }) {
    return fetchDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? fetchDetail,
    TResult? Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
  }) {
    return fetchDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? fetchDetail,
    TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
    required TResult orElse(),
  }) {
    if (fetchDetail != null) {
      return fetchDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_FetchDetail value) fetchDetail,
    required TResult Function(_SubmitEdit value) submitEdit,
  }) {
    return fetchDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_FetchDetail value)? fetchDetail,
    TResult? Function(_SubmitEdit value)? submitEdit,
  }) {
    return fetchDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_FetchDetail value)? fetchDetail,
    TResult Function(_SubmitEdit value)? submitEdit,
    required TResult orElse(),
  }) {
    if (fetchDetail != null) {
      return fetchDetail(this);
    }
    return orElse();
  }
}

abstract class _FetchDetail implements OvernightEvent {
  const factory _FetchDetail({required final int id}) = _$FetchDetailImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$FetchDetailImplCopyWith<_$FetchDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitEditImplCopyWith<$Res> {
  factory _$$SubmitEditImplCopyWith(
          _$SubmitEditImpl value, $Res Function(_$SubmitEditImpl) then) =
      __$$SubmitEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      int approvedId,
      DateTime dateRegister,
      bool isProblem,
      ({
        double breakHours,
        DateTime endTime,
        String location,
        String reason,
        DateTime timeStart
      }) slip});
}

/// @nodoc
class __$$SubmitEditImplCopyWithImpl<$Res>
    extends _$OvernightEventCopyWithImpl<$Res, _$SubmitEditImpl>
    implements _$$SubmitEditImplCopyWith<$Res> {
  __$$SubmitEditImplCopyWithImpl(
      _$SubmitEditImpl _value, $Res Function(_$SubmitEditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? approvedId = null,
    Object? dateRegister = null,
    Object? isProblem = null,
    Object? slip = null,
  }) {
    return _then(_$SubmitEditImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      approvedId: null == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int,
      dateRegister: null == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isProblem: null == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool,
      slip: null == slip
          ? _value.slip
          : slip // ignore: cast_nullable_to_non_nullable
              as ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }),
    ));
  }
}

/// @nodoc

class _$SubmitEditImpl implements _SubmitEdit {
  const _$SubmitEditImpl(
      {required this.id,
      required this.approvedId,
      required this.dateRegister,
      required this.isProblem,
      required this.slip});

  @override
  final int id;
  @override
  final int approvedId;
  @override
  final DateTime dateRegister;
  @override
  final bool isProblem;
  @override
  final ({
    double breakHours,
    DateTime endTime,
    String location,
    String reason,
    DateTime timeStart
  }) slip;

  @override
  String toString() {
    return 'OvernightEvent.submitEdit(id: $id, approvedId: $approvedId, dateRegister: $dateRegister, isProblem: $isProblem, slip: $slip)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitEditImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.approvedId, approvedId) ||
                other.approvedId == approvedId) &&
            (identical(other.dateRegister, dateRegister) ||
                other.dateRegister == dateRegister) &&
            (identical(other.isProblem, isProblem) ||
                other.isProblem == isProblem) &&
            (identical(other.slip, slip) || other.slip == slip));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, approvedId, dateRegister, isProblem, slip);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitEditImplCopyWith<_$SubmitEditImpl> get copyWith =>
      __$$SubmitEditImplCopyWithImpl<_$SubmitEditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)
        submitBatch,
    required TResult Function(int id) onCancelSubmit,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) fetchDetail,
    required TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)
        submitEdit,
  }) {
    return submitEdit(id, approvedId, dateRegister, isProblem, slip);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult? Function(int id)? onCancelSubmit,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? fetchDetail,
    TResult? Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
  }) {
    return submitEdit?.call(id, approvedId, dateRegister, isProblem, slip);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            List<
                    ({
                      double breakHours,
                      DateTime endTime,
                      String location,
                      String reason,
                      DateTime timeStart
                    })>
                slips)?
        submitBatch,
    TResult Function(int id)? onCancelSubmit,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? fetchDetail,
    TResult Function(
            int id,
            int approvedId,
            DateTime dateRegister,
            bool isProblem,
            ({
              double breakHours,
              DateTime endTime,
              String location,
              String reason,
              DateTime timeStart
            }) slip)?
        submitEdit,
    required TResult orElse(),
  }) {
    if (submitEdit != null) {
      return submitEdit(id, approvedId, dateRegister, isProblem, slip);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_SubmitBatch value) submitBatch,
    required TResult Function(_OnCancelSubmit value) onCancelSubmit,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_FetchDetail value) fetchDetail,
    required TResult Function(_SubmitEdit value) submitEdit,
  }) {
    return submitEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_SubmitBatch value)? submitBatch,
    TResult? Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_FetchDetail value)? fetchDetail,
    TResult? Function(_SubmitEdit value)? submitEdit,
  }) {
    return submitEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_SubmitBatch value)? submitBatch,
    TResult Function(_OnCancelSubmit value)? onCancelSubmit,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_FetchDetail value)? fetchDetail,
    TResult Function(_SubmitEdit value)? submitEdit,
    required TResult orElse(),
  }) {
    if (submitEdit != null) {
      return submitEdit(this);
    }
    return orElse();
  }
}

abstract class _SubmitEdit implements OvernightEvent {
  const factory _SubmitEdit(
      {required final int id,
      required final int approvedId,
      required final DateTime dateRegister,
      required final bool isProblem,
      required final ({
        double breakHours,
        DateTime endTime,
        String location,
        String reason,
        DateTime timeStart
      }) slip}) = _$SubmitEditImpl;

  int get id;
  int get approvedId;
  DateTime get dateRegister;
  bool get isProblem;
  ({
    double breakHours,
    DateTime endTime,
    String location,
    String reason,
    DateTime timeStart
  }) get slip;
  @JsonKey(ignore: true)
  _$$SubmitEditImplCopyWith<_$SubmitEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
