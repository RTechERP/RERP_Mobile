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
