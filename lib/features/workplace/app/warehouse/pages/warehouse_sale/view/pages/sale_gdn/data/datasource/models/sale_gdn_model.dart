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
    @JsonKey(name: 'ReturnedStatus') int? returnedStatus,
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
