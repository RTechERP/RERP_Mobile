// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppVersionImpl _$$AppVersionImplFromJson(Map<String, dynamic> json) =>
    _$AppVersionImpl(
      id: (json['ID'] as num).toInt(),
      minSupportedVersion: json['MinSupportedVersion'] as String?,
    );

Map<String, dynamic> _$$AppVersionImplToJson(_$AppVersionImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'MinSupportedVersion': instance.minSupportedVersion,
    };
