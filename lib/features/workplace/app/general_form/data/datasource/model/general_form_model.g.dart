// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormItemImpl _$$FormItemImplFromJson(Map<String, dynamic> json) =>
    _$FormItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      nameDocumentType: json['NameDocumentType'] as String?,
      code: json['Code'] as String?,
      nameDocument: json['NameDocument'] as String?,
      datePromulgate: json['DatePromulgate'] == null
          ? null
          : DateTime.parse(json['DatePromulgate'] as String),
      dateEffective: json['DateEffective'] == null
          ? null
          : DateTime.parse(json['DateEffective'] as String),
      departmentName: json['DepartmentName'] as String?,
      departmentCode: json['DepartmentCode'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentCode1: json['DepartmentCode1'] as String?,
    );

Map<String, dynamic> _$$FormItemImplToJson(_$FormItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'STT': instance.stt,
      'NameDocumentType': instance.nameDocumentType,
      'Code': instance.code,
      'NameDocument': instance.nameDocument,
      'DatePromulgate': instance.datePromulgate?.toIso8601String(),
      'DateEffective': instance.dateEffective?.toIso8601String(),
      'DepartmentName': instance.departmentName,
      'DepartmentCode': instance.departmentCode,
      'DepartmentID': instance.departmentId,
      'DepartmentCode1': instance.departmentCode1,
    };
