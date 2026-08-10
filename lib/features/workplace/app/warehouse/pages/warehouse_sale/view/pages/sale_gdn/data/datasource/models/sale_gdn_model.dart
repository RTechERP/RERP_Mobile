import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_gdn_model.freezed.dart';
part 'sale_gdn_model.g.dart';

@freezed
class BillExporResponse with _$BillExporResponse {
  const factory BillExporResponse({
    @JsonKey(name: 'TotalPage') int? totalPage,
    @JsonKey(name: 'RowNum') int? rowNum,
    @JsonKey(name: 'WarehouseName') String? warehouseName,
    @JsonKey(name: 'DateStatus') String? dateStatus,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'TypeBill') bool? typeBill,
    @JsonKey(name: 'SupplierID') int? supplierId,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'SenderID') int? senderId,
    @JsonKey(name: 'StockID') int? stockId,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'CreatDate') String? creatDate,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'GroupID') String? groupId,
    @JsonKey(name: 'KhoTypeID') int? khoTypeId,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'ProductType') int? productType,
    @JsonKey(name: 'AddressStockID') int? addressStockId,
    @JsonKey(name: 'IsMerge') bool? isMerge,
    @JsonKey(name: 'UnApprove') int? unApprove,
    @JsonKey(name: 'WarehouseID') int? warehouseId,
    @JsonKey(name: 'IsPrepared') bool? isPrepared,
    @JsonKey(name: 'IsReceived') bool? isReceived,
    @JsonKey(name: 'RequestDate') String? requestDate,
    @JsonKey(name: 'PreparedDate') String? preparedDate,
    @JsonKey(name: 'BillDocumentExportType') int? billDocumentExportType,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'BillImportID') int? billImportId,
    @JsonKey(name: 'WareHouseTranferID') int? wareHouseTranferId,
    @JsonKey(name: 'IsTransfer') bool? isTransfer,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'CustomerName') String? customerName,
    @JsonKey(name: 'nameStatus') String? nameStatus,
    @JsonKey(name: 'FullNameSender') String? fullNameSender,
    @JsonKey(name: 'ProductTypeText') String? productTypeText,
    @JsonKey(name: 'EmployeeCode') String? employeeCode,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'NameNCC') String? nameNcc,
    @JsonKey(name: 'WarehouseType') String? warehouseType,
    @JsonKey(name: 'DeliveryTime') String? deliveryTime,
    @JsonKey(name: 'IsAfterHours') bool? isAfterHours,
    @JsonKey(name: 'IsIncurredApproved') bool? isIncurredApproved,
    @JsonKey(name: 'ReceiverFullName') String? receiverFullName,
  }) = _BillExporResponse;

  factory BillExporResponse.fromJson(Map<String, dynamic> json) =>
      _$BillExporResponseFromJson(json);
}

@freezed
class TypeWarehouseResponse with _$TypeWarehouseResponse {
  const factory TypeWarehouseResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProductGroupID') String? productGroupId,
    @JsonKey(name: 'ProductGroupName') String? productGroupName,
    @JsonKey(name: 'IsVisible') bool? isVisible,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'STT') int? stt,
  }) = _TypeWarehouseResponse;

  factory TypeWarehouseResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeWarehouseResponseFromJson(json);
}

@freezed
class ViewGDNDetailResponse with _$ViewGDNDetailResponse {
  const factory ViewGDNDetailResponse({
    @JsonKey(name: 'TotalInventory') double? totalInventory,
    @JsonKey(name: 'ProductFullName') String? productFullName,
    @JsonKey(name: 'Qty') double? qty,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'ProductTypeText') String? productTypeText,
    @JsonKey(name: 'ProductCode') String? productCode,
    @JsonKey(name: 'ProductNewCode') String? productNewCode,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'ProductGroupName') String? productGroupName,
    @JsonKey(name: 'ProjectNameText') String? projectNameText,
    @JsonKey(name: 'ProductCodeExport') String? productCodeExport,
    @JsonKey(name: 'BillCode') String? billCode,
    @JsonKey(name: 'UnitPricePOKH') double? unitPricePOKH,
    @JsonKey(name: 'UnitPricePurchase') double? unitPricePurchase,
    @JsonKey(name: 'ProjectCodeExport') String? projectCodeExport,
  }) = _ViewGDNDetailResponse;

  factory ViewGDNDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ViewGDNDetailResponseFromJson(json);
}

@freezed
class DetailGDNItemResponse with _$DetailGDNItemResponse {
  const factory DetailGDNItemResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'TypeBill') bool? typeBill,
    @JsonKey(name: 'SupplierID') int? supplierId,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'SenderID') int? senderId,
    @JsonKey(name: 'StockID') int? stockId,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'CreatDate') DateTime? creatDate,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'GroupID') String? groupId,
    @JsonKey(name: 'WarehouseType') String? warehouseType,
    @JsonKey(name: 'KhoTypeID') int? khoTypeId,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'ProductType') int? productType,
    @JsonKey(name: 'AddressStockID') int? addressStockId,
    @JsonKey(name: 'IsMerge') bool? isMerge,
    @JsonKey(name: 'UnApprove') int? unApprove,
    @JsonKey(name: 'WarehouseID') int? warehouseId,
    @JsonKey(name: 'IsPrepared') bool? isPrepared,
    @JsonKey(name: 'IsReceived') bool? isReceived,
    @JsonKey(name: 'RequestDate') DateTime? requestDate,
    @JsonKey(name: 'PreparedDate') DateTime? preparedDate,
    @JsonKey(name: 'BillDocumentExportType') int? billDocumentExportType,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'BillImportID') int? billImportId,
    @JsonKey(name: 'WareHouseTranferID') int? wareHouseTranferId,
    @JsonKey(name: 'IsTransfer') bool? isTransfer,
    @JsonKey(name: 'DeliveryTime') DateTime? deliveryTime,
    @JsonKey(name: 'IsAfterHours') bool? isAfterHours,
    @JsonKey(name: 'ReceiverID') int? receiverId,
    @JsonKey(name: 'IsIncurredApproved') bool? isIncurredApproved,
    @JsonKey(name: 'IncurredApprovedID') int? incurredApprovedId,
    @JsonKey(name: 'IsOrderPrepared') bool? isOrderPrepared,
    @JsonKey(name: 'IsOrderReceived') bool? isOrderReceived,
    @JsonKey(name: 'OrderPreparedID') int? orderPreparedId,
    @JsonKey(name: 'OrderReceivedID') int? orderReceivedId,
    @JsonKey(name: 'IsTransferInternal') bool? isTransferInternal,
    @JsonKey(name: 'KhoTypeTransferID') int? khoTypeTransferId,
  }) = _DetailGDNItemResponse;

  factory DetailGDNItemResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailGDNItemResponseFromJson(json);
}

/// Model cho địa chỉ giao hàng theo khách hàng.
/// API: GET /AddressStock/get-by-customerID/?customerID={customerId}
@freezed
class AddressStockResponse with _$AddressStockResponse {
  const factory AddressStockResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _AddressStockResponse;

  factory AddressStockResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressStockResponseFromJson(json);
}

@freezed
class DetailGDNResponse with _$DetailGDNResponse {
  const factory DetailGDNResponse({
    @JsonKey(name: 'TotalInventory') double? totalInventory,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProductID') int? productId,
    @JsonKey(name: 'BillID') int? billId,
    @JsonKey(name: 'ProductFullName') String? productFullName,
    @JsonKey(name: 'Qty') double? qty,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ExportID') int? exportId,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'TotalQty') double? totalQty,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'ProductType') int? productType,
    @JsonKey(name: 'POKHID') int? pokhId,
    @JsonKey(name: 'GroupExport') String? groupExport,
    @JsonKey(name: 'IsInvoice') bool? isInvoice,
    @JsonKey(name: 'InvoiceNumber') String? invoiceNumber,
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'ReturnedStatus') bool? returnedStatus,
    @JsonKey(name: 'ProjectPartListID') int? projectPartListId,
    @JsonKey(name: 'TradePriceDetailID') int? tradePriceDetailId,
    @JsonKey(name: 'POKHDetailID') int? pokhDetailId,
    @JsonKey(name: 'Specifications') String? specifications,
    @JsonKey(name: 'BillImportDetailID') int? billImportDetailId,
    @JsonKey(name: 'TotalInventory1') double? totalInventory1,
    @JsonKey(name: 'ExpectReturnDate') DateTime? expectReturnDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'CustomerResponse') String? customerResponse,
    @JsonKey(name: 'ProductTypeText') String? productTypeText,
    @JsonKey(name: 'CreatDate') DateTime? creatDate,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'ProductCode') String? productCode,
    @JsonKey(name: 'ProductNewCode') String? productNewCode,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'ProductGroupName') String? productGroupName,
    @JsonKey(name: 'ItemType') String? itemType,
    @JsonKey(name: 'ProjectNameText') String? projectNameText,
    @JsonKey(name: 'ProjectCodeText') String? projectCodeText,
    @JsonKey(name: 'ProjectCodeExport') String? projectCodeExport,
    @JsonKey(name: 'UserReceiver') String? userReceiver,
    @JsonKey(name: 'QuantityRemain') double? quantityRemain,
    @JsonKey(name: 'QtyPO') double? qtyPO,
    @JsonKey(name: 'ChosenInventoryProject') String? chosenInventoryProject,
    @JsonKey(name: 'ProductCodeExport') String? productCodeExport,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'IsMerge') bool? isMerge,
    @JsonKey(name: 'KhoTypeID') int? khoTypeId,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'ProductGroupID') int? productGroupId,
    @JsonKey(name: 'UnitPricePurchase') double? unitPricePurchase,
    @JsonKey(name: 'BillCode') String? billCode,
    @JsonKey(name: 'UnitPricePOKH') double? unitPricePOKH,
    @JsonKey(name: 'WarehouseName') String? warehouseName,
    @JsonKey(name: 'ChildID') int? childId,
    @JsonKey(name: 'WarehouseName1') String? warehouseName1,
    @JsonKey(name: 'PONumber') String? poNumber,
    @JsonKey(name: 'POCode') String? poCode,
    @JsonKey(name: 'POKHDetailIDActual') int? pokhDetailIdActual,
    @JsonKey(name: 'FileName') String? fileName,

    /// Danh sách đường dẫn ảnh local (chưa upload) do người dùng chụp/chọn cho dòng chi tiết.
    /// Không tham gia serialize JSON từ server — chỉ dùng để hiển thị trên UI.
    @Default(<String>[]) List<String> localImagePaths,
  }) = _DetailGDNResponse;

  factory DetailGDNResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailGDNResponseFromJson(Map<String, dynamic>.from(json)
        ..['localImagePaths'] = const <String>[]);
}

/// Upload file response model.
@freezed
class UploadFileResponse with _$UploadFileResponse {
  const factory UploadFileResponse({
    @JsonKey(name: 'fileID') required int fileID,
    @JsonKey(name: 'filePath') required String filePath,
    @JsonKey(name: 'ServerPath') required String serverPath,
    @JsonKey(name: 'fileName') required String fileName,
  }) = _UploadFileResponse;

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseFromJson(json);
}

/// Read file response model
@freezed
class ReadFileResponse with _$ReadFileResponse {
  const factory ReadFileResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'BillExportDetailID') int? billExportDetailId,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'OriginPath') String? originPath,
    @JsonKey(name: 'ServerPath') String? serverPath,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _ReadFileResponse;

  factory ReadFileResponse.fromJson(Map<String, dynamic> json) =>
      _$ReadFileResponseFromJson(json);
}

/// Payload cho API /BillExport/save-data.
/// `billExportDetail` chứa danh sách chi tiết sản phẩm, mỗi item có
/// `FileIds` là danh sách fileID đã upload (ánh xạ qua childId).
@freezed
class SaveBillExportDataPayload with _$SaveBillExportDataPayload {
  const factory SaveBillExportDataPayload({
    @JsonKey(name: 'BillExport') required BillExportPayload billExport,
    @JsonKey(name: 'billExportDetail')
        required List<BillExportDetailPayload> billExportDetail,
    @JsonKey(name: 'DeletedDetailIds') @Default([]) List<int> deletedDetailIds,
    @JsonKey(name: 'DeletedFileIds') @Default([]) List<int> deletedFileIds,
  }) = _SaveBillExportDataPayload;

  factory SaveBillExportDataPayload.fromJson(Map<String, dynamic> json) =>
      _$SaveBillExportDataPayloadFromJson(json);
}

/// BillExport object trong payload save-data.
@freezed
class BillExportPayload with _$BillExportPayload {
  const factory BillExportPayload({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'TypeBill') bool? typeBill,
    @JsonKey(name: 'SupplierID') int? supplierId,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'SenderID') int? senderId,
    @JsonKey(name: 'StockID') int? stockId,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'GroupID') String? groupId,
    @JsonKey(name: 'WarehouseType') String? warehouseType,
    @JsonKey(name: 'KhoTypeID') int? khoTypeId,
    @JsonKey(name: 'CreatDate') String? creatDate,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'ProductType') int? productType,
    @JsonKey(name: 'AddressStockID') int? addressStockId,
    @JsonKey(name: 'WarehouseID') int? warehouseId,
    @JsonKey(name: 'RequestDate') String? requestDate,
    @JsonKey(name: 'DeliveryTime') String? deliveryTime,
    @JsonKey(name: 'IsAfterHours') bool? isAfterHours,
    @JsonKey(name: 'BillDocumentExportType') int? billDocumentExportType,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'IsTransfer') bool? isTransfer,
    @JsonKey(name: 'WareHouseTranferID') int? wareHouseTranferId,
    @JsonKey(name: 'IsTransferInternal') bool? isTransferInternal,
    @JsonKey(name: 'KhoTypeTransferID') int? khoTypeTransferId,
    @JsonKey(name: 'ReceiverID') int? receiverId,
    @JsonKey(name: 'IsPrepared') bool? isPrepared,
    @JsonKey(name: 'IsReceived') bool? isReceived,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _BillExportPayload;

  factory BillExportPayload.fromJson(Map<String, dynamic> json) =>
      _$BillExportPayloadFromJson(json);
}

/// BillExportDetail object trong payload save-data.
/// `FileIds` chứa danh sách fileID của ảnh đã upload.
@freezed
class BillExportDetailPayload with _$BillExportDetailPayload {
  const factory BillExportDetailPayload({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProductID') int? productId,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'ProductCode') String? productCode,
    @JsonKey(name: 'ProductNewCode') String? productNewCode,
    @JsonKey(name: 'ProductFullName') String? productFullName,
    @JsonKey(name: 'Qty') num? qty,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'TotalQty') num? totalQty,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'ProductType') int? productType,
    @JsonKey(name: 'POKHID') int? pokhId,
    @JsonKey(name: 'GroupExport') String? groupExport,
    @JsonKey(name: 'IsInvoice') bool? isInvoice,
    @JsonKey(name: 'InvoiceNumber') String? invoiceNumber,
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'ReturnedStatus') bool? returnedStatus,
    @JsonKey(name: 'ProjectPartListID') int? projectPartListId,
    @JsonKey(name: 'TradePriceDetailID') int? tradePriceDetailId,
    @JsonKey(name: 'POKHDetailID') int? pokhDetailId,
    @JsonKey(name: 'Specifications') String? specifications,
    @JsonKey(name: 'BillImportDetailID') int? billImportDetailId,
    @JsonKey(name: 'TotalInventory') num? totalInventory,
    @JsonKey(name: 'ExpectReturnDate') String? expectReturnDate,
    @JsonKey(name: 'CustomerResponse') String? customerResponse,
    @JsonKey(name: 'POKHDetailIDActual') int? pokhDetailIdActual,
    @JsonKey(name: 'PONumber') String? poNumber,
    @JsonKey(name: 'ChosenInventoryProject') String? chosenInventoryProject,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'UnitName') String? unitName,
    @JsonKey(name: 'ChildID') int? childId,
    @JsonKey(name: 'ImportDetailID') int? importDetailId,
    @JsonKey(name: 'ForceReallocate') bool? forceReallocate,
    @JsonKey(name: 'UnitPricePOKH') num? unitPricePOKH,
    @JsonKey(name: 'UnitPricePurchase') num? unitPricePurchase,
    @JsonKey(name: 'BillCode') String? billCode,
    @JsonKey(name: 'FileIds') @Default([]) List<int> fileIds,
  }) = _BillExportDetailPayload;

  factory BillExportDetailPayload.fromJson(Map<String, dynamic> json) =>
      _$BillExportDetailPayloadFromJson(json);
}

/// Response của API /BillExport/save-data.
@freezed
class SaveBillExportDataResponse with _$SaveBillExportDataResponse {
  const factory SaveBillExportDataResponse({
    @JsonKey(name: 'BillExportID') int? billExportId,
  }) = _SaveBillExportDataResponse;

  factory SaveBillExportDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SaveBillExportDataResponseFromJson(json);
}

// ===========================================================================
// Lookup models for BillExport form fields
// ===========================================================================

/// NCC (Supplier) — API `/billexport/get-suppliers`.
@freezed
class SupplierResponse with _$SupplierResponse {
  const factory SupplierResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CodeNCC') String? code,
    @JsonKey(name: 'NameNCC') String? name,
    @JsonKey(name: 'AddressNCC') String? address,
    @JsonKey(name: 'PhoneNCC') String? phone,
    @JsonKey(name: 'OrdererNCC') String? orderer,
    @JsonKey(name: 'Debt') String? debt,
    @JsonKey(name: 'NgayUpdate') DateTime? ngayUpdate,
    @JsonKey(name: 'NVPhuTrach') String? nvPhuTrach,
    @JsonKey(name: 'LoaiHangHoa') String? loaiHangHoa,
    @JsonKey(name: 'Brand') String? brand,
    @JsonKey(name: 'MaNhom') String? maNhom,
    @JsonKey(name: 'TenTiengAnh') String? tenTiengAnh,
    @JsonKey(name: 'Website') String? website,
    @JsonKey(name: 'SoTK') String? soTK,
    @JsonKey(name: 'NganHang') String? nganHang,
    @JsonKey(name: 'MaSoThue') String? maSoThue,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'Company') int? company,
    @JsonKey(name: 'ShortNameSupplier') String? shortName,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsDebt') bool? isDebt,
    @JsonKey(name: 'FedexAccount') String? fedexAccount,
    @JsonKey(name: 'OriginItem') String? originItem,
    @JsonKey(name: 'BankCharge') String? bankCharge,
    @JsonKey(name: 'AddressDelivery') String? addressDelivery,
    @JsonKey(name: 'RulePayID') int? rulePayId,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'RuleIncoterm') String? ruleIncoterm,
    @JsonKey(name: 'BankListID') int? bankListId,
  }) = _SupplierResponse;

  factory SupplierResponse.fromJson(Map<String, dynamic> json) =>
      _$SupplierResponseFromJson(json);
}

/// Người giao hàng (Sender / Employee) — API `/billexport/get-senders`.
@freezed
class SenderResponse with _$SenderResponse {
  const factory SenderResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'LoginName') String? loginName,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'BirthOfDate') DateTime? birthOfDate,
    @JsonKey(name: 'Sex') int? sex,
    @JsonKey(name: 'Telephone') String? telephone,
    @JsonKey(name: 'HandPhone') String? handPhone,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Position') String? position,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
  }) = _SenderResponse;

  factory SenderResponse.fromJson(Map<String, dynamic> json) =>
      _$SenderResponseFromJson(json);
}

/// Khách hàng — API `/billexport/get-customers`.
@freezed
class CustomerResponse with _$CustomerResponse {
  const factory CustomerResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CustomerName') String? name,
    @JsonKey(name: 'CustomerCode') String? code,
    @JsonKey(name: 'CustomerShortName') String? shortName,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'Website') String? website,
    @JsonKey(name: 'ContactName') String? contactName,
    @JsonKey(name: 'ContactPhone') String? contactPhone,
    @JsonKey(name: 'ContactEmail') String? contactEmail,
    @JsonKey(name: 'AdressStock') String? addressStock,
    @JsonKey(name: 'TaxCode') String? taxCode,
  }) = _CustomerResponse;

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
}

/// Dự án — API `/billexport/get-all-project`.
@freezed
class ProjectGDNResponse with _$ProjectGDNResponse {
  const factory ProjectGDNResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'ProjectCode') String? code,
    @JsonKey(name: 'ProjectName') String? name,
    @JsonKey(name: 'ProjectShortName') String? shortName,
    @JsonKey(name: 'ProjectStatus') int? status,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'ProjectType') int? projectType,
    @JsonKey(name: 'PlanDateStart') DateTime? planDateStart,
    @JsonKey(name: 'PlanDateEnd') DateTime? planDateEnd,
    @JsonKey(name: 'ActualDateStart') DateTime? actualDateStart,
    @JsonKey(name: 'ActualDateEnd') DateTime? actualDateEnd,
    @JsonKey(name: 'EndUser') int? endUser,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'TypeProject') int? typeProject,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _ProjectGDNResponse;

  factory ProjectGDNResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectGDNResponseFromJson(json);
}

/// Kho — API `/billexport/get-warehouses`.
@freezed
class WarehouseResponse with _$WarehouseResponse {
  const factory WarehouseResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'WarehouseCode') String? code,
    @JsonKey(name: 'WarehouseName') String? name,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _WarehouseResponse;

  factory WarehouseResponse.fromJson(Map<String, dynamic> json) =>
      _$WarehouseResponseFromJson(json);
}

/// Nhóm sản phẩm (loại kho) — API `/ProductGroup/product-group-new`.
/// Field trả về nằm trong `data` của `BaseData`.
@freezed
class ProductGroupNewResponse with _$ProductGroupNewResponse {
  const factory ProductGroupNewResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProductGroupID') String? productGroupId,
    @JsonKey(name: 'ProductGroupName') String? name,
    @JsonKey(name: 'IsVisible') bool? isVisible,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'IsView') int? isView,
  }) = _ProductGroupNewResponse;

  factory ProductGroupNewResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductGroupNewResponseFromJson(json);
}

/// Danh sách nhân viên (Employee) dùng cho bottom-sheet người giao / người nhận.
/// API: GET /billexport/get-users
@freezed
class BillExportUserResponse with _$BillExportUserResponse {
  const factory BillExportUserResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeCode') String? employeeCode,
    @JsonKey(name: 'TeamName') String? teamName,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'LoginName') String? loginName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'StatusText') String? statusText,
  }) = _BillExportUserResponse;

  factory BillExportUserResponse.fromJson(Map<String, dynamic> json) =>
      _$BillExportUserResponseFromJson(json);
}

// ===========================================================================
// Cache models for lookup data (SaleGdn)
// ===========================================================================

/// Cache model for all lookup data in SaleGdn.
/// Pre-fetched from sale_gdn_screen.dart and hydrated into in-memory cache
/// so that sale_gdn_detail_screen has data ready without additional API calls.
class SaleGdnLookupCache {
  final DateTime fetchedAt;
  final List<SupplierResponse> suppliers;
  final List<SenderResponse> senders;
  final List<CustomerResponse> customers;
  final List<ProjectGDNResponse> projects;
  final List<WarehouseResponse> warehouses;
  final List<ProductGroupNewResponse> productGroups;
  final List<BillExportUserResponse> users;

  const SaleGdnLookupCache({
    required this.fetchedAt,
    required this.suppliers,
    required this.senders,
    required this.customers,
    required this.projects,
    required this.warehouses,
    required this.productGroups,
    required this.users,
  });
}