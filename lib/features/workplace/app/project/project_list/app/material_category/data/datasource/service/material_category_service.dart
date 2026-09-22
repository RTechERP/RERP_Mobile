import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';

import '../../../../../../../../../../common/constants.dart';
import '../model/material_category_model.dart';
import '../model/solution_model.dart';
import '../model/version_model.dart';

/// Service cung cấp dữ liệu cho màn Danh mục vật tư gồm:
/// - Danh mục vật tư (API - TODO: cập nhật path khi backend sẵn sàng).
/// - Giải pháp (API GET /projectworker/get-solution/{projectRequestId}).
/// - Phiên bản (API GET /ProjectPartListVersion/get-all).
@injectable
class MaterialCategoryService extends DioBaseApiService {
  MaterialCategoryService(super.dio);

  /// Lấy danh sách danh mục vật tư.
  /// TODO: cập nhật path + response khi backend cung cấp endpoint.
  Future<List<MaterialCategoryItem>> getMaterialCategories({
    String keyword = '',
  }) async {
    // TODO: thay bằng API call thực tế khi backend sẵn sàng.
    throw UnimplementedError(
      'getMaterialCategories chưa được triển khai (thiếu endpoint backend).',
    );
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

  /// Lấy danh sách phiên bản theo projectSolutionId, gọi đồng thời cả hai API
  /// với isPO = true / false. Trả về cặp (versions giải pháp, versions PO).
  /// Endpoint: GET /ProjectPartListVersion/get-all
  /// Response format: `{ status, message, data: List of VersionModel }`.
  Future<({List<VersionModel> solutionVersions, List<VersionModel> poVersions})>
      getVersions(int projectSolutionId) async {
    final results = await Future.wait([
      get<BaseData<List<VersionModel>>>(
        ApiEndPoint.getVersions,
        query: {'projectSolutionId': projectSolutionId, 'isPO': false},
        parser: (json) => _parseList(
          json,
          VersionModel.fromJson,
        ),
      ),
      get<BaseData<List<VersionModel>>>(
        ApiEndPoint.getVersions,
        query: {'projectSolutionId': projectSolutionId, 'isPO': true},
        parser: (json) => _parseList(
          json,
          VersionModel.fromJson,
        ),
      ),
    ]);

    return (
      solutionVersions: results[0].data ?? <VersionModel>[],
      poVersions: results[1].data ?? <VersionModel>[],
    );
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
}
