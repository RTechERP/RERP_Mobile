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
      assetCategory: json['AssetCategory'] as String?,
      assetCategoryText: json['AssetCategorytext'] as String?,
      assetCode: json['AssetCode'] as String?,
      assetId: (json['AssetID'] as num?)?.toInt(),
      assetNote: json['AssetNote'] as String?,
      deliverId: (json['DeliverID'] as num?)?.toInt(),
      deliverName: json['DeliverName'] as String?,
      departmentDeliver: json['DepartmentDeliver'] as String?,
      departmentReceiver: json['DepartmentReceiver'] as String?,
      implementationDate: json['ImplementationDate'] == null
          ? null
          : DateTime.parse(json['ImplementationDate'] as String),
      isApproveAccountant: json['IsApproveAccountant'] as bool?,
      isApproved: json['IsApproved'] as bool?,
      isApprovedPersonalProperty: json['IsApprovedPersonalProperty'] as bool?,
      possitionDeliver: json['PossitionDeliver'] as String?,
    );

Map<String, dynamic> _$$PersonalPropertyItemImplToJson(
        _$PersonalPropertyItemImpl instance) =>
    <String, dynamic>{
      'AssetCategory': instance.assetCategory,
      'AssetCategorytext': instance.assetCategoryText,
      'AssetCode': instance.assetCode,
      'AssetID': instance.assetId,
      'AssetNote': instance.assetNote,
      'DeliverID': instance.deliverId,
      'DeliverName': instance.deliverName,
      'DepartmentDeliver': instance.departmentDeliver,
      'DepartmentReceiver': instance.departmentReceiver,
      'ImplementationDate': instance.implementationDate?.toIso8601String(),
      'IsApproveAccountant': instance.isApproveAccountant,
      'IsApproved': instance.isApproved,
      'IsApprovedPersonalProperty': instance.isApprovedPersonalProperty,
      'PossitionDeliver': instance.possitionDeliver,
    };
