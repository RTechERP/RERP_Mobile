// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_import_export_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HistoryImportExportResponse _$HistoryImportExportResponseFromJson(
  Map<String, dynamic> json,
) {
  return _HistoryImportExportResponse.fromJson(json);
}

/// @nodoc
mixin _$HistoryImportExportResponse {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IDDetail')
  int? get idDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'RowNum')
  int? get rowNum => throw _privateConstructorUsedError;

  /// Mã phiếu nhập/xuất (vd. `PTNB261022001`).
  @JsonKey(name: 'BillImportCode')
  String? get billImportCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'BillCode')
  String? get billCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'SomeBill')
  String? get someBill => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatDate')
  String? get creatDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateRequestImport')
  String? get dateRequestImport => throw _privateConstructorUsedError;

  /// Người giao / người nhận / nhà cung cấp.
  @JsonKey(name: 'Deliver')
  String? get deliver => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reciver')
  String? get reciver => throw _privateConstructorUsedError;
  @JsonKey(name: 'Suplier')
  String? get suplier => throw _privateConstructorUsedError;

  /// Kho & loại kho.
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'WarehouseName')
  String? get warehouseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'KhoType')
  String? get khoType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Stock')
  String? get stock => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaterialType')
  String? get materialType => throw _privateConstructorUsedError;

  /// Thông tin sản phẩm của dòng chi tiết.
  @JsonKey(name: 'ProductCode')
  String? get productCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductNewCode')
  String? get productNewCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductName')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Qty')
  double? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'Unit')
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'SerialNumber')
  String? get serialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddressBox')
  String? get addressBox => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;

  /// Trạng thái hiển thị: `statusText` (vd. "Phiếu Nhập"),
  /// `approveText` (vd. "Huỷ/Chưa nhận chứng từ").
  @JsonKey(name: 'StatusText')
  String? get statusText => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApproveText')
  String? get approveText => throw _privateConstructorUsedError;

  /// Thời điểm huỷ/nhận chứng từ (`yyyy-MM-ddTHH:mm:ss`), null nếu chưa có.
  @JsonKey(name: 'DateStatus')
  String? get dateStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'BillType')
  bool? get billType => throw _privateConstructorUsedError;
  @JsonKey(name: 'BillTypeNew')
  int? get billTypeNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsReturnedInventory')
  bool? get isReturnedInventory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryImportExportResponseCopyWith<HistoryImportExportResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryImportExportResponseCopyWith<$Res> {
  factory $HistoryImportExportResponseCopyWith(
    HistoryImportExportResponse value,
    $Res Function(HistoryImportExportResponse) then,
  ) =
      _$HistoryImportExportResponseCopyWithImpl<
        $Res,
        HistoryImportExportResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'IDDetail') int? idDetail,
    @JsonKey(name: 'RowNum') int? rowNum,
    @JsonKey(name: 'BillImportCode') String? billImportCode,
    @JsonKey(name: 'BillCode') String? billCode,
    @JsonKey(name: 'SomeBill') String? someBill,
    @JsonKey(name: 'CreatDate') String? creatDate,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'DateRequestImport') String? dateRequestImport,
    @JsonKey(name: 'Deliver') String? deliver,
    @JsonKey(name: 'Reciver') String? reciver,
    @JsonKey(name: 'Suplier') String? suplier,
    @JsonKey(name: 'WarehouseID') int? warehouseId,
    @JsonKey(name: 'WarehouseName') String? warehouseName,
    @JsonKey(name: 'KhoType') String? khoType,
    @JsonKey(name: 'Stock') String? stock,
    @JsonKey(name: 'MaterialType') String? materialType,
    @JsonKey(name: 'ProductCode') String? productCode,
    @JsonKey(name: 'ProductNewCode') String? productNewCode,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'Qty') double? qty,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'AddressBox') String? addressBox,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'ApproveText') String? approveText,
    @JsonKey(name: 'DateStatus') String? dateStatus,
    @JsonKey(name: 'Status') bool? status,
    @JsonKey(name: 'BillType') bool? billType,
    @JsonKey(name: 'BillTypeNew') int? billTypeNew,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsReturnedInventory') bool? isReturnedInventory,
  });
}

/// @nodoc
class _$HistoryImportExportResponseCopyWithImpl<
  $Res,
  $Val extends HistoryImportExportResponse
>
    implements $HistoryImportExportResponseCopyWith<$Res> {
  _$HistoryImportExportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idDetail = freezed,
    Object? rowNum = freezed,
    Object? billImportCode = freezed,
    Object? billCode = freezed,
    Object? someBill = freezed,
    Object? creatDate = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? dateRequestImport = freezed,
    Object? deliver = freezed,
    Object? reciver = freezed,
    Object? suplier = freezed,
    Object? warehouseId = freezed,
    Object? warehouseName = freezed,
    Object? khoType = freezed,
    Object? stock = freezed,
    Object? materialType = freezed,
    Object? productCode = freezed,
    Object? productNewCode = freezed,
    Object? productName = freezed,
    Object? qty = freezed,
    Object? unit = freezed,
    Object? serialNumber = freezed,
    Object? addressBox = freezed,
    Object? projectName = freezed,
    Object? note = freezed,
    Object? statusText = freezed,
    Object? approveText = freezed,
    Object? dateStatus = freezed,
    Object? status = freezed,
    Object? billType = freezed,
    Object? billTypeNew = freezed,
    Object? isDeleted = freezed,
    Object? isReturnedInventory = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            idDetail: freezed == idDetail
                ? _value.idDetail
                : idDetail // ignore: cast_nullable_to_non_nullable
                      as int?,
            rowNum: freezed == rowNum
                ? _value.rowNum
                : rowNum // ignore: cast_nullable_to_non_nullable
                      as int?,
            billImportCode: freezed == billImportCode
                ? _value.billImportCode
                : billImportCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            billCode: freezed == billCode
                ? _value.billCode
                : billCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            someBill: freezed == someBill
                ? _value.someBill
                : someBill // ignore: cast_nullable_to_non_nullable
                      as String?,
            creatDate: freezed == creatDate
                ? _value.creatDate
                : creatDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdDate: freezed == createdDate
                ? _value.createdDate
                : createdDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdBy: freezed == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateRequestImport: freezed == dateRequestImport
                ? _value.dateRequestImport
                : dateRequestImport // ignore: cast_nullable_to_non_nullable
                      as String?,
            deliver: freezed == deliver
                ? _value.deliver
                : deliver // ignore: cast_nullable_to_non_nullable
                      as String?,
            reciver: freezed == reciver
                ? _value.reciver
                : reciver // ignore: cast_nullable_to_non_nullable
                      as String?,
            suplier: freezed == suplier
                ? _value.suplier
                : suplier // ignore: cast_nullable_to_non_nullable
                      as String?,
            warehouseId: freezed == warehouseId
                ? _value.warehouseId
                : warehouseId // ignore: cast_nullable_to_non_nullable
                      as int?,
            warehouseName: freezed == warehouseName
                ? _value.warehouseName
                : warehouseName // ignore: cast_nullable_to_non_nullable
                      as String?,
            khoType: freezed == khoType
                ? _value.khoType
                : khoType // ignore: cast_nullable_to_non_nullable
                      as String?,
            stock: freezed == stock
                ? _value.stock
                : stock // ignore: cast_nullable_to_non_nullable
                      as String?,
            materialType: freezed == materialType
                ? _value.materialType
                : materialType // ignore: cast_nullable_to_non_nullable
                      as String?,
            productCode: freezed == productCode
                ? _value.productCode
                : productCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            productNewCode: freezed == productNewCode
                ? _value.productNewCode
                : productNewCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            productName: freezed == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String?,
            qty: freezed == qty
                ? _value.qty
                : qty // ignore: cast_nullable_to_non_nullable
                      as double?,
            unit: freezed == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String?,
            serialNumber: freezed == serialNumber
                ? _value.serialNumber
                : serialNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            addressBox: freezed == addressBox
                ? _value.addressBox
                : addressBox // ignore: cast_nullable_to_non_nullable
                      as String?,
            projectName: freezed == projectName
                ? _value.projectName
                : projectName // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            statusText: freezed == statusText
                ? _value.statusText
                : statusText // ignore: cast_nullable_to_non_nullable
                      as String?,
            approveText: freezed == approveText
                ? _value.approveText
                : approveText // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateStatus: freezed == dateStatus
                ? _value.dateStatus
                : dateStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as bool?,
            billType: freezed == billType
                ? _value.billType
                : billType // ignore: cast_nullable_to_non_nullable
                      as bool?,
            billTypeNew: freezed == billTypeNew
                ? _value.billTypeNew
                : billTypeNew // ignore: cast_nullable_to_non_nullable
                      as int?,
            isDeleted: freezed == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isReturnedInventory: freezed == isReturnedInventory
                ? _value.isReturnedInventory
                : isReturnedInventory // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HistoryImportExportResponseImplCopyWith<$Res>
    implements $HistoryImportExportResponseCopyWith<$Res> {
  factory _$$HistoryImportExportResponseImplCopyWith(
    _$HistoryImportExportResponseImpl value,
    $Res Function(_$HistoryImportExportResponseImpl) then,
  ) = __$$HistoryImportExportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'IDDetail') int? idDetail,
    @JsonKey(name: 'RowNum') int? rowNum,
    @JsonKey(name: 'BillImportCode') String? billImportCode,
    @JsonKey(name: 'BillCode') String? billCode,
    @JsonKey(name: 'SomeBill') String? someBill,
    @JsonKey(name: 'CreatDate') String? creatDate,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'DateRequestImport') String? dateRequestImport,
    @JsonKey(name: 'Deliver') String? deliver,
    @JsonKey(name: 'Reciver') String? reciver,
    @JsonKey(name: 'Suplier') String? suplier,
    @JsonKey(name: 'WarehouseID') int? warehouseId,
    @JsonKey(name: 'WarehouseName') String? warehouseName,
    @JsonKey(name: 'KhoType') String? khoType,
    @JsonKey(name: 'Stock') String? stock,
    @JsonKey(name: 'MaterialType') String? materialType,
    @JsonKey(name: 'ProductCode') String? productCode,
    @JsonKey(name: 'ProductNewCode') String? productNewCode,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'Qty') double? qty,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'AddressBox') String? addressBox,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'ApproveText') String? approveText,
    @JsonKey(name: 'DateStatus') String? dateStatus,
    @JsonKey(name: 'Status') bool? status,
    @JsonKey(name: 'BillType') bool? billType,
    @JsonKey(name: 'BillTypeNew') int? billTypeNew,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsReturnedInventory') bool? isReturnedInventory,
  });
}

/// @nodoc
class __$$HistoryImportExportResponseImplCopyWithImpl<$Res>
    extends
        _$HistoryImportExportResponseCopyWithImpl<
          $Res,
          _$HistoryImportExportResponseImpl
        >
    implements _$$HistoryImportExportResponseImplCopyWith<$Res> {
  __$$HistoryImportExportResponseImplCopyWithImpl(
    _$HistoryImportExportResponseImpl _value,
    $Res Function(_$HistoryImportExportResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idDetail = freezed,
    Object? rowNum = freezed,
    Object? billImportCode = freezed,
    Object? billCode = freezed,
    Object? someBill = freezed,
    Object? creatDate = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? dateRequestImport = freezed,
    Object? deliver = freezed,
    Object? reciver = freezed,
    Object? suplier = freezed,
    Object? warehouseId = freezed,
    Object? warehouseName = freezed,
    Object? khoType = freezed,
    Object? stock = freezed,
    Object? materialType = freezed,
    Object? productCode = freezed,
    Object? productNewCode = freezed,
    Object? productName = freezed,
    Object? qty = freezed,
    Object? unit = freezed,
    Object? serialNumber = freezed,
    Object? addressBox = freezed,
    Object? projectName = freezed,
    Object? note = freezed,
    Object? statusText = freezed,
    Object? approveText = freezed,
    Object? dateStatus = freezed,
    Object? status = freezed,
    Object? billType = freezed,
    Object? billTypeNew = freezed,
    Object? isDeleted = freezed,
    Object? isReturnedInventory = freezed,
  }) {
    return _then(
      _$HistoryImportExportResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        idDetail: freezed == idDetail
            ? _value.idDetail
            : idDetail // ignore: cast_nullable_to_non_nullable
                  as int?,
        rowNum: freezed == rowNum
            ? _value.rowNum
            : rowNum // ignore: cast_nullable_to_non_nullable
                  as int?,
        billImportCode: freezed == billImportCode
            ? _value.billImportCode
            : billImportCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        billCode: freezed == billCode
            ? _value.billCode
            : billCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        someBill: freezed == someBill
            ? _value.someBill
            : someBill // ignore: cast_nullable_to_non_nullable
                  as String?,
        creatDate: freezed == creatDate
            ? _value.creatDate
            : creatDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdDate: freezed == createdDate
            ? _value.createdDate
            : createdDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdBy: freezed == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateRequestImport: freezed == dateRequestImport
            ? _value.dateRequestImport
            : dateRequestImport // ignore: cast_nullable_to_non_nullable
                  as String?,
        deliver: freezed == deliver
            ? _value.deliver
            : deliver // ignore: cast_nullable_to_non_nullable
                  as String?,
        reciver: freezed == reciver
            ? _value.reciver
            : reciver // ignore: cast_nullable_to_non_nullable
                  as String?,
        suplier: freezed == suplier
            ? _value.suplier
            : suplier // ignore: cast_nullable_to_non_nullable
                  as String?,
        warehouseId: freezed == warehouseId
            ? _value.warehouseId
            : warehouseId // ignore: cast_nullable_to_non_nullable
                  as int?,
        warehouseName: freezed == warehouseName
            ? _value.warehouseName
            : warehouseName // ignore: cast_nullable_to_non_nullable
                  as String?,
        khoType: freezed == khoType
            ? _value.khoType
            : khoType // ignore: cast_nullable_to_non_nullable
                  as String?,
        stock: freezed == stock
            ? _value.stock
            : stock // ignore: cast_nullable_to_non_nullable
                  as String?,
        materialType: freezed == materialType
            ? _value.materialType
            : materialType // ignore: cast_nullable_to_non_nullable
                  as String?,
        productCode: freezed == productCode
            ? _value.productCode
            : productCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        productNewCode: freezed == productNewCode
            ? _value.productNewCode
            : productNewCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        productName: freezed == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String?,
        qty: freezed == qty
            ? _value.qty
            : qty // ignore: cast_nullable_to_non_nullable
                  as double?,
        unit: freezed == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String?,
        serialNumber: freezed == serialNumber
            ? _value.serialNumber
            : serialNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        addressBox: freezed == addressBox
            ? _value.addressBox
            : addressBox // ignore: cast_nullable_to_non_nullable
                  as String?,
        projectName: freezed == projectName
            ? _value.projectName
            : projectName // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        statusText: freezed == statusText
            ? _value.statusText
            : statusText // ignore: cast_nullable_to_non_nullable
                  as String?,
        approveText: freezed == approveText
            ? _value.approveText
            : approveText // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateStatus: freezed == dateStatus
            ? _value.dateStatus
            : dateStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as bool?,
        billType: freezed == billType
            ? _value.billType
            : billType // ignore: cast_nullable_to_non_nullable
                  as bool?,
        billTypeNew: freezed == billTypeNew
            ? _value.billTypeNew
            : billTypeNew // ignore: cast_nullable_to_non_nullable
                  as int?,
        isDeleted: freezed == isDeleted
            ? _value.isDeleted
            : isDeleted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isReturnedInventory: freezed == isReturnedInventory
            ? _value.isReturnedInventory
            : isReturnedInventory // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryImportExportResponseImpl
    implements _HistoryImportExportResponse {
  const _$HistoryImportExportResponseImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'IDDetail') this.idDetail,
    @JsonKey(name: 'RowNum') this.rowNum,
    @JsonKey(name: 'BillImportCode') this.billImportCode,
    @JsonKey(name: 'BillCode') this.billCode,
    @JsonKey(name: 'SomeBill') this.someBill,
    @JsonKey(name: 'CreatDate') this.creatDate,
    @JsonKey(name: 'CreatedDate') this.createdDate,
    @JsonKey(name: 'CreatedBy') this.createdBy,
    @JsonKey(name: 'DateRequestImport') this.dateRequestImport,
    @JsonKey(name: 'Deliver') this.deliver,
    @JsonKey(name: 'Reciver') this.reciver,
    @JsonKey(name: 'Suplier') this.suplier,
    @JsonKey(name: 'WarehouseID') this.warehouseId,
    @JsonKey(name: 'WarehouseName') this.warehouseName,
    @JsonKey(name: 'KhoType') this.khoType,
    @JsonKey(name: 'Stock') this.stock,
    @JsonKey(name: 'MaterialType') this.materialType,
    @JsonKey(name: 'ProductCode') this.productCode,
    @JsonKey(name: 'ProductNewCode') this.productNewCode,
    @JsonKey(name: 'ProductName') this.productName,
    @JsonKey(name: 'Qty') this.qty,
    @JsonKey(name: 'Unit') this.unit,
    @JsonKey(name: 'SerialNumber') this.serialNumber,
    @JsonKey(name: 'AddressBox') this.addressBox,
    @JsonKey(name: 'ProjectName') this.projectName,
    @JsonKey(name: 'Note') this.note,
    @JsonKey(name: 'StatusText') this.statusText,
    @JsonKey(name: 'ApproveText') this.approveText,
    @JsonKey(name: 'DateStatus') this.dateStatus,
    @JsonKey(name: 'Status') this.status,
    @JsonKey(name: 'BillType') this.billType,
    @JsonKey(name: 'BillTypeNew') this.billTypeNew,
    @JsonKey(name: 'IsDeleted') this.isDeleted,
    @JsonKey(name: 'IsReturnedInventory') this.isReturnedInventory,
  });

  factory _$HistoryImportExportResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$HistoryImportExportResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'IDDetail')
  final int? idDetail;
  @override
  @JsonKey(name: 'RowNum')
  final int? rowNum;

  /// Mã phiếu nhập/xuất (vd. `PTNB261022001`).
  @override
  @JsonKey(name: 'BillImportCode')
  final String? billImportCode;
  @override
  @JsonKey(name: 'BillCode')
  final String? billCode;
  @override
  @JsonKey(name: 'SomeBill')
  final String? someBill;
  @override
  @JsonKey(name: 'CreatDate')
  final String? creatDate;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'DateRequestImport')
  final String? dateRequestImport;

  /// Người giao / người nhận / nhà cung cấp.
  @override
  @JsonKey(name: 'Deliver')
  final String? deliver;
  @override
  @JsonKey(name: 'Reciver')
  final String? reciver;
  @override
  @JsonKey(name: 'Suplier')
  final String? suplier;

  /// Kho & loại kho.
  @override
  @JsonKey(name: 'WarehouseID')
  final int? warehouseId;
  @override
  @JsonKey(name: 'WarehouseName')
  final String? warehouseName;
  @override
  @JsonKey(name: 'KhoType')
  final String? khoType;
  @override
  @JsonKey(name: 'Stock')
  final String? stock;
  @override
  @JsonKey(name: 'MaterialType')
  final String? materialType;

  /// Thông tin sản phẩm của dòng chi tiết.
  @override
  @JsonKey(name: 'ProductCode')
  final String? productCode;
  @override
  @JsonKey(name: 'ProductNewCode')
  final String? productNewCode;
  @override
  @JsonKey(name: 'ProductName')
  final String? productName;
  @override
  @JsonKey(name: 'Qty')
  final double? qty;
  @override
  @JsonKey(name: 'Unit')
  final String? unit;
  @override
  @JsonKey(name: 'SerialNumber')
  final String? serialNumber;
  @override
  @JsonKey(name: 'AddressBox')
  final String? addressBox;
  @override
  @JsonKey(name: 'ProjectName')
  final String? projectName;
  @override
  @JsonKey(name: 'Note')
  final String? note;

  /// Trạng thái hiển thị: `statusText` (vd. "Phiếu Nhập"),
  /// `approveText` (vd. "Huỷ/Chưa nhận chứng từ").
  @override
  @JsonKey(name: 'StatusText')
  final String? statusText;
  @override
  @JsonKey(name: 'ApproveText')
  final String? approveText;

  /// Thời điểm huỷ/nhận chứng từ (`yyyy-MM-ddTHH:mm:ss`), null nếu chưa có.
  @override
  @JsonKey(name: 'DateStatus')
  final String? dateStatus;
  @override
  @JsonKey(name: 'Status')
  final bool? status;
  @override
  @JsonKey(name: 'BillType')
  final bool? billType;
  @override
  @JsonKey(name: 'BillTypeNew')
  final int? billTypeNew;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'IsReturnedInventory')
  final bool? isReturnedInventory;

  @override
  String toString() {
    return 'HistoryImportExportResponse(id: $id, idDetail: $idDetail, rowNum: $rowNum, billImportCode: $billImportCode, billCode: $billCode, someBill: $someBill, creatDate: $creatDate, createdDate: $createdDate, createdBy: $createdBy, dateRequestImport: $dateRequestImport, deliver: $deliver, reciver: $reciver, suplier: $suplier, warehouseId: $warehouseId, warehouseName: $warehouseName, khoType: $khoType, stock: $stock, materialType: $materialType, productCode: $productCode, productNewCode: $productNewCode, productName: $productName, qty: $qty, unit: $unit, serialNumber: $serialNumber, addressBox: $addressBox, projectName: $projectName, note: $note, statusText: $statusText, approveText: $approveText, dateStatus: $dateStatus, status: $status, billType: $billType, billTypeNew: $billTypeNew, isDeleted: $isDeleted, isReturnedInventory: $isReturnedInventory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryImportExportResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idDetail, idDetail) ||
                other.idDetail == idDetail) &&
            (identical(other.rowNum, rowNum) || other.rowNum == rowNum) &&
            (identical(other.billImportCode, billImportCode) ||
                other.billImportCode == billImportCode) &&
            (identical(other.billCode, billCode) ||
                other.billCode == billCode) &&
            (identical(other.someBill, someBill) ||
                other.someBill == someBill) &&
            (identical(other.creatDate, creatDate) ||
                other.creatDate == creatDate) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.dateRequestImport, dateRequestImport) ||
                other.dateRequestImport == dateRequestImport) &&
            (identical(other.deliver, deliver) || other.deliver == deliver) &&
            (identical(other.reciver, reciver) || other.reciver == reciver) &&
            (identical(other.suplier, suplier) || other.suplier == suplier) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.khoType, khoType) || other.khoType == khoType) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.materialType, materialType) ||
                other.materialType == materialType) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.productNewCode, productNewCode) ||
                other.productNewCode == productNewCode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.addressBox, addressBox) ||
                other.addressBox == addressBox) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.statusText, statusText) ||
                other.statusText == statusText) &&
            (identical(other.approveText, approveText) ||
                other.approveText == approveText) &&
            (identical(other.dateStatus, dateStatus) ||
                other.dateStatus == dateStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.billType, billType) ||
                other.billType == billType) &&
            (identical(other.billTypeNew, billTypeNew) ||
                other.billTypeNew == billTypeNew) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.isReturnedInventory, isReturnedInventory) ||
                other.isReturnedInventory == isReturnedInventory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    idDetail,
    rowNum,
    billImportCode,
    billCode,
    someBill,
    creatDate,
    createdDate,
    createdBy,
    dateRequestImport,
    deliver,
    reciver,
    suplier,
    warehouseId,
    warehouseName,
    khoType,
    stock,
    materialType,
    productCode,
    productNewCode,
    productName,
    qty,
    unit,
    serialNumber,
    addressBox,
    projectName,
    note,
    statusText,
    approveText,
    dateStatus,
    status,
    billType,
    billTypeNew,
    isDeleted,
    isReturnedInventory,
  ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryImportExportResponseImplCopyWith<_$HistoryImportExportResponseImpl>
  get copyWith =>
      __$$HistoryImportExportResponseImplCopyWithImpl<
        _$HistoryImportExportResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryImportExportResponseImplToJson(this);
  }
}

abstract class _HistoryImportExportResponse
    implements HistoryImportExportResponse {
  const factory _HistoryImportExportResponse({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'IDDetail') final int? idDetail,
    @JsonKey(name: 'RowNum') final int? rowNum,
    @JsonKey(name: 'BillImportCode') final String? billImportCode,
    @JsonKey(name: 'BillCode') final String? billCode,
    @JsonKey(name: 'SomeBill') final String? someBill,
    @JsonKey(name: 'CreatDate') final String? creatDate,
    @JsonKey(name: 'CreatedDate') final String? createdDate,
    @JsonKey(name: 'CreatedBy') final String? createdBy,
    @JsonKey(name: 'DateRequestImport') final String? dateRequestImport,
    @JsonKey(name: 'Deliver') final String? deliver,
    @JsonKey(name: 'Reciver') final String? reciver,
    @JsonKey(name: 'Suplier') final String? suplier,
    @JsonKey(name: 'WarehouseID') final int? warehouseId,
    @JsonKey(name: 'WarehouseName') final String? warehouseName,
    @JsonKey(name: 'KhoType') final String? khoType,
    @JsonKey(name: 'Stock') final String? stock,
    @JsonKey(name: 'MaterialType') final String? materialType,
    @JsonKey(name: 'ProductCode') final String? productCode,
    @JsonKey(name: 'ProductNewCode') final String? productNewCode,
    @JsonKey(name: 'ProductName') final String? productName,
    @JsonKey(name: 'Qty') final double? qty,
    @JsonKey(name: 'Unit') final String? unit,
    @JsonKey(name: 'SerialNumber') final String? serialNumber,
    @JsonKey(name: 'AddressBox') final String? addressBox,
    @JsonKey(name: 'ProjectName') final String? projectName,
    @JsonKey(name: 'Note') final String? note,
    @JsonKey(name: 'StatusText') final String? statusText,
    @JsonKey(name: 'ApproveText') final String? approveText,
    @JsonKey(name: 'DateStatus') final String? dateStatus,
    @JsonKey(name: 'Status') final bool? status,
    @JsonKey(name: 'BillType') final bool? billType,
    @JsonKey(name: 'BillTypeNew') final int? billTypeNew,
    @JsonKey(name: 'IsDeleted') final bool? isDeleted,
    @JsonKey(name: 'IsReturnedInventory') final bool? isReturnedInventory,
  }) = _$HistoryImportExportResponseImpl;

  factory _HistoryImportExportResponse.fromJson(Map<String, dynamic> json) =
      _$HistoryImportExportResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'IDDetail')
  int? get idDetail;
  @override
  @JsonKey(name: 'RowNum')
  int? get rowNum;
  @override
  /// Mã phiếu nhập/xuất (vd. `PTNB261022001`).
  @JsonKey(name: 'BillImportCode')
  String? get billImportCode;
  @override
  @JsonKey(name: 'BillCode')
  String? get billCode;
  @override
  @JsonKey(name: 'SomeBill')
  String? get someBill;
  @override
  @JsonKey(name: 'CreatDate')
  String? get creatDate;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'DateRequestImport')
  String? get dateRequestImport;
  @override
  /// Người giao / người nhận / nhà cung cấp.
  @JsonKey(name: 'Deliver')
  String? get deliver;
  @override
  @JsonKey(name: 'Reciver')
  String? get reciver;
  @override
  @JsonKey(name: 'Suplier')
  String? get suplier;
  @override
  /// Kho & loại kho.
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId;
  @override
  @JsonKey(name: 'WarehouseName')
  String? get warehouseName;
  @override
  @JsonKey(name: 'KhoType')
  String? get khoType;
  @override
  @JsonKey(name: 'Stock')
  String? get stock;
  @override
  @JsonKey(name: 'MaterialType')
  String? get materialType;
  @override
  /// Thông tin sản phẩm của dòng chi tiết.
  @JsonKey(name: 'ProductCode')
  String? get productCode;
  @override
  @JsonKey(name: 'ProductNewCode')
  String? get productNewCode;
  @override
  @JsonKey(name: 'ProductName')
  String? get productName;
  @override
  @JsonKey(name: 'Qty')
  double? get qty;
  @override
  @JsonKey(name: 'Unit')
  String? get unit;
  @override
  @JsonKey(name: 'SerialNumber')
  String? get serialNumber;
  @override
  @JsonKey(name: 'AddressBox')
  String? get addressBox;
  @override
  @JsonKey(name: 'ProjectName')
  String? get projectName;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  /// Trạng thái hiển thị: `statusText` (vd. "Phiếu Nhập"),
  /// `approveText` (vd. "Huỷ/Chưa nhận chứng từ").
  @JsonKey(name: 'StatusText')
  String? get statusText;
  @override
  @JsonKey(name: 'ApproveText')
  String? get approveText;
  @override
  /// Thời điểm huỷ/nhận chứng từ (`yyyy-MM-ddTHH:mm:ss`), null nếu chưa có.
  @JsonKey(name: 'DateStatus')
  String? get dateStatus;
  @override
  @JsonKey(name: 'Status')
  bool? get status;
  @override
  @JsonKey(name: 'BillType')
  bool? get billType;
  @override
  @JsonKey(name: 'BillTypeNew')
  int? get billTypeNew;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'IsReturnedInventory')
  bool? get isReturnedInventory;
  @override
  @JsonKey(ignore: true)
  _$$HistoryImportExportResponseImplCopyWith<_$HistoryImportExportResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
