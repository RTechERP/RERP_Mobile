import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/test_table_model.dart';

/// Gọi API liên quan bàn test ESL: phiếu đăng ký, bàn, nhân viên, dự án, người duyệt.
@injectable
class TestTableService extends DioBaseApiService {
  TestTableService(super.dio);

  /// Lấy danh sách phiếu đăng ký bàn test, lọc theo [keyword] và [employeeId].
  /// [employeeId] = id nhân viên của currentUser — BE sẽ chỉ trả phiếu
  /// do nhân viên đó đăng ký (OwnerID). Nếu null/0 thì BE trả tất cả.
  Future<BaseData<List<TestCardItem>>> getTestCardItem({
    String keyword = '',
    int employeeId = 0,
  }) async {
    return get<BaseData<List<TestCardItem>>>(
      ApiEndPoint.getTestTable,
      query: {
        'keyword': keyword,
        'employeeId': employeeId,
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

  /// POST /ESLRegistration/check-conflict — kiểm tra bàn test đã có ai đăng ký
  /// trong khoảng [startDate, endDate] chưa.
  ///
  /// BE trả về dạng `{status, message, data}`:
  /// - `status == 1` và `message == "Không trùng lặp"` → OK
  /// - ngược lại → conflict (chứa thông tin phiếu trùng).
  Future<String> checkConflict({
    required Map<String, dynamic> payload,
  }) async {
    // BE nhận body JSON thuần — không stringify list/số.
    final res = await dio.post(
      ApiEndPoint.checkConflictRegistration,
      data: payload,
      options: Options(
        contentType: Headers.jsonContentType,
        headers: {Headers.contentTypeHeader: Headers.jsonContentType},
      ),
    );

    final raw = res.data;
    if (raw is Map) {
      final data = raw['data'];
      if (data is String && data.trim().isNotEmpty) return data;
      final msg = raw['message'] ?? raw['msg'];
      if (msg is String && msg.trim().isNotEmpty) return msg;
      return '';
    }
    if (raw is String && raw.trim().isNotEmpty) return raw;
    return '';
  }

  /// POST /ESLRegistration/save — lưu phiếu đăng ký mới.
  ///
  /// Trả về id phiếu vừa tạo (BE trả về `{status, data: <id>}`).
  /// BE nhận body JSON thuần — `MachineIDs` phải là List<int>, không phải CSV.
  Future<int> saveRegistration({
    required Map<String, dynamic> payload,
  }) async {
    final res = await dio.post(
      ApiEndPoint.saveRegistration,
      data: payload,
      options: Options(
        contentType: Headers.jsonContentType,
        headers: {Headers.contentTypeHeader: Headers.jsonContentType},
      ),
    );

    final raw = res.data;
    if (raw is Map) {
      final status = raw['status'];
      if (status == 1 || status == '1') {
        final data = raw['data'];
        if (data is int) return data;
        if (data is num) return data.toInt();
        if (data is String && data.trim().isNotEmpty) {
          return int.tryParse(data) ?? 0;
        }
        // status OK nhưng không có id → trả 0 (caller xử lý).
        return 0;
      }
      throw BaseError.httpInternalServerError(
        (raw['message'] ?? raw['msg'] ?? 'Lưu phiếu thất bại').toString(),
      );
    }
    throw const BaseError.httpInternalServerError('Lưu phiếu thất bại');
  }

  /// GET /ESLTestMachine/get-by-table?testTableId=X
  /// — lấy danh sách máy test thuộc một bàn test.
  Future<BaseData<List<TestMachineItem>>> getTestMachineByTable({
    required int testTableId,
  }) async {
    return get<BaseData<List<TestMachineItem>>>(
      ApiEndPoint.getTestMachineByTable,
      query: {'testTableId': testTableId},
      parser: (json) => _parseList(
        json,
        TestMachineItem.fromJson,
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
