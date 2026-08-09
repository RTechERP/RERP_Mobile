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

_$ViewGDNDetailResponseImpl _$$ViewGDNDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ViewGDNDetailResponseImpl(
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
    );

Map<String, dynamic> _$$ViewGDNDetailResponseImplToJson(
        _$ViewGDNDetailResponseImpl instance) =>
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
    };

_$DetailGDNItemResponseImpl _$$DetailGDNItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailGDNItemResponseImpl(
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
      creatDate: json['CreatDate'] == null
          ? null
          : DateTime.parse(json['CreatDate'] as String),
      isApproved: json['IsApproved'] as bool?,
      status: (json['Status'] as num?)?.toInt(),
      groupId: json['GroupID'] as String?,
      warehouseType: json['WarehouseType'] as String?,
      khoTypeId: (json['KhoTypeID'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      productType: (json['ProductType'] as num?)?.toInt(),
      addressStockId: (json['AddressStockID'] as num?)?.toInt(),
      isMerge: json['IsMerge'] as bool?,
      unApprove: (json['UnApprove'] as num?)?.toInt(),
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
      isPrepared: json['IsPrepared'] as bool?,
      isReceived: json['IsReceived'] as bool?,
      requestDate: json['RequestDate'] == null
          ? null
          : DateTime.parse(json['RequestDate'] as String),
      preparedDate: json['PreparedDate'] == null
          ? null
          : DateTime.parse(json['PreparedDate'] as String),
      billDocumentExportType: (json['BillDocumentExportType'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      billImportId: (json['BillImportID'] as num?)?.toInt(),
      wareHouseTranferId: (json['WareHouseTranferID'] as num?)?.toInt(),
      isTransfer: json['IsTransfer'] as bool?,
      deliveryTime: json['DeliveryTime'] == null
          ? null
          : DateTime.parse(json['DeliveryTime'] as String),
      isAfterHours: json['IsAfterHours'] as bool?,
      receiverId: (json['ReceiverID'] as num?)?.toInt(),
      isIncurredApproved: json['IsIncurredApproved'] as bool?,
      incurredApprovedId: (json['IncurredApprovedID'] as num?)?.toInt(),
      isOrderPrepared: json['IsOrderPrepared'] as bool?,
      isOrderReceived: json['IsOrderReceived'] as bool?,
      orderPreparedId: (json['OrderPreparedID'] as num?)?.toInt(),
      orderReceivedId: (json['OrderReceivedID'] as num?)?.toInt(),
      isTransferInternal: json['IsTransferInternal'] as bool?,
      khoTypeTransferId: (json['KhoTypeTransferID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DetailGDNItemResponseImplToJson(
        _$DetailGDNItemResponseImpl instance) =>
    <String, dynamic>{
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
      'CreatDate': instance.creatDate?.toIso8601String(),
      'IsApproved': instance.isApproved,
      'Status': instance.status,
      'GroupID': instance.groupId,
      'WarehouseType': instance.warehouseType,
      'KhoTypeID': instance.khoTypeId,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'ProductType': instance.productType,
      'AddressStockID': instance.addressStockId,
      'IsMerge': instance.isMerge,
      'UnApprove': instance.unApprove,
      'WarehouseID': instance.warehouseId,
      'IsPrepared': instance.isPrepared,
      'IsReceived': instance.isReceived,
      'RequestDate': instance.requestDate?.toIso8601String(),
      'PreparedDate': instance.preparedDate?.toIso8601String(),
      'BillDocumentExportType': instance.billDocumentExportType,
      'IsDeleted': instance.isDeleted,
      'BillImportID': instance.billImportId,
      'WareHouseTranferID': instance.wareHouseTranferId,
      'IsTransfer': instance.isTransfer,
      'DeliveryTime': instance.deliveryTime?.toIso8601String(),
      'IsAfterHours': instance.isAfterHours,
      'ReceiverID': instance.receiverId,
      'IsIncurredApproved': instance.isIncurredApproved,
      'IncurredApprovedID': instance.incurredApprovedId,
      'IsOrderPrepared': instance.isOrderPrepared,
      'IsOrderReceived': instance.isOrderReceived,
      'OrderPreparedID': instance.orderPreparedId,
      'OrderReceivedID': instance.orderReceivedId,
      'IsTransferInternal': instance.isTransferInternal,
      'KhoTypeTransferID': instance.khoTypeTransferId,
    };

_$DetailGDNResponseImpl _$$DetailGDNResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailGDNResponseImpl(
      totalInventory: (json['TotalInventory'] as num?)?.toDouble(),
      id: (json['ID'] as num?)?.toInt(),
      productId: (json['ProductID'] as num?)?.toInt(),
      billId: (json['BillID'] as num?)?.toInt(),
      productFullName: json['ProductFullName'] as String?,
      qty: (json['Qty'] as num?)?.toDouble(),
      projectName: json['ProjectName'] as String?,
      exportId: (json['ExportID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      totalQty: (json['TotalQty'] as num?)?.toDouble(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      productType: (json['ProductType'] as num?)?.toInt(),
      pokhId: (json['POKHID'] as num?)?.toInt(),
      groupExport: json['GroupExport'] as String?,
      isInvoice: json['IsInvoice'] as bool?,
      invoiceNumber: json['InvoiceNumber'] as String?,
      serialNumber: json['SerialNumber'] as String?,
      returnedStatus: json['ReturnedStatus'] as bool?,
      projectPartListId: (json['ProjectPartListID'] as num?)?.toInt(),
      tradePriceDetailId: (json['TradePriceDetailID'] as num?)?.toInt(),
      pokhDetailId: (json['POKHDetailID'] as num?)?.toInt(),
      specifications: json['Specifications'] as String?,
      billImportDetailId: (json['BillImportDetailID'] as num?)?.toInt(),
      totalInventory1: (json['TotalInventory1'] as num?)?.toDouble(),
      expectReturnDate: json['ExpectReturnDate'] == null
          ? null
          : DateTime.parse(json['ExpectReturnDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      customerResponse: json['CustomerResponse'] as String?,
      productTypeText: json['ProductTypeText'] as String?,
      creatDate: json['CreatDate'] == null
          ? null
          : DateTime.parse(json['CreatDate'] as String),
      code: json['Code'] as String?,
      customerId: (json['CustomerID'] as num?)?.toInt(),
      address: json['Address'] as String?,
      productCode: json['ProductCode'] as String?,
      productNewCode: json['ProductNewCode'] as String?,
      productName: json['ProductName'] as String?,
      unit: json['Unit'] as String?,
      productGroupName: json['ProductGroupName'] as String?,
      itemType: json['ItemType'] as String?,
      projectNameText: json['ProjectNameText'] as String?,
      projectCodeText: json['ProjectCodeText'] as String?,
      projectCodeExport: json['ProjectCodeExport'] as String?,
      userReceiver: json['UserReceiver'] as String?,
      quantityRemain: (json['QuantityRemain'] as num?)?.toDouble(),
      qtyPO: (json['QtyPO'] as num?)?.toDouble(),
      chosenInventoryProject: json['ChosenInventoryProject'] as String?,
      productCodeExport: json['ProductCodeExport'] as String?,
      parentId: (json['ParentID'] as num?)?.toInt(),
      isMerge: json['IsMerge'] as bool?,
      khoTypeId: (json['KhoTypeID'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      productGroupId: (json['ProductGroupID'] as num?)?.toInt(),
      unitPricePurchase: (json['UnitPricePurchase'] as num?)?.toDouble(),
      billCode: json['BillCode'] as String?,
      unitPricePOKH: (json['UnitPricePOKH'] as num?)?.toDouble(),
      warehouseName: json['WarehouseName'] as String?,
      childId: (json['ChildID'] as num?)?.toInt(),
      warehouseName1: json['WarehouseName1'] as String?,
      poNumber: json['PONumber'] as String?,
      poCode: json['POCode'] as String?,
      pokhDetailIdActual: (json['POKHDetailIDActual'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      localImagePaths: (json['localImagePaths'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$DetailGDNResponseImplToJson(
        _$DetailGDNResponseImpl instance) =>
    <String, dynamic>{
      'TotalInventory': instance.totalInventory,
      'ID': instance.id,
      'ProductID': instance.productId,
      'BillID': instance.billId,
      'ProductFullName': instance.productFullName,
      'Qty': instance.qty,
      'ProjectName': instance.projectName,
      'ExportID': instance.exportId,
      'Note': instance.note,
      'STT': instance.stt,
      'TotalQty': instance.totalQty,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'ProjectID': instance.projectId,
      'ProductType': instance.productType,
      'POKHID': instance.pokhId,
      'GroupExport': instance.groupExport,
      'IsInvoice': instance.isInvoice,
      'InvoiceNumber': instance.invoiceNumber,
      'SerialNumber': instance.serialNumber,
      'ReturnedStatus': instance.returnedStatus,
      'ProjectPartListID': instance.projectPartListId,
      'TradePriceDetailID': instance.tradePriceDetailId,
      'POKHDetailID': instance.pokhDetailId,
      'Specifications': instance.specifications,
      'BillImportDetailID': instance.billImportDetailId,
      'TotalInventory1': instance.totalInventory1,
      'ExpectReturnDate': instance.expectReturnDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'CustomerResponse': instance.customerResponse,
      'ProductTypeText': instance.productTypeText,
      'CreatDate': instance.creatDate?.toIso8601String(),
      'Code': instance.code,
      'CustomerID': instance.customerId,
      'Address': instance.address,
      'ProductCode': instance.productCode,
      'ProductNewCode': instance.productNewCode,
      'ProductName': instance.productName,
      'Unit': instance.unit,
      'ProductGroupName': instance.productGroupName,
      'ItemType': instance.itemType,
      'ProjectNameText': instance.projectNameText,
      'ProjectCodeText': instance.projectCodeText,
      'ProjectCodeExport': instance.projectCodeExport,
      'UserReceiver': instance.userReceiver,
      'QuantityRemain': instance.quantityRemain,
      'QtyPO': instance.qtyPO,
      'ChosenInventoryProject': instance.chosenInventoryProject,
      'ProductCodeExport': instance.productCodeExport,
      'ParentID': instance.parentId,
      'IsMerge': instance.isMerge,
      'KhoTypeID': instance.khoTypeId,
      'UserID': instance.userId,
      'ProductGroupID': instance.productGroupId,
      'UnitPricePurchase': instance.unitPricePurchase,
      'BillCode': instance.billCode,
      'UnitPricePOKH': instance.unitPricePOKH,
      'WarehouseName': instance.warehouseName,
      'ChildID': instance.childId,
      'WarehouseName1': instance.warehouseName1,
      'PONumber': instance.poNumber,
      'POCode': instance.poCode,
      'POKHDetailIDActual': instance.pokhDetailIdActual,
      'FileName': instance.fileName,
      'localImagePaths': instance.localImagePaths,
    };

_$UploadFileResponseImpl _$$UploadFileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadFileResponseImpl(
      fileID: (json['fileID'] as num).toInt(),
      filePath: json['filePath'] as String,
      serverPath: json['ServerPath'] as String,
      fileName: json['fileName'] as String,
    );

Map<String, dynamic> _$$UploadFileResponseImplToJson(
        _$UploadFileResponseImpl instance) =>
    <String, dynamic>{
      'fileID': instance.fileID,
      'filePath': instance.filePath,
      'ServerPath': instance.serverPath,
      'fileName': instance.fileName,
    };

_$ReadFileResponseImpl _$$ReadFileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReadFileResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      billExportDetailId: (json['BillExportDetailID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      originPath: json['OriginPath'] as String?,
      serverPath: json['ServerPath'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$ReadFileResponseImplToJson(
        _$ReadFileResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'BillExportDetailID': instance.billExportDetailId,
      'FileName': instance.fileName,
      'OriginPath': instance.originPath,
      'ServerPath': instance.serverPath,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
    };

_$SaveBillExportDataPayloadImpl _$$SaveBillExportDataPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveBillExportDataPayloadImpl(
      billExport: BillExportPayload.fromJson(
          json['BillExport'] as Map<String, dynamic>),
      billExportDetail: (json['billExportDetail'] as List<dynamic>)
          .map((e) =>
              BillExportDetailPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
      deletedDetailIds: (json['DeletedDetailIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      deletedFileIds: (json['DeletedFileIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SaveBillExportDataPayloadImplToJson(
        _$SaveBillExportDataPayloadImpl instance) =>
    <String, dynamic>{
      'BillExport': instance.billExport,
      'billExportDetail': instance.billExportDetail,
      'DeletedDetailIds': instance.deletedDetailIds,
      'DeletedFileIds': instance.deletedFileIds,
    };

_$BillExportPayloadImpl _$$BillExportPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$BillExportPayloadImpl(
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
      status: (json['Status'] as num?)?.toInt(),
      groupId: json['GroupID'] as String?,
      warehouseType: json['WarehouseType'] as String?,
      khoTypeId: (json['KhoTypeID'] as num?)?.toInt(),
      creatDate: json['CreatDate'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      productType: (json['ProductType'] as num?)?.toInt(),
      addressStockId: (json['AddressStockID'] as num?)?.toInt(),
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
      requestDate: json['RequestDate'] as String?,
      deliveryTime: json['DeliveryTime'] as String?,
      isAfterHours: json['IsAfterHours'] as bool?,
      billDocumentExportType: (json['BillDocumentExportType'] as num?)?.toInt(),
      isApproved: json['IsApproved'] as bool?,
      isTransfer: json['IsTransfer'] as bool?,
      wareHouseTranferId: (json['WareHouseTranferID'] as num?)?.toInt(),
      isTransferInternal: json['IsTransferInternal'] as bool?,
      khoTypeTransferId: (json['KhoTypeTransferID'] as num?)?.toInt(),
      receiverId: (json['ReceiverID'] as num?)?.toInt(),
      isPrepared: json['IsPrepared'] as bool?,
      isReceived: json['IsReceived'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$BillExportPayloadImplToJson(
        _$BillExportPayloadImpl instance) =>
    <String, dynamic>{
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
      'Status': instance.status,
      'GroupID': instance.groupId,
      'WarehouseType': instance.warehouseType,
      'KhoTypeID': instance.khoTypeId,
      'CreatDate': instance.creatDate,
      'CreatedDate': instance.createdDate,
      'UpdatedDate': instance.updatedDate,
      'ProductType': instance.productType,
      'AddressStockID': instance.addressStockId,
      'WarehouseID': instance.warehouseId,
      'RequestDate': instance.requestDate,
      'DeliveryTime': instance.deliveryTime,
      'IsAfterHours': instance.isAfterHours,
      'BillDocumentExportType': instance.billDocumentExportType,
      'IsApproved': instance.isApproved,
      'IsTransfer': instance.isTransfer,
      'WareHouseTranferID': instance.wareHouseTranferId,
      'IsTransferInternal': instance.isTransferInternal,
      'KhoTypeTransferID': instance.khoTypeTransferId,
      'ReceiverID': instance.receiverId,
      'IsPrepared': instance.isPrepared,
      'IsReceived': instance.isReceived,
      'IsDeleted': instance.isDeleted,
    };

_$BillExportDetailPayloadImpl _$$BillExportDetailPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$BillExportDetailPayloadImpl(
      id: (json['ID'] as num?)?.toInt(),
      productId: (json['ProductID'] as num?)?.toInt(),
      productName: json['ProductName'] as String?,
      productCode: json['ProductCode'] as String?,
      productNewCode: json['ProductNewCode'] as String?,
      productFullName: json['ProductFullName'] as String?,
      qty: json['Qty'] as num?,
      projectName: json['ProjectName'] as String?,
      note: json['Note'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      totalQty: json['TotalQty'] as num?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      productType: (json['ProductType'] as num?)?.toInt(),
      pokhId: (json['POKHID'] as num?)?.toInt(),
      groupExport: json['GroupExport'] as String?,
      isInvoice: json['IsInvoice'] as bool?,
      invoiceNumber: json['InvoiceNumber'] as String?,
      serialNumber: json['SerialNumber'] as String?,
      returnedStatus: json['ReturnedStatus'] as bool?,
      projectPartListId: (json['ProjectPartListID'] as num?)?.toInt(),
      tradePriceDetailId: (json['TradePriceDetailID'] as num?)?.toInt(),
      pokhDetailId: (json['POKHDetailID'] as num?)?.toInt(),
      specifications: json['Specifications'] as String?,
      billImportDetailId: (json['BillImportDetailID'] as num?)?.toInt(),
      totalInventory: json['TotalInventory'] as num?,
      expectReturnDate: json['ExpectReturnDate'] as String?,
      customerResponse: json['CustomerResponse'] as String?,
      pokhDetailIdActual: (json['POKHDetailIDActual'] as num?)?.toInt(),
      poNumber: json['PONumber'] as String?,
      chosenInventoryProject: json['ChosenInventoryProject'] as String?,
      unit: json['Unit'] as String?,
      unitName: json['UnitName'] as String?,
      childId: (json['ChildID'] as num?)?.toInt(),
      importDetailId: (json['ImportDetailID'] as num?)?.toInt(),
      forceReallocate: json['ForceReallocate'] as bool?,
      unitPricePOKH: json['UnitPricePOKH'] as num?,
      unitPricePurchase: json['UnitPricePurchase'] as num?,
      billCode: json['BillCode'] as String?,
      fileIds: (json['FileIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BillExportDetailPayloadImplToJson(
        _$BillExportDetailPayloadImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProductID': instance.productId,
      'ProductName': instance.productName,
      'ProductCode': instance.productCode,
      'ProductNewCode': instance.productNewCode,
      'ProductFullName': instance.productFullName,
      'Qty': instance.qty,
      'ProjectName': instance.projectName,
      'Note': instance.note,
      'STT': instance.stt,
      'TotalQty': instance.totalQty,
      'ProjectID': instance.projectId,
      'ProductType': instance.productType,
      'POKHID': instance.pokhId,
      'GroupExport': instance.groupExport,
      'IsInvoice': instance.isInvoice,
      'InvoiceNumber': instance.invoiceNumber,
      'SerialNumber': instance.serialNumber,
      'ReturnedStatus': instance.returnedStatus,
      'ProjectPartListID': instance.projectPartListId,
      'TradePriceDetailID': instance.tradePriceDetailId,
      'POKHDetailID': instance.pokhDetailId,
      'Specifications': instance.specifications,
      'BillImportDetailID': instance.billImportDetailId,
      'TotalInventory': instance.totalInventory,
      'ExpectReturnDate': instance.expectReturnDate,
      'CustomerResponse': instance.customerResponse,
      'POKHDetailIDActual': instance.pokhDetailIdActual,
      'PONumber': instance.poNumber,
      'ChosenInventoryProject': instance.chosenInventoryProject,
      'Unit': instance.unit,
      'UnitName': instance.unitName,
      'ChildID': instance.childId,
      'ImportDetailID': instance.importDetailId,
      'ForceReallocate': instance.forceReallocate,
      'UnitPricePOKH': instance.unitPricePOKH,
      'UnitPricePurchase': instance.unitPricePurchase,
      'BillCode': instance.billCode,
      'FileIds': instance.fileIds,
    };

_$SaveBillExportDataResponseImpl _$$SaveBillExportDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveBillExportDataResponseImpl(
      billExportId: (json['BillExportID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SaveBillExportDataResponseImplToJson(
        _$SaveBillExportDataResponseImpl instance) =>
    <String, dynamic>{
      'BillExportID': instance.billExportId,
    };

_$SupplierResponseImpl _$$SupplierResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SupplierResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['CodeNCC'] as String?,
      name: json['NameNCC'] as String?,
      address: json['AddressNCC'] as String?,
      phone: json['PhoneNCC'] as String?,
      orderer: json['OrdererNCC'] as String?,
      debt: json['Debt'],
      ngayUpdate: json['NgayUpdate'] == null
          ? null
          : DateTime.parse(json['NgayUpdate'] as String),
      nvPhuTrach: json['NVPhuTrach'] as String?,
      loaiHangHoa: json['LoaiHangHoa'] as String?,
      brand: json['Brand'] as String?,
      maNhom: json['MaNhom'] as String?,
      tenTiengAnh: json['TenTiengAnh'] as String?,
      website: json['Website'] as String?,
      soTK: json['SoTK'] as String?,
      nganHang: json['NganHang'] as String?,
      maSoThue: json['MaSoThue'] as String?,
      note: json['Note'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      company: json['Company'] as String?,
      shortName: json['ShortNameSupplier'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      isDebt: json['IsDebt'] as bool?,
      fedexAccount: json['FedexAccount'] as String?,
      originItem: json['OriginItem'] as String?,
      bankCharge: json['BankCharge'] as String?,
      addressDelivery: json['AddressDelivery'] as String?,
      rulePayId: (json['RulePayID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      ruleIncoterm: json['RuleIncoterm'] as String?,
      bankListId: (json['BankListID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SupplierResponseImplToJson(
        _$SupplierResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CodeNCC': instance.code,
      'NameNCC': instance.name,
      'AddressNCC': instance.address,
      'PhoneNCC': instance.phone,
      'OrdererNCC': instance.orderer,
      'Debt': instance.debt,
      'NgayUpdate': instance.ngayUpdate?.toIso8601String(),
      'NVPhuTrach': instance.nvPhuTrach,
      'LoaiHangHoa': instance.loaiHangHoa,
      'Brand': instance.brand,
      'MaNhom': instance.maNhom,
      'TenTiengAnh': instance.tenTiengAnh,
      'Website': instance.website,
      'SoTK': instance.soTK,
      'NganHang': instance.nganHang,
      'MaSoThue': instance.maSoThue,
      'Note': instance.note,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'Company': instance.company,
      'ShortNameSupplier': instance.shortName,
      'EmployeeID': instance.employeeId,
      'IsDeleted': instance.isDeleted,
      'IsDebt': instance.isDebt,
      'FedexAccount': instance.fedexAccount,
      'OriginItem': instance.originItem,
      'BankCharge': instance.bankCharge,
      'AddressDelivery': instance.addressDelivery,
      'RulePayID': instance.rulePayId,
      'Description': instance.description,
      'RuleIncoterm': instance.ruleIncoterm,
      'BankListID': instance.bankListId,
    };

_$SenderResponseImpl _$$SenderResponseImplFromJson(Map<String, dynamic> json) =>
    _$SenderResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      loginName: json['LoginName'] as String?,
      fullName: json['FullName'] as String?,
      birthOfDate: json['BirthOfDate'] == null
          ? null
          : DateTime.parse(json['BirthOfDate'] as String),
      sex: (json['Sex'] as num?)?.toInt(),
      telephone: json['Telephone'] as String?,
      handPhone: json['HandPhone'] as String?,
      email: json['Email'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      position: json['Position'] as String?,
      imagePath: json['ImagePath'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
    );

Map<String, dynamic> _$$SenderResponseImplToJson(
        _$SenderResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'LoginName': instance.loginName,
      'FullName': instance.fullName,
      'BirthOfDate': instance.birthOfDate?.toIso8601String(),
      'Sex': instance.sex,
      'Telephone': instance.telephone,
      'HandPhone': instance.handPhone,
      'Email': instance.email,
      'DepartmentID': instance.departmentId,
      'Status': instance.status,
      'Position': instance.position,
      'ImagePath': instance.imagePath,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
    };

_$CustomerResponseImpl _$$CustomerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      name: json['CustomerName'] as String?,
      code: json['CustomerCode'] as String?,
      shortName: json['CustomerShortName'] as String?,
      address: json['Address'] as String?,
      phone: json['Phone'] as String?,
      email: json['Email'] as String?,
      note: json['Note'] as String?,
      website: json['Website'] as String?,
      contactName: json['ContactName'] as String?,
      contactPhone: json['ContactPhone'] as String?,
      contactEmail: json['ContactEmail'] as String?,
      addressStock: json['AdressStock'] as String?,
      taxCode: json['TaxCode'] as String?,
    );

Map<String, dynamic> _$$CustomerResponseImplToJson(
        _$CustomerResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerName': instance.name,
      'CustomerCode': instance.code,
      'CustomerShortName': instance.shortName,
      'Address': instance.address,
      'Phone': instance.phone,
      'Email': instance.email,
      'Note': instance.note,
      'Website': instance.website,
      'ContactName': instance.contactName,
      'ContactPhone': instance.contactPhone,
      'ContactEmail': instance.contactEmail,
      'AdressStock': instance.addressStock,
      'TaxCode': instance.taxCode,
    };

_$ProjectGDNResponseImpl _$$ProjectGDNResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectGDNResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      code: json['ProjectCode'] as String?,
      name: json['ProjectName'] as String?,
      shortName: json['ProjectShortName'] as String?,
      status: (json['ProjectStatus'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      userTechnicalId: (json['UserTechnicalID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      projectType: (json['ProjectType'] as num?)?.toInt(),
      planDateStart: json['PlanDateStart'] == null
          ? null
          : DateTime.parse(json['PlanDateStart'] as String),
      planDateEnd: json['PlanDateEnd'] == null
          ? null
          : DateTime.parse(json['PlanDateEnd'] as String),
      actualDateStart: json['ActualDateStart'] == null
          ? null
          : DateTime.parse(json['ActualDateStart'] as String),
      actualDateEnd: json['ActualDateEnd'] == null
          ? null
          : DateTime.parse(json['ActualDateEnd'] as String),
      endUser: (json['EndUser'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      typeProject: (json['TypeProject'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$ProjectGDNResponseImplToJson(
        _$ProjectGDNResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'ProjectCode': instance.code,
      'ProjectName': instance.name,
      'ProjectShortName': instance.shortName,
      'ProjectStatus': instance.status,
      'UserID': instance.userId,
      'UserTechnicalID': instance.userTechnicalId,
      'Note': instance.note,
      'ProjectType': instance.projectType,
      'PlanDateStart': instance.planDateStart?.toIso8601String(),
      'PlanDateEnd': instance.planDateEnd?.toIso8601String(),
      'ActualDateStart': instance.actualDateStart?.toIso8601String(),
      'ActualDateEnd': instance.actualDateEnd?.toIso8601String(),
      'EndUser': instance.endUser,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'TypeProject': instance.typeProject,
      'IsDeleted': instance.isDeleted,
    };

_$WarehouseResponseImpl _$$WarehouseResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WarehouseResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['WarehouseCode'] as String?,
      name: json['WarehouseName'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$WarehouseResponseImplToJson(
        _$WarehouseResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'WarehouseCode': instance.code,
      'WarehouseName': instance.name,
      'IsDeleted': instance.isDeleted,
    };

_$ProductGroupNewResponseImpl _$$ProductGroupNewResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductGroupNewResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      productGroupId: json['ProductGroupID'] as String?,
      name: json['ProductGroupName'] as String?,
      isVisible: json['IsVisible'] as bool?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      isView: (json['IsView'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductGroupNewResponseImplToJson(
        _$ProductGroupNewResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProductGroupID': instance.productGroupId,
      'ProductGroupName': instance.name,
      'IsVisible': instance.isVisible,
      'EmployeeID': instance.employeeId,
      'ParentID': instance.parentId,
      'STT': instance.stt,
      'IsView': instance.isView,
    };
