// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialCategoryDataImpl _$$MaterialCategoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialCategoryDataImpl(
      materialCategory: (json['materialCategory'] as List<dynamic>?)
          ?.map((e) => MaterialCategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPage: (json['totalPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MaterialCategoryDataImplToJson(
        _$MaterialCategoryDataImpl instance) =>
    <String, dynamic>{
      'materialCategory': instance.materialCategory,
      'totalPage': instance.totalPage,
    };

_$MaterialCategoryItemImpl _$$MaterialCategoryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialCategoryItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      materialCategoryCode: json['MaterialCategoryCode'] as String?,
      materialCategoryName: json['MaterialCategoryName'] as String?,
      materialCategoryShortName: json['MaterialCategoryShortName'] as String?,
      materialCategoryStatus: (json['MaterialCategoryStatus'] as num?)?.toInt(),
      materialCategoryNote: json['MaterialCategoryNote'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      rowNum: (json['RowNum'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MaterialCategoryItemImplToJson(
        _$MaterialCategoryItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'MaterialCategoryCode': instance.materialCategoryCode,
      'MaterialCategoryName': instance.materialCategoryName,
      'MaterialCategoryShortName': instance.materialCategoryShortName,
      'MaterialCategoryStatus': instance.materialCategoryStatus,
      'MaterialCategoryNote': instance.materialCategoryNote,
      'IsDeleted': instance.isDeleted,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate,
      'RowNum': instance.rowNum,
    };
