import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../common/constants.dart';
import '../models/lead_source_model.dart';

/// Service gọi API module Nguồn Lead của CRM.
@injectable
class LeadSourceService extends DioBaseApiService {
  LeadSourceService(super.dio);

  /// Lấy danh sách nguồn lead.
  ///
  /// API: GET /LeadSource?sourceGroup=0.
  /// `sourceGroup=0` → lấy tất cả, `1` = Marketing, `2` = Sale.
  Future<BaseData<List<LeadSourceItem>>> getLeadSources({
    int sourceGroup = 0,
  }) async {
    return get<BaseData<List<LeadSourceItem>>>(
      ApiEndPoint.leadSource,
      query: {'sourceGroup': sourceGroup},
      parser: (json) => BaseData<List<LeadSourceItem>>.fromJson(json, (data) {
        return _parseList<LeadSourceItem>(data, LeadSourceItem.fromJson);
      }),
    );
  }

  /// Lưu nguồn lead (thêm/sửa).
  ///
  /// API: POST /LeadSource.
  /// Payload: { "ID": 0|id, "Code": "...", "Name": "...", "SourceGroup": 1|2, "STT": ..., "Note": "..." }.
  Future<BaseData<LeadSourceItem>> saveLeadSource(
    LeadSourceItem source,
  ) async {
    return post<BaseData<LeadSourceItem>>(
      ApiEndPoint.leadSource,
      body: source.toJson(),
      parser: (json) => BaseData<LeadSourceItem>.fromJson(
        json,
        (data) => LeadSourceItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Xoá nguồn lead.
  ///
  /// API: POST /LeadSource/delete.
  /// Payload: [12].
  Future<BaseData<List<int>>> deleteLeadSource(List<int> ids) async {
    return post<BaseData<List<int>>>(
      ApiEndPoint.leadSourceDelete,
      body: ids,
      parser: (json) => _parseDeletedIds(json),
    );
  }

  /// Parse response delete — lấy `status`/`message` ở envelope và danh sách ID đã xoá trong `data`.
  BaseData<List<int>> _parseDeletedIds(dynamic json) {
    final root = json is Map
        ? Map<String, dynamic>.from(json)
        : <String, dynamic>{};

    final data = root['data'];
    final message = root['message'] as String?;

    final deletedIds = data is List
        ? data.whereType<num>().map((e) => e.toInt()).toList()
        : const <int>[];

    return BaseData<List<int>>(
      status: (root['status'] as num?)?.toInt() ?? (deletedIds.isEmpty ? 0 : 1),
      data: deletedIds,
    )..message = message;
  }

  /// Parse list từ dynamic thành List<T>.
  List<T> _parseList<T>(dynamic data, T Function(Map<String, dynamic>) fromJson) {
    if (data is List) {
      return data.map((item) => fromJson(item as Map<String, dynamic>)).toList();
    }
    return [];
  }
}
