// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_approval_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductReturnEmployee _$ProductReturnEmployeeFromJson(
  Map<String, dynamic> json,
) {
  return _ProductReturnEmployee.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnEmployee {
  /// Id nhân viên (lưu ý server trả với key `EmployeeeID`).
  @JsonKey(name: 'EmployeeeID')
  int? get employeeId => throw _privateConstructorUsedError;

  /// Id người dùng — dùng làm tham số `userID` khi lọc lịch sử mượn/trả.
  @JsonKey(name: 'UserID')
  int? get userId => throw _privateConstructorUsedError;

  /// Mã nhân viên (vd. `GM00`).
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;

  /// Họ tên nhân viên.
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;

  /// Id phòng ban.
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;

  /// Tên phòng ban.
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;

  /// Id nhóm.
  @JsonKey(name: 'TeamID')
  int? get teamId => throw _privateConstructorUsedError;

  /// Tên nhóm.
  @JsonKey(name: 'TeamName')
  String? get teamName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReturnEmployeeCopyWith<ProductReturnEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnEmployeeCopyWith<$Res> {
  factory $ProductReturnEmployeeCopyWith(
    ProductReturnEmployee value,
    $Res Function(ProductReturnEmployee) then,
  ) = _$ProductReturnEmployeeCopyWithImpl<$Res, ProductReturnEmployee>;
  @useResult
  $Res call({
    @JsonKey(name: 'EmployeeeID') int? employeeId,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'TeamID') int? teamId,
    @JsonKey(name: 'TeamName') String? teamName,
  });
}

/// @nodoc
class _$ProductReturnEmployeeCopyWithImpl<
  $Res,
  $Val extends ProductReturnEmployee
>
    implements $ProductReturnEmployeeCopyWith<$Res> {
  _$ProductReturnEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? userId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? teamId = freezed,
    Object? teamName = freezed,
  }) {
    return _then(
      _value.copyWith(
            employeeId: freezed == employeeId
                ? _value.employeeId
                : employeeId // ignore: cast_nullable_to_non_nullable
                      as int?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            departmentId: freezed == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as int?,
            departmentName: freezed == departmentName
                ? _value.departmentName
                : departmentName // ignore: cast_nullable_to_non_nullable
                      as String?,
            teamId: freezed == teamId
                ? _value.teamId
                : teamId // ignore: cast_nullable_to_non_nullable
                      as int?,
            teamName: freezed == teamName
                ? _value.teamName
                : teamName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductReturnEmployeeImplCopyWith<$Res>
    implements $ProductReturnEmployeeCopyWith<$Res> {
  factory _$$ProductReturnEmployeeImplCopyWith(
    _$ProductReturnEmployeeImpl value,
    $Res Function(_$ProductReturnEmployeeImpl) then,
  ) = __$$ProductReturnEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'EmployeeeID') int? employeeId,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'TeamID') int? teamId,
    @JsonKey(name: 'TeamName') String? teamName,
  });
}

/// @nodoc
class __$$ProductReturnEmployeeImplCopyWithImpl<$Res>
    extends
        _$ProductReturnEmployeeCopyWithImpl<$Res, _$ProductReturnEmployeeImpl>
    implements _$$ProductReturnEmployeeImplCopyWith<$Res> {
  __$$ProductReturnEmployeeImplCopyWithImpl(
    _$ProductReturnEmployeeImpl _value,
    $Res Function(_$ProductReturnEmployeeImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? userId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? teamId = freezed,
    Object? teamName = freezed,
  }) {
    return _then(
      _$ProductReturnEmployeeImpl(
        employeeId: freezed == employeeId
            ? _value.employeeId
            : employeeId // ignore: cast_nullable_to_non_nullable
                  as int?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        departmentId: freezed == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as int?,
        departmentName: freezed == departmentName
            ? _value.departmentName
            : departmentName // ignore: cast_nullable_to_non_nullable
                  as String?,
        teamId: freezed == teamId
            ? _value.teamId
            : teamId // ignore: cast_nullable_to_non_nullable
                  as int?,
        teamName: freezed == teamName
            ? _value.teamName
            : teamName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnEmployeeImpl implements _ProductReturnEmployee {
  const _$ProductReturnEmployeeImpl({
    @JsonKey(name: 'EmployeeeID') this.employeeId,
    @JsonKey(name: 'UserID') this.userId,
    @JsonKey(name: 'Code') this.code,
    @JsonKey(name: 'FullName') this.fullName,
    @JsonKey(name: 'DepartmentID') this.departmentId,
    @JsonKey(name: 'DepartmentName') this.departmentName,
    @JsonKey(name: 'TeamID') this.teamId,
    @JsonKey(name: 'TeamName') this.teamName,
  });

  factory _$ProductReturnEmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReturnEmployeeImplFromJson(json);

  /// Id nhân viên (lưu ý server trả với key `EmployeeeID`).
  @override
  @JsonKey(name: 'EmployeeeID')
  final int? employeeId;

  /// Id người dùng — dùng làm tham số `userID` khi lọc lịch sử mượn/trả.
  @override
  @JsonKey(name: 'UserID')
  final int? userId;

  /// Mã nhân viên (vd. `GM00`).
  @override
  @JsonKey(name: 'Code')
  final String? code;

  /// Họ tên nhân viên.
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;

  /// Id phòng ban.
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;

  /// Tên phòng ban.
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;

  /// Id nhóm.
  @override
  @JsonKey(name: 'TeamID')
  final int? teamId;

  /// Tên nhóm.
  @override
  @JsonKey(name: 'TeamName')
  final String? teamName;

  @override
  String toString() {
    return 'ProductReturnEmployee(employeeId: $employeeId, userId: $userId, code: $code, fullName: $fullName, departmentId: $departmentId, departmentName: $departmentName, teamId: $teamId, teamName: $teamName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnEmployeeImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    employeeId,
    userId,
    code,
    fullName,
    departmentId,
    departmentName,
    teamId,
    teamName,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnEmployeeImplCopyWith<_$ProductReturnEmployeeImpl>
  get copyWith =>
      __$$ProductReturnEmployeeImplCopyWithImpl<_$ProductReturnEmployeeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnEmployeeImplToJson(this);
  }
}

abstract class _ProductReturnEmployee implements ProductReturnEmployee {
  const factory _ProductReturnEmployee({
    @JsonKey(name: 'EmployeeeID') final int? employeeId,
    @JsonKey(name: 'UserID') final int? userId,
    @JsonKey(name: 'Code') final String? code,
    @JsonKey(name: 'FullName') final String? fullName,
    @JsonKey(name: 'DepartmentID') final int? departmentId,
    @JsonKey(name: 'DepartmentName') final String? departmentName,
    @JsonKey(name: 'TeamID') final int? teamId,
    @JsonKey(name: 'TeamName') final String? teamName,
  }) = _$ProductReturnEmployeeImpl;

  factory _ProductReturnEmployee.fromJson(Map<String, dynamic> json) =
      _$ProductReturnEmployeeImpl.fromJson;

  @override
  /// Id nhân viên (lưu ý server trả với key `EmployeeeID`).
  @JsonKey(name: 'EmployeeeID')
  int? get employeeId;
  @override
  /// Id người dùng — dùng làm tham số `userID` khi lọc lịch sử mượn/trả.
  @JsonKey(name: 'UserID')
  int? get userId;
  @override
  /// Mã nhân viên (vd. `GM00`).
  @JsonKey(name: 'Code')
  String? get code;
  @override
  /// Họ tên nhân viên.
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  /// Id phòng ban.
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  /// Tên phòng ban.
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  /// Id nhóm.
  @JsonKey(name: 'TeamID')
  int? get teamId;
  @override
  /// Tên nhóm.
  @JsonKey(name: 'TeamName')
  String? get teamName;
  @override
  @JsonKey(ignore: true)
  _$$ProductReturnEmployeeImplCopyWith<_$ProductReturnEmployeeImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ProductReturnHistoryItem _$ProductReturnHistoryItemFromJson(
  Map<String, dynamic> json,
) {
  return _ProductReturnHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnHistoryItem {
  /// Id phiếu mượn.
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Trạng thái phiếu (4 = đăng ký trả, 5 = chờ duyệt...).
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;

  /// Trạng thái mới của phiếu (dùng để hiển thị chip).
  @JsonKey(name: 'StatusNew')
  int? get statusNew => throw _privateConstructorUsedError;

  /// Nhãn trạng thái (vd. `Đăng ký trả`).
  @JsonKey(name: 'StatusText')
  String? get statusText => throw _privateConstructorUsedError;

  /// Id sản phẩm RTC.
  @JsonKey(name: 'ProductRTCID')
  int? get productRtcId => throw _privateConstructorUsedError;

  /// Id QR code sản phẩm.
  @JsonKey(name: 'ProductRTCQRCodeID')
  int? get productRtcQrCodeId => throw _privateConstructorUsedError;

  /// Thời điểm mượn (ISO).
  @JsonKey(name: 'DateBorrow')
  String? get dateBorrow => throw _privateConstructorUsedError;

  /// Hạn trả dự kiến (ISO).
  @JsonKey(name: 'DateReturnExpected')
  String? get dateReturnExpected => throw _privateConstructorUsedError;

  /// Thời điểm trả thực tế (ISO, null = chưa trả).
  @JsonKey(name: 'DateReturn')
  String? get dateReturn => throw _privateConstructorUsedError;

  /// Id người mượn.
  @JsonKey(name: 'PeopleID')
  int? get peopleId => throw _privateConstructorUsedError;

  /// Họ tên người mượn (vd. `R0339 - Nguyễn Đức Thuận`).
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;

  /// Người mượn trước đó.
  @JsonKey(name: 'OldBorrower')
  String? get oldBorrower => throw _privateConstructorUsedError;

  /// Dự án sử dụng.
  @JsonKey(name: 'Project')
  String? get project => throw _privateConstructorUsedError;

  /// Ghi chú.
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;

  /// Số lượng đã mượn.
  @JsonKey(name: 'NumberBorrow')
  double? get numberBorrow => throw _privateConstructorUsedError;

  /// Người quản lý đã xác nhận hay chưa.
  @JsonKey(name: 'AdminConfirm')
  bool get adminConfirm => throw _privateConstructorUsedError;

  /// Id phiếu xuất kho liên quan.
  @JsonKey(name: 'BillExportTechnicalID')
  int? get billExportTechnicalId => throw _privateConstructorUsedError;

  /// Mã phiếu xuất kho liên quan.
  @JsonKey(name: 'BillExportCode')
  String? get billExportCode => throw _privateConstructorUsedError;

  /// Nhãn loại phiếu.
  @JsonKey(name: 'BillTypeText')
  String? get billTypeText => throw _privateConstructorUsedError;

  /// Trạng thái phiếu xuất kho.
  @JsonKey(name: 'BillStatus')
  int? get billStatus => throw _privateConstructorUsedError;

  /// Id nhóm sản phẩm.
  @JsonKey(name: 'ProductGroupRTCID')
  int? get productGroupRtcId => throw _privateConstructorUsedError;

  /// Tên nhóm sản phẩm.
  @JsonKey(name: 'ProductGroupName')
  String? get productGroupName => throw _privateConstructorUsedError;

  /// Mã sản phẩm.
  @JsonKey(name: 'ProductCode')
  String? get productCode => throw _privateConstructorUsedError;

  /// Mã nội bộ sản phẩm.
  @JsonKey(name: 'ProductCodeRTC')
  String? get productCodeRtc => throw _privateConstructorUsedError;

  /// Tên sản phẩm.
  @JsonKey(name: 'ProductName')
  String? get productName => throw _privateConstructorUsedError;

  /// Nhà sản xuất.
  @JsonKey(name: 'Maker')
  String? get maker => throw _privateConstructorUsedError;

  /// Id đơn vị tính.
  @JsonKey(name: 'UnitCountID')
  int? get unitCountId => throw _privateConstructorUsedError;

  /// Tên đơn vị tính (vd. `PCS`).
  @JsonKey(name: 'UnitCountName')
  String? get unitCountName => throw _privateConstructorUsedError;

  /// Số lượng còn lại.
  @JsonKey(name: 'Number')
  double? get number => throw _privateConstructorUsedError;

  /// Trạng thái sản phẩm.
  @JsonKey(name: 'StatusProduct')
  bool get statusProduct => throw _privateConstructorUsedError;

  /// Thời điểm tạo bản ghi.
  @JsonKey(name: 'CreateDate')
  String? get createDate => throw _privateConstructorUsedError;

  /// Số lượng tồn trong kho.
  @JsonKey(name: 'NumberInStore')
  double? get numberInStore => throw _privateConstructorUsedError;

  /// Số serial.
  @JsonKey(name: 'Serial')
  String? get serial => throw _privateConstructorUsedError;

  /// Số serial.
  @JsonKey(name: 'SerialNumber')
  String? get serialNumber => throw _privateConstructorUsedError;

  /// Part number.
  @JsonKey(name: 'PartNumber')
  String? get partNumber => throw _privateConstructorUsedError;

  /// Người tạo bản ghi.
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;

  /// Đường dẫn ảnh vị trí.
  @JsonKey(name: 'LocationImg')
  String? get locationImg => throw _privateConstructorUsedError;

  /// Sản phẩm mượn của khách hàng hay không.
  @JsonKey(name: 'BorrowCustomer')
  bool get borrowCustomer => throw _privateConstructorUsedError;

  /// Địa chỉ lưu kho (ô lưu trữ).
  @JsonKey(name: 'AddressBox')
  String? get addressBox => throw _privateConstructorUsedError;

  /// Bản ghi đã bị xoá hay chưa.
  @JsonKey(name: 'IsDelete')
  bool get isDelete => throw _privateConstructorUsedError;

  /// Tên phòng ban của người mượn.
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;

  /// QR code sản phẩm.
  @JsonKey(name: 'ProductQRCode')
  String? get productQrCode => throw _privateConstructorUsedError;

  /// Zalo id của người mượn.
  @JsonKey(name: 'UserZaloID')
  String? get userZaloId => throw _privateConstructorUsedError;

  /// Vị trí kho Modula.
  @JsonKey(name: 'ModulaLocationName')
  String? get modulaLocationName => throw _privateConstructorUsedError;

  /// Mã vị trí kho Modula.
  @JsonKey(name: 'ModulaLocationCode')
  String? get modulaLocationCode => throw _privateConstructorUsedError;

  /// Toạ độ X.
  @JsonKey(name: 'AxisX')
  double? get axisX => throw _privateConstructorUsedError;

  /// Toạ độ Y.
  @JsonKey(name: 'AxisY')
  double? get axisY => throw _privateConstructorUsedError;

  /// Trạng thái người mượn.
  @JsonKey(name: 'StatusPerson')
  int? get statusPerson => throw _privateConstructorUsedError;

  /// Nhãn trạng thái người mượn.
  @JsonKey(name: 'StatusPersonText')
  String? get statusPersonText => throw _privateConstructorUsedError;

  /// Id ô Modula chi tiết.
  @JsonKey(name: 'ModulaLocationDetailID')
  int? get modulaLocationDetailId => throw _privateConstructorUsedError;

  /// Mã ô Modula chi tiết.
  @JsonKey(name: 'ModulaLocationDetailCode')
  String? get modulaLocationDetailCode => throw _privateConstructorUsedError;

  /// Tên ô Modula chi tiết.
  @JsonKey(name: 'ModulaLocationDetailName')
  String? get modulaLocationDetailName => throw _privateConstructorUsedError;

  /// Tên kho.
  @JsonKey(name: 'WarehouseName')
  String? get warehouseName => throw _privateConstructorUsedError;

  /// Số thứ tự hiển thị.
  @JsonKey(name: 'RowNumber')
  int? get rowNumber => throw _privateConstructorUsedError;

  /// Cờ trùng ngày.
  @JsonKey(name: 'DualDate')
  int? get dualDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReturnHistoryItemCopyWith<ProductReturnHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnHistoryItemCopyWith<$Res> {
  factory $ProductReturnHistoryItemCopyWith(
    ProductReturnHistoryItem value,
    $Res Function(ProductReturnHistoryItem) then,
  ) = _$ProductReturnHistoryItemCopyWithImpl<$Res, ProductReturnHistoryItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'StatusNew') int? statusNew,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'ProductRTCID') int? productRtcId,
    @JsonKey(name: 'ProductRTCQRCodeID') int? productRtcQrCodeId,
    @JsonKey(name: 'DateBorrow') String? dateBorrow,
    @JsonKey(name: 'DateReturnExpected') String? dateReturnExpected,
    @JsonKey(name: 'DateReturn') String? dateReturn,
    @JsonKey(name: 'PeopleID') int? peopleId,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'OldBorrower') String? oldBorrower,
    @JsonKey(name: 'Project') String? project,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'NumberBorrow') double? numberBorrow,
    @JsonKey(name: 'AdminConfirm') bool adminConfirm,
    @JsonKey(name: 'BillExportTechnicalID') int? billExportTechnicalId,
    @JsonKey(name: 'BillExportCode') String? billExportCode,
    @JsonKey(name: 'BillTypeText') String? billTypeText,
    @JsonKey(name: 'BillStatus') int? billStatus,
    @JsonKey(name: 'ProductGroupRTCID') int? productGroupRtcId,
    @JsonKey(name: 'ProductGroupName') String? productGroupName,
    @JsonKey(name: 'ProductCode') String? productCode,
    @JsonKey(name: 'ProductCodeRTC') String? productCodeRtc,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'Maker') String? maker,
    @JsonKey(name: 'UnitCountID') int? unitCountId,
    @JsonKey(name: 'UnitCountName') String? unitCountName,
    @JsonKey(name: 'Number') double? number,
    @JsonKey(name: 'StatusProduct') bool statusProduct,
    @JsonKey(name: 'CreateDate') String? createDate,
    @JsonKey(name: 'NumberInStore') double? numberInStore,
    @JsonKey(name: 'Serial') String? serial,
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'PartNumber') String? partNumber,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'LocationImg') String? locationImg,
    @JsonKey(name: 'BorrowCustomer') bool borrowCustomer,
    @JsonKey(name: 'AddressBox') String? addressBox,
    @JsonKey(name: 'IsDelete') bool isDelete,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'ProductQRCode') String? productQrCode,
    @JsonKey(name: 'UserZaloID') String? userZaloId,
    @JsonKey(name: 'ModulaLocationName') String? modulaLocationName,
    @JsonKey(name: 'ModulaLocationCode') String? modulaLocationCode,
    @JsonKey(name: 'AxisX') double? axisX,
    @JsonKey(name: 'AxisY') double? axisY,
    @JsonKey(name: 'StatusPerson') int? statusPerson,
    @JsonKey(name: 'StatusPersonText') String? statusPersonText,
    @JsonKey(name: 'ModulaLocationDetailID') int? modulaLocationDetailId,
    @JsonKey(name: 'ModulaLocationDetailCode') String? modulaLocationDetailCode,
    @JsonKey(name: 'ModulaLocationDetailName') String? modulaLocationDetailName,
    @JsonKey(name: 'WarehouseName') String? warehouseName,
    @JsonKey(name: 'RowNumber') int? rowNumber,
    @JsonKey(name: 'DualDate') int? dualDate,
  });
}

/// @nodoc
class _$ProductReturnHistoryItemCopyWithImpl<
  $Res,
  $Val extends ProductReturnHistoryItem
>
    implements $ProductReturnHistoryItemCopyWith<$Res> {
  _$ProductReturnHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? statusNew = freezed,
    Object? statusText = freezed,
    Object? productRtcId = freezed,
    Object? productRtcQrCodeId = freezed,
    Object? dateBorrow = freezed,
    Object? dateReturnExpected = freezed,
    Object? dateReturn = freezed,
    Object? peopleId = freezed,
    Object? fullName = freezed,
    Object? oldBorrower = freezed,
    Object? project = freezed,
    Object? note = freezed,
    Object? numberBorrow = freezed,
    Object? adminConfirm = null,
    Object? billExportTechnicalId = freezed,
    Object? billExportCode = freezed,
    Object? billTypeText = freezed,
    Object? billStatus = freezed,
    Object? productGroupRtcId = freezed,
    Object? productGroupName = freezed,
    Object? productCode = freezed,
    Object? productCodeRtc = freezed,
    Object? productName = freezed,
    Object? maker = freezed,
    Object? unitCountId = freezed,
    Object? unitCountName = freezed,
    Object? number = freezed,
    Object? statusProduct = null,
    Object? createDate = freezed,
    Object? numberInStore = freezed,
    Object? serial = freezed,
    Object? serialNumber = freezed,
    Object? partNumber = freezed,
    Object? createdBy = freezed,
    Object? locationImg = freezed,
    Object? borrowCustomer = null,
    Object? addressBox = freezed,
    Object? isDelete = null,
    Object? departmentName = freezed,
    Object? productQrCode = freezed,
    Object? userZaloId = freezed,
    Object? modulaLocationName = freezed,
    Object? modulaLocationCode = freezed,
    Object? axisX = freezed,
    Object? axisY = freezed,
    Object? statusPerson = freezed,
    Object? statusPersonText = freezed,
    Object? modulaLocationDetailId = freezed,
    Object? modulaLocationDetailCode = freezed,
    Object? modulaLocationDetailName = freezed,
    Object? warehouseName = freezed,
    Object? rowNumber = freezed,
    Object? dualDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as int?,
            statusNew: freezed == statusNew
                ? _value.statusNew
                : statusNew // ignore: cast_nullable_to_non_nullable
                      as int?,
            statusText: freezed == statusText
                ? _value.statusText
                : statusText // ignore: cast_nullable_to_non_nullable
                      as String?,
            productRtcId: freezed == productRtcId
                ? _value.productRtcId
                : productRtcId // ignore: cast_nullable_to_non_nullable
                      as int?,
            productRtcQrCodeId: freezed == productRtcQrCodeId
                ? _value.productRtcQrCodeId
                : productRtcQrCodeId // ignore: cast_nullable_to_non_nullable
                      as int?,
            dateBorrow: freezed == dateBorrow
                ? _value.dateBorrow
                : dateBorrow // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateReturnExpected: freezed == dateReturnExpected
                ? _value.dateReturnExpected
                : dateReturnExpected // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateReturn: freezed == dateReturn
                ? _value.dateReturn
                : dateReturn // ignore: cast_nullable_to_non_nullable
                      as String?,
            peopleId: freezed == peopleId
                ? _value.peopleId
                : peopleId // ignore: cast_nullable_to_non_nullable
                      as int?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            oldBorrower: freezed == oldBorrower
                ? _value.oldBorrower
                : oldBorrower // ignore: cast_nullable_to_non_nullable
                      as String?,
            project: freezed == project
                ? _value.project
                : project // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            numberBorrow: freezed == numberBorrow
                ? _value.numberBorrow
                : numberBorrow // ignore: cast_nullable_to_non_nullable
                      as double?,
            adminConfirm: null == adminConfirm
                ? _value.adminConfirm
                : adminConfirm // ignore: cast_nullable_to_non_nullable
                      as bool,
            billExportTechnicalId: freezed == billExportTechnicalId
                ? _value.billExportTechnicalId
                : billExportTechnicalId // ignore: cast_nullable_to_non_nullable
                      as int?,
            billExportCode: freezed == billExportCode
                ? _value.billExportCode
                : billExportCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            billTypeText: freezed == billTypeText
                ? _value.billTypeText
                : billTypeText // ignore: cast_nullable_to_non_nullable
                      as String?,
            billStatus: freezed == billStatus
                ? _value.billStatus
                : billStatus // ignore: cast_nullable_to_non_nullable
                      as int?,
            productGroupRtcId: freezed == productGroupRtcId
                ? _value.productGroupRtcId
                : productGroupRtcId // ignore: cast_nullable_to_non_nullable
                      as int?,
            productGroupName: freezed == productGroupName
                ? _value.productGroupName
                : productGroupName // ignore: cast_nullable_to_non_nullable
                      as String?,
            productCode: freezed == productCode
                ? _value.productCode
                : productCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            productCodeRtc: freezed == productCodeRtc
                ? _value.productCodeRtc
                : productCodeRtc // ignore: cast_nullable_to_non_nullable
                      as String?,
            productName: freezed == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String?,
            maker: freezed == maker
                ? _value.maker
                : maker // ignore: cast_nullable_to_non_nullable
                      as String?,
            unitCountId: freezed == unitCountId
                ? _value.unitCountId
                : unitCountId // ignore: cast_nullable_to_non_nullable
                      as int?,
            unitCountName: freezed == unitCountName
                ? _value.unitCountName
                : unitCountName // ignore: cast_nullable_to_non_nullable
                      as String?,
            number: freezed == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as double?,
            statusProduct: null == statusProduct
                ? _value.statusProduct
                : statusProduct // ignore: cast_nullable_to_non_nullable
                      as bool,
            createDate: freezed == createDate
                ? _value.createDate
                : createDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            numberInStore: freezed == numberInStore
                ? _value.numberInStore
                : numberInStore // ignore: cast_nullable_to_non_nullable
                      as double?,
            serial: freezed == serial
                ? _value.serial
                : serial // ignore: cast_nullable_to_non_nullable
                      as String?,
            serialNumber: freezed == serialNumber
                ? _value.serialNumber
                : serialNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            partNumber: freezed == partNumber
                ? _value.partNumber
                : partNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdBy: freezed == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            locationImg: freezed == locationImg
                ? _value.locationImg
                : locationImg // ignore: cast_nullable_to_non_nullable
                      as String?,
            borrowCustomer: null == borrowCustomer
                ? _value.borrowCustomer
                : borrowCustomer // ignore: cast_nullable_to_non_nullable
                      as bool,
            addressBox: freezed == addressBox
                ? _value.addressBox
                : addressBox // ignore: cast_nullable_to_non_nullable
                      as String?,
            isDelete: null == isDelete
                ? _value.isDelete
                : isDelete // ignore: cast_nullable_to_non_nullable
                      as bool,
            departmentName: freezed == departmentName
                ? _value.departmentName
                : departmentName // ignore: cast_nullable_to_non_nullable
                      as String?,
            productQrCode: freezed == productQrCode
                ? _value.productQrCode
                : productQrCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            userZaloId: freezed == userZaloId
                ? _value.userZaloId
                : userZaloId // ignore: cast_nullable_to_non_nullable
                      as String?,
            modulaLocationName: freezed == modulaLocationName
                ? _value.modulaLocationName
                : modulaLocationName // ignore: cast_nullable_to_non_nullable
                      as String?,
            modulaLocationCode: freezed == modulaLocationCode
                ? _value.modulaLocationCode
                : modulaLocationCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            axisX: freezed == axisX
                ? _value.axisX
                : axisX // ignore: cast_nullable_to_non_nullable
                      as double?,
            axisY: freezed == axisY
                ? _value.axisY
                : axisY // ignore: cast_nullable_to_non_nullable
                      as double?,
            statusPerson: freezed == statusPerson
                ? _value.statusPerson
                : statusPerson // ignore: cast_nullable_to_non_nullable
                      as int?,
            statusPersonText: freezed == statusPersonText
                ? _value.statusPersonText
                : statusPersonText // ignore: cast_nullable_to_non_nullable
                      as String?,
            modulaLocationDetailId: freezed == modulaLocationDetailId
                ? _value.modulaLocationDetailId
                : modulaLocationDetailId // ignore: cast_nullable_to_non_nullable
                      as int?,
            modulaLocationDetailCode: freezed == modulaLocationDetailCode
                ? _value.modulaLocationDetailCode
                : modulaLocationDetailCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            modulaLocationDetailName: freezed == modulaLocationDetailName
                ? _value.modulaLocationDetailName
                : modulaLocationDetailName // ignore: cast_nullable_to_non_nullable
                      as String?,
            warehouseName: freezed == warehouseName
                ? _value.warehouseName
                : warehouseName // ignore: cast_nullable_to_non_nullable
                      as String?,
            rowNumber: freezed == rowNumber
                ? _value.rowNumber
                : rowNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            dualDate: freezed == dualDate
                ? _value.dualDate
                : dualDate // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductReturnHistoryItemImplCopyWith<$Res>
    implements $ProductReturnHistoryItemCopyWith<$Res> {
  factory _$$ProductReturnHistoryItemImplCopyWith(
    _$ProductReturnHistoryItemImpl value,
    $Res Function(_$ProductReturnHistoryItemImpl) then,
  ) = __$$ProductReturnHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'StatusNew') int? statusNew,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'ProductRTCID') int? productRtcId,
    @JsonKey(name: 'ProductRTCQRCodeID') int? productRtcQrCodeId,
    @JsonKey(name: 'DateBorrow') String? dateBorrow,
    @JsonKey(name: 'DateReturnExpected') String? dateReturnExpected,
    @JsonKey(name: 'DateReturn') String? dateReturn,
    @JsonKey(name: 'PeopleID') int? peopleId,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'OldBorrower') String? oldBorrower,
    @JsonKey(name: 'Project') String? project,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'NumberBorrow') double? numberBorrow,
    @JsonKey(name: 'AdminConfirm') bool adminConfirm,
    @JsonKey(name: 'BillExportTechnicalID') int? billExportTechnicalId,
    @JsonKey(name: 'BillExportCode') String? billExportCode,
    @JsonKey(name: 'BillTypeText') String? billTypeText,
    @JsonKey(name: 'BillStatus') int? billStatus,
    @JsonKey(name: 'ProductGroupRTCID') int? productGroupRtcId,
    @JsonKey(name: 'ProductGroupName') String? productGroupName,
    @JsonKey(name: 'ProductCode') String? productCode,
    @JsonKey(name: 'ProductCodeRTC') String? productCodeRtc,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'Maker') String? maker,
    @JsonKey(name: 'UnitCountID') int? unitCountId,
    @JsonKey(name: 'UnitCountName') String? unitCountName,
    @JsonKey(name: 'Number') double? number,
    @JsonKey(name: 'StatusProduct') bool statusProduct,
    @JsonKey(name: 'CreateDate') String? createDate,
    @JsonKey(name: 'NumberInStore') double? numberInStore,
    @JsonKey(name: 'Serial') String? serial,
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'PartNumber') String? partNumber,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'LocationImg') String? locationImg,
    @JsonKey(name: 'BorrowCustomer') bool borrowCustomer,
    @JsonKey(name: 'AddressBox') String? addressBox,
    @JsonKey(name: 'IsDelete') bool isDelete,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'ProductQRCode') String? productQrCode,
    @JsonKey(name: 'UserZaloID') String? userZaloId,
    @JsonKey(name: 'ModulaLocationName') String? modulaLocationName,
    @JsonKey(name: 'ModulaLocationCode') String? modulaLocationCode,
    @JsonKey(name: 'AxisX') double? axisX,
    @JsonKey(name: 'AxisY') double? axisY,
    @JsonKey(name: 'StatusPerson') int? statusPerson,
    @JsonKey(name: 'StatusPersonText') String? statusPersonText,
    @JsonKey(name: 'ModulaLocationDetailID') int? modulaLocationDetailId,
    @JsonKey(name: 'ModulaLocationDetailCode') String? modulaLocationDetailCode,
    @JsonKey(name: 'ModulaLocationDetailName') String? modulaLocationDetailName,
    @JsonKey(name: 'WarehouseName') String? warehouseName,
    @JsonKey(name: 'RowNumber') int? rowNumber,
    @JsonKey(name: 'DualDate') int? dualDate,
  });
}

/// @nodoc
class __$$ProductReturnHistoryItemImplCopyWithImpl<$Res>
    extends
        _$ProductReturnHistoryItemCopyWithImpl<
          $Res,
          _$ProductReturnHistoryItemImpl
        >
    implements _$$ProductReturnHistoryItemImplCopyWith<$Res> {
  __$$ProductReturnHistoryItemImplCopyWithImpl(
    _$ProductReturnHistoryItemImpl _value,
    $Res Function(_$ProductReturnHistoryItemImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? statusNew = freezed,
    Object? statusText = freezed,
    Object? productRtcId = freezed,
    Object? productRtcQrCodeId = freezed,
    Object? dateBorrow = freezed,
    Object? dateReturnExpected = freezed,
    Object? dateReturn = freezed,
    Object? peopleId = freezed,
    Object? fullName = freezed,
    Object? oldBorrower = freezed,
    Object? project = freezed,
    Object? note = freezed,
    Object? numberBorrow = freezed,
    Object? adminConfirm = null,
    Object? billExportTechnicalId = freezed,
    Object? billExportCode = freezed,
    Object? billTypeText = freezed,
    Object? billStatus = freezed,
    Object? productGroupRtcId = freezed,
    Object? productGroupName = freezed,
    Object? productCode = freezed,
    Object? productCodeRtc = freezed,
    Object? productName = freezed,
    Object? maker = freezed,
    Object? unitCountId = freezed,
    Object? unitCountName = freezed,
    Object? number = freezed,
    Object? statusProduct = null,
    Object? createDate = freezed,
    Object? numberInStore = freezed,
    Object? serial = freezed,
    Object? serialNumber = freezed,
    Object? partNumber = freezed,
    Object? createdBy = freezed,
    Object? locationImg = freezed,
    Object? borrowCustomer = null,
    Object? addressBox = freezed,
    Object? isDelete = null,
    Object? departmentName = freezed,
    Object? productQrCode = freezed,
    Object? userZaloId = freezed,
    Object? modulaLocationName = freezed,
    Object? modulaLocationCode = freezed,
    Object? axisX = freezed,
    Object? axisY = freezed,
    Object? statusPerson = freezed,
    Object? statusPersonText = freezed,
    Object? modulaLocationDetailId = freezed,
    Object? modulaLocationDetailCode = freezed,
    Object? modulaLocationDetailName = freezed,
    Object? warehouseName = freezed,
    Object? rowNumber = freezed,
    Object? dualDate = freezed,
  }) {
    return _then(
      _$ProductReturnHistoryItemImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as int?,
        statusNew: freezed == statusNew
            ? _value.statusNew
            : statusNew // ignore: cast_nullable_to_non_nullable
                  as int?,
        statusText: freezed == statusText
            ? _value.statusText
            : statusText // ignore: cast_nullable_to_non_nullable
                  as String?,
        productRtcId: freezed == productRtcId
            ? _value.productRtcId
            : productRtcId // ignore: cast_nullable_to_non_nullable
                  as int?,
        productRtcQrCodeId: freezed == productRtcQrCodeId
            ? _value.productRtcQrCodeId
            : productRtcQrCodeId // ignore: cast_nullable_to_non_nullable
                  as int?,
        dateBorrow: freezed == dateBorrow
            ? _value.dateBorrow
            : dateBorrow // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateReturnExpected: freezed == dateReturnExpected
            ? _value.dateReturnExpected
            : dateReturnExpected // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateReturn: freezed == dateReturn
            ? _value.dateReturn
            : dateReturn // ignore: cast_nullable_to_non_nullable
                  as String?,
        peopleId: freezed == peopleId
            ? _value.peopleId
            : peopleId // ignore: cast_nullable_to_non_nullable
                  as int?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        oldBorrower: freezed == oldBorrower
            ? _value.oldBorrower
            : oldBorrower // ignore: cast_nullable_to_non_nullable
                  as String?,
        project: freezed == project
            ? _value.project
            : project // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        numberBorrow: freezed == numberBorrow
            ? _value.numberBorrow
            : numberBorrow // ignore: cast_nullable_to_non_nullable
                  as double?,
        adminConfirm: null == adminConfirm
            ? _value.adminConfirm
            : adminConfirm // ignore: cast_nullable_to_non_nullable
                  as bool,
        billExportTechnicalId: freezed == billExportTechnicalId
            ? _value.billExportTechnicalId
            : billExportTechnicalId // ignore: cast_nullable_to_non_nullable
                  as int?,
        billExportCode: freezed == billExportCode
            ? _value.billExportCode
            : billExportCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        billTypeText: freezed == billTypeText
            ? _value.billTypeText
            : billTypeText // ignore: cast_nullable_to_non_nullable
                  as String?,
        billStatus: freezed == billStatus
            ? _value.billStatus
            : billStatus // ignore: cast_nullable_to_non_nullable
                  as int?,
        productGroupRtcId: freezed == productGroupRtcId
            ? _value.productGroupRtcId
            : productGroupRtcId // ignore: cast_nullable_to_non_nullable
                  as int?,
        productGroupName: freezed == productGroupName
            ? _value.productGroupName
            : productGroupName // ignore: cast_nullable_to_non_nullable
                  as String?,
        productCode: freezed == productCode
            ? _value.productCode
            : productCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        productCodeRtc: freezed == productCodeRtc
            ? _value.productCodeRtc
            : productCodeRtc // ignore: cast_nullable_to_non_nullable
                  as String?,
        productName: freezed == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String?,
        maker: freezed == maker
            ? _value.maker
            : maker // ignore: cast_nullable_to_non_nullable
                  as String?,
        unitCountId: freezed == unitCountId
            ? _value.unitCountId
            : unitCountId // ignore: cast_nullable_to_non_nullable
                  as int?,
        unitCountName: freezed == unitCountName
            ? _value.unitCountName
            : unitCountName // ignore: cast_nullable_to_non_nullable
                  as String?,
        number: freezed == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as double?,
        statusProduct: null == statusProduct
            ? _value.statusProduct
            : statusProduct // ignore: cast_nullable_to_non_nullable
                  as bool,
        createDate: freezed == createDate
            ? _value.createDate
            : createDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        numberInStore: freezed == numberInStore
            ? _value.numberInStore
            : numberInStore // ignore: cast_nullable_to_non_nullable
                  as double?,
        serial: freezed == serial
            ? _value.serial
            : serial // ignore: cast_nullable_to_non_nullable
                  as String?,
        serialNumber: freezed == serialNumber
            ? _value.serialNumber
            : serialNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        partNumber: freezed == partNumber
            ? _value.partNumber
            : partNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdBy: freezed == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationImg: freezed == locationImg
            ? _value.locationImg
            : locationImg // ignore: cast_nullable_to_non_nullable
                  as String?,
        borrowCustomer: null == borrowCustomer
            ? _value.borrowCustomer
            : borrowCustomer // ignore: cast_nullable_to_non_nullable
                  as bool,
        addressBox: freezed == addressBox
            ? _value.addressBox
            : addressBox // ignore: cast_nullable_to_non_nullable
                  as String?,
        isDelete: null == isDelete
            ? _value.isDelete
            : isDelete // ignore: cast_nullable_to_non_nullable
                  as bool,
        departmentName: freezed == departmentName
            ? _value.departmentName
            : departmentName // ignore: cast_nullable_to_non_nullable
                  as String?,
        productQrCode: freezed == productQrCode
            ? _value.productQrCode
            : productQrCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        userZaloId: freezed == userZaloId
            ? _value.userZaloId
            : userZaloId // ignore: cast_nullable_to_non_nullable
                  as String?,
        modulaLocationName: freezed == modulaLocationName
            ? _value.modulaLocationName
            : modulaLocationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        modulaLocationCode: freezed == modulaLocationCode
            ? _value.modulaLocationCode
            : modulaLocationCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        axisX: freezed == axisX
            ? _value.axisX
            : axisX // ignore: cast_nullable_to_non_nullable
                  as double?,
        axisY: freezed == axisY
            ? _value.axisY
            : axisY // ignore: cast_nullable_to_non_nullable
                  as double?,
        statusPerson: freezed == statusPerson
            ? _value.statusPerson
            : statusPerson // ignore: cast_nullable_to_non_nullable
                  as int?,
        statusPersonText: freezed == statusPersonText
            ? _value.statusPersonText
            : statusPersonText // ignore: cast_nullable_to_non_nullable
                  as String?,
        modulaLocationDetailId: freezed == modulaLocationDetailId
            ? _value.modulaLocationDetailId
            : modulaLocationDetailId // ignore: cast_nullable_to_non_nullable
                  as int?,
        modulaLocationDetailCode: freezed == modulaLocationDetailCode
            ? _value.modulaLocationDetailCode
            : modulaLocationDetailCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        modulaLocationDetailName: freezed == modulaLocationDetailName
            ? _value.modulaLocationDetailName
            : modulaLocationDetailName // ignore: cast_nullable_to_non_nullable
                  as String?,
        warehouseName: freezed == warehouseName
            ? _value.warehouseName
            : warehouseName // ignore: cast_nullable_to_non_nullable
                  as String?,
        rowNumber: freezed == rowNumber
            ? _value.rowNumber
            : rowNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        dualDate: freezed == dualDate
            ? _value.dualDate
            : dualDate // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnHistoryItemImpl implements _ProductReturnHistoryItem {
  const _$ProductReturnHistoryItemImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'Status') this.status,
    @JsonKey(name: 'StatusNew') this.statusNew,
    @JsonKey(name: 'StatusText') this.statusText,
    @JsonKey(name: 'ProductRTCID') this.productRtcId,
    @JsonKey(name: 'ProductRTCQRCodeID') this.productRtcQrCodeId,
    @JsonKey(name: 'DateBorrow') this.dateBorrow,
    @JsonKey(name: 'DateReturnExpected') this.dateReturnExpected,
    @JsonKey(name: 'DateReturn') this.dateReturn,
    @JsonKey(name: 'PeopleID') this.peopleId,
    @JsonKey(name: 'FullName') this.fullName,
    @JsonKey(name: 'OldBorrower') this.oldBorrower,
    @JsonKey(name: 'Project') this.project,
    @JsonKey(name: 'Note') this.note,
    @JsonKey(name: 'NumberBorrow') this.numberBorrow,
    @JsonKey(name: 'AdminConfirm') this.adminConfirm = false,
    @JsonKey(name: 'BillExportTechnicalID') this.billExportTechnicalId,
    @JsonKey(name: 'BillExportCode') this.billExportCode,
    @JsonKey(name: 'BillTypeText') this.billTypeText,
    @JsonKey(name: 'BillStatus') this.billStatus,
    @JsonKey(name: 'ProductGroupRTCID') this.productGroupRtcId,
    @JsonKey(name: 'ProductGroupName') this.productGroupName,
    @JsonKey(name: 'ProductCode') this.productCode,
    @JsonKey(name: 'ProductCodeRTC') this.productCodeRtc,
    @JsonKey(name: 'ProductName') this.productName,
    @JsonKey(name: 'Maker') this.maker,
    @JsonKey(name: 'UnitCountID') this.unitCountId,
    @JsonKey(name: 'UnitCountName') this.unitCountName,
    @JsonKey(name: 'Number') this.number,
    @JsonKey(name: 'StatusProduct') this.statusProduct = false,
    @JsonKey(name: 'CreateDate') this.createDate,
    @JsonKey(name: 'NumberInStore') this.numberInStore,
    @JsonKey(name: 'Serial') this.serial,
    @JsonKey(name: 'SerialNumber') this.serialNumber,
    @JsonKey(name: 'PartNumber') this.partNumber,
    @JsonKey(name: 'CreatedBy') this.createdBy,
    @JsonKey(name: 'LocationImg') this.locationImg,
    @JsonKey(name: 'BorrowCustomer') this.borrowCustomer = false,
    @JsonKey(name: 'AddressBox') this.addressBox,
    @JsonKey(name: 'IsDelete') this.isDelete = false,
    @JsonKey(name: 'DepartmentName') this.departmentName,
    @JsonKey(name: 'ProductQRCode') this.productQrCode,
    @JsonKey(name: 'UserZaloID') this.userZaloId,
    @JsonKey(name: 'ModulaLocationName') this.modulaLocationName,
    @JsonKey(name: 'ModulaLocationCode') this.modulaLocationCode,
    @JsonKey(name: 'AxisX') this.axisX,
    @JsonKey(name: 'AxisY') this.axisY,
    @JsonKey(name: 'StatusPerson') this.statusPerson,
    @JsonKey(name: 'StatusPersonText') this.statusPersonText,
    @JsonKey(name: 'ModulaLocationDetailID') this.modulaLocationDetailId,
    @JsonKey(name: 'ModulaLocationDetailCode') this.modulaLocationDetailCode,
    @JsonKey(name: 'ModulaLocationDetailName') this.modulaLocationDetailName,
    @JsonKey(name: 'WarehouseName') this.warehouseName,
    @JsonKey(name: 'RowNumber') this.rowNumber,
    @JsonKey(name: 'DualDate') this.dualDate,
  });

  factory _$ProductReturnHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReturnHistoryItemImplFromJson(json);

  /// Id phiếu mượn.
  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// Trạng thái phiếu (4 = đăng ký trả, 5 = chờ duyệt...).
  @override
  @JsonKey(name: 'Status')
  final int? status;

  /// Trạng thái mới của phiếu (dùng để hiển thị chip).
  @override
  @JsonKey(name: 'StatusNew')
  final int? statusNew;

  /// Nhãn trạng thái (vd. `Đăng ký trả`).
  @override
  @JsonKey(name: 'StatusText')
  final String? statusText;

  /// Id sản phẩm RTC.
  @override
  @JsonKey(name: 'ProductRTCID')
  final int? productRtcId;

  /// Id QR code sản phẩm.
  @override
  @JsonKey(name: 'ProductRTCQRCodeID')
  final int? productRtcQrCodeId;

  /// Thời điểm mượn (ISO).
  @override
  @JsonKey(name: 'DateBorrow')
  final String? dateBorrow;

  /// Hạn trả dự kiến (ISO).
  @override
  @JsonKey(name: 'DateReturnExpected')
  final String? dateReturnExpected;

  /// Thời điểm trả thực tế (ISO, null = chưa trả).
  @override
  @JsonKey(name: 'DateReturn')
  final String? dateReturn;

  /// Id người mượn.
  @override
  @JsonKey(name: 'PeopleID')
  final int? peopleId;

  /// Họ tên người mượn (vd. `R0339 - Nguyễn Đức Thuận`).
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;

  /// Người mượn trước đó.
  @override
  @JsonKey(name: 'OldBorrower')
  final String? oldBorrower;

  /// Dự án sử dụng.
  @override
  @JsonKey(name: 'Project')
  final String? project;

  /// Ghi chú.
  @override
  @JsonKey(name: 'Note')
  final String? note;

  /// Số lượng đã mượn.
  @override
  @JsonKey(name: 'NumberBorrow')
  final double? numberBorrow;

  /// Người quản lý đã xác nhận hay chưa.
  @override
  @JsonKey(name: 'AdminConfirm')
  final bool adminConfirm;

  /// Id phiếu xuất kho liên quan.
  @override
  @JsonKey(name: 'BillExportTechnicalID')
  final int? billExportTechnicalId;

  /// Mã phiếu xuất kho liên quan.
  @override
  @JsonKey(name: 'BillExportCode')
  final String? billExportCode;

  /// Nhãn loại phiếu.
  @override
  @JsonKey(name: 'BillTypeText')
  final String? billTypeText;

  /// Trạng thái phiếu xuất kho.
  @override
  @JsonKey(name: 'BillStatus')
  final int? billStatus;

  /// Id nhóm sản phẩm.
  @override
  @JsonKey(name: 'ProductGroupRTCID')
  final int? productGroupRtcId;

  /// Tên nhóm sản phẩm.
  @override
  @JsonKey(name: 'ProductGroupName')
  final String? productGroupName;

  /// Mã sản phẩm.
  @override
  @JsonKey(name: 'ProductCode')
  final String? productCode;

  /// Mã nội bộ sản phẩm.
  @override
  @JsonKey(name: 'ProductCodeRTC')
  final String? productCodeRtc;

  /// Tên sản phẩm.
  @override
  @JsonKey(name: 'ProductName')
  final String? productName;

  /// Nhà sản xuất.
  @override
  @JsonKey(name: 'Maker')
  final String? maker;

  /// Id đơn vị tính.
  @override
  @JsonKey(name: 'UnitCountID')
  final int? unitCountId;

  /// Tên đơn vị tính (vd. `PCS`).
  @override
  @JsonKey(name: 'UnitCountName')
  final String? unitCountName;

  /// Số lượng còn lại.
  @override
  @JsonKey(name: 'Number')
  final double? number;

  /// Trạng thái sản phẩm.
  @override
  @JsonKey(name: 'StatusProduct')
  final bool statusProduct;

  /// Thời điểm tạo bản ghi.
  @override
  @JsonKey(name: 'CreateDate')
  final String? createDate;

  /// Số lượng tồn trong kho.
  @override
  @JsonKey(name: 'NumberInStore')
  final double? numberInStore;

  /// Số serial.
  @override
  @JsonKey(name: 'Serial')
  final String? serial;

  /// Số serial.
  @override
  @JsonKey(name: 'SerialNumber')
  final String? serialNumber;

  /// Part number.
  @override
  @JsonKey(name: 'PartNumber')
  final String? partNumber;

  /// Người tạo bản ghi.
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;

  /// Đường dẫn ảnh vị trí.
  @override
  @JsonKey(name: 'LocationImg')
  final String? locationImg;

  /// Sản phẩm mượn của khách hàng hay không.
  @override
  @JsonKey(name: 'BorrowCustomer')
  final bool borrowCustomer;

  /// Địa chỉ lưu kho (ô lưu trữ).
  @override
  @JsonKey(name: 'AddressBox')
  final String? addressBox;

  /// Bản ghi đã bị xoá hay chưa.
  @override
  @JsonKey(name: 'IsDelete')
  final bool isDelete;

  /// Tên phòng ban của người mượn.
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;

  /// QR code sản phẩm.
  @override
  @JsonKey(name: 'ProductQRCode')
  final String? productQrCode;

  /// Zalo id của người mượn.
  @override
  @JsonKey(name: 'UserZaloID')
  final String? userZaloId;

  /// Vị trí kho Modula.
  @override
  @JsonKey(name: 'ModulaLocationName')
  final String? modulaLocationName;

  /// Mã vị trí kho Modula.
  @override
  @JsonKey(name: 'ModulaLocationCode')
  final String? modulaLocationCode;

  /// Toạ độ X.
  @override
  @JsonKey(name: 'AxisX')
  final double? axisX;

  /// Toạ độ Y.
  @override
  @JsonKey(name: 'AxisY')
  final double? axisY;

  /// Trạng thái người mượn.
  @override
  @JsonKey(name: 'StatusPerson')
  final int? statusPerson;

  /// Nhãn trạng thái người mượn.
  @override
  @JsonKey(name: 'StatusPersonText')
  final String? statusPersonText;

  /// Id ô Modula chi tiết.
  @override
  @JsonKey(name: 'ModulaLocationDetailID')
  final int? modulaLocationDetailId;

  /// Mã ô Modula chi tiết.
  @override
  @JsonKey(name: 'ModulaLocationDetailCode')
  final String? modulaLocationDetailCode;

  /// Tên ô Modula chi tiết.
  @override
  @JsonKey(name: 'ModulaLocationDetailName')
  final String? modulaLocationDetailName;

  /// Tên kho.
  @override
  @JsonKey(name: 'WarehouseName')
  final String? warehouseName;

  /// Số thứ tự hiển thị.
  @override
  @JsonKey(name: 'RowNumber')
  final int? rowNumber;

  /// Cờ trùng ngày.
  @override
  @JsonKey(name: 'DualDate')
  final int? dualDate;

  @override
  String toString() {
    return 'ProductReturnHistoryItem(id: $id, status: $status, statusNew: $statusNew, statusText: $statusText, productRtcId: $productRtcId, productRtcQrCodeId: $productRtcQrCodeId, dateBorrow: $dateBorrow, dateReturnExpected: $dateReturnExpected, dateReturn: $dateReturn, peopleId: $peopleId, fullName: $fullName, oldBorrower: $oldBorrower, project: $project, note: $note, numberBorrow: $numberBorrow, adminConfirm: $adminConfirm, billExportTechnicalId: $billExportTechnicalId, billExportCode: $billExportCode, billTypeText: $billTypeText, billStatus: $billStatus, productGroupRtcId: $productGroupRtcId, productGroupName: $productGroupName, productCode: $productCode, productCodeRtc: $productCodeRtc, productName: $productName, maker: $maker, unitCountId: $unitCountId, unitCountName: $unitCountName, number: $number, statusProduct: $statusProduct, createDate: $createDate, numberInStore: $numberInStore, serial: $serial, serialNumber: $serialNumber, partNumber: $partNumber, createdBy: $createdBy, locationImg: $locationImg, borrowCustomer: $borrowCustomer, addressBox: $addressBox, isDelete: $isDelete, departmentName: $departmentName, productQrCode: $productQrCode, userZaloId: $userZaloId, modulaLocationName: $modulaLocationName, modulaLocationCode: $modulaLocationCode, axisX: $axisX, axisY: $axisY, statusPerson: $statusPerson, statusPersonText: $statusPersonText, modulaLocationDetailId: $modulaLocationDetailId, modulaLocationDetailCode: $modulaLocationDetailCode, modulaLocationDetailName: $modulaLocationDetailName, warehouseName: $warehouseName, rowNumber: $rowNumber, dualDate: $dualDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnHistoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusNew, statusNew) ||
                other.statusNew == statusNew) &&
            (identical(other.statusText, statusText) ||
                other.statusText == statusText) &&
            (identical(other.productRtcId, productRtcId) ||
                other.productRtcId == productRtcId) &&
            (identical(other.productRtcQrCodeId, productRtcQrCodeId) ||
                other.productRtcQrCodeId == productRtcQrCodeId) &&
            (identical(other.dateBorrow, dateBorrow) ||
                other.dateBorrow == dateBorrow) &&
            (identical(other.dateReturnExpected, dateReturnExpected) ||
                other.dateReturnExpected == dateReturnExpected) &&
            (identical(other.dateReturn, dateReturn) ||
                other.dateReturn == dateReturn) &&
            (identical(other.peopleId, peopleId) ||
                other.peopleId == peopleId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.oldBorrower, oldBorrower) ||
                other.oldBorrower == oldBorrower) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.numberBorrow, numberBorrow) ||
                other.numberBorrow == numberBorrow) &&
            (identical(other.adminConfirm, adminConfirm) ||
                other.adminConfirm == adminConfirm) &&
            (identical(other.billExportTechnicalId, billExportTechnicalId) ||
                other.billExportTechnicalId == billExportTechnicalId) &&
            (identical(other.billExportCode, billExportCode) ||
                other.billExportCode == billExportCode) &&
            (identical(other.billTypeText, billTypeText) ||
                other.billTypeText == billTypeText) &&
            (identical(other.billStatus, billStatus) ||
                other.billStatus == billStatus) &&
            (identical(other.productGroupRtcId, productGroupRtcId) ||
                other.productGroupRtcId == productGroupRtcId) &&
            (identical(other.productGroupName, productGroupName) ||
                other.productGroupName == productGroupName) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.productCodeRtc, productCodeRtc) ||
                other.productCodeRtc == productCodeRtc) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.maker, maker) || other.maker == maker) &&
            (identical(other.unitCountId, unitCountId) ||
                other.unitCountId == unitCountId) &&
            (identical(other.unitCountName, unitCountName) ||
                other.unitCountName == unitCountName) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.statusProduct, statusProduct) ||
                other.statusProduct == statusProduct) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.numberInStore, numberInStore) ||
                other.numberInStore == numberInStore) &&
            (identical(other.serial, serial) || other.serial == serial) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.locationImg, locationImg) ||
                other.locationImg == locationImg) &&
            (identical(other.borrowCustomer, borrowCustomer) ||
                other.borrowCustomer == borrowCustomer) &&
            (identical(other.addressBox, addressBox) ||
                other.addressBox == addressBox) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.productQrCode, productQrCode) ||
                other.productQrCode == productQrCode) &&
            (identical(other.userZaloId, userZaloId) ||
                other.userZaloId == userZaloId) &&
            (identical(other.modulaLocationName, modulaLocationName) ||
                other.modulaLocationName == modulaLocationName) &&
            (identical(other.modulaLocationCode, modulaLocationCode) ||
                other.modulaLocationCode == modulaLocationCode) &&
            (identical(other.axisX, axisX) || other.axisX == axisX) &&
            (identical(other.axisY, axisY) || other.axisY == axisY) &&
            (identical(other.statusPerson, statusPerson) ||
                other.statusPerson == statusPerson) &&
            (identical(other.statusPersonText, statusPersonText) ||
                other.statusPersonText == statusPersonText) &&
            (identical(other.modulaLocationDetailId, modulaLocationDetailId) ||
                other.modulaLocationDetailId == modulaLocationDetailId) &&
            (identical(
                  other.modulaLocationDetailCode,
                  modulaLocationDetailCode,
                ) ||
                other.modulaLocationDetailCode == modulaLocationDetailCode) &&
            (identical(
                  other.modulaLocationDetailName,
                  modulaLocationDetailName,
                ) ||
                other.modulaLocationDetailName == modulaLocationDetailName) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.rowNumber, rowNumber) ||
                other.rowNumber == rowNumber) &&
            (identical(other.dualDate, dualDate) ||
                other.dualDate == dualDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    status,
    statusNew,
    statusText,
    productRtcId,
    productRtcQrCodeId,
    dateBorrow,
    dateReturnExpected,
    dateReturn,
    peopleId,
    fullName,
    oldBorrower,
    project,
    note,
    numberBorrow,
    adminConfirm,
    billExportTechnicalId,
    billExportCode,
    billTypeText,
    billStatus,
    productGroupRtcId,
    productGroupName,
    productCode,
    productCodeRtc,
    productName,
    maker,
    unitCountId,
    unitCountName,
    number,
    statusProduct,
    createDate,
    numberInStore,
    serial,
    serialNumber,
    partNumber,
    createdBy,
    locationImg,
    borrowCustomer,
    addressBox,
    isDelete,
    departmentName,
    productQrCode,
    userZaloId,
    modulaLocationName,
    modulaLocationCode,
    axisX,
    axisY,
    statusPerson,
    statusPersonText,
    modulaLocationDetailId,
    modulaLocationDetailCode,
    modulaLocationDetailName,
    warehouseName,
    rowNumber,
    dualDate,
  ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnHistoryItemImplCopyWith<_$ProductReturnHistoryItemImpl>
  get copyWith =>
      __$$ProductReturnHistoryItemImplCopyWithImpl<
        _$ProductReturnHistoryItemImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnHistoryItemImplToJson(this);
  }
}

abstract class _ProductReturnHistoryItem implements ProductReturnHistoryItem {
  const factory _ProductReturnHistoryItem({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'Status') final int? status,
    @JsonKey(name: 'StatusNew') final int? statusNew,
    @JsonKey(name: 'StatusText') final String? statusText,
    @JsonKey(name: 'ProductRTCID') final int? productRtcId,
    @JsonKey(name: 'ProductRTCQRCodeID') final int? productRtcQrCodeId,
    @JsonKey(name: 'DateBorrow') final String? dateBorrow,
    @JsonKey(name: 'DateReturnExpected') final String? dateReturnExpected,
    @JsonKey(name: 'DateReturn') final String? dateReturn,
    @JsonKey(name: 'PeopleID') final int? peopleId,
    @JsonKey(name: 'FullName') final String? fullName,
    @JsonKey(name: 'OldBorrower') final String? oldBorrower,
    @JsonKey(name: 'Project') final String? project,
    @JsonKey(name: 'Note') final String? note,
    @JsonKey(name: 'NumberBorrow') final double? numberBorrow,
    @JsonKey(name: 'AdminConfirm') final bool adminConfirm,
    @JsonKey(name: 'BillExportTechnicalID') final int? billExportTechnicalId,
    @JsonKey(name: 'BillExportCode') final String? billExportCode,
    @JsonKey(name: 'BillTypeText') final String? billTypeText,
    @JsonKey(name: 'BillStatus') final int? billStatus,
    @JsonKey(name: 'ProductGroupRTCID') final int? productGroupRtcId,
    @JsonKey(name: 'ProductGroupName') final String? productGroupName,
    @JsonKey(name: 'ProductCode') final String? productCode,
    @JsonKey(name: 'ProductCodeRTC') final String? productCodeRtc,
    @JsonKey(name: 'ProductName') final String? productName,
    @JsonKey(name: 'Maker') final String? maker,
    @JsonKey(name: 'UnitCountID') final int? unitCountId,
    @JsonKey(name: 'UnitCountName') final String? unitCountName,
    @JsonKey(name: 'Number') final double? number,
    @JsonKey(name: 'StatusProduct') final bool statusProduct,
    @JsonKey(name: 'CreateDate') final String? createDate,
    @JsonKey(name: 'NumberInStore') final double? numberInStore,
    @JsonKey(name: 'Serial') final String? serial,
    @JsonKey(name: 'SerialNumber') final String? serialNumber,
    @JsonKey(name: 'PartNumber') final String? partNumber,
    @JsonKey(name: 'CreatedBy') final String? createdBy,
    @JsonKey(name: 'LocationImg') final String? locationImg,
    @JsonKey(name: 'BorrowCustomer') final bool borrowCustomer,
    @JsonKey(name: 'AddressBox') final String? addressBox,
    @JsonKey(name: 'IsDelete') final bool isDelete,
    @JsonKey(name: 'DepartmentName') final String? departmentName,
    @JsonKey(name: 'ProductQRCode') final String? productQrCode,
    @JsonKey(name: 'UserZaloID') final String? userZaloId,
    @JsonKey(name: 'ModulaLocationName') final String? modulaLocationName,
    @JsonKey(name: 'ModulaLocationCode') final String? modulaLocationCode,
    @JsonKey(name: 'AxisX') final double? axisX,
    @JsonKey(name: 'AxisY') final double? axisY,
    @JsonKey(name: 'StatusPerson') final int? statusPerson,
    @JsonKey(name: 'StatusPersonText') final String? statusPersonText,
    @JsonKey(name: 'ModulaLocationDetailID') final int? modulaLocationDetailId,
    @JsonKey(name: 'ModulaLocationDetailCode')
    final String? modulaLocationDetailCode,
    @JsonKey(name: 'ModulaLocationDetailName')
    final String? modulaLocationDetailName,
    @JsonKey(name: 'WarehouseName') final String? warehouseName,
    @JsonKey(name: 'RowNumber') final int? rowNumber,
    @JsonKey(name: 'DualDate') final int? dualDate,
  }) = _$ProductReturnHistoryItemImpl;

  factory _ProductReturnHistoryItem.fromJson(Map<String, dynamic> json) =
      _$ProductReturnHistoryItemImpl.fromJson;

  @override
  /// Id phiếu mượn.
  @JsonKey(name: 'ID')
  int? get id;
  @override
  /// Trạng thái phiếu (4 = đăng ký trả, 5 = chờ duyệt...).
  @JsonKey(name: 'Status')
  int? get status;
  @override
  /// Trạng thái mới của phiếu (dùng để hiển thị chip).
  @JsonKey(name: 'StatusNew')
  int? get statusNew;
  @override
  /// Nhãn trạng thái (vd. `Đăng ký trả`).
  @JsonKey(name: 'StatusText')
  String? get statusText;
  @override
  /// Id sản phẩm RTC.
  @JsonKey(name: 'ProductRTCID')
  int? get productRtcId;
  @override
  /// Id QR code sản phẩm.
  @JsonKey(name: 'ProductRTCQRCodeID')
  int? get productRtcQrCodeId;
  @override
  /// Thời điểm mượn (ISO).
  @JsonKey(name: 'DateBorrow')
  String? get dateBorrow;
  @override
  /// Hạn trả dự kiến (ISO).
  @JsonKey(name: 'DateReturnExpected')
  String? get dateReturnExpected;
  @override
  /// Thời điểm trả thực tế (ISO, null = chưa trả).
  @JsonKey(name: 'DateReturn')
  String? get dateReturn;
  @override
  /// Id người mượn.
  @JsonKey(name: 'PeopleID')
  int? get peopleId;
  @override
  /// Họ tên người mượn (vd. `R0339 - Nguyễn Đức Thuận`).
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  /// Người mượn trước đó.
  @JsonKey(name: 'OldBorrower')
  String? get oldBorrower;
  @override
  /// Dự án sử dụng.
  @JsonKey(name: 'Project')
  String? get project;
  @override
  /// Ghi chú.
  @JsonKey(name: 'Note')
  String? get note;
  @override
  /// Số lượng đã mượn.
  @JsonKey(name: 'NumberBorrow')
  double? get numberBorrow;
  @override
  /// Người quản lý đã xác nhận hay chưa.
  @JsonKey(name: 'AdminConfirm')
  bool get adminConfirm;
  @override
  /// Id phiếu xuất kho liên quan.
  @JsonKey(name: 'BillExportTechnicalID')
  int? get billExportTechnicalId;
  @override
  /// Mã phiếu xuất kho liên quan.
  @JsonKey(name: 'BillExportCode')
  String? get billExportCode;
  @override
  /// Nhãn loại phiếu.
  @JsonKey(name: 'BillTypeText')
  String? get billTypeText;
  @override
  /// Trạng thái phiếu xuất kho.
  @JsonKey(name: 'BillStatus')
  int? get billStatus;
  @override
  /// Id nhóm sản phẩm.
  @JsonKey(name: 'ProductGroupRTCID')
  int? get productGroupRtcId;
  @override
  /// Tên nhóm sản phẩm.
  @JsonKey(name: 'ProductGroupName')
  String? get productGroupName;
  @override
  /// Mã sản phẩm.
  @JsonKey(name: 'ProductCode')
  String? get productCode;
  @override
  /// Mã nội bộ sản phẩm.
  @JsonKey(name: 'ProductCodeRTC')
  String? get productCodeRtc;
  @override
  /// Tên sản phẩm.
  @JsonKey(name: 'ProductName')
  String? get productName;
  @override
  /// Nhà sản xuất.
  @JsonKey(name: 'Maker')
  String? get maker;
  @override
  /// Id đơn vị tính.
  @JsonKey(name: 'UnitCountID')
  int? get unitCountId;
  @override
  /// Tên đơn vị tính (vd. `PCS`).
  @JsonKey(name: 'UnitCountName')
  String? get unitCountName;
  @override
  /// Số lượng còn lại.
  @JsonKey(name: 'Number')
  double? get number;
  @override
  /// Trạng thái sản phẩm.
  @JsonKey(name: 'StatusProduct')
  bool get statusProduct;
  @override
  /// Thời điểm tạo bản ghi.
  @JsonKey(name: 'CreateDate')
  String? get createDate;
  @override
  /// Số lượng tồn trong kho.
  @JsonKey(name: 'NumberInStore')
  double? get numberInStore;
  @override
  /// Số serial.
  @JsonKey(name: 'Serial')
  String? get serial;
  @override
  /// Số serial.
  @JsonKey(name: 'SerialNumber')
  String? get serialNumber;
  @override
  /// Part number.
  @JsonKey(name: 'PartNumber')
  String? get partNumber;
  @override
  /// Người tạo bản ghi.
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  /// Đường dẫn ảnh vị trí.
  @JsonKey(name: 'LocationImg')
  String? get locationImg;
  @override
  /// Sản phẩm mượn của khách hàng hay không.
  @JsonKey(name: 'BorrowCustomer')
  bool get borrowCustomer;
  @override
  /// Địa chỉ lưu kho (ô lưu trữ).
  @JsonKey(name: 'AddressBox')
  String? get addressBox;
  @override
  /// Bản ghi đã bị xoá hay chưa.
  @JsonKey(name: 'IsDelete')
  bool get isDelete;
  @override
  /// Tên phòng ban của người mượn.
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  /// QR code sản phẩm.
  @JsonKey(name: 'ProductQRCode')
  String? get productQrCode;
  @override
  /// Zalo id của người mượn.
  @JsonKey(name: 'UserZaloID')
  String? get userZaloId;
  @override
  /// Vị trí kho Modula.
  @JsonKey(name: 'ModulaLocationName')
  String? get modulaLocationName;
  @override
  /// Mã vị trí kho Modula.
  @JsonKey(name: 'ModulaLocationCode')
  String? get modulaLocationCode;
  @override
  /// Toạ độ X.
  @JsonKey(name: 'AxisX')
  double? get axisX;
  @override
  /// Toạ độ Y.
  @JsonKey(name: 'AxisY')
  double? get axisY;
  @override
  /// Trạng thái người mượn.
  @JsonKey(name: 'StatusPerson')
  int? get statusPerson;
  @override
  /// Nhãn trạng thái người mượn.
  @JsonKey(name: 'StatusPersonText')
  String? get statusPersonText;
  @override
  /// Id ô Modula chi tiết.
  @JsonKey(name: 'ModulaLocationDetailID')
  int? get modulaLocationDetailId;
  @override
  /// Mã ô Modula chi tiết.
  @JsonKey(name: 'ModulaLocationDetailCode')
  String? get modulaLocationDetailCode;
  @override
  /// Tên ô Modula chi tiết.
  @JsonKey(name: 'ModulaLocationDetailName')
  String? get modulaLocationDetailName;
  @override
  /// Tên kho.
  @JsonKey(name: 'WarehouseName')
  String? get warehouseName;
  @override
  /// Số thứ tự hiển thị.
  @JsonKey(name: 'RowNumber')
  int? get rowNumber;
  @override
  /// Cờ trùng ngày.
  @JsonKey(name: 'DualDate')
  int? get dualDate;
  @override
  @JsonKey(ignore: true)
  _$$ProductReturnHistoryItemImplCopyWith<_$ProductReturnHistoryItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ProductReturnHistoryDetail _$ProductReturnHistoryDetailFromJson(
  Map<String, dynamic> json,
) {
  return _ProductReturnHistoryDetail.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnHistoryDetail {
  /// Id phiếu trả sản phẩm — dùng làm `HistoryId` khi duyệt.
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Id sản phẩm RTC.
  @JsonKey(name: 'ProductRTCID')
  int? get productRtcId => throw _privateConstructorUsedError;

  /// Id QR code sản phẩm.
  @JsonKey(name: 'ProductRTCQRCodeID')
  int? get productRtcQrCodeId => throw _privateConstructorUsedError;

  /// Thời điểm mượn (ISO).
  @JsonKey(name: 'DateBorrow')
  String? get dateBorrow => throw _privateConstructorUsedError;

  /// Hạn trả dự kiến (ISO).
  @JsonKey(name: 'DateReturnExpected')
  String? get dateReturnExpected => throw _privateConstructorUsedError;

  /// Thời điểm trả thực tế (ISO, null = chưa trả).
  @JsonKey(name: 'DateReturn')
  String? get dateReturn => throw _privateConstructorUsedError;

  /// Id người mượn.
  @JsonKey(name: 'PeopleID')
  int? get peopleId => throw _privateConstructorUsedError;

  /// Dự án sử dụng.
  @JsonKey(name: 'Project')
  String? get project => throw _privateConstructorUsedError;

  /// Ghi chú.
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;

  /// Trạng thái phiếu.
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;

  /// Số lượng đã mượn.
  @JsonKey(name: 'NumberBorrow')
  double? get numberBorrow => throw _privateConstructorUsedError;

  /// Người tạo bản ghi.
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;

  /// Thời điểm tạo bản ghi.
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;

  /// Người cập nhật gần nhất.
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;

  /// Thời điểm cập nhật gần nhất.
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;

  /// Người quản lý đã xác nhận hay chưa.
  @JsonKey(name: 'AdminConfirm')
  bool get adminConfirm => throw _privateConstructorUsedError;

  /// Id phiếu xuất kho liên quan.
  @JsonKey(name: 'BillExportTechnicalID')
  int? get billExportTechnicalId => throw _privateConstructorUsedError;

  /// QR code sản phẩm.
  @JsonKey(name: 'ProductRTCQRCode')
  String? get productRtcQrCode => throw _privateConstructorUsedError;

  /// Id kho.
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId => throw _privateConstructorUsedError;

  /// Bản ghi đã bị xoá hay chưa.
  @JsonKey(name: 'IsDelete')
  bool get isDelete => throw _privateConstructorUsedError;

  /// Id vị trí kho.
  @JsonKey(name: 'ProductLocationID')
  int? get productLocationId => throw _privateConstructorUsedError;

  /// Trạng thái người mượn.
  @JsonKey(name: 'StatusPerson')
  int? get statusPerson => throw _privateConstructorUsedError;

  /// Id phiếu cha (dùng cho phiếu gộp).
  @JsonKey(name: 'ParentID')
  int? get parentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReturnHistoryDetailCopyWith<ProductReturnHistoryDetail>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnHistoryDetailCopyWith<$Res> {
  factory $ProductReturnHistoryDetailCopyWith(
    ProductReturnHistoryDetail value,
    $Res Function(ProductReturnHistoryDetail) then,
  ) =
      _$ProductReturnHistoryDetailCopyWithImpl<
        $Res,
        ProductReturnHistoryDetail
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProductRTCID') int? productRtcId,
    @JsonKey(name: 'ProductRTCQRCodeID') int? productRtcQrCodeId,
    @JsonKey(name: 'DateBorrow') String? dateBorrow,
    @JsonKey(name: 'DateReturnExpected') String? dateReturnExpected,
    @JsonKey(name: 'DateReturn') String? dateReturn,
    @JsonKey(name: 'PeopleID') int? peopleId,
    @JsonKey(name: 'Project') String? project,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'NumberBorrow') double? numberBorrow,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'AdminConfirm') bool adminConfirm,
    @JsonKey(name: 'BillExportTechnicalID') int? billExportTechnicalId,
    @JsonKey(name: 'ProductRTCQRCode') String? productRtcQrCode,
    @JsonKey(name: 'WarehouseID') int? warehouseId,
    @JsonKey(name: 'IsDelete') bool isDelete,
    @JsonKey(name: 'ProductLocationID') int? productLocationId,
    @JsonKey(name: 'StatusPerson') int? statusPerson,
    @JsonKey(name: 'ParentID') int? parentId,
  });
}

/// @nodoc
class _$ProductReturnHistoryDetailCopyWithImpl<
  $Res,
  $Val extends ProductReturnHistoryDetail
>
    implements $ProductReturnHistoryDetailCopyWith<$Res> {
  _$ProductReturnHistoryDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productRtcId = freezed,
    Object? productRtcQrCodeId = freezed,
    Object? dateBorrow = freezed,
    Object? dateReturnExpected = freezed,
    Object? dateReturn = freezed,
    Object? peopleId = freezed,
    Object? project = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? numberBorrow = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? adminConfirm = null,
    Object? billExportTechnicalId = freezed,
    Object? productRtcQrCode = freezed,
    Object? warehouseId = freezed,
    Object? isDelete = null,
    Object? productLocationId = freezed,
    Object? statusPerson = freezed,
    Object? parentId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            productRtcId: freezed == productRtcId
                ? _value.productRtcId
                : productRtcId // ignore: cast_nullable_to_non_nullable
                      as int?,
            productRtcQrCodeId: freezed == productRtcQrCodeId
                ? _value.productRtcQrCodeId
                : productRtcQrCodeId // ignore: cast_nullable_to_non_nullable
                      as int?,
            dateBorrow: freezed == dateBorrow
                ? _value.dateBorrow
                : dateBorrow // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateReturnExpected: freezed == dateReturnExpected
                ? _value.dateReturnExpected
                : dateReturnExpected // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateReturn: freezed == dateReturn
                ? _value.dateReturn
                : dateReturn // ignore: cast_nullable_to_non_nullable
                      as String?,
            peopleId: freezed == peopleId
                ? _value.peopleId
                : peopleId // ignore: cast_nullable_to_non_nullable
                      as int?,
            project: freezed == project
                ? _value.project
                : project // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as int?,
            numberBorrow: freezed == numberBorrow
                ? _value.numberBorrow
                : numberBorrow // ignore: cast_nullable_to_non_nullable
                      as double?,
            createdBy: freezed == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdDate: freezed == createdDate
                ? _value.createdDate
                : createdDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedBy: freezed == updatedBy
                ? _value.updatedBy
                : updatedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedDate: freezed == updatedDate
                ? _value.updatedDate
                : updatedDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminConfirm: null == adminConfirm
                ? _value.adminConfirm
                : adminConfirm // ignore: cast_nullable_to_non_nullable
                      as bool,
            billExportTechnicalId: freezed == billExportTechnicalId
                ? _value.billExportTechnicalId
                : billExportTechnicalId // ignore: cast_nullable_to_non_nullable
                      as int?,
            productRtcQrCode: freezed == productRtcQrCode
                ? _value.productRtcQrCode
                : productRtcQrCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            warehouseId: freezed == warehouseId
                ? _value.warehouseId
                : warehouseId // ignore: cast_nullable_to_non_nullable
                      as int?,
            isDelete: null == isDelete
                ? _value.isDelete
                : isDelete // ignore: cast_nullable_to_non_nullable
                      as bool,
            productLocationId: freezed == productLocationId
                ? _value.productLocationId
                : productLocationId // ignore: cast_nullable_to_non_nullable
                      as int?,
            statusPerson: freezed == statusPerson
                ? _value.statusPerson
                : statusPerson // ignore: cast_nullable_to_non_nullable
                      as int?,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductReturnHistoryDetailImplCopyWith<$Res>
    implements $ProductReturnHistoryDetailCopyWith<$Res> {
  factory _$$ProductReturnHistoryDetailImplCopyWith(
    _$ProductReturnHistoryDetailImpl value,
    $Res Function(_$ProductReturnHistoryDetailImpl) then,
  ) = __$$ProductReturnHistoryDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProductRTCID') int? productRtcId,
    @JsonKey(name: 'ProductRTCQRCodeID') int? productRtcQrCodeId,
    @JsonKey(name: 'DateBorrow') String? dateBorrow,
    @JsonKey(name: 'DateReturnExpected') String? dateReturnExpected,
    @JsonKey(name: 'DateReturn') String? dateReturn,
    @JsonKey(name: 'PeopleID') int? peopleId,
    @JsonKey(name: 'Project') String? project,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'NumberBorrow') double? numberBorrow,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'AdminConfirm') bool adminConfirm,
    @JsonKey(name: 'BillExportTechnicalID') int? billExportTechnicalId,
    @JsonKey(name: 'ProductRTCQRCode') String? productRtcQrCode,
    @JsonKey(name: 'WarehouseID') int? warehouseId,
    @JsonKey(name: 'IsDelete') bool isDelete,
    @JsonKey(name: 'ProductLocationID') int? productLocationId,
    @JsonKey(name: 'StatusPerson') int? statusPerson,
    @JsonKey(name: 'ParentID') int? parentId,
  });
}

/// @nodoc
class __$$ProductReturnHistoryDetailImplCopyWithImpl<$Res>
    extends
        _$ProductReturnHistoryDetailCopyWithImpl<
          $Res,
          _$ProductReturnHistoryDetailImpl
        >
    implements _$$ProductReturnHistoryDetailImplCopyWith<$Res> {
  __$$ProductReturnHistoryDetailImplCopyWithImpl(
    _$ProductReturnHistoryDetailImpl _value,
    $Res Function(_$ProductReturnHistoryDetailImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productRtcId = freezed,
    Object? productRtcQrCodeId = freezed,
    Object? dateBorrow = freezed,
    Object? dateReturnExpected = freezed,
    Object? dateReturn = freezed,
    Object? peopleId = freezed,
    Object? project = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? numberBorrow = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? adminConfirm = null,
    Object? billExportTechnicalId = freezed,
    Object? productRtcQrCode = freezed,
    Object? warehouseId = freezed,
    Object? isDelete = null,
    Object? productLocationId = freezed,
    Object? statusPerson = freezed,
    Object? parentId = freezed,
  }) {
    return _then(
      _$ProductReturnHistoryDetailImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        productRtcId: freezed == productRtcId
            ? _value.productRtcId
            : productRtcId // ignore: cast_nullable_to_non_nullable
                  as int?,
        productRtcQrCodeId: freezed == productRtcQrCodeId
            ? _value.productRtcQrCodeId
            : productRtcQrCodeId // ignore: cast_nullable_to_non_nullable
                  as int?,
        dateBorrow: freezed == dateBorrow
            ? _value.dateBorrow
            : dateBorrow // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateReturnExpected: freezed == dateReturnExpected
            ? _value.dateReturnExpected
            : dateReturnExpected // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateReturn: freezed == dateReturn
            ? _value.dateReturn
            : dateReturn // ignore: cast_nullable_to_non_nullable
                  as String?,
        peopleId: freezed == peopleId
            ? _value.peopleId
            : peopleId // ignore: cast_nullable_to_non_nullable
                  as int?,
        project: freezed == project
            ? _value.project
            : project // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as int?,
        numberBorrow: freezed == numberBorrow
            ? _value.numberBorrow
            : numberBorrow // ignore: cast_nullable_to_non_nullable
                  as double?,
        createdBy: freezed == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdDate: freezed == createdDate
            ? _value.createdDate
            : createdDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedBy: freezed == updatedBy
            ? _value.updatedBy
            : updatedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedDate: freezed == updatedDate
            ? _value.updatedDate
            : updatedDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminConfirm: null == adminConfirm
            ? _value.adminConfirm
            : adminConfirm // ignore: cast_nullable_to_non_nullable
                  as bool,
        billExportTechnicalId: freezed == billExportTechnicalId
            ? _value.billExportTechnicalId
            : billExportTechnicalId // ignore: cast_nullable_to_non_nullable
                  as int?,
        productRtcQrCode: freezed == productRtcQrCode
            ? _value.productRtcQrCode
            : productRtcQrCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        warehouseId: freezed == warehouseId
            ? _value.warehouseId
            : warehouseId // ignore: cast_nullable_to_non_nullable
                  as int?,
        isDelete: null == isDelete
            ? _value.isDelete
            : isDelete // ignore: cast_nullable_to_non_nullable
                  as bool,
        productLocationId: freezed == productLocationId
            ? _value.productLocationId
            : productLocationId // ignore: cast_nullable_to_non_nullable
                  as int?,
        statusPerson: freezed == statusPerson
            ? _value.statusPerson
            : statusPerson // ignore: cast_nullable_to_non_nullable
                  as int?,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnHistoryDetailImpl implements _ProductReturnHistoryDetail {
  const _$ProductReturnHistoryDetailImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'ProductRTCID') this.productRtcId,
    @JsonKey(name: 'ProductRTCQRCodeID') this.productRtcQrCodeId,
    @JsonKey(name: 'DateBorrow') this.dateBorrow,
    @JsonKey(name: 'DateReturnExpected') this.dateReturnExpected,
    @JsonKey(name: 'DateReturn') this.dateReturn,
    @JsonKey(name: 'PeopleID') this.peopleId,
    @JsonKey(name: 'Project') this.project,
    @JsonKey(name: 'Note') this.note,
    @JsonKey(name: 'Status') this.status,
    @JsonKey(name: 'NumberBorrow') this.numberBorrow,
    @JsonKey(name: 'CreatedBy') this.createdBy,
    @JsonKey(name: 'CreatedDate') this.createdDate,
    @JsonKey(name: 'UpdatedBy') this.updatedBy,
    @JsonKey(name: 'UpdatedDate') this.updatedDate,
    @JsonKey(name: 'AdminConfirm') this.adminConfirm = false,
    @JsonKey(name: 'BillExportTechnicalID') this.billExportTechnicalId,
    @JsonKey(name: 'ProductRTCQRCode') this.productRtcQrCode,
    @JsonKey(name: 'WarehouseID') this.warehouseId,
    @JsonKey(name: 'IsDelete') this.isDelete = false,
    @JsonKey(name: 'ProductLocationID') this.productLocationId,
    @JsonKey(name: 'StatusPerson') this.statusPerson,
    @JsonKey(name: 'ParentID') this.parentId,
  });

  factory _$ProductReturnHistoryDetailImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ProductReturnHistoryDetailImplFromJson(json);

  /// Id phiếu trả sản phẩm — dùng làm `HistoryId` khi duyệt.
  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// Id sản phẩm RTC.
  @override
  @JsonKey(name: 'ProductRTCID')
  final int? productRtcId;

  /// Id QR code sản phẩm.
  @override
  @JsonKey(name: 'ProductRTCQRCodeID')
  final int? productRtcQrCodeId;

  /// Thời điểm mượn (ISO).
  @override
  @JsonKey(name: 'DateBorrow')
  final String? dateBorrow;

  /// Hạn trả dự kiến (ISO).
  @override
  @JsonKey(name: 'DateReturnExpected')
  final String? dateReturnExpected;

  /// Thời điểm trả thực tế (ISO, null = chưa trả).
  @override
  @JsonKey(name: 'DateReturn')
  final String? dateReturn;

  /// Id người mượn.
  @override
  @JsonKey(name: 'PeopleID')
  final int? peopleId;

  /// Dự án sử dụng.
  @override
  @JsonKey(name: 'Project')
  final String? project;

  /// Ghi chú.
  @override
  @JsonKey(name: 'Note')
  final String? note;

  /// Trạng thái phiếu.
  @override
  @JsonKey(name: 'Status')
  final int? status;

  /// Số lượng đã mượn.
  @override
  @JsonKey(name: 'NumberBorrow')
  final double? numberBorrow;

  /// Người tạo bản ghi.
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;

  /// Thời điểm tạo bản ghi.
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;

  /// Người cập nhật gần nhất.
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;

  /// Thời điểm cập nhật gần nhất.
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;

  /// Người quản lý đã xác nhận hay chưa.
  @override
  @JsonKey(name: 'AdminConfirm')
  final bool adminConfirm;

  /// Id phiếu xuất kho liên quan.
  @override
  @JsonKey(name: 'BillExportTechnicalID')
  final int? billExportTechnicalId;

  /// QR code sản phẩm.
  @override
  @JsonKey(name: 'ProductRTCQRCode')
  final String? productRtcQrCode;

  /// Id kho.
  @override
  @JsonKey(name: 'WarehouseID')
  final int? warehouseId;

  /// Bản ghi đã bị xoá hay chưa.
  @override
  @JsonKey(name: 'IsDelete')
  final bool isDelete;

  /// Id vị trí kho.
  @override
  @JsonKey(name: 'ProductLocationID')
  final int? productLocationId;

  /// Trạng thái người mượn.
  @override
  @JsonKey(name: 'StatusPerson')
  final int? statusPerson;

  /// Id phiếu cha (dùng cho phiếu gộp).
  @override
  @JsonKey(name: 'ParentID')
  final int? parentId;

  @override
  String toString() {
    return 'ProductReturnHistoryDetail(id: $id, productRtcId: $productRtcId, productRtcQrCodeId: $productRtcQrCodeId, dateBorrow: $dateBorrow, dateReturnExpected: $dateReturnExpected, dateReturn: $dateReturn, peopleId: $peopleId, project: $project, note: $note, status: $status, numberBorrow: $numberBorrow, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, adminConfirm: $adminConfirm, billExportTechnicalId: $billExportTechnicalId, productRtcQrCode: $productRtcQrCode, warehouseId: $warehouseId, isDelete: $isDelete, productLocationId: $productLocationId, statusPerson: $statusPerson, parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnHistoryDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productRtcId, productRtcId) ||
                other.productRtcId == productRtcId) &&
            (identical(other.productRtcQrCodeId, productRtcQrCodeId) ||
                other.productRtcQrCodeId == productRtcQrCodeId) &&
            (identical(other.dateBorrow, dateBorrow) ||
                other.dateBorrow == dateBorrow) &&
            (identical(other.dateReturnExpected, dateReturnExpected) ||
                other.dateReturnExpected == dateReturnExpected) &&
            (identical(other.dateReturn, dateReturn) ||
                other.dateReturn == dateReturn) &&
            (identical(other.peopleId, peopleId) ||
                other.peopleId == peopleId) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.numberBorrow, numberBorrow) ||
                other.numberBorrow == numberBorrow) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.adminConfirm, adminConfirm) ||
                other.adminConfirm == adminConfirm) &&
            (identical(other.billExportTechnicalId, billExportTechnicalId) ||
                other.billExportTechnicalId == billExportTechnicalId) &&
            (identical(other.productRtcQrCode, productRtcQrCode) ||
                other.productRtcQrCode == productRtcQrCode) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete) &&
            (identical(other.productLocationId, productLocationId) ||
                other.productLocationId == productLocationId) &&
            (identical(other.statusPerson, statusPerson) ||
                other.statusPerson == statusPerson) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    productRtcId,
    productRtcQrCodeId,
    dateBorrow,
    dateReturnExpected,
    dateReturn,
    peopleId,
    project,
    note,
    status,
    numberBorrow,
    createdBy,
    createdDate,
    updatedBy,
    updatedDate,
    adminConfirm,
    billExportTechnicalId,
    productRtcQrCode,
    warehouseId,
    isDelete,
    productLocationId,
    statusPerson,
    parentId,
  ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnHistoryDetailImplCopyWith<_$ProductReturnHistoryDetailImpl>
  get copyWith =>
      __$$ProductReturnHistoryDetailImplCopyWithImpl<
        _$ProductReturnHistoryDetailImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnHistoryDetailImplToJson(this);
  }
}

abstract class _ProductReturnHistoryDetail
    implements ProductReturnHistoryDetail {
  const factory _ProductReturnHistoryDetail({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'ProductRTCID') final int? productRtcId,
    @JsonKey(name: 'ProductRTCQRCodeID') final int? productRtcQrCodeId,
    @JsonKey(name: 'DateBorrow') final String? dateBorrow,
    @JsonKey(name: 'DateReturnExpected') final String? dateReturnExpected,
    @JsonKey(name: 'DateReturn') final String? dateReturn,
    @JsonKey(name: 'PeopleID') final int? peopleId,
    @JsonKey(name: 'Project') final String? project,
    @JsonKey(name: 'Note') final String? note,
    @JsonKey(name: 'Status') final int? status,
    @JsonKey(name: 'NumberBorrow') final double? numberBorrow,
    @JsonKey(name: 'CreatedBy') final String? createdBy,
    @JsonKey(name: 'CreatedDate') final String? createdDate,
    @JsonKey(name: 'UpdatedBy') final String? updatedBy,
    @JsonKey(name: 'UpdatedDate') final String? updatedDate,
    @JsonKey(name: 'AdminConfirm') final bool adminConfirm,
    @JsonKey(name: 'BillExportTechnicalID') final int? billExportTechnicalId,
    @JsonKey(name: 'ProductRTCQRCode') final String? productRtcQrCode,
    @JsonKey(name: 'WarehouseID') final int? warehouseId,
    @JsonKey(name: 'IsDelete') final bool isDelete,
    @JsonKey(name: 'ProductLocationID') final int? productLocationId,
    @JsonKey(name: 'StatusPerson') final int? statusPerson,
    @JsonKey(name: 'ParentID') final int? parentId,
  }) = _$ProductReturnHistoryDetailImpl;

  factory _ProductReturnHistoryDetail.fromJson(Map<String, dynamic> json) =
      _$ProductReturnHistoryDetailImpl.fromJson;

  @override
  /// Id phiếu trả sản phẩm — dùng làm `HistoryId` khi duyệt.
  @JsonKey(name: 'ID')
  int? get id;
  @override
  /// Id sản phẩm RTC.
  @JsonKey(name: 'ProductRTCID')
  int? get productRtcId;
  @override
  /// Id QR code sản phẩm.
  @JsonKey(name: 'ProductRTCQRCodeID')
  int? get productRtcQrCodeId;
  @override
  /// Thời điểm mượn (ISO).
  @JsonKey(name: 'DateBorrow')
  String? get dateBorrow;
  @override
  /// Hạn trả dự kiến (ISO).
  @JsonKey(name: 'DateReturnExpected')
  String? get dateReturnExpected;
  @override
  /// Thời điểm trả thực tế (ISO, null = chưa trả).
  @JsonKey(name: 'DateReturn')
  String? get dateReturn;
  @override
  /// Id người mượn.
  @JsonKey(name: 'PeopleID')
  int? get peopleId;
  @override
  /// Dự án sử dụng.
  @JsonKey(name: 'Project')
  String? get project;
  @override
  /// Ghi chú.
  @JsonKey(name: 'Note')
  String? get note;
  @override
  /// Trạng thái phiếu.
  @JsonKey(name: 'Status')
  int? get status;
  @override
  /// Số lượng đã mượn.
  @JsonKey(name: 'NumberBorrow')
  double? get numberBorrow;
  @override
  /// Người tạo bản ghi.
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  /// Thời điểm tạo bản ghi.
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  /// Người cập nhật gần nhất.
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  /// Thời điểm cập nhật gần nhất.
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  /// Người quản lý đã xác nhận hay chưa.
  @JsonKey(name: 'AdminConfirm')
  bool get adminConfirm;
  @override
  /// Id phiếu xuất kho liên quan.
  @JsonKey(name: 'BillExportTechnicalID')
  int? get billExportTechnicalId;
  @override
  /// QR code sản phẩm.
  @JsonKey(name: 'ProductRTCQRCode')
  String? get productRtcQrCode;
  @override
  /// Id kho.
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId;
  @override
  /// Bản ghi đã bị xoá hay chưa.
  @JsonKey(name: 'IsDelete')
  bool get isDelete;
  @override
  /// Id vị trí kho.
  @JsonKey(name: 'ProductLocationID')
  int? get productLocationId;
  @override
  /// Trạng thái người mượn.
  @JsonKey(name: 'StatusPerson')
  int? get statusPerson;
  @override
  /// Id phiếu cha (dùng cho phiếu gộp).
  @JsonKey(name: 'ParentID')
  int? get parentId;
  @override
  @JsonKey(ignore: true)
  _$$ProductReturnHistoryDetailImplCopyWith<_$ProductReturnHistoryDetailImpl>
  get copyWith => throw _privateConstructorUsedError;
}
