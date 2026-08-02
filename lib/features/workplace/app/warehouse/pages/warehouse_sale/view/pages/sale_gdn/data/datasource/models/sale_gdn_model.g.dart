// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_gdn_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillExporResponseImpl _$$BillExporResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BillExporResponseImpl(
      totalPage: (json['TotalPage'] as num?)?.toInt(),
      rowNum: (json['RowNum'] as num?)?.toInt(),
      warehouseName: json['WarehouseName'] as String?,
      dateStatus: json['DateStatus'] as String?,
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      typeBill: json['TypeBill'] as bool?,
      supplierId: (json['SupplierID'] as num?)?.toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      senderId: (json['SenderID'] as num?)?.toInt(),
      stockId: (json['StockID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      address: json['Address'] as String?,
      creatDate: json['CreatDate'] as String?,
      isApproved: json['IsApproved'] as bool?,
      status: (json['Status'] as num?)?.toInt(),
      groupId: json['GroupID'] as String?,
      khoTypeId: (json['KhoTypeID'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      productType: (json['ProductType'] as num?)?.toInt(),
      addressStockId: (json['AddressStockID'] as num?)?.toInt(),
      isMerge: json['IsMerge'] as bool?,
      unApprove: (json['UnApprove'] as num?)?.toInt(),
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
      isPrepared: json['IsPrepared'] as bool?,
      isReceived: json['IsReceived'] as bool?,
      requestDate: json['RequestDate'] as String?,
      preparedDate: json['PreparedDate'] as String?,
      billDocumentExportType: (json['BillDocumentExportType'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      billImportId: (json['BillImportID'] as num?)?.toInt(),
      wareHouseTranferId: (json['WareHouseTranferID'] as num?)?.toInt(),
      isTransfer: json['IsTransfer'] as bool?,
      fullName: json['FullName'] as String?,
      customerName: json['CustomerName'] as String?,
      nameStatus: json['nameStatus'] as String?,
      fullNameSender: json['FullNameSender'] as String?,
      productTypeText: json['ProductTypeText'] as String?,
      employeeCode: json['EmployeeCode'] as String?,
      departmentName: json['DepartmentName'] as String?,
      nameNcc: json['NameNCC'] as String?,
      warehouseType: json['WarehouseType'] as String?,
      deliveryTime: json['DeliveryTime'] as String?,
      isAfterHours: json['IsAfterHours'] as bool?,
      isIncurredApproved: json['IsIncurredApproved'] as bool?,
      receiverFullName: json['ReceiverFullName'] as String?,
    );

Map<String, dynamic> _$$BillExporResponseImplToJson(
        _$BillExporResponseImpl instance) =>
    <String, dynamic>{
      'TotalPage': instance.totalPage,
      'RowNum': instance.rowNum,
      'WarehouseName': instance.warehouseName,
      'DateStatus': instance.dateStatus,
      'ID': instance.id,
      'Code': instance.code,
      'TypeBill': instance.typeBill,
      'SupplierID': instance.supplierId,
      'CustomerID': instance.customerId,
      'UserID': instance.userId,
      'SenderID': instance.senderId,
      'StockID': instance.stockId,
      'Description': instance.description,
      'Address': instance.address,
      'CreatDate': instance.creatDate,
      'IsApproved': instance.isApproved,
      'Status': instance.status,
      'GroupID': instance.groupId,
      'KhoTypeID': instance.khoTypeId,
      'CreatedDate': instance.createdDate,
      'UpdatedDate': instance.updatedDate,
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'ProductType': instance.productType,
      'AddressStockID': instance.addressStockId,
      'IsMerge': instance.isMerge,
      'UnApprove': instance.unApprove,
      'WarehouseID': instance.warehouseId,
      'IsPrepared': instance.isPrepared,
      'IsReceived': instance.isReceived,
      'RequestDate': instance.requestDate,
      'PreparedDate': instance.preparedDate,
      'BillDocumentExportType': instance.billDocumentExportType,
      'IsDeleted': instance.isDeleted,
      'BillImportID': instance.billImportId,
      'WareHouseTranferID': instance.wareHouseTranferId,
      'IsTransfer': instance.isTransfer,
      'FullName': instance.fullName,
      'CustomerName': instance.customerName,
      'nameStatus': instance.nameStatus,
      'FullNameSender': instance.fullNameSender,
      'ProductTypeText': instance.productTypeText,
      'EmployeeCode': instance.employeeCode,
      'DepartmentName': instance.departmentName,
      'NameNCC': instance.nameNcc,
      'WarehouseType': instance.warehouseType,
      'DeliveryTime': instance.deliveryTime,
      'IsAfterHours': instance.isAfterHours,
      'IsIncurredApproved': instance.isIncurredApproved,
      'ReceiverFullName': instance.receiverFullName,
    };

_$TypeWarehouseResponseImpl _$$TypeWarehouseResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TypeWarehouseResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      productGroupId: json['ProductGroupID'] as String?,
      productGroupName: json['ProductGroupName'] as String?,
      isVisible: json['IsVisible'] as bool?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TypeWarehouseResponseImplToJson(
        _$TypeWarehouseResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProductGroupID': instance.productGroupId,
      'ProductGroupName': instance.productGroupName,
      'IsVisible': instance.isVisible,
      'EmployeeID': instance.employeeId,
      'ParentID': instance.parentId,
      'STT': instance.stt,
    };

_$DetailGDNResponseImpl _$$DetailGDNResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailGDNResponseImpl(
      totalInventory: (json['TotalInventory'] as num?)?.toDouble(),
      productFullName: json['ProductFullName'] as String?,
      qty: (json['Qty'] as num?)?.toDouble(),
      note: json['Note'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      serialNumber: json['SerialNumber'] as String?,
      productTypeText: json['ProductTypeText'] as String?,
      productCode: json['ProductCode'] as String?,
      productNewCode: json['ProductNewCode'] as String?,
      productName: json['ProductName'] as String?,
      unit: json['Unit'] as String?,
      productGroupName: json['ProductGroupName'] as String?,
      projectNameText: json['ProjectNameText'] as String?,
      productCodeExport: json['ProductCodeExport'] as String?,
      billCode: json['BillCode'] as String?,
      unitPricePOKH: (json['UnitPricePOKH'] as num?)?.toDouble(),
      unitPricePurchase: (json['UnitPricePurchase'] as num?)?.toDouble(),
      projectCodeExport: json['ProjectCodeExport'] as String?,
      localImagePaths: (json['localImagePaths'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$DetailGDNResponseImplToJson(
        _$DetailGDNResponseImpl instance) =>
    <String, dynamic>{
      'TotalInventory': instance.totalInventory,
      'ProductFullName': instance.productFullName,
      'Qty': instance.qty,
      'Note': instance.note,
      'STT': instance.stt,
      'SerialNumber': instance.serialNumber,
      'ProductTypeText': instance.productTypeText,
      'ProductCode': instance.productCode,
      'ProductNewCode': instance.productNewCode,
      'ProductName': instance.productName,
      'Unit': instance.unit,
      'ProductGroupName': instance.productGroupName,
      'ProjectNameText': instance.projectNameText,
      'ProductCodeExport': instance.productCodeExport,
      'BillCode': instance.billCode,
      'UnitPricePOKH': instance.unitPricePOKH,
      'UnitPricePurchase': instance.unitPricePurchase,
      'ProjectCodeExport': instance.projectCodeExport,
      'localImagePaths': instance.localImagePaths,
    };
