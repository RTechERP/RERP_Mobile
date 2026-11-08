import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_check_model.freezed.dart';
part 'inventory_check_model.g.dart';

/// Nhân viên có thể được giao để kiểm kê.
///
/// Trả về từ API `GET /WarehouseInventoryCount/get-employees`.
@freezed
class InventoryCheckEmployee with _$InventoryCheckEmployee {
  const factory InventoryCheckEmployee({
    /// Id nhân viên (khớp với `EmployeeID` của đợt kiểm kê).
    @JsonKey(name: 'ID') int? id,

    /// Mã nhân viên (vd. `R0316`).
    @JsonKey(name: 'Code') String? code,

    /// Họ tên nhân viên.
    @JsonKey(name: 'FullName') String? fullName,
  }) = _InventoryCheckEmployee;

  factory InventoryCheckEmployee.fromJson(Map<String, dynamic> json) =>
      _$InventoryCheckEmployeeFromJson(json);
}

/// Một đợt kiểm kê kho.
///
/// Trả về từ API `GET /WarehouseInventoryCount/get-all`.
@freezed
class InventoryCountItem with _$InventoryCountItem {
  const factory InventoryCountItem({
    @JsonKey(name: 'ID') int? id,

    /// Mã đợt kiểm kê (vd. `KiemKe_20261018_01`).
    @JsonKey(name: 'Code') String? code,

    /// Tên đợt kiểm kê (vd. `Đợt kiểm kê ngày 18/10/2026`).
    @JsonKey(name: 'Name') String? name,

    /// Id kho thực hiện kiểm kê (1 = Kho Demo, 2 = Kho Modula, 3 = Kho AGV).
    @JsonKey(name: 'WarehouseID') int? warehouseId,

    /// Tên kho.
    @JsonKey(name: 'WarehouseName') String? warehouseName,

    /// Id nhân viên kiểm kê.
    @JsonKey(name: 'EmployeeID') int? employeeId,

    /// Họ tên nhân viên kiểm kê.
    @JsonKey(name: 'EmployeeName') String? employeeName,

    /// Mã nhân viên kiểm kê.
    @JsonKey(name: 'EmployeeCode') String? employeeCode,

    /// Thời điểm kiểm kê (ISO `yyyy-MM-ddTHH:mm:ss`).
    @JsonKey(name: 'DateCount') String? dateCount,

    /// Ghi chú của đợt kiểm kê.
    @JsonKey(name: 'Note') String? note,

    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,

    /// Đợt kiểm kê đã hoàn thành hay chưa.
    @JsonKey(name: 'IsComplete') bool? isComplete,

    /// Tổng số sản phẩm đã kiểm kê.
    @JsonKey(name: 'TotalItems') int? totalItems,
  }) = _InventoryCountItem;

  factory InventoryCountItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryCountItemFromJson(json);
}

/// Payload gửi API `POST /WarehouseInventoryCount/save-data` — tạo đợt
/// kiểm kê mới.
///
/// `DateCount` gửi theo chuẩn ISO (`yyyy-MM-ddTHH:mm:ss.SSSZ`).
@freezed
class InventoryCountSavePayload with _$InventoryCountSavePayload {
  const factory InventoryCountSavePayload({
    /// Id đợt kiểm kê — 0 khi tạo mới.
    @JsonKey(name: 'ID') @Default(0) int id,

    /// Mã đợt kiểm kê (sinh từ API `generate-code`).
    @JsonKey(name: 'Code') required String code,

    /// Tên đợt kiểm kê.
    @JsonKey(name: 'Name') required String name,

    /// Id kho thực hiện kiểm kê (1 = Kho Demo, 2 = Kho Modula, 3 = Kho AGV).
    @JsonKey(name: 'WarehouseID') required int warehouseId,

    /// Id nhân viên kiểm kê.
    @JsonKey(name: 'EmployeeID') required int employeeId,

    /// Thời điểm kiểm kê (ISO).
    @JsonKey(name: 'DateCount') required String dateCount,

    /// Ghi chú của đợt kiểm kê.
    @JsonKey(name: 'Note') String? note,

    /// Đợt kiểm kê đã hoàn thành hay chưa.
    @JsonKey(name: 'IsComplete') @Default(false) bool isComplete,
  }) = _InventoryCountSavePayload;

  factory InventoryCountSavePayload.fromJson(Map<String, dynamic> json) =>
      _$InventoryCountSavePayloadFromJson(json);
}

/// Kết quả trả về từ API `POST /WarehouseInventoryCount/save-data`.
///
/// Server bọc trong `{ "message": ..., "data": { ... } }`, phần `data` là
/// thông tin đợt kiểm kê vừa tạo (chưa có `WarehouseName` / `EmployeeName`
/// vì server không trả kèm).
@freezed
class InventoryCountSaveResult with _$InventoryCountSaveResult {
  const factory InventoryCountSaveResult({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'IsComplete') bool? isComplete,
  }) = _InventoryCountSaveResult;

  factory InventoryCountSaveResult.fromJson(Map<String, dynamic> json) =>
      _$InventoryCountSaveResultFromJson(json);
}

/// Chi tiết một đợt kiểm kê — trả về từ API
/// `GET /WarehouseInventoryCount/get-by-id?id=X`.
///
/// Dùng để fill sẵn form ở màn chỉnh sửa đợt kiểm kê.
@freezed
class InventoryCountDetail with _$InventoryCountDetail {
  const factory InventoryCountDetail({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'IsComplete') bool? isComplete,
  }) = _InventoryCountDetail;

  factory InventoryCountDetail.fromJson(Map<String, dynamic> json) =>
      _$InventoryCountDetailFromJson(json);
}

/// Phiếu kiểm kê kèm danh sách sản phẩm đã kiểm kê — trả về từ API
/// `GET /WarehouseInventoryCount/get-inventory-sheet?countId=X`.
///
/// [master] là thông tin đợt kiểm kê, [items] là các dòng sản phẩm kiểm kê.
@freezed
class InventoryCountSheet with _$InventoryCountSheet {
  const factory InventoryCountSheet({
    /// Thông tin đợt kiểm kê.
    @JsonKey(name: 'Master') InventoryCountSheetMaster? master,

    /// Danh sách sản phẩm đã kiểm kê.
    @JsonKey(name: 'Items') @Default([]) List<InventoryCountSheetItem> items,
  }) = _InventoryCountSheet;

  factory InventoryCountSheet.fromJson(Map<String, dynamic> json) =>
      _$InventoryCountSheetFromJson(json);
}

/// Thông tin đợt kiểm kê trong phiếu (`Master` của API get-inventory-sheet).
@freezed
class InventoryCountSheetMaster with _$InventoryCountSheetMaster {
  const factory InventoryCountSheetMaster({
    @JsonKey(name: 'ID') int? id,
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
  }) = _InventoryCountSheetMaster;

  factory InventoryCountSheetMaster.fromJson(Map<String, dynamic> json) =>
      _$InventoryCountSheetMasterFromJson(json);
}

/// Nhóm sản phẩm RTC trong kho.
///
/// Trả về từ API
/// `GET /ProductRTC/product-group-rtc-new?warehouseId=1&isDeleted=false&isVisible=false&warehouseType=1`.
@freezed
class InventoryProductGroupRtc with _$InventoryProductGroupRtc {
  const factory InventoryProductGroupRtc({
    @JsonKey(name: 'ID') int? id,

    /// Mã nhóm sản phẩm (vd. `N30`).
    @JsonKey(name: 'ProductGroupNo') String? groupNo,

    /// Tên nhóm sản phẩm (vd. `CAMERA CARD`).
    @JsonKey(name: 'ProductGroupName') String? groupName,

    /// Thứ tự hiển thị.
    @JsonKey(name: 'NumberOrder') int? numberOrder,

    /// Id kho chứa nhóm sản phẩm.
    @JsonKey(name: 'WarehouseID') int? warehouseId,

    /// Loại kho (1 = kho demo).
    @JsonKey(name: 'WarehouseType') int? warehouseType,

    /// Nhóm đã bị xoá hay chưa.
    @JsonKey(name: 'IsDeleted') @Default(false) bool isDeleted,
  }) = _InventoryProductGroupRtc;

  factory InventoryProductGroupRtc.fromJson(Map<String, dynamic> json) =>
      _$InventoryProductGroupRtcFromJson(json);
}

/// Một dòng sản phẩm trong phiếu kiểm kê.
@freezed
class InventoryCountSheetItem with _$InventoryCountSheetItem {
  const factory InventoryCountSheetItem({
    @JsonKey(name: 'ID') int? id,

    /// Id đợt kiểm kê cha.
    @JsonKey(name: 'WarehouseInventoryCountID') int? warehouseInventoryCountId,

    /// Id sản phẩm (theo hệ thống RTC).
    @JsonKey(name: 'ProductRTCID') int? productRtcId,

    /// Mã sản phẩm.
    @JsonKey(name: 'ProductCode') String? productCode,

    /// Tên sản phẩm.
    @JsonKey(name: 'ProductName') String? productName,

    /// Mã nội bộ sản phẩm.
    @JsonKey(name: 'ProductCodeRTC') String? productCodeRtc,

    /// Nhà sản xuất.
    @JsonKey(name: 'Maker') String? maker,

    /// Đơn vị tính.
    @JsonKey(name: 'UnitName') String? unitName,

    /// Địa chỉ kho (ô lưu trữ).
    @JsonKey(name: 'AddressBox') String? addressBox,

    /// Vị trí lưu kho.
    @JsonKey(name: 'LocationName') String? locationName,

    /// Số serial.
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'Serial') String? serial,
    @JsonKey(name: 'PartNumber') String? partNumber,

    /// Id nhóm sản phẩm.
    @JsonKey(name: 'ProductGroupRTCID') int? productGroupRtcId,

    /// Tên nhóm sản phẩm.
    @JsonKey(name: 'ProductGroupName') String? productGroupName,

    /// Vị trí kho Modula.
    @JsonKey(name: 'ModulaLocationName') String? modulaLocationName,

    /// Số lượng tồn trong kho.
    @JsonKey(name: 'NumberInStore') @Default(0) int numberInStore,

    /// Tồn kho thực tế (hệ thống).
    @JsonKey(name: 'InventoryReal') @Default(0) int inventoryReal,

    /// Số lượng nhập.
    @JsonKey(name: 'NumberImport') @Default(0) double numberImport,

    /// Số lượng xuất.
    @JsonKey(name: 'NumberExport') @Default(0) double numberExport,

    /// Số lượng đang mượn.
    @JsonKey(name: 'NumberBorrowing') @Default(0) int numberBorrowing,

    /// Số lượng xuất mượn.
    @JsonKey(name: 'QuantityExportMuon') @Default(0) int quantityExportMuon,

    /// Số lượng thực tế kiểm kê (null = chưa kiểm kê).
    @JsonKey(name: 'QuantityActual') double? quantityActual,

    /// Chênh lệch giữa thực tế và tồn kho (null = chưa kiểm kê).
    @JsonKey(name: 'Difference') double? difference,

    /// Ghi chú của dòng kiểm kê.
    @JsonKey(name: 'Note') String? note,

    /// Đã kiểm kê dòng này hay chưa.
    @JsonKey(name: 'HasCounted') @Default(false) bool hasCounted,

    /// Số lượng đang mượn (chi tiết).
    @JsonKey(name: 'BorrowedQuantity') double? borrowedQuantity,

    /// Số lượng khách hàng đang mượn.
    @JsonKey(name: 'CustomerBorrowedQuantity') double? customerBorrowedQuantity,

    /// Tồn kho tổng.
    @JsonKey(name: 'InventoryQuantity') double? inventoryQuantity,

    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
  }) = _InventoryCountSheetItem;

  factory InventoryCountSheetItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryCountSheetItemFromJson(json);
}
