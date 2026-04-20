// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lunch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LunchItem _$LunchItemFromJson(Map<String, dynamic> json) {
  return _LunchItem.fromJson(json);
}

/// @nodoc
mixin _$LunchItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateOrder')
  DateTime? get dateOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'RowNumber')
  int? get rowNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  int? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'LocationText')
  String? get locationText => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LunchItemCopyWith<LunchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LunchItemCopyWith<$Res> {
  factory $LunchItemCopyWith(LunchItem value, $Res Function(LunchItem) then) =
      _$LunchItemCopyWithImpl<$Res, LunchItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'DateOrder') DateTime? dateOrder,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'RowNumber') int? rowNumber,
      @JsonKey(name: 'Location') int? location,
      @JsonKey(name: 'LocationText') String? locationText,
      @JsonKey(name: 'EmployeeID') int? employeeId});
}

/// @nodoc
class _$LunchItemCopyWithImpl<$Res, $Val extends LunchItem>
    implements $LunchItemCopyWith<$Res> {
  _$LunchItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? quantity = freezed,
    Object? dateOrder = freezed,
    Object? note = freezed,
    Object? isApproved = freezed,
    Object? rowNumber = freezed,
    Object? location = freezed,
    Object? locationText = freezed,
    Object? employeeId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOrder: freezed == dateOrder
          ? _value.dateOrder
          : dateOrder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      rowNumber: freezed == rowNumber
          ? _value.rowNumber
          : rowNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
      locationText: freezed == locationText
          ? _value.locationText
          : locationText // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LunchItemImplCopyWith<$Res>
    implements $LunchItemCopyWith<$Res> {
  factory _$$LunchItemImplCopyWith(
          _$LunchItemImpl value, $Res Function(_$LunchItemImpl) then) =
      __$$LunchItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'DateOrder') DateTime? dateOrder,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'RowNumber') int? rowNumber,
      @JsonKey(name: 'Location') int? location,
      @JsonKey(name: 'LocationText') String? locationText,
      @JsonKey(name: 'EmployeeID') int? employeeId});
}

/// @nodoc
class __$$LunchItemImplCopyWithImpl<$Res>
    extends _$LunchItemCopyWithImpl<$Res, _$LunchItemImpl>
    implements _$$LunchItemImplCopyWith<$Res> {
  __$$LunchItemImplCopyWithImpl(
      _$LunchItemImpl _value, $Res Function(_$LunchItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? quantity = freezed,
    Object? dateOrder = freezed,
    Object? note = freezed,
    Object? isApproved = freezed,
    Object? rowNumber = freezed,
    Object? location = freezed,
    Object? locationText = freezed,
    Object? employeeId = freezed,
  }) {
    return _then(_$LunchItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOrder: freezed == dateOrder
          ? _value.dateOrder
          : dateOrder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      rowNumber: freezed == rowNumber
          ? _value.rowNumber
          : rowNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
      locationText: freezed == locationText
          ? _value.locationText
          : locationText // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LunchItemImpl implements _LunchItem {
  const _$LunchItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'Quantity') this.quantity,
      @JsonKey(name: 'DateOrder') this.dateOrder,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'RowNumber') this.rowNumber,
      @JsonKey(name: 'Location') this.location,
      @JsonKey(name: 'LocationText') this.locationText,
      @JsonKey(name: 'EmployeeID') this.employeeId});

  factory _$LunchItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LunchItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'Quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'DateOrder')
  final DateTime? dateOrder;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsApproved')
  final bool? isApproved;
  @override
  @JsonKey(name: 'RowNumber')
  final int? rowNumber;
  @override
  @JsonKey(name: 'Location')
  final int? location;
  @override
  @JsonKey(name: 'LocationText')
  final String? locationText;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;

  @override
  String toString() {
    return 'LunchItem(id: $id, code: $code, fullName: $fullName, quantity: $quantity, dateOrder: $dateOrder, note: $note, isApproved: $isApproved, rowNumber: $rowNumber, location: $location, locationText: $locationText, employeeId: $employeeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LunchItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.dateOrder, dateOrder) ||
                other.dateOrder == dateOrder) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.rowNumber, rowNumber) ||
                other.rowNumber == rowNumber) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locationText, locationText) ||
                other.locationText == locationText) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      fullName,
      quantity,
      dateOrder,
      note,
      isApproved,
      rowNumber,
      location,
      locationText,
      employeeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LunchItemImplCopyWith<_$LunchItemImpl> get copyWith =>
      __$$LunchItemImplCopyWithImpl<_$LunchItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LunchItemImplToJson(
      this,
    );
  }
}

abstract class _LunchItem implements LunchItem {
  const factory _LunchItem(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'FullName') final String? fullName,
      @JsonKey(name: 'Quantity') final int? quantity,
      @JsonKey(name: 'DateOrder') final DateTime? dateOrder,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'IsApproved') final bool? isApproved,
      @JsonKey(name: 'RowNumber') final int? rowNumber,
      @JsonKey(name: 'Location') final int? location,
      @JsonKey(name: 'LocationText') final String? locationText,
      @JsonKey(name: 'EmployeeID') final int? employeeId}) = _$LunchItemImpl;

  factory _LunchItem.fromJson(Map<String, dynamic> json) =
      _$LunchItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'Quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'DateOrder')
  DateTime? get dateOrder;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsApproved')
  bool? get isApproved;
  @override
  @JsonKey(name: 'RowNumber')
  int? get rowNumber;
  @override
  @JsonKey(name: 'Location')
  int? get location;
  @override
  @JsonKey(name: 'LocationText')
  String? get locationText;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(ignore: true)
  _$$LunchItemImplCopyWith<_$LunchItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaveLunchItem _$SaveLunchItemFromJson(Map<String, dynamic> json) {
  return _SaveLunchItem.fromJson(json);
}

/// @nodoc
mixin _$SaveLunchItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateOrder')
  DateTime? get dateOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'DecilineApprove')
  int? get decilineApprove => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  int? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaveLunchItemCopyWith<SaveLunchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveLunchItemCopyWith<$Res> {
  factory $SaveLunchItemCopyWith(
          SaveLunchItem value, $Res Function(SaveLunchItem) then) =
      _$SaveLunchItemCopyWithImpl<$Res, SaveLunchItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'DateOrder') DateTime? dateOrder,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'DecilineApprove') int? decilineApprove,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'Location') int? location});
}

/// @nodoc
class _$SaveLunchItemCopyWithImpl<$Res, $Val extends SaveLunchItem>
    implements $SaveLunchItemCopyWith<$Res> {
  _$SaveLunchItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = freezed,
    Object? quantity = freezed,
    Object? dateOrder = freezed,
    Object? note = freezed,
    Object? isApproved = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? decilineApprove = freezed,
    Object? reasonDeciline = freezed,
    Object? isDeleted = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOrder: freezed == dateOrder
          ? _value.dateOrder
          : dateOrder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      decilineApprove: freezed == decilineApprove
          ? _value.decilineApprove
          : decilineApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveLunchItemImplCopyWith<$Res>
    implements $SaveLunchItemCopyWith<$Res> {
  factory _$$SaveLunchItemImplCopyWith(
          _$SaveLunchItemImpl value, $Res Function(_$SaveLunchItemImpl) then) =
      __$$SaveLunchItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'DateOrder') DateTime? dateOrder,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'DecilineApprove') int? decilineApprove,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'Location') int? location});
}

/// @nodoc
class __$$SaveLunchItemImplCopyWithImpl<$Res>
    extends _$SaveLunchItemCopyWithImpl<$Res, _$SaveLunchItemImpl>
    implements _$$SaveLunchItemImplCopyWith<$Res> {
  __$$SaveLunchItemImplCopyWithImpl(
      _$SaveLunchItemImpl _value, $Res Function(_$SaveLunchItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = freezed,
    Object? quantity = freezed,
    Object? dateOrder = freezed,
    Object? note = freezed,
    Object? isApproved = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? decilineApprove = freezed,
    Object? reasonDeciline = freezed,
    Object? isDeleted = freezed,
    Object? location = freezed,
  }) {
    return _then(_$SaveLunchItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOrder: freezed == dateOrder
          ? _value.dateOrder
          : dateOrder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      decilineApprove: freezed == decilineApprove
          ? _value.decilineApprove
          : decilineApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaveLunchItemImpl implements _SaveLunchItem {
  const _$SaveLunchItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'Quantity') this.quantity,
      @JsonKey(name: 'DateOrder') this.dateOrder,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'DecilineApprove') this.decilineApprove,
      @JsonKey(name: 'ReasonDeciline') this.reasonDeciline,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'Location') this.location});

  factory _$SaveLunchItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveLunchItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'Quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'DateOrder')
  final DateTime? dateOrder;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsApproved')
  final bool? isApproved;
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
  @JsonKey(name: 'DecilineApprove')
  final int? decilineApprove;
  @override
  @JsonKey(name: 'ReasonDeciline')
  final String? reasonDeciline;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'Location')
  final int? location;

  @override
  String toString() {
    return 'SaveLunchItem(id: $id, employeeId: $employeeId, quantity: $quantity, dateOrder: $dateOrder, note: $note, isApproved: $isApproved, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, decilineApprove: $decilineApprove, reasonDeciline: $reasonDeciline, isDeleted: $isDeleted, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveLunchItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.dateOrder, dateOrder) ||
                other.dateOrder == dateOrder) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.decilineApprove, decilineApprove) ||
                other.decilineApprove == decilineApprove) &&
            (identical(other.reasonDeciline, reasonDeciline) ||
                other.reasonDeciline == reasonDeciline) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      employeeId,
      quantity,
      dateOrder,
      note,
      isApproved,
      createdDate,
      createdBy,
      updatedDate,
      updatedBy,
      decilineApprove,
      reasonDeciline,
      isDeleted,
      location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveLunchItemImplCopyWith<_$SaveLunchItemImpl> get copyWith =>
      __$$SaveLunchItemImplCopyWithImpl<_$SaveLunchItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveLunchItemImplToJson(
      this,
    );
  }
}

abstract class _SaveLunchItem implements SaveLunchItem {
  const factory _SaveLunchItem(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'Quantity') final int? quantity,
      @JsonKey(name: 'DateOrder') final DateTime? dateOrder,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'IsApproved') final bool? isApproved,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'DecilineApprove') final int? decilineApprove,
      @JsonKey(name: 'ReasonDeciline') final String? reasonDeciline,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted,
      @JsonKey(name: 'Location') final int? location}) = _$SaveLunchItemImpl;

  factory _SaveLunchItem.fromJson(Map<String, dynamic> json) =
      _$SaveLunchItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'Quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'DateOrder')
  DateTime? get dateOrder;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsApproved')
  bool? get isApproved;
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
  @JsonKey(name: 'DecilineApprove')
  int? get decilineApprove;
  @override
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'Location')
  int? get location;
  @override
  @JsonKey(ignore: true)
  _$$SaveLunchItemImplCopyWith<_$SaveLunchItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
