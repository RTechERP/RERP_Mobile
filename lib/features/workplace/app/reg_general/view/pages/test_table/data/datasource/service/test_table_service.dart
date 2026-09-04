import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/test_table_model.dart';

/// Gọi API danh sách đăng ký bàn test ESL.
@injectable
class TestTableService extends DioBaseApiService {
  TestTableService(super.dio);

  /// Lấy danh sách phiếu bàn test, lọc theo [keyword] nếu có.
  Future<BaseData<List<TestTableItem>>> getTestTableItem({
    String keyword = '',
  }) async {
    return get<BaseData<List<TestTableItem>>>(
      ApiEndPoint.getTestTable,
      query: {
        'keyword': keyword,
      },
      parser: (json) => _parseList<TestTableItem>(
        json,
        TestTableItem.fromJson,
      ),
    );
  }

  /// Parse response — hỗ trợ data là List hoặc Map (`data`/`items`/`result`).
  BaseData<List<T>> _parseList<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    List<T> mapList(dynamic list) {
      if (list is! List) return <T>[];
      return list
          .whereType<Map>()
          .map((e) => fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
        (data) => mapList(data),
      );
    }

    return BaseData<List<T>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) return mapList(data);
        if (data is Map) {
          final nested = data['result'] ?? data['items'] ?? data['data'];
          final nestedItems = mapList(nested);
          if (nestedItems.isNotEmpty) return nestedItems;

          return data.values
              .whereType<List>()
              .expand((e) => mapList(e))
              .toList();
        }
        return <T>[];
      },
    );
  }
}
