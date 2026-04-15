// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalAssetItemImpl _$$PersonalAssetItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalAssetItemImpl(
      assetCode: json['AssetCode'] as String?,
      assetType: json['AssetType'] as String?,
      dateBuy: json['DateBuy'] == null
          ? null
          : DateTime.parse(json['DateBuy'] as String),
      seri: json['Seri'] as String?,
      sourceCode: json['SourceCode'] as String?,
      status: json['Status'] as String?,
      tsAssetCode: json['TSAssetCode'] as String?,
      tsAssetName: json['TSAssetName'] as String?,
      tsCodeNCC: json['TSCodeNCC'] as String?,
      unitName: json['UnitName'] as String?,
    );

Map<String, dynamic> _$$PersonalAssetItemImplToJson(
        _$PersonalAssetItemImpl instance) =>
    <String, dynamic>{
      'AssetCode': instance.assetCode,
      'AssetType': instance.assetType,
      'DateBuy': instance.dateBuy?.toIso8601String(),
      'Seri': instance.seri,
      'SourceCode': instance.sourceCode,
      'Status': instance.status,
      'TSAssetCode': instance.tsAssetCode,
      'TSAssetName': instance.tsAssetName,
      'TSCodeNCC': instance.tsCodeNCC,
      'UnitName': instance.unitName,
    };

_$PersonalPropertyItemImpl _$$PersonalPropertyItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalPropertyItemImpl(
      assetId: (json['AssetID'] as num?)?.toInt(),
      deliverId: (json['DeliverID'] as num?)?.toInt(),
      receiverId: (json['ReceiverID'] as num?)?.toInt(),
      isApprovedPersonalProperty: json['IsApprovedPersonalProperty'] as bool?,
      assetCategory: (json['AssetCategory'] as num?)?.toInt(),
      assetCode: json['AssetCode'] as String?,
      implementationDate: json['ImplementationDate'] == null
          ? null
          : DateTime.parse(json['ImplementationDate'] as String),
      assetNote: json['AssetNote'] as String?,
      isApproved: json['IsApproved'] as bool?,
      isApproveAccountant: json['IsApproveAccountant'] as bool?,
      deliverName: json['DeliverName'] as String?,
      departmentDeliver: json['DepartmentDeliver'] as String?,
      possitionDeliver: json['PossitionDeliver'] as String?,
      receiverName: json['ReceiverName'] as String?,
      departmentReceiver: json['DepartmentReceiver'] as String?,
      possitionReceiver: json['PossitionReceiver'] as String?,
      assetCategoryText: json['AssetCategorytext'] as String?,
    );

Map<String, dynamic> _$$PersonalPropertyItemImplToJson(
        _$PersonalPropertyItemImpl instance) =>
    <String, dynamic>{
      'AssetID': instance.assetId,
      'DeliverID': instance.deliverId,
      'ReceiverID': instance.receiverId,
      'IsApprovedPersonalProperty': instance.isApprovedPersonalProperty,
      'AssetCategory': instance.assetCategory,
      'AssetCode': instance.assetCode,
      'ImplementationDate': instance.implementationDate?.toIso8601String(),
      'AssetNote': instance.assetNote,
      'IsApproved': instance.isApproved,
      'IsApproveAccountant': instance.isApproveAccountant,
      'DeliverName': instance.deliverName,
      'DepartmentDeliver': instance.departmentDeliver,
      'PossitionDeliver': instance.possitionDeliver,
      'ReceiverName': instance.receiverName,
      'DepartmentReceiver': instance.departmentReceiver,
      'PossitionReceiver': instance.possitionReceiver,
      'AssetCategorytext': instance.assetCategoryText,
    };

_$DetailPersonalPropertyItemImpl _$$DetailPersonalPropertyItemImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailPersonalPropertyItemImpl(
      id: (json['ID'] as num).toInt(),
      tsAssetAllocationId: (json['TSAssetAllocationID'] as num?)?.toInt(),
      assetManagementId: (json['AssetManagementID'] as num).toInt(),
      stt: (json['STT'] as num).toInt(),
      quantity: (json['Quantity'] as num).toInt(),
      note: json['Note'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      tsAllAssetId: (json['TSAllAssetID'] as num?)?.toInt(),
      tsCodeNcc: json['TSCodeNCC'] as String?,
      tsAssetName: json['TSAssetName'] as String?,
      unitName: json['UnitName'] as String?,
      status: json['Status'] as String?,
      fullName: json['FullName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      positionName: json['PositionName'] as String?,
      chucVuHdId: (json['ChucVuHDID'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DetailPersonalPropertyItemImplToJson(
        _$DetailPersonalPropertyItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TSAssetAllocationID': instance.tsAssetAllocationId,
      'AssetManagementID': instance.assetManagementId,
      'STT': instance.stt,
      'Quantity': instance.quantity,
      'Note': instance.note,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'EmployeeID': instance.employeeId,
      'IsDeleted': instance.isDeleted,
      'TSAllAssetID': instance.tsAllAssetId,
      'TSCodeNCC': instance.tsCodeNcc,
      'TSAssetName': instance.tsAssetName,
      'UnitName': instance.unitName,
      'Status': instance.status,
      'FullName': instance.fullName,
      'DepartmentName': instance.departmentName,
      'PositionName': instance.positionName,
      'ChucVuHDID': instance.chucVuHdId,
      'DepartmentID': instance.departmentId,
    };
