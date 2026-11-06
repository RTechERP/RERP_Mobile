// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryCheckEmployeeImpl _$$InventoryCheckEmployeeImplFromJson(
  Map<String, dynamic> json,
) => _$InventoryCheckEmployeeImpl(
  id: (json['ID'] as num?)?.toInt(),
  code: json['Code'] as String?,
  fullName: json['FullName'] as String?,
);

Map<String, dynamic> _$$InventoryCheckEmployeeImplToJson(
  _$InventoryCheckEmployeeImpl instance,
) => <String, dynamic>{
  'ID': instance.id,
  'Code': instance.code,
  'FullName': instance.fullName,
};

_$InventoryCountItemImpl _$$InventoryCountItemImplFromJson(
  Map<String, dynamic> json,
) => _$InventoryCountItemImpl(
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
  _$InventoryCountItemImpl instance,
) => <String, dynamic>{
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
  Map<String, dynamic> json,
) => _$InventoryCountSavePayloadImpl(
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
  _$InventoryCountSavePayloadImpl instance,
) => <String, dynamic>{
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
  Map<String, dynamic> json,
) => _$InventoryCountSaveResultImpl(
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
  _$InventoryCountSaveResultImpl instance,
) => <String, dynamic>{
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
