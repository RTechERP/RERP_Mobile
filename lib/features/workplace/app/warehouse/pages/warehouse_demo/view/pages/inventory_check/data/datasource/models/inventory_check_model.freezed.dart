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
