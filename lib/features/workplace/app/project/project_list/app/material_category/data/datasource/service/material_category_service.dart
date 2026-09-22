import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';

import '../../../../../../../../../../common/constants.dart';
import '../model/part_list_model.dart';
import '../model/solution_model.dart';
import '../model/version_model.dart';

/// Service cung cấp dữ liệu cho màn Danh mục vật tư gồm:
/// - Danh mục vật tư (API - TODO: cập nhật path khi backend sẵn sàng).
/// - Giải pháp (API GET /projectworker/get-solution/{projectRequestId}).
/// - Phiên bản (API GET /ProjectPartListVersion/get-all).
@injectable
class MaterialCategoryService extends DioBaseApiService {
  MaterialCategoryService(super.dio);

  /// Lấy danh sách vật tư theo phiên bản.
  /// Endpoint: POST /ProjectPartList/get-all
  /// Payload: { projectId, projectPartListVersionId, keywords, partlistTypeId, isDeleted, isConsumable, isApprovedTBP, isApprovedPurchase }
  Future<List<PartListModel>> getPartList({
    required int projectId,
    required int projectPartListVersionId,
    required int projectTypeId,
    String keyword = '',
    int isDeleted = 0,
    bool isConsumable = false,
    int isApprovedTbp = -1,
    int isApprovedPurchase = -1,
  }) async {
    final body = {
      'ProjectID': projectId,
      'ProjectPartListVersionID': projectPartListVersionId,
      'PartlistTypeID': projectTypeId,
      'Keywords': keyword,
      'IsDeleted': isDeleted,
      'IsConsumable': isConsumable,
      'IsApprovedTBP': isApprovedTbp,
      'IsApprovedPurchase': isApprovedPurchase,
    };
    final result = await post<dynamic>(
      ApiEndPoint.getPartList,
      body: body,
    );
    return _parsePartListResponse(result);
  }

  /// Parse response part list - có thể trả về List trực tiếp hoặc wrapped.
  List<PartListModel> _parsePartListResponse(dynamic json) {
    if (json is List) {
      return json
          .map((e) => PartListModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (json is Map<String, dynamic>) {
      final data = json['data'];
      if (data is List) {
        return data
            .map((e) => PartListModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    }
    return <PartListModel>[];
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
