// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialCategoryItem {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// null = node root, ngược lại = id của node cha.
  int? get parentId => throw _privateConstructorUsedError;

  /// Mã thiết bị / mã máy áp dụng.
  String? get deviceCode => throw _privateConstructorUsedError;

  /// Số lượng cho 1 máy.
  int? get qtyPerMachine => throw _privateConstructorUsedError;

  /// Số lượng tổng (cha và con đều có giá trị riêng, không auto-sum).
  int? get totalQty => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialCategoryItemCopyWith<MaterialCategoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialCategoryItemCopyWith<$Res> {
  factory $MaterialCategoryItemCopyWith(MaterialCategoryItem value,
          $Res Function(MaterialCategoryItem) then) =
      _$MaterialCategoryItemCopyWithImpl<$Res, MaterialCategoryItem>;
  @useResult
  $Res call(
      {int id,
      String code,
      String name,
      int? parentId,
      String? deviceCode,
      int? qtyPerMachine,
      int? totalQty,
      String? note,
      bool isActive});
}

/// @nodoc
class _$MaterialCategoryItemCopyWithImpl<$Res,
        $Val extends MaterialCategoryItem>
    implements $MaterialCategoryItemCopyWith<$Res> {
  _$MaterialCategoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? parentId = freezed,
    Object? deviceCode = freezed,
    Object? qtyPerMachine = freezed,
    Object? totalQty = freezed,
    Object? note = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceCode: freezed == deviceCode
          ? _value.deviceCode
          : deviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      qtyPerMachine: freezed == qtyPerMachine
          ? _value.qtyPerMachine
          : qtyPerMachine // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQty: freezed == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialCategoryItemImplCopyWith<$Res>
    implements $MaterialCategoryItemCopyWith<$Res> {
  factory _$$MaterialCategoryItemImplCopyWith(_$MaterialCategoryItemImpl value,
          $Res Function(_$MaterialCategoryItemImpl) then) =
      __$$MaterialCategoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      String name,
      int? parentId,
      String? deviceCode,
      int? qtyPerMachine,
      int? totalQty,
      String? note,
      bool isActive});
}

/// @nodoc
class __$$MaterialCategoryItemImplCopyWithImpl<$Res>
    extends _$MaterialCategoryItemCopyWithImpl<$Res, _$MaterialCategoryItemImpl>
    implements _$$MaterialCategoryItemImplCopyWith<$Res> {
  __$$MaterialCategoryItemImplCopyWithImpl(_$MaterialCategoryItemImpl _value,
      $Res Function(_$MaterialCategoryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? parentId = freezed,
    Object? deviceCode = freezed,
    Object? qtyPerMachine = freezed,
    Object? totalQty = freezed,
    Object? note = freezed,
    Object? isActive = null,
  }) {
    return _then(_$MaterialCategoryItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceCode: freezed == deviceCode
          ? _value.deviceCode
          : deviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      qtyPerMachine: freezed == qtyPerMachine
          ? _value.qtyPerMachine
          : qtyPerMachine // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQty: freezed == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MaterialCategoryItemImpl implements _MaterialCategoryItem {
  const _$MaterialCategoryItemImpl(
      {required this.id,
      required this.code,
      required this.name,
      this.parentId,
      this.deviceCode,
      this.qtyPerMachine,
      this.totalQty,
      this.note,
      this.isActive = true});

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;

  /// null = node root, ngược lại = id của node cha.
  @override
  final int? parentId;

  /// Mã thiết bị / mã máy áp dụng.
  @override
  final String? deviceCode;

  /// Số lượng cho 1 máy.
  @override
  final int? qtyPerMachine;

  /// Số lượng tổng (cha và con đều có giá trị riêng, không auto-sum).
  @override
  final int? totalQty;
  @override
  final String? note;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'MaterialCategoryItem(id: $id, code: $code, name: $name, parentId: $parentId, deviceCode: $deviceCode, qtyPerMachine: $qtyPerMachine, totalQty: $totalQty, note: $note, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialCategoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.deviceCode, deviceCode) ||
                other.deviceCode == deviceCode) &&
            (identical(other.qtyPerMachine, qtyPerMachine) ||
                other.qtyPerMachine == qtyPerMachine) &&
            (identical(other.totalQty, totalQty) ||
                other.totalQty == totalQty) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, parentId,
      deviceCode, qtyPerMachine, totalQty, note, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialCategoryItemImplCopyWith<_$MaterialCategoryItemImpl>
      get copyWith =>
          __$$MaterialCategoryItemImplCopyWithImpl<_$MaterialCategoryItemImpl>(
              this, _$identity);
}

abstract class _MaterialCategoryItem implements MaterialCategoryItem {
  const factory _MaterialCategoryItem(
      {required final int id,
      required final String code,
      required final String name,
      final int? parentId,
      final String? deviceCode,
      final int? qtyPerMachine,
      final int? totalQty,
      final String? note,
      final bool isActive}) = _$MaterialCategoryItemImpl;

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override

  /// null = node root, ngược lại = id của node cha.
  int? get parentId;
  @override

  /// Mã thiết bị / mã máy áp dụng.
  String? get deviceCode;
  @override

  /// Số lượng cho 1 máy.
  int? get qtyPerMachine;
  @override

  /// Số lượng tổng (cha và con đều có giá trị riêng, không auto-sum).
  int? get totalQty;
  @override
  String? get note;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$MaterialCategoryItemImplCopyWith<_$MaterialCategoryItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
