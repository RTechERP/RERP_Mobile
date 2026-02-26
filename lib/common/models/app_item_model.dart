import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_item_model.freezed.dart';
part 'app_item_model.g.dart';

@freezed
class AppItemModel with _$AppItemModel {
  const factory AppItemModel({
    required String id,
    required String name,

    String? tab,
    String? type,
    String? description,

    int? iconCodePoint,
    String? iconFontFamily,
    String? iconFontPackage,
    String? route,
    DateTime? favoriteAt,
    String? imageUrl,

    @Default(1.0) double opacity,
    @Default(true) bool enabled,
  }) = _AppItemModel;

  factory AppItemModel.fromJson(Map<String, dynamic> json) =>
      _$AppItemModelFromJson(json);

  factory AppItemModel.fromMap(Map<String, dynamic> map) {
    return AppItemModel(
      id: map['id'] as String,
      name: map['name'] as String,
      tab: map['tab'] as String?,
      type: map['type'] as String?,
      description: map['description'] as String?,
      iconCodePoint: map['iconCodePoint'] as int?,
      iconFontFamily: map['iconFontFamily'] as String?,
      iconFontPackage: map['iconFontPackage'] as String?,
      route: map['route'] as String?,
      favoriteAt: map['favoriteAt'] != null
          ? DateTime.parse(map['favoriteAt'])
          : null,
      imageUrl: map['imageUrl'] as String?,
      // KHÔNG cần set opacity + enabled vì đã có default
    );
  }
}
