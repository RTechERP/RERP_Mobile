import 'package:injectable/injectable.dart';
import '../model/material_category_model.dart';

/// Service cung cấp dữ liệu danh mục vật tư.
/// Hiện tại trả về dữ liệu tĩnh (mock) - sẽ thay bằng API call sau.
@injectable
class MaterialCategoryService {
  MaterialCategoryService();

  Future<List<MaterialCategoryItem>> getMaterialCategories({
    String keyword = '',
  }) async {
    // Mock data tĩnh - sẽ thay bằng API call khi backend sẵn sàng.
    await Future.delayed(const Duration(milliseconds: 300));

    final all = _mockData;

    if (keyword.isEmpty) return all;

    final lower = keyword.toLowerCase();
    return all.where((item) {
      return item.name.toLowerCase().contains(lower) ||
          item.code.toLowerCase().contains(lower);
    }).toList();
  }

  /// Mock data tĩnh - sẽ thay bằng API call khi backend sẵn sàng.
  static final List<MaterialCategoryItem> _mockData = [
    MaterialCategoryItem(
      id: 1,
      code: 'MCD-001',
      name: 'Danh mục vật tư',
      note: 'Danh mục chính',
      isActive: true,
    ),
    // MaterialCategoryItem(
    //   id: 2,
    //   code: 'MCD-002',
    //   name: 'Vật tư cơ khí',
    //   note: 'Bulong, ốc vít, tán',
    //   isActive: true,
    // ),
    // MaterialCategoryItem(
    //   id: 3,
    //   code: 'MCD-003',
    //   name: 'Dụng cụ thi công',
    //   note: 'Khoan, cắt, mài',
    //   isActive: true,
    // ),
    // MaterialCategoryItem(
    //   id: 4,
    //   code: 'MCD-004',
    //   name: 'Vật tư tiêu hao',
    //   note: 'Băng keo, dây điện',
    //   isActive: true,
    // ),
    // MaterialCategoryItem(
    //   id: 5,
    //   code: 'MCD-005',
    //   name: 'Phụ kiện',
    //   note: 'Phụ kiện various',
    //   isActive: true,
    // ),
    // MaterialCategoryItem(
    //   id: 6,
    //   code: 'MCD-006',
    //   name: 'Vật tư an toàn',
    //   note: 'Bảo hộ lao động',
    //   isActive: true,
    // ),
  ];

  /// Trả về danh sách danh mục tĩnh để hiển thị preview trong bottom sheet
  /// mà không cần khởi tạo bloc.
  static List<MaterialCategoryItem> previewCategories() => _mockData;
}
