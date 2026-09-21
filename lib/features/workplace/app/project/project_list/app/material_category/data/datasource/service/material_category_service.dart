import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';

import '../../../../../../../../../../common/constants.dart';
import '../model/material_category_model.dart';
import '../model/solution_model.dart';

/// Service cung cấp dữ liệu cho màn Danh mục vật tư gồm:
/// - Danh mục vật tư (mock, sẽ thay bằng API khi backend sẵn sàng).
/// - Giải pháp (API GET /projectworker/get-solution/{projectRequestId}).
@injectable
class MaterialCategoryService extends DioBaseApiService {
  MaterialCategoryService(super.dio);

  /// Lấy danh sách danh mục vật tư.
  /// Hiện tại trả về dữ liệu tĩnh (mock) - sẽ thay bằng API call khi backend sẵn sàng.
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

  /// Lấy danh sách giải pháp theo projectRequestId.
  /// Endpoint: GET /projectworker/get-solution/{projectRequestId}
  /// Response format: `{ status, message, data: List of SolutionModel }`.
  Future<List<SolutionModel>> getSolutions(int projectRequestId) async {
    final result = await get<BaseData<List<SolutionModel>>>(
      '${ApiEndPoint.getSolution}/$projectRequestId',
      parser: (json) => _parseList(
        json,
        SolutionModel.fromJson,
      ),
    );
    return result.data ?? <SolutionModel>[];
  }

  /// Parse response thành BaseData&lt;List&lt;T&gt;&gt;, hỗ trợ nhiều format khác nhau.
  BaseData<List<T>> _parseList<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List)
            .map((e) => fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    return BaseData<List<T>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) {
          return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
        }
        if (data is Map) {
          final items = (data as Map<String, dynamic>).values
              .whereType<List>()
              .expand((e) => e)
              .map((e) => fromJson(e as Map<String, dynamic>))
              .toList();
          if (items.isNotEmpty) return items;
        }
        return <T>[];
      },
    );
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
  ];

  /// Trả về danh sách danh mục tĩnh để hiển thị preview trong bottom sheet
  /// mà không cần khởi tạo bloc.
  static List<MaterialCategoryItem> previewCategories() => _mockData;
}
