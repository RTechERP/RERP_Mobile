// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryCheckEmployeeImpl _$$InventoryCheckEmployeeImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryCheckEmployeeImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
    );

Map<String, dynamic> _$$InventoryCheckEmployeeImplToJson(
        _$InventoryCheckEmployeeImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
    };

_$InventoryCountItemImpl _$$InventoryCountItemImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryCountItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
      warehouseName: json['WarehouseName'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      employeeName: json['EmployeeName'] as String?,
      employeeCode: json['EmployeeCode'] as String?,
      dateCount: json['DateCount'] as String?,
      note: json['Note'] as String?,
      createdDate: json['CreatedDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      isComplete: json['IsComplete'] as bool?,
      totalItems: (json['TotalItems'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InventoryCountItemImplToJson(
        _$InventoryCountItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'WarehouseID': instance.warehouseId,
      'WarehouseName': instance.warehouseName,
      'EmployeeID': instance.employeeId,
      'EmployeeName': instance.employeeName,
      'EmployeeCode': instance.employeeCode,
      'DateCount': instance.dateCount,
      'Note': instance.note,
      'CreatedDate': instance.createdDate,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate,
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'IsComplete': instance.isComplete,
      'TotalItems': instance.totalItems,
    };

_$InventoryCountSavePayloadImpl _$$InventoryCountSavePayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryCountSavePayloadImpl(
      id: (json['ID'] as num?)?.toInt() ?? 0,
      code: json['Code'] as String,
      name: json['Name'] as String,
      warehouseId: (json['WarehouseID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num).toInt(),
      dateCount: json['DateCount'] as String,
      note: json['Note'] as String?,
      isComplete: json['IsComplete'] as bool? ?? false,
    );

Map<String, dynamic> _$$InventoryCountSavePayloadImplToJson(
        _$InventoryCountSavePayloadImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'WarehouseID': instance.warehouseId,
      'EmployeeID': instance.employeeId,
      'DateCount': instance.dateCount,
      'Note': instance.note,
      'IsComplete': instance.isComplete,
    };

_$InventoryCountSaveResultImpl _$$InventoryCountSaveResultImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryCountSaveResultImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      dateCount: json['DateCount'] as String?,
      note: json['Note'] as String?,
      createdDate: json['CreatedDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      isComplete: json['IsComplete'] as bool?,
    );

Map<String, dynamic> _$$InventoryCountSaveResultImplToJson(
        _$InventoryCountSaveResultImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'WarehouseID': instance.warehouseId,
      'EmployeeID': instance.employeeId,
      'DateCount': instance.dateCount,
      'Note': instance.note,
      'CreatedDate': instance.createdDate,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate,
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'IsComplete': instance.isComplete,
    };

_$InventoryCountDetailImpl _$$InventoryCountDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryCountDetailImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      dateCount: json['DateCount'] as String?,
      note: json['Note'] as String?,
      createdDate: json['CreatedDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      isComplete: json['IsComplete'] as bool?,
    );

Map<String, dynamic> _$$InventoryCountDetailImplToJson(
        _$InventoryCountDetailImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'WarehouseID': instance.warehouseId,
      'EmployeeID': instance.employeeId,
      'DateCount': instance.dateCount,
      'Note': instance.note,
      'CreatedDate': instance.createdDate,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate,
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'IsComplete': instance.isComplete,
    };

_$InventoryCountSheetImpl _$$InventoryCountSheetImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryCountSheetImpl(
      master: json['Master'] == null
          ? null
          : InventoryCountSheetMaster.fromJson(
              json['Master'] as Map<String, dynamic>),
      items: (json['Items'] as List<dynamic>?)
              ?.map((e) =>
                  InventoryCountSheetItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InventoryCountSheetImplToJson(
        _$InventoryCountSheetImpl instance) =>
    <String, dynamic>{
      'Master': instance.master,
      'Items': instance.items,
    };

_$InventoryCountSheetMasterImpl _$$InventoryCountSheetMasterImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryCountSheetMasterImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
      warehouseName: json['WarehouseName'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      employeeName: json['EmployeeName'] as String?,
      employeeCode: json['EmployeeCode'] as String?,
      dateCount: json['DateCount'] as String?,
      note: json['Note'] as String?,
      createdDate: json['CreatedDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      isComplete: json['IsComplete'] as bool?,
    );

Map<String, dynamic> _$$InventoryCountSheetMasterImplToJson(
        _$InventoryCountSheetMasterImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'WarehouseID': instance.warehouseId,
      'WarehouseName': instance.warehouseName,
      'EmployeeID': instance.employeeId,
      'EmployeeName': instance.employeeName,
      'EmployeeCode': instance.employeeCode,
      'DateCount': instance.dateCount,
      'Note': instance.note,
      'CreatedDate': instance.createdDate,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate,
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'IsComplete': instance.isComplete,
    };

_$InventoryProductGroupRtcImpl _$$InventoryProductGroupRtcImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryProductGroupRtcImpl(
      id: (json['ID'] as num?)?.toInt(),
      groupNo: json['ProductGroupNo'] as String?,
      groupName: json['ProductGroupName'] as String?,
      numberOrder: (json['NumberOrder'] as num?)?.toInt(),
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
      warehouseType: (json['WarehouseType'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$InventoryProductGroupRtcImplToJson(
        _$InventoryProductGroupRtcImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProductGroupNo': instance.groupNo,
      'ProductGroupName': instance.groupName,
      'NumberOrder': instance.numberOrder,
      'WarehouseID': instance.warehouseId,
      'WarehouseType': instance.warehouseType,
      'IsDeleted': instance.isDeleted,
    };

_$InventoryCountSheetItemImpl _$$InventoryCountSheetItemImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryCountSheetItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      warehouseInventoryCountId:
          (json['WarehouseInventoryCountID'] as num?)?.toInt(),
      productRtcId: (json['ProductRTCID'] as num?)?.toInt(),
      productCode: json['ProductCode'] as String?,
      productName: json['ProductName'] as String?,
      productCodeRtc: json['ProductCodeRTC'] as String?,
      maker: json['Maker'] as String?,
      unitName: json['UnitName'] as String?,
      addressBox: json['AddressBox'] as String?,
      locationName: json['LocationName'] as String?,
      serialNumber: json['SerialNumber'] as String?,
      serial: json['Serial'] as String?,
      partNumber: json['PartNumber'] as String?,
      productGroupRtcId: (json['ProductGroupRTCID'] as num?)?.toInt(),
      productGroupName: json['ProductGroupName'] as String?,
      modulaLocationName: json['ModulaLocationName'] as String?,
      numberInStore: (json['NumberInStore'] as num?)?.toInt() ?? 0,
      inventoryReal: (json['InventoryReal'] as num?)?.toInt() ?? 0,
      numberImport: (json['NumberImport'] as num?)?.toDouble() ?? 0,
      numberExport: (json['NumberExport'] as num?)?.toDouble() ?? 0,
      numberBorrowing: (json['NumberBorrowing'] as num?)?.toInt() ?? 0,
      quantityExportMuon: (json['QuantityExportMuon'] as num?)?.toInt() ?? 0,
      quantityActual: (json['QuantityActual'] as num?)?.toDouble(),
      difference: (json['Difference'] as num?)?.toDouble(),
      note: json['Note'] as String?,
      hasCounted: json['HasCounted'] as bool? ?? false,
      borrowedQuantity: (json['BorrowedQuantity'] as num?)?.toDouble(),
      customerBorrowedQuantity:
          (json['CustomerBorrowedQuantity'] as num?)?.toDouble(),
      inventoryQuantity: (json['InventoryQuantity'] as num?)?.toDouble(),
      updatedDate: json['UpdatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
    );

Map<String, dynamic> _$$InventoryCountSheetItemImplToJson(
        _$InventoryCountSheetItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'WarehouseInventoryCountID': instance.warehouseInventoryCountId,
      'ProductRTCID': instance.productRtcId,
      'ProductCode': instance.productCode,
      'ProductName': instance.productName,
      'ProductCodeRTC': instance.productCodeRtc,
      'Maker': instance.maker,
      'UnitName': instance.unitName,
      'AddressBox': instance.addressBox,
      'LocationName': instance.locationName,
      'SerialNumber': instance.serialNumber,
      'Serial': instance.serial,
      'PartNumber': instance.partNumber,
      'ProductGroupRTCID': instance.productGroupRtcId,
      'ProductGroupName': instance.productGroupName,
      'ModulaLocationName': instance.modulaLocationName,
      'NumberInStore': instance.numberInStore,
      'InventoryReal': instance.inventoryReal,
      'NumberImport': instance.numberImport,
      'NumberExport': instance.numberExport,
      'NumberBorrowing': instance.numberBorrowing,
      'QuantityExportMuon': instance.quantityExportMuon,
      'QuantityActual': instance.quantityActual,
      'Difference': instance.difference,
      'Note': instance.note,
      'HasCounted': instance.hasCounted,
      'BorrowedQuantity': instance.borrowedQuantity,
      'CustomerBorrowedQuantity': instance.customerBorrowedQuantity,
      'InventoryQuantity': instance.inventoryQuantity,
      'UpdatedDate': instance.updatedDate,
      'UpdatedBy': instance.updatedBy,
    };
