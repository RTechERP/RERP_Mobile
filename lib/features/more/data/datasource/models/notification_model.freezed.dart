// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypeNotiItem _$TypeNotiItemFromJson(Map<String, dynamic> json) {
  return _TypeNotiItem.fromJson(json);
}

/// @nodoc
mixin _$TypeNotiItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeName')
  String get typeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsSelected')
  bool get isSelected => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeLinkID')
  int get typeLinkId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserID')
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeNotiItemCopyWith<TypeNotiItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeNotiItemCopyWith<$Res> {
  factory $TypeNotiItemCopyWith(
          TypeNotiItem value, $Res Function(TypeNotiItem) then) =
      _$TypeNotiItemCopyWithImpl<$Res, TypeNotiItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'TypeName') String typeName,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool isDeleted,
      @JsonKey(name: 'IsSelected') bool isSelected,
      @JsonKey(name: 'TypeLinkID') int typeLinkId,
      @JsonKey(name: 'UserID') int userId});
}

/// @nodoc
class _$TypeNotiItemCopyWithImpl<$Res, $Val extends TypeNotiItem>
    implements $TypeNotiItemCopyWith<$Res> {
  _$TypeNotiItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? typeName = null,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = null,
    Object? isSelected = null,
    Object? typeLinkId = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      typeLinkId: null == typeLinkId
          ? _value.typeLinkId
          : typeLinkId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeNotiItemImplCopyWith<$Res>
    implements $TypeNotiItemCopyWith<$Res> {
  factory _$$TypeNotiItemImplCopyWith(
          _$TypeNotiItemImpl value, $Res Function(_$TypeNotiItemImpl) then) =
      __$$TypeNotiItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'TypeName') String typeName,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool isDeleted,
      @JsonKey(name: 'IsSelected') bool isSelected,
      @JsonKey(name: 'TypeLinkID') int typeLinkId,
      @JsonKey(name: 'UserID') int userId});
}

/// @nodoc
class __$$TypeNotiItemImplCopyWithImpl<$Res>
    extends _$TypeNotiItemCopyWithImpl<$Res, _$TypeNotiItemImpl>
    implements _$$TypeNotiItemImplCopyWith<$Res> {
  __$$TypeNotiItemImplCopyWithImpl(
      _$TypeNotiItemImpl _value, $Res Function(_$TypeNotiItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? typeName = null,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = null,
    Object? isSelected = null,
    Object? typeLinkId = null,
    Object? userId = null,
  }) {
    return _then(_$TypeNotiItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      typeLinkId: null == typeLinkId
          ? _value.typeLinkId
          : typeLinkId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeNotiItemImpl implements _TypeNotiItem {
  const _$TypeNotiItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'TypeName') required this.typeName,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'IsDeleted') required this.isDeleted,
      @JsonKey(name: 'IsSelected') required this.isSelected,
      @JsonKey(name: 'TypeLinkID') required this.typeLinkId,
      @JsonKey(name: 'UserID') required this.userId});

  factory _$TypeNotiItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeNotiItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'TypeName')
  final String typeName;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime? updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool isDeleted;
  @override
  @JsonKey(name: 'IsSelected')
  final bool isSelected;
  @override
  @JsonKey(name: 'TypeLinkID')
  final int typeLinkId;
  @override
  @JsonKey(name: 'UserID')
  final int userId;

  @override
  String toString() {
    return 'TypeNotiItem(id: $id, typeName: $typeName, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, isDeleted: $isDeleted, isSelected: $isSelected, typeLinkId: $typeLinkId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeNotiItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.typeLinkId, typeLinkId) ||
                other.typeLinkId == typeLinkId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      typeName,
      createdDate,
      createdBy,
      updatedDate,
      updatedBy,
      isDeleted,
      isSelected,
      typeLinkId,
      userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeNotiItemImplCopyWith<_$TypeNotiItemImpl> get copyWith =>
      __$$TypeNotiItemImplCopyWithImpl<_$TypeNotiItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeNotiItemImplToJson(
      this,
    );
  }
}

abstract class _TypeNotiItem implements TypeNotiItem {
  const factory _TypeNotiItem(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'TypeName') required final String typeName,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'IsDeleted') required final bool isDeleted,
      @JsonKey(name: 'IsSelected') required final bool isSelected,
      @JsonKey(name: 'TypeLinkID') required final int typeLinkId,
      @JsonKey(name: 'UserID') required final int userId}) = _$TypeNotiItemImpl;

  factory _TypeNotiItem.fromJson(Map<String, dynamic> json) =
      _$TypeNotiItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'TypeName')
  String get typeName;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  bool get isDeleted;
  @override
  @JsonKey(name: 'IsSelected')
  bool get isSelected;
  @override
  @JsonKey(name: 'TypeLinkID')
  int get typeLinkId;
  @override
  @JsonKey(name: 'UserID')
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$TypeNotiItemImplCopyWith<_$TypeNotiItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
