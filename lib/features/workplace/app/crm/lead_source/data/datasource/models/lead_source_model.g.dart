// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadSourceItemImpl _$$LeadSourceItemImplFromJson(Map<String, dynamic> json) =>
    _$LeadSourceItemImpl(
      id: (json['ID'] as num?)?.toInt() ?? 0,
      code: json['Code'] as String? ?? '',
      name: json['Name'] as String? ?? '',
      sourceGroup: (json['SourceGroup'] as num?)?.toInt() ?? 0,
      stt: (json['STT'] as num?)?.toInt(),
      note: json['Note'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$LeadSourceItemImplToJson(
        _$LeadSourceItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'SourceGroup': instance.sourceGroup,
      'STT': instance.stt,
      'Note': instance.note,
      'IsDeleted': instance.isDeleted,
    };
