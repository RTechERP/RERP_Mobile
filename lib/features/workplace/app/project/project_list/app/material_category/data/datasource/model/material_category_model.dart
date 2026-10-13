import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_category_model.freezed.dart';

/// Model hiển thị cho một danh mục vật tư (hỗ trợ phân cấp cha - con).
///
/// Cấu trúc cây đa cấp được xác định bằng `parentId` (null = root).
@freezed
class MaterialCategoryItem with _$MaterialCategoryItem {
  const factory MaterialCategoryItem({
    required int id,
    required String code,
    required String name,
    /// null = node root, ngược lại = id của node cha.
    int? parentId,
    /// Mã thiết bị / mã máy áp dụng.
    String? deviceCode,
    /// Số lượng cho 1 máy.
    int? qtyPerMachine,
    /// Số lượng tổng (cha và con đều có giá trị riêng, không auto-sum).
    int? totalQty,
    String? note,
    @Default(true) bool isActive,
  }) = _MaterialCategoryItem;
}
