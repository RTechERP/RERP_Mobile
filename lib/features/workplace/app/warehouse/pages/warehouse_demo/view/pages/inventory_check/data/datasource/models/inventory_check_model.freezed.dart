// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_check_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryCheckEmployee _$InventoryCheckEmployeeFromJson(
    Map<String, dynamic> json) {
  return _InventoryCheckEmployee.fromJson(json);
}

/// @nodoc
mixin _$InventoryCheckEmployee {
  /// Id nhân viên (khớp với `EmployeeID` của đợt kiểm kê).
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Mã nhân viên (vd. `R0316`).
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;

  /// Họ tên nhân viên.
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryCheckEmployeeCopyWith<InventoryCheckEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCheckEmployeeCopyWith<$Res> {
  factory $InventoryCheckEmployeeCopyWith(InventoryCheckEmployee value,
          $Res Function(InventoryCheckEmployee) then) =
      _$InventoryCheckEmployeeCopyWithImpl<$Res, InventoryCheckEmployee>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName});
}

/// @nodoc
class _$InventoryCheckEmployeeCopyWithImpl<$Res,
        $Val extends InventoryCheckEmployee>
    implements $InventoryCheckEmployeeCopyWith<$Res> {
  _$InventoryCheckEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryCheckEmployeeImplCopyWith<$Res>
    implements $InventoryCheckEmployeeCopyWith<$Res> {
  factory _$$InventoryCheckEmployeeImplCopyWith(
          _$InventoryCheckEmployeeImpl value,
          $Res Function(_$InventoryCheckEmployeeImpl) then) =
      __$$InventoryCheckEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName});
}

/// @nodoc
class __$$InventoryCheckEmployeeImplCopyWithImpl<$Res>
    extends _$InventoryCheckEmployeeCopyWithImpl<$Res,
        _$InventoryCheckEmployeeImpl>
    implements _$$InventoryCheckEmployeeImplCopyWith<$Res> {
  __$$InventoryCheckEmployeeImplCopyWithImpl(
      _$InventoryCheckEmployeeImpl _value,
      $Res Function(_$InventoryCheckEmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_$InventoryCheckEmployeeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryCheckEmployeeImpl implements _InventoryCheckEmployee {
  const _$InventoryCheckEmployeeImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName});

  factory _$InventoryCheckEmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryCheckEmployeeImplFromJson(json);

  /// Id nhân viên (khớp với `EmployeeID` của đợt kiểm kê).
  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// Mã nhân viên (vd. `R0316`).
  @override
  @JsonKey(name: 'Code')
  final String? code;

  /// Họ tên nhân viên.
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;

  @override
  String toString() {
    return 'InventoryCheckEmployee(id: $id, code: $code, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCheckEmployeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryCheckEmployeeImplCopyWith<_$InventoryCheckEmployeeImpl>
      get copyWith => __$$InventoryCheckEmployeeImplCopyWithImpl<
          _$InventoryCheckEmployeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCheckEmployeeImplToJson(
      this,
    );
  }
}

abstract class _InventoryCheckEmployee implements InventoryCheckEmployee {
  const factory _InventoryCheckEmployee(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'FullName') final String? fullName}) =
      _$InventoryCheckEmployeeImpl;

  factory _InventoryCheckEmployee.fromJson(Map<String, dynamic> json) =
      _$InventoryCheckEmployeeImpl.fromJson;

  @override

  /// Id nhân viên (khớp với `EmployeeID` của đợt kiểm kê).
  @JsonKey(name: 'ID')
  int? get id;
  @override

  /// Mã nhân viên (vd. `R0316`).
  @JsonKey(name: 'Code')
  String? get code;
  @override

  /// Họ tên nhân viên.
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(ignore: true)
  _$$InventoryCheckEmployeeImplCopyWith<_$InventoryCheckEmployeeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryCountItem _$InventoryCountItemFromJson(Map<String, dynamic> json) {
  return _InventoryCountItem.fromJson(json);
}

/// @nodoc
mixin _$InventoryCountItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Mã đợt kiểm kê (vd. `KiemKe_20261018_01`).
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;

  /// Tên đợt kiểm kê (vd. `Đợt kiểm kê ngày 18/10/2026`).
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;

  /// Id kho thực hiện kiểm kê (1 = Kho Demo, 2 = Kho Modula, 3 = Kho AGV).
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId => throw _privateConstructorUsedError;

  /// Tên kho.
  @JsonKey(name: 'WarehouseName')
  String? get warehouseName => throw _privateConstructorUsedError;

  /// Id nhân viên kiểm kê.
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;

  /// Họ tên nhân viên kiểm kê.
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;

  /// Mã nhân viên kiểm kê.
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode => throw _privateConstructorUsedError;

  /// Thời điểm kiểm kê (ISO `yyyy-MM-ddTHH:mm:ss`).
  @JsonKey(name: 'DateCount')
  String? get dateCount => throw _privateConstructorUsedError;

  /// Ghi chú của đợt kiểm kê.
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  /// Đợt kiểm kê đã hoàn thành hay chưa.
  @JsonKey(name: 'IsComplete')
  bool? get isComplete => throw _privateConstructorUsedError;

  /// Tổng số sản phẩm đã kiểm kê.
  @JsonKey(name: 'TotalItems')
  int? get totalItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryCountItemCopyWith<InventoryCountItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCountItemCopyWith<$Res> {
  factory $InventoryCountItemCopyWith(
          InventoryCountItem value, $Res Function(InventoryCountItem) then) =
      _$InventoryCountItemCopyWithImpl<$Res, InventoryCountItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'WarehouseName') String? warehouseName,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'EmployeeCode') String? employeeCode,
      @JsonKey(name: 'DateCount') String? dateCount,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsComplete') bool? isComplete,
      @JsonKey(name: 'TotalItems') int? totalItems});
}

/// @nodoc
class _$InventoryCountItemCopyWithImpl<$Res, $Val extends InventoryCountItem>
    implements $InventoryCountItemCopyWith<$Res> {
  _$InventoryCountItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? warehouseId = freezed,
    Object? warehouseName = freezed,
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? employeeCode = freezed,
    Object? dateCount = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? isComplete = freezed,
    Object? totalItems = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseName: freezed == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCount: freezed == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalItems: freezed == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryCountItemImplCopyWith<$Res>
    implements $InventoryCountItemCopyWith<$Res> {
  factory _$$InventoryCountItemImplCopyWith(_$InventoryCountItemImpl value,
          $Res Function(_$InventoryCountItemImpl) then) =
      __$$InventoryCountItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'WarehouseName') String? warehouseName,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'EmployeeCode') String? employeeCode,
      @JsonKey(name: 'DateCount') String? dateCount,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsComplete') bool? isComplete,
      @JsonKey(name: 'TotalItems') int? totalItems});
}

/// @nodoc
class __$$InventoryCountItemImplCopyWithImpl<$Res>
    extends _$InventoryCountItemCopyWithImpl<$Res, _$InventoryCountItemImpl>
    implements _$$InventoryCountItemImplCopyWith<$Res> {
  __$$InventoryCountItemImplCopyWithImpl(_$InventoryCountItemImpl _value,
      $Res Function(_$InventoryCountItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? warehouseId = freezed,
    Object? warehouseName = freezed,
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? employeeCode = freezed,
    Object? dateCount = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? isComplete = freezed,
    Object? totalItems = freezed,
  }) {
    return _then(_$InventoryCountItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseName: freezed == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCount: freezed == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalItems: freezed == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryCountItemImpl implements _InventoryCountItem {
  const _$InventoryCountItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'WarehouseID') this.warehouseId,
      @JsonKey(name: 'WarehouseName') this.warehouseName,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'EmployeeCode') this.employeeCode,
      @JsonKey(name: 'DateCount') this.dateCount,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'IsComplete') this.isComplete,
      @JsonKey(name: 'TotalItems') this.totalItems});

  factory _$InventoryCountItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryCountItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// Mã đợt kiểm kê (vd. `KiemKe_20261018_01`).
  @override
  @JsonKey(name: 'Code')
  final String? code;

  /// Tên đợt kiểm kê (vd. `Đợt kiểm kê ngày 18/10/2026`).
  @override
  @JsonKey(name: 'Name')
  final String? name;

  /// Id kho thực hiện kiểm kê (1 = Kho Demo, 2 = Kho Modula, 3 = Kho AGV).
  @override
  @JsonKey(name: 'WarehouseID')
  final int? warehouseId;

  /// Tên kho.
  @override
  @JsonKey(name: 'WarehouseName')
  final String? warehouseName;

  /// Id nhân viên kiểm kê.
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;

  /// Họ tên nhân viên kiểm kê.
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;

  /// Mã nhân viên kiểm kê.
  @override
  @JsonKey(name: 'EmployeeCode')
  final String? employeeCode;

  /// Thời điểm kiểm kê (ISO `yyyy-MM-ddTHH:mm:ss`).
  @override
  @JsonKey(name: 'DateCount')
  final String? dateCount;

  /// Ghi chú của đợt kiểm kê.
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  /// Đợt kiểm kê đã hoàn thành hay chưa.
  @override
  @JsonKey(name: 'IsComplete')
  final bool? isComplete;

  /// Tổng số sản phẩm đã kiểm kê.
  @override
  @JsonKey(name: 'TotalItems')
  final int? totalItems;

  @override
  String toString() {
    return 'InventoryCountItem(id: $id, code: $code, name: $name, warehouseId: $warehouseId, warehouseName: $warehouseName, employeeId: $employeeId, employeeName: $employeeName, employeeCode: $employeeCode, dateCount: $dateCount, note: $note, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, isDeleted: $isDeleted, isComplete: $isComplete, totalItems: $totalItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCountItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeeCode, employeeCode) ||
                other.employeeCode == employeeCode) &&
            (identical(other.dateCount, dateCount) ||
                other.dateCount == dateCount) &&
            (identical(other.note, note) || other.note == note) &&
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
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      warehouseId,
      warehouseName,
      employeeId,
      employeeName,
      employeeCode,
      dateCount,
      note,
      createdDate,
      createdBy,
      updatedDate,
      updatedBy,
      isDeleted,
      isComplete,
      totalItems);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryCountItemImplCopyWith<_$InventoryCountItemImpl> get copyWith =>
      __$$InventoryCountItemImplCopyWithImpl<_$InventoryCountItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCountItemImplToJson(
      this,
    );
  }
}

abstract class _InventoryCountItem implements InventoryCountItem {
  const factory _InventoryCountItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'WarehouseID') final int? warehouseId,
          @JsonKey(name: 'WarehouseName') final String? warehouseName,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'EmployeeName') final String? employeeName,
          @JsonKey(name: 'EmployeeCode') final String? employeeCode,
          @JsonKey(name: 'DateCount') final String? dateCount,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'IsComplete') final bool? isComplete,
          @JsonKey(name: 'TotalItems') final int? totalItems}) =
      _$InventoryCountItemImpl;

  factory _InventoryCountItem.fromJson(Map<String, dynamic> json) =
      _$InventoryCountItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override

  /// Mã đợt kiểm kê (vd. `KiemKe_20261018_01`).
  @JsonKey(name: 'Code')
  String? get code;
  @override

  /// Tên đợt kiểm kê (vd. `Đợt kiểm kê ngày 18/10/2026`).
  @JsonKey(name: 'Name')
  String? get name;
  @override

  /// Id kho thực hiện kiểm kê (1 = Kho Demo, 2 = Kho Modula, 3 = Kho AGV).
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId;
  @override

  /// Tên kho.
  @JsonKey(name: 'WarehouseName')
  String? get warehouseName;
  @override

  /// Id nhân viên kiểm kê.
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override

  /// Họ tên nhân viên kiểm kê.
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override

  /// Mã nhân viên kiểm kê.
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode;
  @override

  /// Thời điểm kiểm kê (ISO `yyyy-MM-ddTHH:mm:ss`).
  @JsonKey(name: 'DateCount')
  String? get dateCount;
  @override

  /// Ghi chú của đợt kiểm kê.
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override

  /// Đợt kiểm kê đã hoàn thành hay chưa.
  @JsonKey(name: 'IsComplete')
  bool? get isComplete;
  @override

  /// Tổng số sản phẩm đã kiểm kê.
  @JsonKey(name: 'TotalItems')
  int? get totalItems;
  @override
  @JsonKey(ignore: true)
  _$$InventoryCountItemImplCopyWith<_$InventoryCountItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryCountSavePayload _$InventoryCountSavePayloadFromJson(
    Map<String, dynamic> json) {
  return _InventoryCountSavePayload.fromJson(json);
}

/// @nodoc
mixin _$InventoryCountSavePayload {
  /// Id đợt kiểm kê — 0 khi tạo mới.
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;

  /// Mã đợt kiểm kê (sinh từ API `generate-code`).
  @JsonKey(name: 'Code')
  String get code => throw _privateConstructorUsedError;

  /// Tên đợt kiểm kê.
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;

  /// Id kho thực hiện kiểm kê (1 = Kho Demo, 2 = Kho Modula, 3 = Kho AGV).
  @JsonKey(name: 'WarehouseID')
  int get warehouseId => throw _privateConstructorUsedError;

  /// Id nhân viên kiểm kê.
  @JsonKey(name: 'EmployeeID')
  int get employeeId => throw _privateConstructorUsedError;

  /// Thời điểm kiểm kê (ISO).
  @JsonKey(name: 'DateCount')
  String get dateCount => throw _privateConstructorUsedError;

  /// Ghi chú của đợt kiểm kê.
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;

  /// Đợt kiểm kê đã hoàn thành hay chưa.
  @JsonKey(name: 'IsComplete')
  bool get isComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryCountSavePayloadCopyWith<InventoryCountSavePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCountSavePayloadCopyWith<$Res> {
  factory $InventoryCountSavePayloadCopyWith(InventoryCountSavePayload value,
          $Res Function(InventoryCountSavePayload) then) =
      _$InventoryCountSavePayloadCopyWithImpl<$Res, InventoryCountSavePayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'WarehouseID') int warehouseId,
      @JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'DateCount') String dateCount,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsComplete') bool isComplete});
}

/// @nodoc
class _$InventoryCountSavePayloadCopyWithImpl<$Res,
        $Val extends InventoryCountSavePayload>
    implements $InventoryCountSavePayloadCopyWith<$Res> {
  _$InventoryCountSavePayloadCopyWithImpl(this._value, this._then);

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
    Object? warehouseId = null,
    Object? employeeId = null,
    Object? dateCount = null,
    Object? note = freezed,
    Object? isComplete = null,
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
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      dateCount: null == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryCountSavePayloadImplCopyWith<$Res>
    implements $InventoryCountSavePayloadCopyWith<$Res> {
  factory _$$InventoryCountSavePayloadImplCopyWith(
          _$InventoryCountSavePayloadImpl value,
          $Res Function(_$InventoryCountSavePayloadImpl) then) =
      __$$InventoryCountSavePayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'WarehouseID') int warehouseId,
      @JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'DateCount') String dateCount,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsComplete') bool isComplete});
}

/// @nodoc
class __$$InventoryCountSavePayloadImplCopyWithImpl<$Res>
    extends _$InventoryCountSavePayloadCopyWithImpl<$Res,
        _$InventoryCountSavePayloadImpl>
    implements _$$InventoryCountSavePayloadImplCopyWith<$Res> {
  __$$InventoryCountSavePayloadImplCopyWithImpl(
      _$InventoryCountSavePayloadImpl _value,
      $Res Function(_$InventoryCountSavePayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? warehouseId = null,
    Object? employeeId = null,
    Object? dateCount = null,
    Object? note = freezed,
    Object? isComplete = null,
  }) {
    return _then(_$InventoryCountSavePayloadImpl(
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
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      dateCount: null == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryCountSavePayloadImpl implements _InventoryCountSavePayload {
  const _$InventoryCountSavePayloadImpl(
      {@JsonKey(name: 'ID') this.id = 0,
      @JsonKey(name: 'Code') required this.code,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'WarehouseID') required this.warehouseId,
      @JsonKey(name: 'EmployeeID') required this.employeeId,
      @JsonKey(name: 'DateCount') required this.dateCount,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsComplete') this.isComplete = false});

  factory _$InventoryCountSavePayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryCountSavePayloadImplFromJson(json);

  /// Id đợt kiểm kê — 0 khi tạo mới.
  @override
  @JsonKey(name: 'ID')
  final int id;

  /// Mã đợt kiểm kê (sinh từ API `generate-code`).
  @override
  @JsonKey(name: 'Code')
  final String code;

  /// Tên đợt kiểm kê.
  @override
  @JsonKey(name: 'Name')
  final String name;

  /// Id kho thực hiện kiểm kê (1 = Kho Demo, 2 = Kho Modula, 3 = Kho AGV).
  @override
  @JsonKey(name: 'WarehouseID')
  final int warehouseId;

  /// Id nhân viên kiểm kê.
  @override
  @JsonKey(name: 'EmployeeID')
  final int employeeId;

  /// Thời điểm kiểm kê (ISO).
  @override
  @JsonKey(name: 'DateCount')
  final String dateCount;

  /// Ghi chú của đợt kiểm kê.
  @override
  @JsonKey(name: 'Note')
  final String? note;

  /// Đợt kiểm kê đã hoàn thành hay chưa.
  @override
  @JsonKey(name: 'IsComplete')
  final bool isComplete;

  @override
  String toString() {
    return 'InventoryCountSavePayload(id: $id, code: $code, name: $name, warehouseId: $warehouseId, employeeId: $employeeId, dateCount: $dateCount, note: $note, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCountSavePayloadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.dateCount, dateCount) ||
                other.dateCount == dateCount) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, warehouseId,
      employeeId, dateCount, note, isComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryCountSavePayloadImplCopyWith<_$InventoryCountSavePayloadImpl>
      get copyWith => __$$InventoryCountSavePayloadImplCopyWithImpl<
          _$InventoryCountSavePayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCountSavePayloadImplToJson(
      this,
    );
  }
}

abstract class _InventoryCountSavePayload implements InventoryCountSavePayload {
  const factory _InventoryCountSavePayload(
          {@JsonKey(name: 'ID') final int id,
          @JsonKey(name: 'Code') required final String code,
          @JsonKey(name: 'Name') required final String name,
          @JsonKey(name: 'WarehouseID') required final int warehouseId,
          @JsonKey(name: 'EmployeeID') required final int employeeId,
          @JsonKey(name: 'DateCount') required final String dateCount,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'IsComplete') final bool isComplete}) =
      _$InventoryCountSavePayloadImpl;

  factory _InventoryCountSavePayload.fromJson(Map<String, dynamic> json) =
      _$InventoryCountSavePayloadImpl.fromJson;

  @override

  /// Id đợt kiểm kê — 0 khi tạo mới.
  @JsonKey(name: 'ID')
  int get id;
  @override

  /// Mã đợt kiểm kê (sinh từ API `generate-code`).
  @JsonKey(name: 'Code')
  String get code;
  @override

  /// Tên đợt kiểm kê.
  @JsonKey(name: 'Name')
  String get name;
  @override

  /// Id kho thực hiện kiểm kê (1 = Kho Demo, 2 = Kho Modula, 3 = Kho AGV).
  @JsonKey(name: 'WarehouseID')
  int get warehouseId;
  @override

  /// Id nhân viên kiểm kê.
  @JsonKey(name: 'EmployeeID')
  int get employeeId;
  @override

  /// Thời điểm kiểm kê (ISO).
  @JsonKey(name: 'DateCount')
  String get dateCount;
  @override

  /// Ghi chú của đợt kiểm kê.
  @JsonKey(name: 'Note')
  String? get note;
  @override

  /// Đợt kiểm kê đã hoàn thành hay chưa.
  @JsonKey(name: 'IsComplete')
  bool get isComplete;
  @override
  @JsonKey(ignore: true)
  _$$InventoryCountSavePayloadImplCopyWith<_$InventoryCountSavePayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryCountSaveResult _$InventoryCountSaveResultFromJson(
    Map<String, dynamic> json) {
  return _InventoryCountSaveResult.fromJson(json);
}

/// @nodoc
mixin _$InventoryCountSaveResult {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateCount')
  String? get dateCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsComplete')
  bool? get isComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryCountSaveResultCopyWith<InventoryCountSaveResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCountSaveResultCopyWith<$Res> {
  factory $InventoryCountSaveResultCopyWith(InventoryCountSaveResult value,
          $Res Function(InventoryCountSaveResult) then) =
      _$InventoryCountSaveResultCopyWithImpl<$Res, InventoryCountSaveResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DateCount') String? dateCount,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsComplete') bool? isComplete});
}

/// @nodoc
class _$InventoryCountSaveResultCopyWithImpl<$Res,
        $Val extends InventoryCountSaveResult>
    implements $InventoryCountSaveResultCopyWith<$Res> {
  _$InventoryCountSaveResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? warehouseId = freezed,
    Object? employeeId = freezed,
    Object? dateCount = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? isComplete = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateCount: freezed == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryCountSaveResultImplCopyWith<$Res>
    implements $InventoryCountSaveResultCopyWith<$Res> {
  factory _$$InventoryCountSaveResultImplCopyWith(
          _$InventoryCountSaveResultImpl value,
          $Res Function(_$InventoryCountSaveResultImpl) then) =
      __$$InventoryCountSaveResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DateCount') String? dateCount,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsComplete') bool? isComplete});
}

/// @nodoc
class __$$InventoryCountSaveResultImplCopyWithImpl<$Res>
    extends _$InventoryCountSaveResultCopyWithImpl<$Res,
        _$InventoryCountSaveResultImpl>
    implements _$$InventoryCountSaveResultImplCopyWith<$Res> {
  __$$InventoryCountSaveResultImplCopyWithImpl(
      _$InventoryCountSaveResultImpl _value,
      $Res Function(_$InventoryCountSaveResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? warehouseId = freezed,
    Object? employeeId = freezed,
    Object? dateCount = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? isComplete = freezed,
  }) {
    return _then(_$InventoryCountSaveResultImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateCount: freezed == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryCountSaveResultImpl implements _InventoryCountSaveResult {
  const _$InventoryCountSaveResultImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'WarehouseID') this.warehouseId,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'DateCount') this.dateCount,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'IsComplete') this.isComplete});

  factory _$InventoryCountSaveResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryCountSaveResultImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'WarehouseID')
  final int? warehouseId;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'DateCount')
  final String? dateCount;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'IsComplete')
  final bool? isComplete;

  @override
  String toString() {
    return 'InventoryCountSaveResult(id: $id, code: $code, name: $name, warehouseId: $warehouseId, employeeId: $employeeId, dateCount: $dateCount, note: $note, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, isDeleted: $isDeleted, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCountSaveResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.dateCount, dateCount) ||
                other.dateCount == dateCount) &&
            (identical(other.note, note) || other.note == note) &&
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
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      warehouseId,
      employeeId,
      dateCount,
      note,
      createdDate,
      createdBy,
      updatedDate,
      updatedBy,
      isDeleted,
      isComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryCountSaveResultImplCopyWith<_$InventoryCountSaveResultImpl>
      get copyWith => __$$InventoryCountSaveResultImplCopyWithImpl<
          _$InventoryCountSaveResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCountSaveResultImplToJson(
      this,
    );
  }
}

abstract class _InventoryCountSaveResult implements InventoryCountSaveResult {
  const factory _InventoryCountSaveResult(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'WarehouseID') final int? warehouseId,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'DateCount') final String? dateCount,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'IsComplete') final bool? isComplete}) =
      _$InventoryCountSaveResultImpl;

  factory _InventoryCountSaveResult.fromJson(Map<String, dynamic> json) =
      _$InventoryCountSaveResultImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'DateCount')
  String? get dateCount;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'IsComplete')
  bool? get isComplete;
  @override
  @JsonKey(ignore: true)
  _$$InventoryCountSaveResultImplCopyWith<_$InventoryCountSaveResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryCountDetail _$InventoryCountDetailFromJson(Map<String, dynamic> json) {
  return _InventoryCountDetail.fromJson(json);
}

/// @nodoc
mixin _$InventoryCountDetail {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateCount')
  String? get dateCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsComplete')
  bool? get isComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryCountDetailCopyWith<InventoryCountDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCountDetailCopyWith<$Res> {
  factory $InventoryCountDetailCopyWith(InventoryCountDetail value,
          $Res Function(InventoryCountDetail) then) =
      _$InventoryCountDetailCopyWithImpl<$Res, InventoryCountDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DateCount') String? dateCount,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsComplete') bool? isComplete});
}

/// @nodoc
class _$InventoryCountDetailCopyWithImpl<$Res,
        $Val extends InventoryCountDetail>
    implements $InventoryCountDetailCopyWith<$Res> {
  _$InventoryCountDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? warehouseId = freezed,
    Object? employeeId = freezed,
    Object? dateCount = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? isComplete = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateCount: freezed == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryCountDetailImplCopyWith<$Res>
    implements $InventoryCountDetailCopyWith<$Res> {
  factory _$$InventoryCountDetailImplCopyWith(_$InventoryCountDetailImpl value,
          $Res Function(_$InventoryCountDetailImpl) then) =
      __$$InventoryCountDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DateCount') String? dateCount,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsComplete') bool? isComplete});
}

/// @nodoc
class __$$InventoryCountDetailImplCopyWithImpl<$Res>
    extends _$InventoryCountDetailCopyWithImpl<$Res, _$InventoryCountDetailImpl>
    implements _$$InventoryCountDetailImplCopyWith<$Res> {
  __$$InventoryCountDetailImplCopyWithImpl(_$InventoryCountDetailImpl _value,
      $Res Function(_$InventoryCountDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? warehouseId = freezed,
    Object? employeeId = freezed,
    Object? dateCount = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? isComplete = freezed,
  }) {
    return _then(_$InventoryCountDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateCount: freezed == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryCountDetailImpl implements _InventoryCountDetail {
  const _$InventoryCountDetailImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'WarehouseID') this.warehouseId,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'DateCount') this.dateCount,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'IsComplete') this.isComplete});

  factory _$InventoryCountDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryCountDetailImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'WarehouseID')
  final int? warehouseId;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'DateCount')
  final String? dateCount;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'IsComplete')
  final bool? isComplete;

  @override
  String toString() {
    return 'InventoryCountDetail(id: $id, code: $code, name: $name, warehouseId: $warehouseId, employeeId: $employeeId, dateCount: $dateCount, note: $note, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, isDeleted: $isDeleted, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCountDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.dateCount, dateCount) ||
                other.dateCount == dateCount) &&
            (identical(other.note, note) || other.note == note) &&
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
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      warehouseId,
      employeeId,
      dateCount,
      note,
      createdDate,
      createdBy,
      updatedDate,
      updatedBy,
      isDeleted,
      isComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryCountDetailImplCopyWith<_$InventoryCountDetailImpl>
      get copyWith =>
          __$$InventoryCountDetailImplCopyWithImpl<_$InventoryCountDetailImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCountDetailImplToJson(
      this,
    );
  }
}

abstract class _InventoryCountDetail implements InventoryCountDetail {
  const factory _InventoryCountDetail(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'WarehouseID') final int? warehouseId,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'DateCount') final String? dateCount,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'IsComplete') final bool? isComplete}) =
      _$InventoryCountDetailImpl;

  factory _InventoryCountDetail.fromJson(Map<String, dynamic> json) =
      _$InventoryCountDetailImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'DateCount')
  String? get dateCount;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'IsComplete')
  bool? get isComplete;
  @override
  @JsonKey(ignore: true)
  _$$InventoryCountDetailImplCopyWith<_$InventoryCountDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryCountSheet _$InventoryCountSheetFromJson(Map<String, dynamic> json) {
  return _InventoryCountSheet.fromJson(json);
}

/// @nodoc
mixin _$InventoryCountSheet {
  /// Thông tin đợt kiểm kê.
  @JsonKey(name: 'Master')
  InventoryCountSheetMaster? get master => throw _privateConstructorUsedError;

  /// Danh sách sản phẩm đã kiểm kê.
  @JsonKey(name: 'Items')
  List<InventoryCountSheetItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryCountSheetCopyWith<InventoryCountSheet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCountSheetCopyWith<$Res> {
  factory $InventoryCountSheetCopyWith(
          InventoryCountSheet value, $Res Function(InventoryCountSheet) then) =
      _$InventoryCountSheetCopyWithImpl<$Res, InventoryCountSheet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Master') InventoryCountSheetMaster? master,
      @JsonKey(name: 'Items') List<InventoryCountSheetItem> items});

  $InventoryCountSheetMasterCopyWith<$Res>? get master;
}

/// @nodoc
class _$InventoryCountSheetCopyWithImpl<$Res, $Val extends InventoryCountSheet>
    implements $InventoryCountSheetCopyWith<$Res> {
  _$InventoryCountSheetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? master = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      master: freezed == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as InventoryCountSheetMaster?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InventoryCountSheetItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InventoryCountSheetMasterCopyWith<$Res>? get master {
    if (_value.master == null) {
      return null;
    }

    return $InventoryCountSheetMasterCopyWith<$Res>(_value.master!, (value) {
      return _then(_value.copyWith(master: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InventoryCountSheetImplCopyWith<$Res>
    implements $InventoryCountSheetCopyWith<$Res> {
  factory _$$InventoryCountSheetImplCopyWith(_$InventoryCountSheetImpl value,
          $Res Function(_$InventoryCountSheetImpl) then) =
      __$$InventoryCountSheetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Master') InventoryCountSheetMaster? master,
      @JsonKey(name: 'Items') List<InventoryCountSheetItem> items});

  @override
  $InventoryCountSheetMasterCopyWith<$Res>? get master;
}

/// @nodoc
class __$$InventoryCountSheetImplCopyWithImpl<$Res>
    extends _$InventoryCountSheetCopyWithImpl<$Res, _$InventoryCountSheetImpl>
    implements _$$InventoryCountSheetImplCopyWith<$Res> {
  __$$InventoryCountSheetImplCopyWithImpl(_$InventoryCountSheetImpl _value,
      $Res Function(_$InventoryCountSheetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? master = freezed,
    Object? items = null,
  }) {
    return _then(_$InventoryCountSheetImpl(
      master: freezed == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as InventoryCountSheetMaster?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InventoryCountSheetItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryCountSheetImpl implements _InventoryCountSheet {
  const _$InventoryCountSheetImpl(
      {@JsonKey(name: 'Master') this.master,
      @JsonKey(name: 'Items')
      final List<InventoryCountSheetItem> items = const []})
      : _items = items;

  factory _$InventoryCountSheetImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryCountSheetImplFromJson(json);

  /// Thông tin đợt kiểm kê.
  @override
  @JsonKey(name: 'Master')
  final InventoryCountSheetMaster? master;

  /// Danh sách sản phẩm đã kiểm kê.
  final List<InventoryCountSheetItem> _items;

  /// Danh sách sản phẩm đã kiểm kê.
  @override
  @JsonKey(name: 'Items')
  List<InventoryCountSheetItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'InventoryCountSheet(master: $master, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCountSheetImpl &&
            (identical(other.master, master) || other.master == master) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, master, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryCountSheetImplCopyWith<_$InventoryCountSheetImpl> get copyWith =>
      __$$InventoryCountSheetImplCopyWithImpl<_$InventoryCountSheetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCountSheetImplToJson(
      this,
    );
  }
}

abstract class _InventoryCountSheet implements InventoryCountSheet {
  const factory _InventoryCountSheet(
          {@JsonKey(name: 'Master') final InventoryCountSheetMaster? master,
          @JsonKey(name: 'Items') final List<InventoryCountSheetItem> items}) =
      _$InventoryCountSheetImpl;

  factory _InventoryCountSheet.fromJson(Map<String, dynamic> json) =
      _$InventoryCountSheetImpl.fromJson;

  @override

  /// Thông tin đợt kiểm kê.
  @JsonKey(name: 'Master')
  InventoryCountSheetMaster? get master;
  @override

  /// Danh sách sản phẩm đã kiểm kê.
  @JsonKey(name: 'Items')
  List<InventoryCountSheetItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$InventoryCountSheetImplCopyWith<_$InventoryCountSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryCountSheetMaster _$InventoryCountSheetMasterFromJson(
    Map<String, dynamic> json) {
  return _InventoryCountSheetMaster.fromJson(json);
}

/// @nodoc
mixin _$InventoryCountSheetMaster {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'WarehouseName')
  String? get warehouseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateCount')
  String? get dateCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsComplete')
  bool? get isComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryCountSheetMasterCopyWith<InventoryCountSheetMaster> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCountSheetMasterCopyWith<$Res> {
  factory $InventoryCountSheetMasterCopyWith(InventoryCountSheetMaster value,
          $Res Function(InventoryCountSheetMaster) then) =
      _$InventoryCountSheetMasterCopyWithImpl<$Res, InventoryCountSheetMaster>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'WarehouseName') String? warehouseName,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'EmployeeCode') String? employeeCode,
      @JsonKey(name: 'DateCount') String? dateCount,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsComplete') bool? isComplete});
}

/// @nodoc
class _$InventoryCountSheetMasterCopyWithImpl<$Res,
        $Val extends InventoryCountSheetMaster>
    implements $InventoryCountSheetMasterCopyWith<$Res> {
  _$InventoryCountSheetMasterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? warehouseId = freezed,
    Object? warehouseName = freezed,
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? employeeCode = freezed,
    Object? dateCount = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? isComplete = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseName: freezed == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCount: freezed == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryCountSheetMasterImplCopyWith<$Res>
    implements $InventoryCountSheetMasterCopyWith<$Res> {
  factory _$$InventoryCountSheetMasterImplCopyWith(
          _$InventoryCountSheetMasterImpl value,
          $Res Function(_$InventoryCountSheetMasterImpl) then) =
      __$$InventoryCountSheetMasterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'WarehouseName') String? warehouseName,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'EmployeeCode') String? employeeCode,
      @JsonKey(name: 'DateCount') String? dateCount,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsComplete') bool? isComplete});
}

/// @nodoc
class __$$InventoryCountSheetMasterImplCopyWithImpl<$Res>
    extends _$InventoryCountSheetMasterCopyWithImpl<$Res,
        _$InventoryCountSheetMasterImpl>
    implements _$$InventoryCountSheetMasterImplCopyWith<$Res> {
  __$$InventoryCountSheetMasterImplCopyWithImpl(
      _$InventoryCountSheetMasterImpl _value,
      $Res Function(_$InventoryCountSheetMasterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? warehouseId = freezed,
    Object? warehouseName = freezed,
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? employeeCode = freezed,
    Object? dateCount = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? isComplete = freezed,
  }) {
    return _then(_$InventoryCountSheetMasterImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseName: freezed == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCount: freezed == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryCountSheetMasterImpl implements _InventoryCountSheetMaster {
  const _$InventoryCountSheetMasterImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'WarehouseID') this.warehouseId,
      @JsonKey(name: 'WarehouseName') this.warehouseName,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'EmployeeCode') this.employeeCode,
      @JsonKey(name: 'DateCount') this.dateCount,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'IsComplete') this.isComplete});

  factory _$InventoryCountSheetMasterImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryCountSheetMasterImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'WarehouseID')
  final int? warehouseId;
  @override
  @JsonKey(name: 'WarehouseName')
  final String? warehouseName;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'EmployeeCode')
  final String? employeeCode;
  @override
  @JsonKey(name: 'DateCount')
  final String? dateCount;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'IsComplete')
  final bool? isComplete;

  @override
  String toString() {
    return 'InventoryCountSheetMaster(id: $id, code: $code, name: $name, warehouseId: $warehouseId, warehouseName: $warehouseName, employeeId: $employeeId, employeeName: $employeeName, employeeCode: $employeeCode, dateCount: $dateCount, note: $note, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, isDeleted: $isDeleted, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCountSheetMasterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeeCode, employeeCode) ||
                other.employeeCode == employeeCode) &&
            (identical(other.dateCount, dateCount) ||
                other.dateCount == dateCount) &&
            (identical(other.note, note) || other.note == note) &&
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
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      warehouseId,
      warehouseName,
      employeeId,
      employeeName,
      employeeCode,
      dateCount,
      note,
      createdDate,
      createdBy,
      updatedDate,
      updatedBy,
      isDeleted,
      isComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryCountSheetMasterImplCopyWith<_$InventoryCountSheetMasterImpl>
      get copyWith => __$$InventoryCountSheetMasterImplCopyWithImpl<
          _$InventoryCountSheetMasterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCountSheetMasterImplToJson(
      this,
    );
  }
}

abstract class _InventoryCountSheetMaster implements InventoryCountSheetMaster {
  const factory _InventoryCountSheetMaster(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'WarehouseID') final int? warehouseId,
          @JsonKey(name: 'WarehouseName') final String? warehouseName,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'EmployeeName') final String? employeeName,
          @JsonKey(name: 'EmployeeCode') final String? employeeCode,
          @JsonKey(name: 'DateCount') final String? dateCount,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'IsComplete') final bool? isComplete}) =
      _$InventoryCountSheetMasterImpl;

  factory _InventoryCountSheetMaster.fromJson(Map<String, dynamic> json) =
      _$InventoryCountSheetMasterImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId;
  @override
  @JsonKey(name: 'WarehouseName')
  String? get warehouseName;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode;
  @override
  @JsonKey(name: 'DateCount')
  String? get dateCount;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'IsComplete')
  bool? get isComplete;
  @override
  @JsonKey(ignore: true)
  _$$InventoryCountSheetMasterImplCopyWith<_$InventoryCountSheetMasterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryProductGroupRtc _$InventoryProductGroupRtcFromJson(
    Map<String, dynamic> json) {
  return _InventoryProductGroupRtc.fromJson(json);
}

/// @nodoc
mixin _$InventoryProductGroupRtc {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Mã nhóm sản phẩm (vd. `N30`).
  @JsonKey(name: 'ProductGroupNo')
  String? get groupNo => throw _privateConstructorUsedError;

  /// Tên nhóm sản phẩm (vd. `CAMERA CARD`).
  @JsonKey(name: 'ProductGroupName')
  String? get groupName => throw _privateConstructorUsedError;

  /// Thứ tự hiển thị.
  @JsonKey(name: 'NumberOrder')
  int? get numberOrder => throw _privateConstructorUsedError;

  /// Id kho chứa nhóm sản phẩm.
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId => throw _privateConstructorUsedError;

  /// Loại kho (1 = kho demo).
  @JsonKey(name: 'WarehouseType')
  int? get warehouseType => throw _privateConstructorUsedError;

  /// Nhóm đã bị xoá hay chưa.
  @JsonKey(name: 'IsDeleted')
  bool get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryProductGroupRtcCopyWith<InventoryProductGroupRtc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryProductGroupRtcCopyWith<$Res> {
  factory $InventoryProductGroupRtcCopyWith(InventoryProductGroupRtc value,
          $Res Function(InventoryProductGroupRtc) then) =
      _$InventoryProductGroupRtcCopyWithImpl<$Res, InventoryProductGroupRtc>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ProductGroupNo') String? groupNo,
      @JsonKey(name: 'ProductGroupName') String? groupName,
      @JsonKey(name: 'NumberOrder') int? numberOrder,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'WarehouseType') int? warehouseType,
      @JsonKey(name: 'IsDeleted') bool isDeleted});
}

/// @nodoc
class _$InventoryProductGroupRtcCopyWithImpl<$Res,
        $Val extends InventoryProductGroupRtc>
    implements $InventoryProductGroupRtcCopyWith<$Res> {
  _$InventoryProductGroupRtcCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupNo = freezed,
    Object? groupName = freezed,
    Object? numberOrder = freezed,
    Object? warehouseId = freezed,
    Object? warehouseType = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      groupNo: freezed == groupNo
          ? _value.groupNo
          : groupNo // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOrder: freezed == numberOrder
          ? _value.numberOrder
          : numberOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseType: freezed == warehouseType
          ? _value.warehouseType
          : warehouseType // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryProductGroupRtcImplCopyWith<$Res>
    implements $InventoryProductGroupRtcCopyWith<$Res> {
  factory _$$InventoryProductGroupRtcImplCopyWith(
          _$InventoryProductGroupRtcImpl value,
          $Res Function(_$InventoryProductGroupRtcImpl) then) =
      __$$InventoryProductGroupRtcImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ProductGroupNo') String? groupNo,
      @JsonKey(name: 'ProductGroupName') String? groupName,
      @JsonKey(name: 'NumberOrder') int? numberOrder,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'WarehouseType') int? warehouseType,
      @JsonKey(name: 'IsDeleted') bool isDeleted});
}

/// @nodoc
class __$$InventoryProductGroupRtcImplCopyWithImpl<$Res>
    extends _$InventoryProductGroupRtcCopyWithImpl<$Res,
        _$InventoryProductGroupRtcImpl>
    implements _$$InventoryProductGroupRtcImplCopyWith<$Res> {
  __$$InventoryProductGroupRtcImplCopyWithImpl(
      _$InventoryProductGroupRtcImpl _value,
      $Res Function(_$InventoryProductGroupRtcImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupNo = freezed,
    Object? groupName = freezed,
    Object? numberOrder = freezed,
    Object? warehouseId = freezed,
    Object? warehouseType = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_$InventoryProductGroupRtcImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      groupNo: freezed == groupNo
          ? _value.groupNo
          : groupNo // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOrder: freezed == numberOrder
          ? _value.numberOrder
          : numberOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseType: freezed == warehouseType
          ? _value.warehouseType
          : warehouseType // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryProductGroupRtcImpl implements _InventoryProductGroupRtc {
  const _$InventoryProductGroupRtcImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'ProductGroupNo') this.groupNo,
      @JsonKey(name: 'ProductGroupName') this.groupName,
      @JsonKey(name: 'NumberOrder') this.numberOrder,
      @JsonKey(name: 'WarehouseID') this.warehouseId,
      @JsonKey(name: 'WarehouseType') this.warehouseType,
      @JsonKey(name: 'IsDeleted') this.isDeleted = false});

  factory _$InventoryProductGroupRtcImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryProductGroupRtcImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// Mã nhóm sản phẩm (vd. `N30`).
  @override
  @JsonKey(name: 'ProductGroupNo')
  final String? groupNo;

  /// Tên nhóm sản phẩm (vd. `CAMERA CARD`).
  @override
  @JsonKey(name: 'ProductGroupName')
  final String? groupName;

  /// Thứ tự hiển thị.
  @override
  @JsonKey(name: 'NumberOrder')
  final int? numberOrder;

  /// Id kho chứa nhóm sản phẩm.
  @override
  @JsonKey(name: 'WarehouseID')
  final int? warehouseId;

  /// Loại kho (1 = kho demo).
  @override
  @JsonKey(name: 'WarehouseType')
  final int? warehouseType;

  /// Nhóm đã bị xoá hay chưa.
  @override
  @JsonKey(name: 'IsDeleted')
  final bool isDeleted;

  @override
  String toString() {
    return 'InventoryProductGroupRtc(id: $id, groupNo: $groupNo, groupName: $groupName, numberOrder: $numberOrder, warehouseId: $warehouseId, warehouseType: $warehouseType, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryProductGroupRtcImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupNo, groupNo) || other.groupNo == groupNo) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.numberOrder, numberOrder) ||
                other.numberOrder == numberOrder) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.warehouseType, warehouseType) ||
                other.warehouseType == warehouseType) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, groupNo, groupName,
      numberOrder, warehouseId, warehouseType, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryProductGroupRtcImplCopyWith<_$InventoryProductGroupRtcImpl>
      get copyWith => __$$InventoryProductGroupRtcImplCopyWithImpl<
          _$InventoryProductGroupRtcImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryProductGroupRtcImplToJson(
      this,
    );
  }
}

abstract class _InventoryProductGroupRtc implements InventoryProductGroupRtc {
  const factory _InventoryProductGroupRtc(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'ProductGroupNo') final String? groupNo,
          @JsonKey(name: 'ProductGroupName') final String? groupName,
          @JsonKey(name: 'NumberOrder') final int? numberOrder,
          @JsonKey(name: 'WarehouseID') final int? warehouseId,
          @JsonKey(name: 'WarehouseType') final int? warehouseType,
          @JsonKey(name: 'IsDeleted') final bool isDeleted}) =
      _$InventoryProductGroupRtcImpl;

  factory _InventoryProductGroupRtc.fromJson(Map<String, dynamic> json) =
      _$InventoryProductGroupRtcImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override

  /// Mã nhóm sản phẩm (vd. `N30`).
  @JsonKey(name: 'ProductGroupNo')
  String? get groupNo;
  @override

  /// Tên nhóm sản phẩm (vd. `CAMERA CARD`).
  @JsonKey(name: 'ProductGroupName')
  String? get groupName;
  @override

  /// Thứ tự hiển thị.
  @JsonKey(name: 'NumberOrder')
  int? get numberOrder;
  @override

  /// Id kho chứa nhóm sản phẩm.
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId;
  @override

  /// Loại kho (1 = kho demo).
  @JsonKey(name: 'WarehouseType')
  int? get warehouseType;
  @override

  /// Nhóm đã bị xoá hay chưa.
  @JsonKey(name: 'IsDeleted')
  bool get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$InventoryProductGroupRtcImplCopyWith<_$InventoryProductGroupRtcImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryCountSheetItem _$InventoryCountSheetItemFromJson(
    Map<String, dynamic> json) {
  return _InventoryCountSheetItem.fromJson(json);
}

/// @nodoc
mixin _$InventoryCountSheetItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Id đợt kiểm kê cha.
  @JsonKey(name: 'WarehouseInventoryCountID')
  int? get warehouseInventoryCountId => throw _privateConstructorUsedError;

  /// Id sản phẩm (theo hệ thống RTC).
  @JsonKey(name: 'ProductRTCID')
  int? get productRtcId => throw _privateConstructorUsedError;

  /// Mã sản phẩm.
  @JsonKey(name: 'ProductCode')
  String? get productCode => throw _privateConstructorUsedError;

  /// Tên sản phẩm.
  @JsonKey(name: 'ProductName')
  String? get productName => throw _privateConstructorUsedError;

  /// Mã nội bộ sản phẩm.
  @JsonKey(name: 'ProductCodeRTC')
  String? get productCodeRtc => throw _privateConstructorUsedError;

  /// Nhà sản xuất.
  @JsonKey(name: 'Maker')
  String? get maker => throw _privateConstructorUsedError;

  /// Đơn vị tính.
  @JsonKey(name: 'UnitName')
  String? get unitName => throw _privateConstructorUsedError;

  /// Địa chỉ kho (ô lưu trữ).
  @JsonKey(name: 'AddressBox')
  String? get addressBox => throw _privateConstructorUsedError;

  /// Vị trí lưu kho.
  @JsonKey(name: 'LocationName')
  String? get locationName => throw _privateConstructorUsedError;

  /// Số serial.
  @JsonKey(name: 'SerialNumber')
  String? get serialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Serial')
  String? get serial => throw _privateConstructorUsedError;
  @JsonKey(name: 'PartNumber')
  String? get partNumber => throw _privateConstructorUsedError;

  /// Id nhóm sản phẩm.
  @JsonKey(name: 'ProductGroupRTCID')
  int? get productGroupRtcId => throw _privateConstructorUsedError;

  /// Tên nhóm sản phẩm.
  @JsonKey(name: 'ProductGroupName')
  String? get productGroupName => throw _privateConstructorUsedError;

  /// Vị trí kho Modula.
  @JsonKey(name: 'ModulaLocationName')
  String? get modulaLocationName => throw _privateConstructorUsedError;

  /// Số lượng tồn trong kho.
  @JsonKey(name: 'NumberInStore')
  int get numberInStore => throw _privateConstructorUsedError;

  /// Tồn kho thực tế (hệ thống).
  @JsonKey(name: 'InventoryReal')
  int get inventoryReal => throw _privateConstructorUsedError;

  /// Số lượng nhập.
  @JsonKey(name: 'NumberImport')
  double get numberImport => throw _privateConstructorUsedError;

  /// Số lượng xuất.
  @JsonKey(name: 'NumberExport')
  double get numberExport => throw _privateConstructorUsedError;

  /// Số lượng đang mượn.
  @JsonKey(name: 'NumberBorrowing')
  int get numberBorrowing => throw _privateConstructorUsedError;

  /// Số lượng xuất mượn.
  @JsonKey(name: 'QuantityExportMuon')
  int get quantityExportMuon => throw _privateConstructorUsedError;

  /// Số lượng thực tế kiểm kê (null = chưa kiểm kê).
  @JsonKey(name: 'QuantityActual')
  double? get quantityActual => throw _privateConstructorUsedError;

  /// Chênh lệch giữa thực tế và tồn kho (null = chưa kiểm kê).
  @JsonKey(name: 'Difference')
  double? get difference => throw _privateConstructorUsedError;

  /// Ghi chú của dòng kiểm kê.
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;

  /// Đã kiểm kê dòng này hay chưa.
  @JsonKey(name: 'HasCounted')
  bool get hasCounted => throw _privateConstructorUsedError;

  /// Số lượng đang mượn (chi tiết).
  @JsonKey(name: 'BorrowedQuantity')
  double? get borrowedQuantity => throw _privateConstructorUsedError;

  /// Số lượng khách hàng đang mượn.
  @JsonKey(name: 'CustomerBorrowedQuantity')
  double? get customerBorrowedQuantity => throw _privateConstructorUsedError;

  /// Tồn kho tổng.
  @JsonKey(name: 'InventoryQuantity')
  double? get inventoryQuantity => throw _privateConstructorUsedError;

  /// Id vị trí kho của sản phẩm (0 = chưa có vị trí).
  ///
  /// Dùng để gọi API `get-inventory-sheet-mobile` lọc theo vị trí.
  @JsonKey(name: 'ProductLocationID')
  int? get productLocationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryCountSheetItemCopyWith<InventoryCountSheetItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCountSheetItemCopyWith<$Res> {
  factory $InventoryCountSheetItemCopyWith(InventoryCountSheetItem value,
          $Res Function(InventoryCountSheetItem) then) =
      _$InventoryCountSheetItemCopyWithImpl<$Res, InventoryCountSheetItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'WarehouseInventoryCountID')
      int? warehouseInventoryCountId,
      @JsonKey(name: 'ProductRTCID') int? productRtcId,
      @JsonKey(name: 'ProductCode') String? productCode,
      @JsonKey(name: 'ProductName') String? productName,
      @JsonKey(name: 'ProductCodeRTC') String? productCodeRtc,
      @JsonKey(name: 'Maker') String? maker,
      @JsonKey(name: 'UnitName') String? unitName,
      @JsonKey(name: 'AddressBox') String? addressBox,
      @JsonKey(name: 'LocationName') String? locationName,
      @JsonKey(name: 'SerialNumber') String? serialNumber,
      @JsonKey(name: 'Serial') String? serial,
      @JsonKey(name: 'PartNumber') String? partNumber,
      @JsonKey(name: 'ProductGroupRTCID') int? productGroupRtcId,
      @JsonKey(name: 'ProductGroupName') String? productGroupName,
      @JsonKey(name: 'ModulaLocationName') String? modulaLocationName,
      @JsonKey(name: 'NumberInStore') int numberInStore,
      @JsonKey(name: 'InventoryReal') int inventoryReal,
      @JsonKey(name: 'NumberImport') double numberImport,
      @JsonKey(name: 'NumberExport') double numberExport,
      @JsonKey(name: 'NumberBorrowing') int numberBorrowing,
      @JsonKey(name: 'QuantityExportMuon') int quantityExportMuon,
      @JsonKey(name: 'QuantityActual') double? quantityActual,
      @JsonKey(name: 'Difference') double? difference,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'HasCounted') bool hasCounted,
      @JsonKey(name: 'BorrowedQuantity') double? borrowedQuantity,
      @JsonKey(name: 'CustomerBorrowedQuantity')
      double? customerBorrowedQuantity,
      @JsonKey(name: 'InventoryQuantity') double? inventoryQuantity,
      @JsonKey(name: 'ProductLocationID') int? productLocationId,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy});
}

/// @nodoc
class _$InventoryCountSheetItemCopyWithImpl<$Res,
        $Val extends InventoryCountSheetItem>
    implements $InventoryCountSheetItemCopyWith<$Res> {
  _$InventoryCountSheetItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? warehouseInventoryCountId = freezed,
    Object? productRtcId = freezed,
    Object? productCode = freezed,
    Object? productName = freezed,
    Object? productCodeRtc = freezed,
    Object? maker = freezed,
    Object? unitName = freezed,
    Object? addressBox = freezed,
    Object? locationName = freezed,
    Object? serialNumber = freezed,
    Object? serial = freezed,
    Object? partNumber = freezed,
    Object? productGroupRtcId = freezed,
    Object? productGroupName = freezed,
    Object? modulaLocationName = freezed,
    Object? numberInStore = null,
    Object? inventoryReal = null,
    Object? numberImport = null,
    Object? numberExport = null,
    Object? numberBorrowing = null,
    Object? quantityExportMuon = null,
    Object? quantityActual = freezed,
    Object? difference = freezed,
    Object? note = freezed,
    Object? hasCounted = null,
    Object? borrowedQuantity = freezed,
    Object? customerBorrowedQuantity = freezed,
    Object? inventoryQuantity = freezed,
    Object? productLocationId = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseInventoryCountId: freezed == warehouseInventoryCountId
          ? _value.warehouseInventoryCountId
          : warehouseInventoryCountId // ignore: cast_nullable_to_non_nullable
              as int?,
      productRtcId: freezed == productRtcId
          ? _value.productRtcId
          : productRtcId // ignore: cast_nullable_to_non_nullable
              as int?,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productCodeRtc: freezed == productCodeRtc
          ? _value.productCodeRtc
          : productCodeRtc // ignore: cast_nullable_to_non_nullable
              as String?,
      maker: freezed == maker
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String?,
      unitName: freezed == unitName
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
      addressBox: freezed == addressBox
          ? _value.addressBox
          : addressBox // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      serial: freezed == serial
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String?,
      partNumber: freezed == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      productGroupRtcId: freezed == productGroupRtcId
          ? _value.productGroupRtcId
          : productGroupRtcId // ignore: cast_nullable_to_non_nullable
              as int?,
      productGroupName: freezed == productGroupName
          ? _value.productGroupName
          : productGroupName // ignore: cast_nullable_to_non_nullable
              as String?,
      modulaLocationName: freezed == modulaLocationName
          ? _value.modulaLocationName
          : modulaLocationName // ignore: cast_nullable_to_non_nullable
              as String?,
      numberInStore: null == numberInStore
          ? _value.numberInStore
          : numberInStore // ignore: cast_nullable_to_non_nullable
              as int,
      inventoryReal: null == inventoryReal
          ? _value.inventoryReal
          : inventoryReal // ignore: cast_nullable_to_non_nullable
              as int,
      numberImport: null == numberImport
          ? _value.numberImport
          : numberImport // ignore: cast_nullable_to_non_nullable
              as double,
      numberExport: null == numberExport
          ? _value.numberExport
          : numberExport // ignore: cast_nullable_to_non_nullable
              as double,
      numberBorrowing: null == numberBorrowing
          ? _value.numberBorrowing
          : numberBorrowing // ignore: cast_nullable_to_non_nullable
              as int,
      quantityExportMuon: null == quantityExportMuon
          ? _value.quantityExportMuon
          : quantityExportMuon // ignore: cast_nullable_to_non_nullable
              as int,
      quantityActual: freezed == quantityActual
          ? _value.quantityActual
          : quantityActual // ignore: cast_nullable_to_non_nullable
              as double?,
      difference: freezed == difference
          ? _value.difference
          : difference // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCounted: null == hasCounted
          ? _value.hasCounted
          : hasCounted // ignore: cast_nullable_to_non_nullable
              as bool,
      borrowedQuantity: freezed == borrowedQuantity
          ? _value.borrowedQuantity
          : borrowedQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      customerBorrowedQuantity: freezed == customerBorrowedQuantity
          ? _value.customerBorrowedQuantity
          : customerBorrowedQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      inventoryQuantity: freezed == inventoryQuantity
          ? _value.inventoryQuantity
          : inventoryQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      productLocationId: freezed == productLocationId
          ? _value.productLocationId
          : productLocationId // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryCountSheetItemImplCopyWith<$Res>
    implements $InventoryCountSheetItemCopyWith<$Res> {
  factory _$$InventoryCountSheetItemImplCopyWith(
          _$InventoryCountSheetItemImpl value,
          $Res Function(_$InventoryCountSheetItemImpl) then) =
      __$$InventoryCountSheetItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'WarehouseInventoryCountID')
      int? warehouseInventoryCountId,
      @JsonKey(name: 'ProductRTCID') int? productRtcId,
      @JsonKey(name: 'ProductCode') String? productCode,
      @JsonKey(name: 'ProductName') String? productName,
      @JsonKey(name: 'ProductCodeRTC') String? productCodeRtc,
      @JsonKey(name: 'Maker') String? maker,
      @JsonKey(name: 'UnitName') String? unitName,
      @JsonKey(name: 'AddressBox') String? addressBox,
      @JsonKey(name: 'LocationName') String? locationName,
      @JsonKey(name: 'SerialNumber') String? serialNumber,
      @JsonKey(name: 'Serial') String? serial,
      @JsonKey(name: 'PartNumber') String? partNumber,
      @JsonKey(name: 'ProductGroupRTCID') int? productGroupRtcId,
      @JsonKey(name: 'ProductGroupName') String? productGroupName,
      @JsonKey(name: 'ModulaLocationName') String? modulaLocationName,
      @JsonKey(name: 'NumberInStore') int numberInStore,
      @JsonKey(name: 'InventoryReal') int inventoryReal,
      @JsonKey(name: 'NumberImport') double numberImport,
      @JsonKey(name: 'NumberExport') double numberExport,
      @JsonKey(name: 'NumberBorrowing') int numberBorrowing,
      @JsonKey(name: 'QuantityExportMuon') int quantityExportMuon,
      @JsonKey(name: 'QuantityActual') double? quantityActual,
      @JsonKey(name: 'Difference') double? difference,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'HasCounted') bool hasCounted,
      @JsonKey(name: 'BorrowedQuantity') double? borrowedQuantity,
      @JsonKey(name: 'CustomerBorrowedQuantity')
      double? customerBorrowedQuantity,
      @JsonKey(name: 'InventoryQuantity') double? inventoryQuantity,
      @JsonKey(name: 'ProductLocationID') int? productLocationId,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy});
}

/// @nodoc
class __$$InventoryCountSheetItemImplCopyWithImpl<$Res>
    extends _$InventoryCountSheetItemCopyWithImpl<$Res,
        _$InventoryCountSheetItemImpl>
    implements _$$InventoryCountSheetItemImplCopyWith<$Res> {
  __$$InventoryCountSheetItemImplCopyWithImpl(
      _$InventoryCountSheetItemImpl _value,
      $Res Function(_$InventoryCountSheetItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? warehouseInventoryCountId = freezed,
    Object? productRtcId = freezed,
    Object? productCode = freezed,
    Object? productName = freezed,
    Object? productCodeRtc = freezed,
    Object? maker = freezed,
    Object? unitName = freezed,
    Object? addressBox = freezed,
    Object? locationName = freezed,
    Object? serialNumber = freezed,
    Object? serial = freezed,
    Object? partNumber = freezed,
    Object? productGroupRtcId = freezed,
    Object? productGroupName = freezed,
    Object? modulaLocationName = freezed,
    Object? numberInStore = null,
    Object? inventoryReal = null,
    Object? numberImport = null,
    Object? numberExport = null,
    Object? numberBorrowing = null,
    Object? quantityExportMuon = null,
    Object? quantityActual = freezed,
    Object? difference = freezed,
    Object? note = freezed,
    Object? hasCounted = null,
    Object? borrowedQuantity = freezed,
    Object? customerBorrowedQuantity = freezed,
    Object? inventoryQuantity = freezed,
    Object? productLocationId = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$InventoryCountSheetItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseInventoryCountId: freezed == warehouseInventoryCountId
          ? _value.warehouseInventoryCountId
          : warehouseInventoryCountId // ignore: cast_nullable_to_non_nullable
              as int?,
      productRtcId: freezed == productRtcId
          ? _value.productRtcId
          : productRtcId // ignore: cast_nullable_to_non_nullable
              as int?,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productCodeRtc: freezed == productCodeRtc
          ? _value.productCodeRtc
          : productCodeRtc // ignore: cast_nullable_to_non_nullable
              as String?,
      maker: freezed == maker
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String?,
      unitName: freezed == unitName
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
      addressBox: freezed == addressBox
          ? _value.addressBox
          : addressBox // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      serial: freezed == serial
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String?,
      partNumber: freezed == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      productGroupRtcId: freezed == productGroupRtcId
          ? _value.productGroupRtcId
          : productGroupRtcId // ignore: cast_nullable_to_non_nullable
              as int?,
      productGroupName: freezed == productGroupName
          ? _value.productGroupName
          : productGroupName // ignore: cast_nullable_to_non_nullable
              as String?,
      modulaLocationName: freezed == modulaLocationName
          ? _value.modulaLocationName
          : modulaLocationName // ignore: cast_nullable_to_non_nullable
              as String?,
      numberInStore: null == numberInStore
          ? _value.numberInStore
          : numberInStore // ignore: cast_nullable_to_non_nullable
              as int,
      inventoryReal: null == inventoryReal
          ? _value.inventoryReal
          : inventoryReal // ignore: cast_nullable_to_non_nullable
              as int,
      numberImport: null == numberImport
          ? _value.numberImport
          : numberImport // ignore: cast_nullable_to_non_nullable
              as double,
      numberExport: null == numberExport
          ? _value.numberExport
          : numberExport // ignore: cast_nullable_to_non_nullable
              as double,
      numberBorrowing: null == numberBorrowing
          ? _value.numberBorrowing
          : numberBorrowing // ignore: cast_nullable_to_non_nullable
              as int,
      quantityExportMuon: null == quantityExportMuon
          ? _value.quantityExportMuon
          : quantityExportMuon // ignore: cast_nullable_to_non_nullable
              as int,
      quantityActual: freezed == quantityActual
          ? _value.quantityActual
          : quantityActual // ignore: cast_nullable_to_non_nullable
              as double?,
      difference: freezed == difference
          ? _value.difference
          : difference // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCounted: null == hasCounted
          ? _value.hasCounted
          : hasCounted // ignore: cast_nullable_to_non_nullable
              as bool,
      borrowedQuantity: freezed == borrowedQuantity
          ? _value.borrowedQuantity
          : borrowedQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      customerBorrowedQuantity: freezed == customerBorrowedQuantity
          ? _value.customerBorrowedQuantity
          : customerBorrowedQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      inventoryQuantity: freezed == inventoryQuantity
          ? _value.inventoryQuantity
          : inventoryQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      productLocationId: freezed == productLocationId
          ? _value.productLocationId
          : productLocationId // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryCountSheetItemImpl implements _InventoryCountSheetItem {
  const _$InventoryCountSheetItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'WarehouseInventoryCountID')
      this.warehouseInventoryCountId,
      @JsonKey(name: 'ProductRTCID') this.productRtcId,
      @JsonKey(name: 'ProductCode') this.productCode,
      @JsonKey(name: 'ProductName') this.productName,
      @JsonKey(name: 'ProductCodeRTC') this.productCodeRtc,
      @JsonKey(name: 'Maker') this.maker,
      @JsonKey(name: 'UnitName') this.unitName,
      @JsonKey(name: 'AddressBox') this.addressBox,
      @JsonKey(name: 'LocationName') this.locationName,
      @JsonKey(name: 'SerialNumber') this.serialNumber,
      @JsonKey(name: 'Serial') this.serial,
      @JsonKey(name: 'PartNumber') this.partNumber,
      @JsonKey(name: 'ProductGroupRTCID') this.productGroupRtcId,
      @JsonKey(name: 'ProductGroupName') this.productGroupName,
      @JsonKey(name: 'ModulaLocationName') this.modulaLocationName,
      @JsonKey(name: 'NumberInStore') this.numberInStore = 0,
      @JsonKey(name: 'InventoryReal') this.inventoryReal = 0,
      @JsonKey(name: 'NumberImport') this.numberImport = 0,
      @JsonKey(name: 'NumberExport') this.numberExport = 0,
      @JsonKey(name: 'NumberBorrowing') this.numberBorrowing = 0,
      @JsonKey(name: 'QuantityExportMuon') this.quantityExportMuon = 0,
      @JsonKey(name: 'QuantityActual') this.quantityActual,
      @JsonKey(name: 'Difference') this.difference,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'HasCounted') this.hasCounted = false,
      @JsonKey(name: 'BorrowedQuantity') this.borrowedQuantity,
      @JsonKey(name: 'CustomerBorrowedQuantity') this.customerBorrowedQuantity,
      @JsonKey(name: 'InventoryQuantity') this.inventoryQuantity,
      @JsonKey(name: 'ProductLocationID') this.productLocationId,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy});

  factory _$InventoryCountSheetItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryCountSheetItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// Id đợt kiểm kê cha.
  @override
  @JsonKey(name: 'WarehouseInventoryCountID')
  final int? warehouseInventoryCountId;

  /// Id sản phẩm (theo hệ thống RTC).
  @override
  @JsonKey(name: 'ProductRTCID')
  final int? productRtcId;

  /// Mã sản phẩm.
  @override
  @JsonKey(name: 'ProductCode')
  final String? productCode;

  /// Tên sản phẩm.
  @override
  @JsonKey(name: 'ProductName')
  final String? productName;

  /// Mã nội bộ sản phẩm.
  @override
  @JsonKey(name: 'ProductCodeRTC')
  final String? productCodeRtc;

  /// Nhà sản xuất.
  @override
  @JsonKey(name: 'Maker')
  final String? maker;

  /// Đơn vị tính.
  @override
  @JsonKey(name: 'UnitName')
  final String? unitName;

  /// Địa chỉ kho (ô lưu trữ).
  @override
  @JsonKey(name: 'AddressBox')
  final String? addressBox;

  /// Vị trí lưu kho.
  @override
  @JsonKey(name: 'LocationName')
  final String? locationName;

  /// Số serial.
  @override
  @JsonKey(name: 'SerialNumber')
  final String? serialNumber;
  @override
  @JsonKey(name: 'Serial')
  final String? serial;
  @override
  @JsonKey(name: 'PartNumber')
  final String? partNumber;

  /// Id nhóm sản phẩm.
  @override
  @JsonKey(name: 'ProductGroupRTCID')
  final int? productGroupRtcId;

  /// Tên nhóm sản phẩm.
  @override
  @JsonKey(name: 'ProductGroupName')
  final String? productGroupName;

  /// Vị trí kho Modula.
  @override
  @JsonKey(name: 'ModulaLocationName')
  final String? modulaLocationName;

  /// Số lượng tồn trong kho.
  @override
  @JsonKey(name: 'NumberInStore')
  final int numberInStore;

  /// Tồn kho thực tế (hệ thống).
  @override
  @JsonKey(name: 'InventoryReal')
  final int inventoryReal;

  /// Số lượng nhập.
  @override
  @JsonKey(name: 'NumberImport')
  final double numberImport;

  /// Số lượng xuất.
  @override
  @JsonKey(name: 'NumberExport')
  final double numberExport;

  /// Số lượng đang mượn.
  @override
  @JsonKey(name: 'NumberBorrowing')
  final int numberBorrowing;

  /// Số lượng xuất mượn.
  @override
  @JsonKey(name: 'QuantityExportMuon')
  final int quantityExportMuon;

  /// Số lượng thực tế kiểm kê (null = chưa kiểm kê).
  @override
  @JsonKey(name: 'QuantityActual')
  final double? quantityActual;

  /// Chênh lệch giữa thực tế và tồn kho (null = chưa kiểm kê).
  @override
  @JsonKey(name: 'Difference')
  final double? difference;

  /// Ghi chú của dòng kiểm kê.
  @override
  @JsonKey(name: 'Note')
  final String? note;

  /// Đã kiểm kê dòng này hay chưa.
  @override
  @JsonKey(name: 'HasCounted')
  final bool hasCounted;

  /// Số lượng đang mượn (chi tiết).
  @override
  @JsonKey(name: 'BorrowedQuantity')
  final double? borrowedQuantity;

  /// Số lượng khách hàng đang mượn.
  @override
  @JsonKey(name: 'CustomerBorrowedQuantity')
  final double? customerBorrowedQuantity;

  /// Tồn kho tổng.
  @override
  @JsonKey(name: 'InventoryQuantity')
  final double? inventoryQuantity;

  /// Id vị trí kho của sản phẩm (0 = chưa có vị trí).
  ///
  /// Dùng để gọi API `get-inventory-sheet-mobile` lọc theo vị trí.
  @override
  @JsonKey(name: 'ProductLocationID')
  final int? productLocationId;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;

  @override
  String toString() {
    return 'InventoryCountSheetItem(id: $id, warehouseInventoryCountId: $warehouseInventoryCountId, productRtcId: $productRtcId, productCode: $productCode, productName: $productName, productCodeRtc: $productCodeRtc, maker: $maker, unitName: $unitName, addressBox: $addressBox, locationName: $locationName, serialNumber: $serialNumber, serial: $serial, partNumber: $partNumber, productGroupRtcId: $productGroupRtcId, productGroupName: $productGroupName, modulaLocationName: $modulaLocationName, numberInStore: $numberInStore, inventoryReal: $inventoryReal, numberImport: $numberImport, numberExport: $numberExport, numberBorrowing: $numberBorrowing, quantityExportMuon: $quantityExportMuon, quantityActual: $quantityActual, difference: $difference, note: $note, hasCounted: $hasCounted, borrowedQuantity: $borrowedQuantity, customerBorrowedQuantity: $customerBorrowedQuantity, inventoryQuantity: $inventoryQuantity, productLocationId: $productLocationId, updatedDate: $updatedDate, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCountSheetItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.warehouseInventoryCountId,
                    warehouseInventoryCountId) ||
                other.warehouseInventoryCountId == warehouseInventoryCountId) &&
            (identical(other.productRtcId, productRtcId) ||
                other.productRtcId == productRtcId) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productCodeRtc, productCodeRtc) ||
                other.productCodeRtc == productCodeRtc) &&
            (identical(other.maker, maker) || other.maker == maker) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.addressBox, addressBox) ||
                other.addressBox == addressBox) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.serial, serial) || other.serial == serial) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.productGroupRtcId, productGroupRtcId) ||
                other.productGroupRtcId == productGroupRtcId) &&
            (identical(other.productGroupName, productGroupName) ||
                other.productGroupName == productGroupName) &&
            (identical(other.modulaLocationName, modulaLocationName) ||
                other.modulaLocationName == modulaLocationName) &&
            (identical(other.numberInStore, numberInStore) ||
                other.numberInStore == numberInStore) &&
            (identical(other.inventoryReal, inventoryReal) ||
                other.inventoryReal == inventoryReal) &&
            (identical(other.numberImport, numberImport) ||
                other.numberImport == numberImport) &&
            (identical(other.numberExport, numberExport) ||
                other.numberExport == numberExport) &&
            (identical(other.numberBorrowing, numberBorrowing) ||
                other.numberBorrowing == numberBorrowing) &&
            (identical(other.quantityExportMuon, quantityExportMuon) ||
                other.quantityExportMuon == quantityExportMuon) &&
            (identical(other.quantityActual, quantityActual) ||
                other.quantityActual == quantityActual) &&
            (identical(other.difference, difference) ||
                other.difference == difference) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.hasCounted, hasCounted) ||
                other.hasCounted == hasCounted) &&
            (identical(other.borrowedQuantity, borrowedQuantity) ||
                other.borrowedQuantity == borrowedQuantity) &&
            (identical(
                    other.customerBorrowedQuantity, customerBorrowedQuantity) ||
                other.customerBorrowedQuantity == customerBorrowedQuantity) &&
            (identical(other.inventoryQuantity, inventoryQuantity) ||
                other.inventoryQuantity == inventoryQuantity) &&
            (identical(other.productLocationId, productLocationId) ||
                other.productLocationId == productLocationId) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        warehouseInventoryCountId,
        productRtcId,
        productCode,
        productName,
        productCodeRtc,
        maker,
        unitName,
        addressBox,
        locationName,
        serialNumber,
        serial,
        partNumber,
        productGroupRtcId,
        productGroupName,
        modulaLocationName,
        numberInStore,
        inventoryReal,
        numberImport,
        numberExport,
        numberBorrowing,
        quantityExportMuon,
        quantityActual,
        difference,
        note,
        hasCounted,
        borrowedQuantity,
        customerBorrowedQuantity,
        inventoryQuantity,
        productLocationId,
        updatedDate,
        updatedBy
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryCountSheetItemImplCopyWith<_$InventoryCountSheetItemImpl>
      get copyWith => __$$InventoryCountSheetItemImplCopyWithImpl<
          _$InventoryCountSheetItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCountSheetItemImplToJson(
      this,
    );
  }
}

abstract class _InventoryCountSheetItem implements InventoryCountSheetItem {
  const factory _InventoryCountSheetItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'WarehouseInventoryCountID')
          final int? warehouseInventoryCountId,
          @JsonKey(name: 'ProductRTCID') final int? productRtcId,
          @JsonKey(name: 'ProductCode') final String? productCode,
          @JsonKey(name: 'ProductName') final String? productName,
          @JsonKey(name: 'ProductCodeRTC') final String? productCodeRtc,
          @JsonKey(name: 'Maker') final String? maker,
          @JsonKey(name: 'UnitName') final String? unitName,
          @JsonKey(name: 'AddressBox') final String? addressBox,
          @JsonKey(name: 'LocationName') final String? locationName,
          @JsonKey(name: 'SerialNumber') final String? serialNumber,
          @JsonKey(name: 'Serial') final String? serial,
          @JsonKey(name: 'PartNumber') final String? partNumber,
          @JsonKey(name: 'ProductGroupRTCID') final int? productGroupRtcId,
          @JsonKey(name: 'ProductGroupName') final String? productGroupName,
          @JsonKey(name: 'ModulaLocationName') final String? modulaLocationName,
          @JsonKey(name: 'NumberInStore') final int numberInStore,
          @JsonKey(name: 'InventoryReal') final int inventoryReal,
          @JsonKey(name: 'NumberImport') final double numberImport,
          @JsonKey(name: 'NumberExport') final double numberExport,
          @JsonKey(name: 'NumberBorrowing') final int numberBorrowing,
          @JsonKey(name: 'QuantityExportMuon') final int quantityExportMuon,
          @JsonKey(name: 'QuantityActual') final double? quantityActual,
          @JsonKey(name: 'Difference') final double? difference,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'HasCounted') final bool hasCounted,
          @JsonKey(name: 'BorrowedQuantity') final double? borrowedQuantity,
          @JsonKey(name: 'CustomerBorrowedQuantity')
          final double? customerBorrowedQuantity,
          @JsonKey(name: 'InventoryQuantity') final double? inventoryQuantity,
          @JsonKey(name: 'ProductLocationID') final int? productLocationId,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy}) =
      _$InventoryCountSheetItemImpl;

  factory _InventoryCountSheetItem.fromJson(Map<String, dynamic> json) =
      _$InventoryCountSheetItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override

  /// Id đợt kiểm kê cha.
  @JsonKey(name: 'WarehouseInventoryCountID')
  int? get warehouseInventoryCountId;
  @override

  /// Id sản phẩm (theo hệ thống RTC).
  @JsonKey(name: 'ProductRTCID')
  int? get productRtcId;
  @override

  /// Mã sản phẩm.
  @JsonKey(name: 'ProductCode')
  String? get productCode;
  @override

  /// Tên sản phẩm.
  @JsonKey(name: 'ProductName')
  String? get productName;
  @override

  /// Mã nội bộ sản phẩm.
  @JsonKey(name: 'ProductCodeRTC')
  String? get productCodeRtc;
  @override

  /// Nhà sản xuất.
  @JsonKey(name: 'Maker')
  String? get maker;
  @override

  /// Đơn vị tính.
  @JsonKey(name: 'UnitName')
  String? get unitName;
  @override

  /// Địa chỉ kho (ô lưu trữ).
  @JsonKey(name: 'AddressBox')
  String? get addressBox;
  @override

  /// Vị trí lưu kho.
  @JsonKey(name: 'LocationName')
  String? get locationName;
  @override

  /// Số serial.
  @JsonKey(name: 'SerialNumber')
  String? get serialNumber;
  @override
  @JsonKey(name: 'Serial')
  String? get serial;
  @override
  @JsonKey(name: 'PartNumber')
  String? get partNumber;
  @override

  /// Id nhóm sản phẩm.
  @JsonKey(name: 'ProductGroupRTCID')
  int? get productGroupRtcId;
  @override

  /// Tên nhóm sản phẩm.
  @JsonKey(name: 'ProductGroupName')
  String? get productGroupName;
  @override

  /// Vị trí kho Modula.
  @JsonKey(name: 'ModulaLocationName')
  String? get modulaLocationName;
  @override

  /// Số lượng tồn trong kho.
  @JsonKey(name: 'NumberInStore')
  int get numberInStore;
  @override

  /// Tồn kho thực tế (hệ thống).
  @JsonKey(name: 'InventoryReal')
  int get inventoryReal;
  @override

  /// Số lượng nhập.
  @JsonKey(name: 'NumberImport')
  double get numberImport;
  @override

  /// Số lượng xuất.
  @JsonKey(name: 'NumberExport')
  double get numberExport;
  @override

  /// Số lượng đang mượn.
  @JsonKey(name: 'NumberBorrowing')
  int get numberBorrowing;
  @override

  /// Số lượng xuất mượn.
  @JsonKey(name: 'QuantityExportMuon')
  int get quantityExportMuon;
  @override

  /// Số lượng thực tế kiểm kê (null = chưa kiểm kê).
  @JsonKey(name: 'QuantityActual')
  double? get quantityActual;
  @override

  /// Chênh lệch giữa thực tế và tồn kho (null = chưa kiểm kê).
  @JsonKey(name: 'Difference')
  double? get difference;
  @override

  /// Ghi chú của dòng kiểm kê.
  @JsonKey(name: 'Note')
  String? get note;
  @override

  /// Đã kiểm kê dòng này hay chưa.
  @JsonKey(name: 'HasCounted')
  bool get hasCounted;
  @override

  /// Số lượng đang mượn (chi tiết).
  @JsonKey(name: 'BorrowedQuantity')
  double? get borrowedQuantity;
  @override

  /// Số lượng khách hàng đang mượn.
  @JsonKey(name: 'CustomerBorrowedQuantity')
  double? get customerBorrowedQuantity;
  @override

  /// Tồn kho tổng.
  @JsonKey(name: 'InventoryQuantity')
  double? get inventoryQuantity;
  @override

  /// Id vị trí kho của sản phẩm (0 = chưa có vị trí).
  ///
  /// Dùng để gọi API `get-inventory-sheet-mobile` lọc theo vị trí.
  @JsonKey(name: 'ProductLocationID')
  int? get productLocationId;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$InventoryCountSheetItemImplCopyWith<_$InventoryCountSheetItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryProductLocation _$InventoryProductLocationFromJson(
    Map<String, dynamic> json) {
  return _InventoryProductLocation.fromJson(json);
}

/// @nodoc
mixin _$InventoryProductLocation {
  /// Id vị trí kho (0 = chưa có vị trí).
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Mã vị trí (vd. `K1-T3.1`).
  @JsonKey(name: 'LocationCode')
  String? get locationCode => throw _privateConstructorUsedError;

  /// Tên vị trí.
  @JsonKey(name: 'LocationName')
  String? get locationName => throw _privateConstructorUsedError;

  /// Tên vị trí cũ (dùng khi vị trí đã được đổi tên).
  @JsonKey(name: 'OldLocationName')
  String? get oldLocationName => throw _privateConstructorUsedError;

  /// Id kho chứa vị trí.
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId => throw _privateConstructorUsedError;

  /// Loại vị trí (0 = thường, 1 = kệ...).
  @JsonKey(name: 'LocationType')
  int? get locationType => throw _privateConstructorUsedError;

  /// Thứ tự hiển thị.
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;

  /// Tổng số mã sản phẩm thuộc vị trí này trong đợt kiểm kê.
  @JsonKey(name: 'TotalCount')
  int get totalCount => throw _privateConstructorUsedError;

  /// Số mã đã kiểm (`QuantityActual` khác null).
  @JsonKey(name: 'CountedCount')
  int get countedCount => throw _privateConstructorUsedError;

  /// Số mã chưa kiểm.
  @JsonKey(name: 'UncountedCount')
  int get uncountedCount => throw _privateConstructorUsedError;

  /// Vị trí đã kiểm xong hay chưa.
  @JsonKey(name: 'IsCompleted')
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryProductLocationCopyWith<InventoryProductLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryProductLocationCopyWith<$Res> {
  factory $InventoryProductLocationCopyWith(InventoryProductLocation value,
          $Res Function(InventoryProductLocation) then) =
      _$InventoryProductLocationCopyWithImpl<$Res, InventoryProductLocation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LocationCode') String? locationCode,
      @JsonKey(name: 'LocationName') String? locationName,
      @JsonKey(name: 'OldLocationName') String? oldLocationName,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'LocationType') int? locationType,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'TotalCount') int totalCount,
      @JsonKey(name: 'CountedCount') int countedCount,
      @JsonKey(name: 'UncountedCount') int uncountedCount,
      @JsonKey(name: 'IsCompleted') bool isCompleted});
}

/// @nodoc
class _$InventoryProductLocationCopyWithImpl<$Res,
        $Val extends InventoryProductLocation>
    implements $InventoryProductLocationCopyWith<$Res> {
  _$InventoryProductLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? locationCode = freezed,
    Object? locationName = freezed,
    Object? oldLocationName = freezed,
    Object? warehouseId = freezed,
    Object? locationType = freezed,
    Object? stt = freezed,
    Object? totalCount = null,
    Object? countedCount = null,
    Object? uncountedCount = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      locationCode: freezed == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      oldLocationName: freezed == oldLocationName
          ? _value.oldLocationName
          : oldLocationName // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      locationType: freezed == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      countedCount: null == countedCount
          ? _value.countedCount
          : countedCount // ignore: cast_nullable_to_non_nullable
              as int,
      uncountedCount: null == uncountedCount
          ? _value.uncountedCount
          : uncountedCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryProductLocationImplCopyWith<$Res>
    implements $InventoryProductLocationCopyWith<$Res> {
  factory _$$InventoryProductLocationImplCopyWith(
          _$InventoryProductLocationImpl value,
          $Res Function(_$InventoryProductLocationImpl) then) =
      __$$InventoryProductLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LocationCode') String? locationCode,
      @JsonKey(name: 'LocationName') String? locationName,
      @JsonKey(name: 'OldLocationName') String? oldLocationName,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'LocationType') int? locationType,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'TotalCount') int totalCount,
      @JsonKey(name: 'CountedCount') int countedCount,
      @JsonKey(name: 'UncountedCount') int uncountedCount,
      @JsonKey(name: 'IsCompleted') bool isCompleted});
}

/// @nodoc
class __$$InventoryProductLocationImplCopyWithImpl<$Res>
    extends _$InventoryProductLocationCopyWithImpl<$Res,
        _$InventoryProductLocationImpl>
    implements _$$InventoryProductLocationImplCopyWith<$Res> {
  __$$InventoryProductLocationImplCopyWithImpl(
      _$InventoryProductLocationImpl _value,
      $Res Function(_$InventoryProductLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? locationCode = freezed,
    Object? locationName = freezed,
    Object? oldLocationName = freezed,
    Object? warehouseId = freezed,
    Object? locationType = freezed,
    Object? stt = freezed,
    Object? totalCount = null,
    Object? countedCount = null,
    Object? uncountedCount = null,
    Object? isCompleted = null,
  }) {
    return _then(_$InventoryProductLocationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      locationCode: freezed == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      oldLocationName: freezed == oldLocationName
          ? _value.oldLocationName
          : oldLocationName // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      locationType: freezed == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      countedCount: null == countedCount
          ? _value.countedCount
          : countedCount // ignore: cast_nullable_to_non_nullable
              as int,
      uncountedCount: null == uncountedCount
          ? _value.uncountedCount
          : uncountedCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryProductLocationImpl implements _InventoryProductLocation {
  const _$InventoryProductLocationImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'LocationCode') this.locationCode,
      @JsonKey(name: 'LocationName') this.locationName,
      @JsonKey(name: 'OldLocationName') this.oldLocationName,
      @JsonKey(name: 'WarehouseID') this.warehouseId,
      @JsonKey(name: 'LocationType') this.locationType,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'TotalCount') this.totalCount = 0,
      @JsonKey(name: 'CountedCount') this.countedCount = 0,
      @JsonKey(name: 'UncountedCount') this.uncountedCount = 0,
      @JsonKey(name: 'IsCompleted') this.isCompleted = false});

  factory _$InventoryProductLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryProductLocationImplFromJson(json);

  /// Id vị trí kho (0 = chưa có vị trí).
  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// Mã vị trí (vd. `K1-T3.1`).
  @override
  @JsonKey(name: 'LocationCode')
  final String? locationCode;

  /// Tên vị trí.
  @override
  @JsonKey(name: 'LocationName')
  final String? locationName;

  /// Tên vị trí cũ (dùng khi vị trí đã được đổi tên).
  @override
  @JsonKey(name: 'OldLocationName')
  final String? oldLocationName;

  /// Id kho chứa vị trí.
  @override
  @JsonKey(name: 'WarehouseID')
  final int? warehouseId;

  /// Loại vị trí (0 = thường, 1 = kệ...).
  @override
  @JsonKey(name: 'LocationType')
  final int? locationType;

  /// Thứ tự hiển thị.
  @override
  @JsonKey(name: 'STT')
  final int? stt;

  /// Tổng số mã sản phẩm thuộc vị trí này trong đợt kiểm kê.
  @override
  @JsonKey(name: 'TotalCount')
  final int totalCount;

  /// Số mã đã kiểm (`QuantityActual` khác null).
  @override
  @JsonKey(name: 'CountedCount')
  final int countedCount;

  /// Số mã chưa kiểm.
  @override
  @JsonKey(name: 'UncountedCount')
  final int uncountedCount;

  /// Vị trí đã kiểm xong hay chưa.
  @override
  @JsonKey(name: 'IsCompleted')
  final bool isCompleted;

  @override
  String toString() {
    return 'InventoryProductLocation(id: $id, locationCode: $locationCode, locationName: $locationName, oldLocationName: $oldLocationName, warehouseId: $warehouseId, locationType: $locationType, stt: $stt, totalCount: $totalCount, countedCount: $countedCount, uncountedCount: $uncountedCount, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryProductLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locationCode, locationCode) ||
                other.locationCode == locationCode) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.oldLocationName, oldLocationName) ||
                other.oldLocationName == oldLocationName) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.locationType, locationType) ||
                other.locationType == locationType) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.countedCount, countedCount) ||
                other.countedCount == countedCount) &&
            (identical(other.uncountedCount, uncountedCount) ||
                other.uncountedCount == uncountedCount) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      locationCode,
      locationName,
      oldLocationName,
      warehouseId,
      locationType,
      stt,
      totalCount,
      countedCount,
      uncountedCount,
      isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryProductLocationImplCopyWith<_$InventoryProductLocationImpl>
      get copyWith => __$$InventoryProductLocationImplCopyWithImpl<
          _$InventoryProductLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryProductLocationImplToJson(
      this,
    );
  }
}

abstract class _InventoryProductLocation implements InventoryProductLocation {
  const factory _InventoryProductLocation(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'LocationCode') final String? locationCode,
          @JsonKey(name: 'LocationName') final String? locationName,
          @JsonKey(name: 'OldLocationName') final String? oldLocationName,
          @JsonKey(name: 'WarehouseID') final int? warehouseId,
          @JsonKey(name: 'LocationType') final int? locationType,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'TotalCount') final int totalCount,
          @JsonKey(name: 'CountedCount') final int countedCount,
          @JsonKey(name: 'UncountedCount') final int uncountedCount,
          @JsonKey(name: 'IsCompleted') final bool isCompleted}) =
      _$InventoryProductLocationImpl;

  factory _InventoryProductLocation.fromJson(Map<String, dynamic> json) =
      _$InventoryProductLocationImpl.fromJson;

  @override

  /// Id vị trí kho (0 = chưa có vị trí).
  @JsonKey(name: 'ID')
  int? get id;
  @override

  /// Mã vị trí (vd. `K1-T3.1`).
  @JsonKey(name: 'LocationCode')
  String? get locationCode;
  @override

  /// Tên vị trí.
  @JsonKey(name: 'LocationName')
  String? get locationName;
  @override

  /// Tên vị trí cũ (dùng khi vị trí đã được đổi tên).
  @JsonKey(name: 'OldLocationName')
  String? get oldLocationName;
  @override

  /// Id kho chứa vị trí.
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId;
  @override

  /// Loại vị trí (0 = thường, 1 = kệ...).
  @JsonKey(name: 'LocationType')
  int? get locationType;
  @override

  /// Thứ tự hiển thị.
  @JsonKey(name: 'STT')
  int? get stt;
  @override

  /// Tổng số mã sản phẩm thuộc vị trí này trong đợt kiểm kê.
  @JsonKey(name: 'TotalCount')
  int get totalCount;
  @override

  /// Số mã đã kiểm (`QuantityActual` khác null).
  @JsonKey(name: 'CountedCount')
  int get countedCount;
  @override

  /// Số mã chưa kiểm.
  @JsonKey(name: 'UncountedCount')
  int get uncountedCount;
  @override

  /// Vị trí đã kiểm xong hay chưa.
  @JsonKey(name: 'IsCompleted')
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$InventoryProductLocationImplCopyWith<_$InventoryProductLocationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryModulaLocationGroup _$InventoryModulaLocationGroupFromJson(
    Map<String, dynamic> json) {
  return _InventoryModulaLocationGroup.fromJson(json);
}

/// @nodoc
mixin _$InventoryModulaLocationGroup {
  /// Id tủ Modula (0 = chưa có vị trí).
  @JsonKey(name: 'ModulaLocationID')
  int? get id => throw _privateConstructorUsedError;

  /// Thứ tự hiển thị.
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;

  /// Mã tủ (vd. `TRAY1`).
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;

  /// Tên tủ (vd. `Tray 1`).
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;

  /// Tổng số mã sản phẩm thuộc tủ này.
  @JsonKey(name: 'TotalCount')
  int get totalCount => throw _privateConstructorUsedError;

  /// Số mã đã kiểm.
  @JsonKey(name: 'CountedCount')
  int get countedCount => throw _privateConstructorUsedError;

  /// Số mã chưa kiểm.
  @JsonKey(name: 'UncountedCount')
  int get uncountedCount => throw _privateConstructorUsedError;

  /// Tủ đã kiểm xong hay chưa.
  @JsonKey(name: 'IsCompleted')
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryModulaLocationGroupCopyWith<InventoryModulaLocationGroup>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryModulaLocationGroupCopyWith<$Res> {
  factory $InventoryModulaLocationGroupCopyWith(
          InventoryModulaLocationGroup value,
          $Res Function(InventoryModulaLocationGroup) then) =
      _$InventoryModulaLocationGroupCopyWithImpl<$Res,
          InventoryModulaLocationGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ModulaLocationID') int? id,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'TotalCount') int totalCount,
      @JsonKey(name: 'CountedCount') int countedCount,
      @JsonKey(name: 'UncountedCount') int uncountedCount,
      @JsonKey(name: 'IsCompleted') bool isCompleted});
}

/// @nodoc
class _$InventoryModulaLocationGroupCopyWithImpl<$Res,
        $Val extends InventoryModulaLocationGroup>
    implements $InventoryModulaLocationGroupCopyWith<$Res> {
  _$InventoryModulaLocationGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? totalCount = null,
    Object? countedCount = null,
    Object? uncountedCount = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      countedCount: null == countedCount
          ? _value.countedCount
          : countedCount // ignore: cast_nullable_to_non_nullable
              as int,
      uncountedCount: null == uncountedCount
          ? _value.uncountedCount
          : uncountedCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryModulaLocationGroupImplCopyWith<$Res>
    implements $InventoryModulaLocationGroupCopyWith<$Res> {
  factory _$$InventoryModulaLocationGroupImplCopyWith(
          _$InventoryModulaLocationGroupImpl value,
          $Res Function(_$InventoryModulaLocationGroupImpl) then) =
      __$$InventoryModulaLocationGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ModulaLocationID') int? id,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'TotalCount') int totalCount,
      @JsonKey(name: 'CountedCount') int countedCount,
      @JsonKey(name: 'UncountedCount') int uncountedCount,
      @JsonKey(name: 'IsCompleted') bool isCompleted});
}

/// @nodoc
class __$$InventoryModulaLocationGroupImplCopyWithImpl<$Res>
    extends _$InventoryModulaLocationGroupCopyWithImpl<$Res,
        _$InventoryModulaLocationGroupImpl>
    implements _$$InventoryModulaLocationGroupImplCopyWith<$Res> {
  __$$InventoryModulaLocationGroupImplCopyWithImpl(
      _$InventoryModulaLocationGroupImpl _value,
      $Res Function(_$InventoryModulaLocationGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? totalCount = null,
    Object? countedCount = null,
    Object? uncountedCount = null,
    Object? isCompleted = null,
  }) {
    return _then(_$InventoryModulaLocationGroupImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      countedCount: null == countedCount
          ? _value.countedCount
          : countedCount // ignore: cast_nullable_to_non_nullable
              as int,
      uncountedCount: null == uncountedCount
          ? _value.uncountedCount
          : uncountedCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryModulaLocationGroupImpl
    implements _InventoryModulaLocationGroup {
  const _$InventoryModulaLocationGroupImpl(
      {@JsonKey(name: 'ModulaLocationID') this.id,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'TotalCount') this.totalCount = 0,
      @JsonKey(name: 'CountedCount') this.countedCount = 0,
      @JsonKey(name: 'UncountedCount') this.uncountedCount = 0,
      @JsonKey(name: 'IsCompleted') this.isCompleted = false});

  factory _$InventoryModulaLocationGroupImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InventoryModulaLocationGroupImplFromJson(json);

  /// Id tủ Modula (0 = chưa có vị trí).
  @override
  @JsonKey(name: 'ModulaLocationID')
  final int? id;

  /// Thứ tự hiển thị.
  @override
  @JsonKey(name: 'STT')
  final int? stt;

  /// Mã tủ (vd. `TRAY1`).
  @override
  @JsonKey(name: 'Code')
  final String? code;

  /// Tên tủ (vd. `Tray 1`).
  @override
  @JsonKey(name: 'Name')
  final String? name;

  /// Tổng số mã sản phẩm thuộc tủ này.
  @override
  @JsonKey(name: 'TotalCount')
  final int totalCount;

  /// Số mã đã kiểm.
  @override
  @JsonKey(name: 'CountedCount')
  final int countedCount;

  /// Số mã chưa kiểm.
  @override
  @JsonKey(name: 'UncountedCount')
  final int uncountedCount;

  /// Tủ đã kiểm xong hay chưa.
  @override
  @JsonKey(name: 'IsCompleted')
  final bool isCompleted;

  @override
  String toString() {
    return 'InventoryModulaLocationGroup(id: $id, stt: $stt, code: $code, name: $name, totalCount: $totalCount, countedCount: $countedCount, uncountedCount: $uncountedCount, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryModulaLocationGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.countedCount, countedCount) ||
                other.countedCount == countedCount) &&
            (identical(other.uncountedCount, uncountedCount) ||
                other.uncountedCount == uncountedCount) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, stt, code, name, totalCount,
      countedCount, uncountedCount, isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryModulaLocationGroupImplCopyWith<
          _$InventoryModulaLocationGroupImpl>
      get copyWith => __$$InventoryModulaLocationGroupImplCopyWithImpl<
          _$InventoryModulaLocationGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryModulaLocationGroupImplToJson(
      this,
    );
  }
}

abstract class _InventoryModulaLocationGroup
    implements InventoryModulaLocationGroup {
  const factory _InventoryModulaLocationGroup(
          {@JsonKey(name: 'ModulaLocationID') final int? id,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'TotalCount') final int totalCount,
          @JsonKey(name: 'CountedCount') final int countedCount,
          @JsonKey(name: 'UncountedCount') final int uncountedCount,
          @JsonKey(name: 'IsCompleted') final bool isCompleted}) =
      _$InventoryModulaLocationGroupImpl;

  factory _InventoryModulaLocationGroup.fromJson(Map<String, dynamic> json) =
      _$InventoryModulaLocationGroupImpl.fromJson;

  @override

  /// Id tủ Modula (0 = chưa có vị trí).
  @JsonKey(name: 'ModulaLocationID')
  int? get id;
  @override

  /// Thứ tự hiển thị.
  @JsonKey(name: 'STT')
  int? get stt;
  @override

  /// Mã tủ (vd. `TRAY1`).
  @JsonKey(name: 'Code')
  String? get code;
  @override

  /// Tên tủ (vd. `Tray 1`).
  @JsonKey(name: 'Name')
  String? get name;
  @override

  /// Tổng số mã sản phẩm thuộc tủ này.
  @JsonKey(name: 'TotalCount')
  int get totalCount;
  @override

  /// Số mã đã kiểm.
  @JsonKey(name: 'CountedCount')
  int get countedCount;
  @override

  /// Số mã chưa kiểm.
  @JsonKey(name: 'UncountedCount')
  int get uncountedCount;
  @override

  /// Tủ đã kiểm xong hay chưa.
  @JsonKey(name: 'IsCompleted')
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$InventoryModulaLocationGroupImplCopyWith<
          _$InventoryModulaLocationGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryModulaLocationDetail _$InventoryModulaLocationDetailFromJson(
    Map<String, dynamic> json) {
  return _InventoryModulaLocationDetail.fromJson(json);
}

/// @nodoc
mixin _$InventoryModulaLocationDetail {
  /// Id tủ Modula cha.
  @JsonKey(name: 'ModulaLocationID')
  int? get modulaLocationId => throw _privateConstructorUsedError;

  /// Thứ tự hiển thị của tủ.
  @JsonKey(name: 'ModulaSTT')
  int? get modulaStt => throw _privateConstructorUsedError;

  /// Mã tủ Modula.
  @JsonKey(name: 'ModulaLocationCode')
  String? get modulaLocationCode => throw _privateConstructorUsedError;

  /// Tên tủ Modula.
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;

  /// Id ô Modula chi tiết (0 = chưa có vị trí).
  @JsonKey(name: 'ModulaLocationDetailID')
  int? get detailId => throw _privateConstructorUsedError;

  /// Thứ tự hiển thị của ô.
  @JsonKey(name: 'DetailSTT')
  int? get detailStt => throw _privateConstructorUsedError;

  /// Mã ô Modula (vd. `VT1`).
  @JsonKey(name: 'ModulaLocationDetailCode')
  String? get detailCode => throw _privateConstructorUsedError;

  /// Tên ô Modula (vd. `Vị trí 1`).
  @JsonKey(name: 'ModulaLocationDetailName')
  String? get detailName => throw _privateConstructorUsedError;

  /// Tên đầy đủ để hiển thị (vd. `Tray 1 - Vị trí 1`).
  @JsonKey(name: 'LocationName')
  String? get locationName => throw _privateConstructorUsedError;

  /// Tổng số mã sản phẩm thuộc ô này.
  @JsonKey(name: 'TotalCount')
  int get totalCount => throw _privateConstructorUsedError;

  /// Số mã đã kiểm.
  @JsonKey(name: 'CountedCount')
  int get countedCount => throw _privateConstructorUsedError;

  /// Số mã chưa kiểm.
  @JsonKey(name: 'UncountedCount')
  int get uncountedCount => throw _privateConstructorUsedError;

  /// Ô đã kiểm xong hay chưa.
  @JsonKey(name: 'IsCompleted')
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryModulaLocationDetailCopyWith<InventoryModulaLocationDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryModulaLocationDetailCopyWith<$Res> {
  factory $InventoryModulaLocationDetailCopyWith(
          InventoryModulaLocationDetail value,
          $Res Function(InventoryModulaLocationDetail) then) =
      _$InventoryModulaLocationDetailCopyWithImpl<$Res,
          InventoryModulaLocationDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ModulaLocationID') int? modulaLocationId,
      @JsonKey(name: 'ModulaSTT') int? modulaStt,
      @JsonKey(name: 'ModulaLocationCode') String? modulaLocationCode,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'ModulaLocationDetailID') int? detailId,
      @JsonKey(name: 'DetailSTT') int? detailStt,
      @JsonKey(name: 'ModulaLocationDetailCode') String? detailCode,
      @JsonKey(name: 'ModulaLocationDetailName') String? detailName,
      @JsonKey(name: 'LocationName') String? locationName,
      @JsonKey(name: 'TotalCount') int totalCount,
      @JsonKey(name: 'CountedCount') int countedCount,
      @JsonKey(name: 'UncountedCount') int uncountedCount,
      @JsonKey(name: 'IsCompleted') bool isCompleted});
}

/// @nodoc
class _$InventoryModulaLocationDetailCopyWithImpl<$Res,
        $Val extends InventoryModulaLocationDetail>
    implements $InventoryModulaLocationDetailCopyWith<$Res> {
  _$InventoryModulaLocationDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modulaLocationId = freezed,
    Object? modulaStt = freezed,
    Object? modulaLocationCode = freezed,
    Object? name = freezed,
    Object? detailId = freezed,
    Object? detailStt = freezed,
    Object? detailCode = freezed,
    Object? detailName = freezed,
    Object? locationName = freezed,
    Object? totalCount = null,
    Object? countedCount = null,
    Object? uncountedCount = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      modulaLocationId: freezed == modulaLocationId
          ? _value.modulaLocationId
          : modulaLocationId // ignore: cast_nullable_to_non_nullable
              as int?,
      modulaStt: freezed == modulaStt
          ? _value.modulaStt
          : modulaStt // ignore: cast_nullable_to_non_nullable
              as int?,
      modulaLocationCode: freezed == modulaLocationCode
          ? _value.modulaLocationCode
          : modulaLocationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      detailId: freezed == detailId
          ? _value.detailId
          : detailId // ignore: cast_nullable_to_non_nullable
              as int?,
      detailStt: freezed == detailStt
          ? _value.detailStt
          : detailStt // ignore: cast_nullable_to_non_nullable
              as int?,
      detailCode: freezed == detailCode
          ? _value.detailCode
          : detailCode // ignore: cast_nullable_to_non_nullable
              as String?,
      detailName: freezed == detailName
          ? _value.detailName
          : detailName // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      countedCount: null == countedCount
          ? _value.countedCount
          : countedCount // ignore: cast_nullable_to_non_nullable
              as int,
      uncountedCount: null == uncountedCount
          ? _value.uncountedCount
          : uncountedCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryModulaLocationDetailImplCopyWith<$Res>
    implements $InventoryModulaLocationDetailCopyWith<$Res> {
  factory _$$InventoryModulaLocationDetailImplCopyWith(
          _$InventoryModulaLocationDetailImpl value,
          $Res Function(_$InventoryModulaLocationDetailImpl) then) =
      __$$InventoryModulaLocationDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ModulaLocationID') int? modulaLocationId,
      @JsonKey(name: 'ModulaSTT') int? modulaStt,
      @JsonKey(name: 'ModulaLocationCode') String? modulaLocationCode,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'ModulaLocationDetailID') int? detailId,
      @JsonKey(name: 'DetailSTT') int? detailStt,
      @JsonKey(name: 'ModulaLocationDetailCode') String? detailCode,
      @JsonKey(name: 'ModulaLocationDetailName') String? detailName,
      @JsonKey(name: 'LocationName') String? locationName,
      @JsonKey(name: 'TotalCount') int totalCount,
      @JsonKey(name: 'CountedCount') int countedCount,
      @JsonKey(name: 'UncountedCount') int uncountedCount,
      @JsonKey(name: 'IsCompleted') bool isCompleted});
}

/// @nodoc
class __$$InventoryModulaLocationDetailImplCopyWithImpl<$Res>
    extends _$InventoryModulaLocationDetailCopyWithImpl<$Res,
        _$InventoryModulaLocationDetailImpl>
    implements _$$InventoryModulaLocationDetailImplCopyWith<$Res> {
  __$$InventoryModulaLocationDetailImplCopyWithImpl(
      _$InventoryModulaLocationDetailImpl _value,
      $Res Function(_$InventoryModulaLocationDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modulaLocationId = freezed,
    Object? modulaStt = freezed,
    Object? modulaLocationCode = freezed,
    Object? name = freezed,
    Object? detailId = freezed,
    Object? detailStt = freezed,
    Object? detailCode = freezed,
    Object? detailName = freezed,
    Object? locationName = freezed,
    Object? totalCount = null,
    Object? countedCount = null,
    Object? uncountedCount = null,
    Object? isCompleted = null,
  }) {
    return _then(_$InventoryModulaLocationDetailImpl(
      modulaLocationId: freezed == modulaLocationId
          ? _value.modulaLocationId
          : modulaLocationId // ignore: cast_nullable_to_non_nullable
              as int?,
      modulaStt: freezed == modulaStt
          ? _value.modulaStt
          : modulaStt // ignore: cast_nullable_to_non_nullable
              as int?,
      modulaLocationCode: freezed == modulaLocationCode
          ? _value.modulaLocationCode
          : modulaLocationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      detailId: freezed == detailId
          ? _value.detailId
          : detailId // ignore: cast_nullable_to_non_nullable
              as int?,
      detailStt: freezed == detailStt
          ? _value.detailStt
          : detailStt // ignore: cast_nullable_to_non_nullable
              as int?,
      detailCode: freezed == detailCode
          ? _value.detailCode
          : detailCode // ignore: cast_nullable_to_non_nullable
              as String?,
      detailName: freezed == detailName
          ? _value.detailName
          : detailName // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      countedCount: null == countedCount
          ? _value.countedCount
          : countedCount // ignore: cast_nullable_to_non_nullable
              as int,
      uncountedCount: null == uncountedCount
          ? _value.uncountedCount
          : uncountedCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryModulaLocationDetailImpl
    implements _InventoryModulaLocationDetail {
  const _$InventoryModulaLocationDetailImpl(
      {@JsonKey(name: 'ModulaLocationID') this.modulaLocationId,
      @JsonKey(name: 'ModulaSTT') this.modulaStt,
      @JsonKey(name: 'ModulaLocationCode') this.modulaLocationCode,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'ModulaLocationDetailID') this.detailId,
      @JsonKey(name: 'DetailSTT') this.detailStt,
      @JsonKey(name: 'ModulaLocationDetailCode') this.detailCode,
      @JsonKey(name: 'ModulaLocationDetailName') this.detailName,
      @JsonKey(name: 'LocationName') this.locationName,
      @JsonKey(name: 'TotalCount') this.totalCount = 0,
      @JsonKey(name: 'CountedCount') this.countedCount = 0,
      @JsonKey(name: 'UncountedCount') this.uncountedCount = 0,
      @JsonKey(name: 'IsCompleted') this.isCompleted = false});

  factory _$InventoryModulaLocationDetailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InventoryModulaLocationDetailImplFromJson(json);

  /// Id tủ Modula cha.
  @override
  @JsonKey(name: 'ModulaLocationID')
  final int? modulaLocationId;

  /// Thứ tự hiển thị của tủ.
  @override
  @JsonKey(name: 'ModulaSTT')
  final int? modulaStt;

  /// Mã tủ Modula.
  @override
  @JsonKey(name: 'ModulaLocationCode')
  final String? modulaLocationCode;

  /// Tên tủ Modula.
  @override
  @JsonKey(name: 'Name')
  final String? name;

  /// Id ô Modula chi tiết (0 = chưa có vị trí).
  @override
  @JsonKey(name: 'ModulaLocationDetailID')
  final int? detailId;

  /// Thứ tự hiển thị của ô.
  @override
  @JsonKey(name: 'DetailSTT')
  final int? detailStt;

  /// Mã ô Modula (vd. `VT1`).
  @override
  @JsonKey(name: 'ModulaLocationDetailCode')
  final String? detailCode;

  /// Tên ô Modula (vd. `Vị trí 1`).
  @override
  @JsonKey(name: 'ModulaLocationDetailName')
  final String? detailName;

  /// Tên đầy đủ để hiển thị (vd. `Tray 1 - Vị trí 1`).
  @override
  @JsonKey(name: 'LocationName')
  final String? locationName;

  /// Tổng số mã sản phẩm thuộc ô này.
  @override
  @JsonKey(name: 'TotalCount')
  final int totalCount;

  /// Số mã đã kiểm.
  @override
  @JsonKey(name: 'CountedCount')
  final int countedCount;

  /// Số mã chưa kiểm.
  @override
  @JsonKey(name: 'UncountedCount')
  final int uncountedCount;

  /// Ô đã kiểm xong hay chưa.
  @override
  @JsonKey(name: 'IsCompleted')
  final bool isCompleted;

  @override
  String toString() {
    return 'InventoryModulaLocationDetail(modulaLocationId: $modulaLocationId, modulaStt: $modulaStt, modulaLocationCode: $modulaLocationCode, name: $name, detailId: $detailId, detailStt: $detailStt, detailCode: $detailCode, detailName: $detailName, locationName: $locationName, totalCount: $totalCount, countedCount: $countedCount, uncountedCount: $uncountedCount, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryModulaLocationDetailImpl &&
            (identical(other.modulaLocationId, modulaLocationId) ||
                other.modulaLocationId == modulaLocationId) &&
            (identical(other.modulaStt, modulaStt) ||
                other.modulaStt == modulaStt) &&
            (identical(other.modulaLocationCode, modulaLocationCode) ||
                other.modulaLocationCode == modulaLocationCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.detailId, detailId) ||
                other.detailId == detailId) &&
            (identical(other.detailStt, detailStt) ||
                other.detailStt == detailStt) &&
            (identical(other.detailCode, detailCode) ||
                other.detailCode == detailCode) &&
            (identical(other.detailName, detailName) ||
                other.detailName == detailName) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.countedCount, countedCount) ||
                other.countedCount == countedCount) &&
            (identical(other.uncountedCount, uncountedCount) ||
                other.uncountedCount == uncountedCount) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      modulaLocationId,
      modulaStt,
      modulaLocationCode,
      name,
      detailId,
      detailStt,
      detailCode,
      detailName,
      locationName,
      totalCount,
      countedCount,
      uncountedCount,
      isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryModulaLocationDetailImplCopyWith<
          _$InventoryModulaLocationDetailImpl>
      get copyWith => __$$InventoryModulaLocationDetailImplCopyWithImpl<
          _$InventoryModulaLocationDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryModulaLocationDetailImplToJson(
      this,
    );
  }
}

abstract class _InventoryModulaLocationDetail
    implements InventoryModulaLocationDetail {
  const factory _InventoryModulaLocationDetail(
          {@JsonKey(name: 'ModulaLocationID') final int? modulaLocationId,
          @JsonKey(name: 'ModulaSTT') final int? modulaStt,
          @JsonKey(name: 'ModulaLocationCode') final String? modulaLocationCode,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'ModulaLocationDetailID') final int? detailId,
          @JsonKey(name: 'DetailSTT') final int? detailStt,
          @JsonKey(name: 'ModulaLocationDetailCode') final String? detailCode,
          @JsonKey(name: 'ModulaLocationDetailName') final String? detailName,
          @JsonKey(name: 'LocationName') final String? locationName,
          @JsonKey(name: 'TotalCount') final int totalCount,
          @JsonKey(name: 'CountedCount') final int countedCount,
          @JsonKey(name: 'UncountedCount') final int uncountedCount,
          @JsonKey(name: 'IsCompleted') final bool isCompleted}) =
      _$InventoryModulaLocationDetailImpl;

  factory _InventoryModulaLocationDetail.fromJson(Map<String, dynamic> json) =
      _$InventoryModulaLocationDetailImpl.fromJson;

  @override

  /// Id tủ Modula cha.
  @JsonKey(name: 'ModulaLocationID')
  int? get modulaLocationId;
  @override

  /// Thứ tự hiển thị của tủ.
  @JsonKey(name: 'ModulaSTT')
  int? get modulaStt;
  @override

  /// Mã tủ Modula.
  @JsonKey(name: 'ModulaLocationCode')
  String? get modulaLocationCode;
  @override

  /// Tên tủ Modula.
  @JsonKey(name: 'Name')
  String? get name;
  @override

  /// Id ô Modula chi tiết (0 = chưa có vị trí).
  @JsonKey(name: 'ModulaLocationDetailID')
  int? get detailId;
  @override

  /// Thứ tự hiển thị của ô.
  @JsonKey(name: 'DetailSTT')
  int? get detailStt;
  @override

  /// Mã ô Modula (vd. `VT1`).
  @JsonKey(name: 'ModulaLocationDetailCode')
  String? get detailCode;
  @override

  /// Tên ô Modula (vd. `Vị trí 1`).
  @JsonKey(name: 'ModulaLocationDetailName')
  String? get detailName;
  @override

  /// Tên đầy đủ để hiển thị (vd. `Tray 1 - Vị trí 1`).
  @JsonKey(name: 'LocationName')
  String? get locationName;
  @override

  /// Tổng số mã sản phẩm thuộc ô này.
  @JsonKey(name: 'TotalCount')
  int get totalCount;
  @override

  /// Số mã đã kiểm.
  @JsonKey(name: 'CountedCount')
  int get countedCount;
  @override

  /// Số mã chưa kiểm.
  @JsonKey(name: 'UncountedCount')
  int get uncountedCount;
  @override

  /// Ô đã kiểm xong hay chưa.
  @JsonKey(name: 'IsCompleted')
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$InventoryModulaLocationDetailImplCopyWith<
          _$InventoryModulaLocationDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryLocationProgress _$InventoryLocationProgressFromJson(
    Map<String, dynamic> json) {
  return _InventoryLocationProgress.fromJson(json);
}

/// @nodoc
mixin _$InventoryLocationProgress {
  /// Danh sách vị trí kho / kệ (dòng đầu là ID = 0 "Chưa có vị trí").
  @JsonKey(name: 'ProductLocations')
  List<InventoryProductLocation> get productLocations =>
      throw _privateConstructorUsedError;

  /// Danh sách tủ / tray Modula cha (dòng đầu là ID = 0 "Chưa có vị trí").
  @JsonKey(name: 'ModulaLocationGroups')
  List<InventoryModulaLocationGroup> get modulaLocationGroups =>
      throw _privateConstructorUsedError;

  /// Danh sách ô Modula chi tiết (dòng đầu là ID = 0 "Chưa có vị trí").
  @JsonKey(name: 'ModulaLocations')
  List<InventoryModulaLocationDetail> get modulaLocations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryLocationProgressCopyWith<InventoryLocationProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryLocationProgressCopyWith<$Res> {
  factory $InventoryLocationProgressCopyWith(InventoryLocationProgress value,
          $Res Function(InventoryLocationProgress) then) =
      _$InventoryLocationProgressCopyWithImpl<$Res, InventoryLocationProgress>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductLocations')
      List<InventoryProductLocation> productLocations,
      @JsonKey(name: 'ModulaLocationGroups')
      List<InventoryModulaLocationGroup> modulaLocationGroups,
      @JsonKey(name: 'ModulaLocations')
      List<InventoryModulaLocationDetail> modulaLocations});
}

/// @nodoc
class _$InventoryLocationProgressCopyWithImpl<$Res,
        $Val extends InventoryLocationProgress>
    implements $InventoryLocationProgressCopyWith<$Res> {
  _$InventoryLocationProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productLocations = null,
    Object? modulaLocationGroups = null,
    Object? modulaLocations = null,
  }) {
    return _then(_value.copyWith(
      productLocations: null == productLocations
          ? _value.productLocations
          : productLocations // ignore: cast_nullable_to_non_nullable
              as List<InventoryProductLocation>,
      modulaLocationGroups: null == modulaLocationGroups
          ? _value.modulaLocationGroups
          : modulaLocationGroups // ignore: cast_nullable_to_non_nullable
              as List<InventoryModulaLocationGroup>,
      modulaLocations: null == modulaLocations
          ? _value.modulaLocations
          : modulaLocations // ignore: cast_nullable_to_non_nullable
              as List<InventoryModulaLocationDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryLocationProgressImplCopyWith<$Res>
    implements $InventoryLocationProgressCopyWith<$Res> {
  factory _$$InventoryLocationProgressImplCopyWith(
          _$InventoryLocationProgressImpl value,
          $Res Function(_$InventoryLocationProgressImpl) then) =
      __$$InventoryLocationProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductLocations')
      List<InventoryProductLocation> productLocations,
      @JsonKey(name: 'ModulaLocationGroups')
      List<InventoryModulaLocationGroup> modulaLocationGroups,
      @JsonKey(name: 'ModulaLocations')
      List<InventoryModulaLocationDetail> modulaLocations});
}

/// @nodoc
class __$$InventoryLocationProgressImplCopyWithImpl<$Res>
    extends _$InventoryLocationProgressCopyWithImpl<$Res,
        _$InventoryLocationProgressImpl>
    implements _$$InventoryLocationProgressImplCopyWith<$Res> {
  __$$InventoryLocationProgressImplCopyWithImpl(
      _$InventoryLocationProgressImpl _value,
      $Res Function(_$InventoryLocationProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productLocations = null,
    Object? modulaLocationGroups = null,
    Object? modulaLocations = null,
  }) {
    return _then(_$InventoryLocationProgressImpl(
      productLocations: null == productLocations
          ? _value._productLocations
          : productLocations // ignore: cast_nullable_to_non_nullable
              as List<InventoryProductLocation>,
      modulaLocationGroups: null == modulaLocationGroups
          ? _value._modulaLocationGroups
          : modulaLocationGroups // ignore: cast_nullable_to_non_nullable
              as List<InventoryModulaLocationGroup>,
      modulaLocations: null == modulaLocations
          ? _value._modulaLocations
          : modulaLocations // ignore: cast_nullable_to_non_nullable
              as List<InventoryModulaLocationDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryLocationProgressImpl implements _InventoryLocationProgress {
  const _$InventoryLocationProgressImpl(
      {@JsonKey(name: 'ProductLocations')
      final List<InventoryProductLocation> productLocations = const [],
      @JsonKey(name: 'ModulaLocationGroups')
      final List<InventoryModulaLocationGroup> modulaLocationGroups = const [],
      @JsonKey(name: 'ModulaLocations')
      final List<InventoryModulaLocationDetail> modulaLocations = const []})
      : _productLocations = productLocations,
        _modulaLocationGroups = modulaLocationGroups,
        _modulaLocations = modulaLocations;

  factory _$InventoryLocationProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryLocationProgressImplFromJson(json);

  /// Danh sách vị trí kho / kệ (dòng đầu là ID = 0 "Chưa có vị trí").
  final List<InventoryProductLocation> _productLocations;

  /// Danh sách vị trí kho / kệ (dòng đầu là ID = 0 "Chưa có vị trí").
  @override
  @JsonKey(name: 'ProductLocations')
  List<InventoryProductLocation> get productLocations {
    if (_productLocations is EqualUnmodifiableListView)
      return _productLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productLocations);
  }

  /// Danh sách tủ / tray Modula cha (dòng đầu là ID = 0 "Chưa có vị trí").
  final List<InventoryModulaLocationGroup> _modulaLocationGroups;

  /// Danh sách tủ / tray Modula cha (dòng đầu là ID = 0 "Chưa có vị trí").
  @override
  @JsonKey(name: 'ModulaLocationGroups')
  List<InventoryModulaLocationGroup> get modulaLocationGroups {
    if (_modulaLocationGroups is EqualUnmodifiableListView)
      return _modulaLocationGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modulaLocationGroups);
  }

  /// Danh sách ô Modula chi tiết (dòng đầu là ID = 0 "Chưa có vị trí").
  final List<InventoryModulaLocationDetail> _modulaLocations;

  /// Danh sách ô Modula chi tiết (dòng đầu là ID = 0 "Chưa có vị trí").
  @override
  @JsonKey(name: 'ModulaLocations')
  List<InventoryModulaLocationDetail> get modulaLocations {
    if (_modulaLocations is EqualUnmodifiableListView) return _modulaLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modulaLocations);
  }

  @override
  String toString() {
    return 'InventoryLocationProgress(productLocations: $productLocations, modulaLocationGroups: $modulaLocationGroups, modulaLocations: $modulaLocations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryLocationProgressImpl &&
            const DeepCollectionEquality()
                .equals(other._productLocations, _productLocations) &&
            const DeepCollectionEquality()
                .equals(other._modulaLocationGroups, _modulaLocationGroups) &&
            const DeepCollectionEquality()
                .equals(other._modulaLocations, _modulaLocations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productLocations),
      const DeepCollectionEquality().hash(_modulaLocationGroups),
      const DeepCollectionEquality().hash(_modulaLocations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryLocationProgressImplCopyWith<_$InventoryLocationProgressImpl>
      get copyWith => __$$InventoryLocationProgressImplCopyWithImpl<
          _$InventoryLocationProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryLocationProgressImplToJson(
      this,
    );
  }
}

abstract class _InventoryLocationProgress implements InventoryLocationProgress {
  const factory _InventoryLocationProgress(
          {@JsonKey(name: 'ProductLocations')
          final List<InventoryProductLocation> productLocations,
          @JsonKey(name: 'ModulaLocationGroups')
          final List<InventoryModulaLocationGroup> modulaLocationGroups,
          @JsonKey(name: 'ModulaLocations')
          final List<InventoryModulaLocationDetail> modulaLocations}) =
      _$InventoryLocationProgressImpl;

  factory _InventoryLocationProgress.fromJson(Map<String, dynamic> json) =
      _$InventoryLocationProgressImpl.fromJson;

  @override

  /// Danh sách vị trí kho / kệ (dòng đầu là ID = 0 "Chưa có vị trí").
  @JsonKey(name: 'ProductLocations')
  List<InventoryProductLocation> get productLocations;
  @override

  /// Danh sách tủ / tray Modula cha (dòng đầu là ID = 0 "Chưa có vị trí").
  @JsonKey(name: 'ModulaLocationGroups')
  List<InventoryModulaLocationGroup> get modulaLocationGroups;
  @override

  /// Danh sách ô Modula chi tiết (dòng đầu là ID = 0 "Chưa có vị trí").
  @JsonKey(name: 'ModulaLocations')
  List<InventoryModulaLocationDetail> get modulaLocations;
  @override
  @JsonKey(ignore: true)
  _$$InventoryLocationProgressImplCopyWith<_$InventoryLocationProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}
