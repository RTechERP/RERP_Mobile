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
