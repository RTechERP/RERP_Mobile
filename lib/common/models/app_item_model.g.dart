// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppItemModelImpl _$$AppItemModelImplFromJson(Map<String, dynamic> json) =>
    _$AppItemModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      tab: json['tab'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      iconCodePoint: (json['iconCodePoint'] as num?)?.toInt(),
      iconFontFamily: json['iconFontFamily'] as String?,
      iconFontPackage: json['iconFontPackage'] as String?,
      route: json['route'] as String?,
      favoriteAt: json['favoriteAt'] == null
          ? null
          : DateTime.parse(json['favoriteAt'] as String),
      imageUrl: json['imageUrl'] as String?,
      opacity: (json['opacity'] as num?)?.toDouble() ?? 1.0,
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$AppItemModelImplToJson(_$AppItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tab': instance.tab,
      'type': instance.type,
      'description': instance.description,
      'iconCodePoint': instance.iconCodePoint,
      'iconFontFamily': instance.iconFontFamily,
      'iconFontPackage': instance.iconFontPackage,
      'route': instance.route,
      'favoriteAt': instance.favoriteAt?.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'opacity': instance.opacity,
      'enabled': instance.enabled,
    };
