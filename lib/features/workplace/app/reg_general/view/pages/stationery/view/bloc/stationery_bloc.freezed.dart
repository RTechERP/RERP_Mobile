// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stationery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StationeryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationeryEventCopyWith<$Res> {
  factory $StationeryEventCopyWith(
          StationeryEvent value, $Res Function(StationeryEvent) then) =
      _$StationeryEventCopyWithImpl<$Res, StationeryEvent>;
}

/// @nodoc
class _$StationeryEventCopyWithImpl<$Res, $Val extends StationeryEvent>
    implements $StationeryEventCopyWith<$Res> {
  _$StationeryEventCopyWithImpl(this._value, this._then);

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
    extends _$StationeryEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'StationeryEvent.init()';
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
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
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
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements StationeryEvent {
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
    extends _$StationeryEventCopyWithImpl<$Res, _$InitAddImpl>
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
    return 'StationeryEvent.initAdd()';
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
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return initAdd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return initAdd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
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
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return initAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return initAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (initAdd != null) {
      return initAdd(this);
    }
    return orElse();
  }
}

abstract class _InitAdd implements StationeryEvent {
  const factory _InitAdd() = _$InitAddImpl;
}

/// @nodoc
abstract class _$$InitEditImplCopyWith<$Res> {
  factory _$$InitEditImplCopyWith(
          _$InitEditImpl value, $Res Function(_$InitEditImpl) then) =
      __$$InitEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StationeryItem item, List<StationeryDetailItem> details});

  $StationeryItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$InitEditImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$InitEditImpl>
    implements _$$InitEditImplCopyWith<$Res> {
  __$$InitEditImplCopyWithImpl(
      _$InitEditImpl _value, $Res Function(_$InitEditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? details = null,
  }) {
    return _then(_$InitEditImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as StationeryItem,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<StationeryDetailItem>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StationeryItemCopyWith<$Res> get item {
    return $StationeryItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$InitEditImpl implements _InitEdit {
  const _$InitEditImpl(
      {required this.item, required final List<StationeryDetailItem> details})
      : _details = details;

  @override
  final StationeryItem item;
  final List<StationeryDetailItem> _details;
  @override
  List<StationeryDetailItem> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'StationeryEvent.initEdit(item: $item, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitEditImpl &&
            (identical(other.item, item) || other.item == item) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, item, const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitEditImplCopyWith<_$InitEditImpl> get copyWith =>
      __$$InitEditImplCopyWithImpl<_$InitEditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return initEdit(item, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return initEdit?.call(item, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (initEdit != null) {
      return initEdit(item, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return initEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return initEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (initEdit != null) {
      return initEdit(this);
    }
    return orElse();
  }
}

abstract class _InitEdit implements StationeryEvent {
  const factory _InitEdit(
      {required final StationeryItem item,
      required final List<StationeryDetailItem> details}) = _$InitEditImpl;

  StationeryItem get item;
  List<StationeryDetailItem> get details;
  @JsonKey(ignore: true)
  _$$InitEditImplCopyWith<_$InitEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectSupplyImplCopyWith<$Res> {
  factory _$$SelectSupplyImplCopyWith(
          _$SelectSupplyImpl value, $Res Function(_$SelectSupplyImpl) then) =
      __$$SelectSupplyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int slipIndex, StationerySupplyItem supply});

  $StationerySupplyItemCopyWith<$Res> get supply;
}

/// @nodoc
class __$$SelectSupplyImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$SelectSupplyImpl>
    implements _$$SelectSupplyImplCopyWith<$Res> {
  __$$SelectSupplyImplCopyWithImpl(
      _$SelectSupplyImpl _value, $Res Function(_$SelectSupplyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slipIndex = null,
    Object? supply = null,
  }) {
    return _then(_$SelectSupplyImpl(
      slipIndex: null == slipIndex
          ? _value.slipIndex
          : slipIndex // ignore: cast_nullable_to_non_nullable
              as int,
      supply: null == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as StationerySupplyItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StationerySupplyItemCopyWith<$Res> get supply {
    return $StationerySupplyItemCopyWith<$Res>(_value.supply, (value) {
      return _then(_value.copyWith(supply: value));
    });
  }
}

/// @nodoc

class _$SelectSupplyImpl implements _SelectSupply {
  const _$SelectSupplyImpl({required this.slipIndex, required this.supply});

  @override
  final int slipIndex;
  @override
  final StationerySupplyItem supply;

  @override
  String toString() {
    return 'StationeryEvent.selectSupply(slipIndex: $slipIndex, supply: $supply)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectSupplyImpl &&
            (identical(other.slipIndex, slipIndex) ||
                other.slipIndex == slipIndex) &&
            (identical(other.supply, supply) || other.supply == supply));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slipIndex, supply);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectSupplyImplCopyWith<_$SelectSupplyImpl> get copyWith =>
      __$$SelectSupplyImplCopyWithImpl<_$SelectSupplyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return selectSupply(slipIndex, supply);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return selectSupply?.call(slipIndex, supply);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (selectSupply != null) {
      return selectSupply(slipIndex, supply);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return selectSupply(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return selectSupply?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (selectSupply != null) {
      return selectSupply(this);
    }
    return orElse();
  }
}

abstract class _SelectSupply implements StationeryEvent {
  const factory _SelectSupply(
      {required final int slipIndex,
      required final StationerySupplyItem supply}) = _$SelectSupplyImpl;

  int get slipIndex;
  StationerySupplyItem get supply;
  @JsonKey(ignore: true)
  _$$SelectSupplyImplCopyWith<_$SelectSupplyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateQuantityImplCopyWith<$Res> {
  factory _$$UpdateQuantityImplCopyWith(_$UpdateQuantityImpl value,
          $Res Function(_$UpdateQuantityImpl) then) =
      __$$UpdateQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int slipIndex, int quantity});
}

/// @nodoc
class __$$UpdateQuantityImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$UpdateQuantityImpl>
    implements _$$UpdateQuantityImplCopyWith<$Res> {
  __$$UpdateQuantityImplCopyWithImpl(
      _$UpdateQuantityImpl _value, $Res Function(_$UpdateQuantityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slipIndex = null,
    Object? quantity = null,
  }) {
    return _then(_$UpdateQuantityImpl(
      slipIndex: null == slipIndex
          ? _value.slipIndex
          : slipIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateQuantityImpl implements _UpdateQuantity {
  const _$UpdateQuantityImpl({required this.slipIndex, required this.quantity});

  @override
  final int slipIndex;
  @override
  final int quantity;

  @override
  String toString() {
    return 'StationeryEvent.updateQuantity(slipIndex: $slipIndex, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuantityImpl &&
            (identical(other.slipIndex, slipIndex) ||
                other.slipIndex == slipIndex) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slipIndex, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      __$$UpdateQuantityImplCopyWithImpl<_$UpdateQuantityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return updateQuantity(slipIndex, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return updateQuantity?.call(slipIndex, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(slipIndex, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateQuantity implements StationeryEvent {
  const factory _UpdateQuantity(
      {required final int slipIndex,
      required final int quantity}) = _$UpdateQuantityImpl;

  int get slipIndex;
  int get quantity;
  @JsonKey(ignore: true)
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleExceedsLimitImplCopyWith<$Res> {
  factory _$$ToggleExceedsLimitImplCopyWith(_$ToggleExceedsLimitImpl value,
          $Res Function(_$ToggleExceedsLimitImpl) then) =
      __$$ToggleExceedsLimitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int slipIndex, bool exceeds});
}

/// @nodoc
class __$$ToggleExceedsLimitImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$ToggleExceedsLimitImpl>
    implements _$$ToggleExceedsLimitImplCopyWith<$Res> {
  __$$ToggleExceedsLimitImplCopyWithImpl(_$ToggleExceedsLimitImpl _value,
      $Res Function(_$ToggleExceedsLimitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slipIndex = null,
    Object? exceeds = null,
  }) {
    return _then(_$ToggleExceedsLimitImpl(
      slipIndex: null == slipIndex
          ? _value.slipIndex
          : slipIndex // ignore: cast_nullable_to_non_nullable
              as int,
      exceeds: null == exceeds
          ? _value.exceeds
          : exceeds // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleExceedsLimitImpl implements _ToggleExceedsLimit {
  const _$ToggleExceedsLimitImpl(
      {required this.slipIndex, required this.exceeds});

  @override
  final int slipIndex;
  @override
  final bool exceeds;

  @override
  String toString() {
    return 'StationeryEvent.toggleExceedsLimit(slipIndex: $slipIndex, exceeds: $exceeds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleExceedsLimitImpl &&
            (identical(other.slipIndex, slipIndex) ||
                other.slipIndex == slipIndex) &&
            (identical(other.exceeds, exceeds) || other.exceeds == exceeds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slipIndex, exceeds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleExceedsLimitImplCopyWith<_$ToggleExceedsLimitImpl> get copyWith =>
      __$$ToggleExceedsLimitImplCopyWithImpl<_$ToggleExceedsLimitImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return toggleExceedsLimit(slipIndex, exceeds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return toggleExceedsLimit?.call(slipIndex, exceeds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (toggleExceedsLimit != null) {
      return toggleExceedsLimit(slipIndex, exceeds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return toggleExceedsLimit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return toggleExceedsLimit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (toggleExceedsLimit != null) {
      return toggleExceedsLimit(this);
    }
    return orElse();
  }
}

abstract class _ToggleExceedsLimit implements StationeryEvent {
  const factory _ToggleExceedsLimit(
      {required final int slipIndex,
      required final bool exceeds}) = _$ToggleExceedsLimitImpl;

  int get slipIndex;
  bool get exceeds;
  @JsonKey(ignore: true)
  _$$ToggleExceedsLimitImplCopyWith<_$ToggleExceedsLimitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateReasonImplCopyWith<$Res> {
  factory _$$UpdateReasonImplCopyWith(
          _$UpdateReasonImpl value, $Res Function(_$UpdateReasonImpl) then) =
      __$$UpdateReasonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int slipIndex, String reason});
}

/// @nodoc
class __$$UpdateReasonImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$UpdateReasonImpl>
    implements _$$UpdateReasonImplCopyWith<$Res> {
  __$$UpdateReasonImplCopyWithImpl(
      _$UpdateReasonImpl _value, $Res Function(_$UpdateReasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slipIndex = null,
    Object? reason = null,
  }) {
    return _then(_$UpdateReasonImpl(
      slipIndex: null == slipIndex
          ? _value.slipIndex
          : slipIndex // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateReasonImpl implements _UpdateReason {
  const _$UpdateReasonImpl({required this.slipIndex, required this.reason});

  @override
  final int slipIndex;
  @override
  final String reason;

  @override
  String toString() {
    return 'StationeryEvent.updateReason(slipIndex: $slipIndex, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateReasonImpl &&
            (identical(other.slipIndex, slipIndex) ||
                other.slipIndex == slipIndex) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slipIndex, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateReasonImplCopyWith<_$UpdateReasonImpl> get copyWith =>
      __$$UpdateReasonImplCopyWithImpl<_$UpdateReasonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return updateReason(slipIndex, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return updateReason?.call(slipIndex, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (updateReason != null) {
      return updateReason(slipIndex, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return updateReason(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return updateReason?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (updateReason != null) {
      return updateReason(this);
    }
    return orElse();
  }
}

abstract class _UpdateReason implements StationeryEvent {
  const factory _UpdateReason(
      {required final int slipIndex,
      required final String reason}) = _$UpdateReasonImpl;

  int get slipIndex;
  String get reason;
  @JsonKey(ignore: true)
  _$$UpdateReasonImplCopyWith<_$UpdateReasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateNoteImplCopyWith<$Res> {
  factory _$$UpdateNoteImplCopyWith(
          _$UpdateNoteImpl value, $Res Function(_$UpdateNoteImpl) then) =
      __$$UpdateNoteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int slipIndex, String note});
}

/// @nodoc
class __$$UpdateNoteImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$UpdateNoteImpl>
    implements _$$UpdateNoteImplCopyWith<$Res> {
  __$$UpdateNoteImplCopyWithImpl(
      _$UpdateNoteImpl _value, $Res Function(_$UpdateNoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slipIndex = null,
    Object? note = null,
  }) {
    return _then(_$UpdateNoteImpl(
      slipIndex: null == slipIndex
          ? _value.slipIndex
          : slipIndex // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateNoteImpl implements _UpdateNote {
  const _$UpdateNoteImpl({required this.slipIndex, required this.note});

  @override
  final int slipIndex;
  @override
  final String note;

  @override
  String toString() {
    return 'StationeryEvent.updateNote(slipIndex: $slipIndex, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNoteImpl &&
            (identical(other.slipIndex, slipIndex) ||
                other.slipIndex == slipIndex) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slipIndex, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNoteImplCopyWith<_$UpdateNoteImpl> get copyWith =>
      __$$UpdateNoteImplCopyWithImpl<_$UpdateNoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return updateNote(slipIndex, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return updateNote?.call(slipIndex, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (updateNote != null) {
      return updateNote(slipIndex, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return updateNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return updateNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (updateNote != null) {
      return updateNote(this);
    }
    return orElse();
  }
}

abstract class _UpdateNote implements StationeryEvent {
  const factory _UpdateNote(
      {required final int slipIndex,
      required final String note}) = _$UpdateNoteImpl;

  int get slipIndex;
  String get note;
  @JsonKey(ignore: true)
  _$$UpdateNoteImplCopyWith<_$UpdateNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSlipImplCopyWith<$Res> {
  factory _$$AddSlipImplCopyWith(
          _$AddSlipImpl value, $Res Function(_$AddSlipImpl) then) =
      __$$AddSlipImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddSlipImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$AddSlipImpl>
    implements _$$AddSlipImplCopyWith<$Res> {
  __$$AddSlipImplCopyWithImpl(
      _$AddSlipImpl _value, $Res Function(_$AddSlipImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddSlipImpl implements _AddSlip {
  const _$AddSlipImpl();

  @override
  String toString() {
    return 'StationeryEvent.addSlip()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddSlipImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return addSlip();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return addSlip?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (addSlip != null) {
      return addSlip();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return addSlip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return addSlip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (addSlip != null) {
      return addSlip(this);
    }
    return orElse();
  }
}

abstract class _AddSlip implements StationeryEvent {
  const factory _AddSlip() = _$AddSlipImpl;
}

/// @nodoc
abstract class _$$RemoveSlipImplCopyWith<$Res> {
  factory _$$RemoveSlipImplCopyWith(
          _$RemoveSlipImpl value, $Res Function(_$RemoveSlipImpl) then) =
      __$$RemoveSlipImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int slipIndex});
}

/// @nodoc
class __$$RemoveSlipImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$RemoveSlipImpl>
    implements _$$RemoveSlipImplCopyWith<$Res> {
  __$$RemoveSlipImplCopyWithImpl(
      _$RemoveSlipImpl _value, $Res Function(_$RemoveSlipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slipIndex = null,
  }) {
    return _then(_$RemoveSlipImpl(
      slipIndex: null == slipIndex
          ? _value.slipIndex
          : slipIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveSlipImpl implements _RemoveSlip {
  const _$RemoveSlipImpl({required this.slipIndex});

  @override
  final int slipIndex;

  @override
  String toString() {
    return 'StationeryEvent.removeSlip(slipIndex: $slipIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveSlipImpl &&
            (identical(other.slipIndex, slipIndex) ||
                other.slipIndex == slipIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slipIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveSlipImplCopyWith<_$RemoveSlipImpl> get copyWith =>
      __$$RemoveSlipImplCopyWithImpl<_$RemoveSlipImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return removeSlip(slipIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return removeSlip?.call(slipIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (removeSlip != null) {
      return removeSlip(slipIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return removeSlip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return removeSlip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (removeSlip != null) {
      return removeSlip(this);
    }
    return orElse();
  }
}

abstract class _RemoveSlip implements StationeryEvent {
  const factory _RemoveSlip({required final int slipIndex}) = _$RemoveSlipImpl;

  int get slipIndex;
  @JsonKey(ignore: true)
  _$$RemoveSlipImplCopyWith<_$RemoveSlipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitStationeryImplCopyWith<$Res> {
  factory _$$SubmitStationeryImplCopyWith(_$SubmitStationeryImpl value,
          $Res Function(_$SubmitStationeryImpl) then) =
      __$$SubmitStationeryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateRegister});
}

/// @nodoc
class __$$SubmitStationeryImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$SubmitStationeryImpl>
    implements _$$SubmitStationeryImplCopyWith<$Res> {
  __$$SubmitStationeryImplCopyWithImpl(_$SubmitStationeryImpl _value,
      $Res Function(_$SubmitStationeryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRegister = null,
  }) {
    return _then(_$SubmitStationeryImpl(
      dateRegister: null == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SubmitStationeryImpl implements _SubmitStationery {
  const _$SubmitStationeryImpl({required this.dateRegister});

  @override
  final DateTime dateRegister;

  @override
  String toString() {
    return 'StationeryEvent.submitStationery(dateRegister: $dateRegister)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitStationeryImpl &&
            (identical(other.dateRegister, dateRegister) ||
                other.dateRegister == dateRegister));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateRegister);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitStationeryImplCopyWith<_$SubmitStationeryImpl> get copyWith =>
      __$$SubmitStationeryImplCopyWithImpl<_$SubmitStationeryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return submitStationery(dateRegister);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return submitStationery?.call(dateRegister);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (submitStationery != null) {
      return submitStationery(dateRegister);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return submitStationery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return submitStationery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (submitStationery != null) {
      return submitStationery(this);
    }
    return orElse();
  }
}

abstract class _SubmitStationery implements StationeryEvent {
  const factory _SubmitStationery({required final DateTime dateRegister}) =
      _$SubmitStationeryImpl;

  DateTime get dateRegister;
  @JsonKey(ignore: true)
  _$$SubmitStationeryImplCopyWith<_$SubmitStationeryImpl> get copyWith =>
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
    extends _$StationeryEventCopyWithImpl<$Res, _$ClearSubmitStateImpl>
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
    return 'StationeryEvent.clearSubmitState()';
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
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return clearSubmitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return clearSubmitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
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
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return clearSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return clearSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState(this);
    }
    return orElse();
  }
}

abstract class _ClearSubmitState implements StationeryEvent {
  const factory _ClearSubmitState() = _$ClearSubmitStateImpl;
}

/// @nodoc
abstract class _$$ChangeMonthImplCopyWith<$Res> {
  factory _$$ChangeMonthImplCopyWith(
          _$ChangeMonthImpl value, $Res Function(_$ChangeMonthImpl) then) =
      __$$ChangeMonthImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime month});
}

/// @nodoc
class __$$ChangeMonthImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$ChangeMonthImpl>
    implements _$$ChangeMonthImplCopyWith<$Res> {
  __$$ChangeMonthImplCopyWithImpl(
      _$ChangeMonthImpl _value, $Res Function(_$ChangeMonthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
  }) {
    return _then(_$ChangeMonthImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChangeMonthImpl implements _ChangeMonth {
  const _$ChangeMonthImpl({required this.month});

  @override
  final DateTime month;

  @override
  String toString() {
    return 'StationeryEvent.changeMonth(month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeMonthImpl &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeMonthImplCopyWith<_$ChangeMonthImpl> get copyWith =>
      __$$ChangeMonthImplCopyWithImpl<_$ChangeMonthImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return changeMonth(month);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return changeMonth?.call(month);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (changeMonth != null) {
      return changeMonth(month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return changeMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return changeMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (changeMonth != null) {
      return changeMonth(this);
    }
    return orElse();
  }
}

abstract class _ChangeMonth implements StationeryEvent {
  const factory _ChangeMonth({required final DateTime month}) =
      _$ChangeMonthImpl;

  DateTime get month;
  @JsonKey(ignore: true)
  _$$ChangeMonthImplCopyWith<_$ChangeMonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteStationeryImplCopyWith<$Res> {
  factory _$$DeleteStationeryImplCopyWith(_$DeleteStationeryImpl value,
          $Res Function(_$DeleteStationeryImpl) then) =
      __$$DeleteStationeryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int itemId});
}

/// @nodoc
class __$$DeleteStationeryImplCopyWithImpl<$Res>
    extends _$StationeryEventCopyWithImpl<$Res, _$DeleteStationeryImpl>
    implements _$$DeleteStationeryImplCopyWith<$Res> {
  __$$DeleteStationeryImplCopyWithImpl(_$DeleteStationeryImpl _value,
      $Res Function(_$DeleteStationeryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
  }) {
    return _then(_$DeleteStationeryImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteStationeryImpl implements _DeleteStationery {
  const _$DeleteStationeryImpl({required this.itemId});

  @override
  final int itemId;

  @override
  String toString() {
    return 'StationeryEvent.deleteStationery(itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteStationeryImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteStationeryImplCopyWith<_$DeleteStationeryImpl> get copyWith =>
      __$$DeleteStationeryImplCopyWithImpl<_$DeleteStationeryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(
            StationeryItem item, List<StationeryDetailItem> details)
        initEdit,
    required TResult Function(int slipIndex, StationerySupplyItem supply)
        selectSupply,
    required TResult Function(int slipIndex, int quantity) updateQuantity,
    required TResult Function(int slipIndex, bool exceeds) toggleExceedsLimit,
    required TResult Function(int slipIndex, String reason) updateReason,
    required TResult Function(int slipIndex, String note) updateNote,
    required TResult Function() addSlip,
    required TResult Function(int slipIndex) removeSlip,
    required TResult Function(DateTime dateRegister) submitStationery,
    required TResult Function() clearSubmitState,
    required TResult Function(DateTime month) changeMonth,
    required TResult Function(int itemId) deleteStationery,
  }) {
    return deleteStationery(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult? Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult? Function(int slipIndex, int quantity)? updateQuantity,
    TResult? Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult? Function(int slipIndex, String reason)? updateReason,
    TResult? Function(int slipIndex, String note)? updateNote,
    TResult? Function()? addSlip,
    TResult? Function(int slipIndex)? removeSlip,
    TResult? Function(DateTime dateRegister)? submitStationery,
    TResult? Function()? clearSubmitState,
    TResult? Function(DateTime month)? changeMonth,
    TResult? Function(int itemId)? deleteStationery,
  }) {
    return deleteStationery?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(StationeryItem item, List<StationeryDetailItem> details)?
        initEdit,
    TResult Function(int slipIndex, StationerySupplyItem supply)? selectSupply,
    TResult Function(int slipIndex, int quantity)? updateQuantity,
    TResult Function(int slipIndex, bool exceeds)? toggleExceedsLimit,
    TResult Function(int slipIndex, String reason)? updateReason,
    TResult Function(int slipIndex, String note)? updateNote,
    TResult Function()? addSlip,
    TResult Function(int slipIndex)? removeSlip,
    TResult Function(DateTime dateRegister)? submitStationery,
    TResult Function()? clearSubmitState,
    TResult Function(DateTime month)? changeMonth,
    TResult Function(int itemId)? deleteStationery,
    required TResult orElse(),
  }) {
    if (deleteStationery != null) {
      return deleteStationery(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_SelectSupply value) selectSupply,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ToggleExceedsLimit value) toggleExceedsLimit,
    required TResult Function(_UpdateReason value) updateReason,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_AddSlip value) addSlip,
    required TResult Function(_RemoveSlip value) removeSlip,
    required TResult Function(_SubmitStationery value) submitStationery,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_ChangeMonth value) changeMonth,
    required TResult Function(_DeleteStationery value) deleteStationery,
  }) {
    return deleteStationery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_SelectSupply value)? selectSupply,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult? Function(_UpdateReason value)? updateReason,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_AddSlip value)? addSlip,
    TResult? Function(_RemoveSlip value)? removeSlip,
    TResult? Function(_SubmitStationery value)? submitStationery,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_ChangeMonth value)? changeMonth,
    TResult? Function(_DeleteStationery value)? deleteStationery,
  }) {
    return deleteStationery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_SelectSupply value)? selectSupply,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ToggleExceedsLimit value)? toggleExceedsLimit,
    TResult Function(_UpdateReason value)? updateReason,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_AddSlip value)? addSlip,
    TResult Function(_RemoveSlip value)? removeSlip,
    TResult Function(_SubmitStationery value)? submitStationery,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_ChangeMonth value)? changeMonth,
    TResult Function(_DeleteStationery value)? deleteStationery,
    required TResult orElse(),
  }) {
    if (deleteStationery != null) {
      return deleteStationery(this);
    }
    return orElse();
  }
}

abstract class _DeleteStationery implements StationeryEvent {
  const factory _DeleteStationery({required final int itemId}) =
      _$DeleteStationeryImpl;

  int get itemId;
  @JsonKey(ignore: true)
  _$$DeleteStationeryImplCopyWith<_$DeleteStationeryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
