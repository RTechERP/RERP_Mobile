import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/test_table_model.dart';

/// Gọi API liên quan bàn test ESL: phiếu đăng ký, bàn, nhân viên, dự án, người duyệt.
@injectable
class TestTableService extends DioBaseApiService {
  TestTableService(super.dio);

  /// Lấy danh sách phiếu đăng ký bàn test, lọc theo [keyword] nếu có.
  Future<BaseData<List<TestCardItem>>> getTestCardItem({
    String keyword = '',
  }) async {
    return get<BaseData<List<TestCardItem>>>(
      ApiEndPoint.getTestTable,
      query: {
        'keyword': keyword,
      },
      parser: (json) => _parseList(
        json,
        TestCardItem.fromJson,
      ),
    );
  }

  /// Lấy danh sách bàn test ESL.
  Future<BaseData<List<TestTableItem>>> getTestTableItem() async {
    return get<BaseData<List<TestTableItem>>>(
      ApiEndPoint.getEslTestTable,
      parser: (json) => _parseList(
        json,
        TestTableItem.fromJson,
      ),
    );
  }

  /// Lấy danh sách nhân viên, lọc theo [status], [departmentId], [keyword].
  Future<BaseData<List<EmployeeInfoItem>>> getEmployeeInfoItem({
    int status = 0,
    int departmentId = 0,
    String keyword = '',
  }) async {
    return get<BaseData<List<EmployeeInfoItem>>>(
      ApiEndPoint.getEmployee,
      query: {
        'status': status,
        'departmentid': departmentId,
        'keyword': keyword,
      },
      parser: (json) => _parseList(
        json,
        EmployeeInfoItem.fromJson,
      ),
    );
  }

  /// Lấy danh sách dự án.
  Future<BaseData<List<ProjectItem>>> getProjectItem() async {
    return get<BaseData<List<ProjectItem>>>(
      ApiEndPoint.getAllProject,
      parser: (json) => _parseList(
        json,
        ProjectItem.fromJson,
      ),
    );
  }

  /// Lấy danh sách người duyệt.
  Future<BaseData<List<ApproverItem>>> getApproverItem() async {
    return get<BaseData<List<ApproverItem>>>(
      ApiEndPoint.getAllUserApprove,
      parser: (json) => _parseList(
        json,
        ApproverItem.fromJson,
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
