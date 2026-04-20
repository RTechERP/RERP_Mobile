// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypeNotiItemImpl _$$TypeNotiItemImplFromJson(Map<String, dynamic> json) =>
    _$TypeNotiItemImpl(
      id: (json['ID'] as num).toInt(),
      typeName: json['TypeName'] as String,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool,
      isSelected: json['IsSelected'] as bool,
      typeLinkId: (json['TypeLinkID'] as num).toInt(),
      userId: (json['UserID'] as num).toInt(),
    );

Map<String, dynamic> _$$TypeNotiItemImplToJson(_$TypeNotiItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TypeName': instance.typeName,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'IsSelected': instance.isSelected,
      'TypeLinkID': instance.typeLinkId,
      'UserID': instance.userId,
    };
