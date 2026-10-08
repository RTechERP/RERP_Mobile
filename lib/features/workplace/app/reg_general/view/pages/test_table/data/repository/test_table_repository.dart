import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../common/logger/index.dart';
import '../datasource/models/test_table_model.dart';

/// Repository lưu trữ local cho lookup data của feature TestTable — dùng
/// [SharedPreferences] để cache 4 list lookup (bàn test / nhân viên / dự án /
/// người duyệt), giúp màn Add/Edit/QR dùng dữ liệu ngay khi mở mà không phải
/// gọi lại 4 API mỗi lần.
///
/// Cache scope: per-user (key ghép với employeeId). Khi chưa có currentUser
/// (vd: QR scan trước khi mở list) dùng key dùng chung `0`.
///
/// Toàn bộ API là [static] để dùng thẳng từ bloc mà không cần inject / DI
/// — giống pattern [WorkTripRepository].
class TestTableRepository {
  TestTableRepository._();

  // Bump khi đổi model/payload mapping để auto invalidate cache cũ.
  static const _cacheVersion = 1;
  static const _lookupCacheKeyPrefix = 'test_table_lookup_cache_v1';

  static String _lookupCacheKey(int employeeId) =>
      '${_lookupCacheKeyPrefix}_$employeeId';

  // ── Lookup cache (gộp 4 list) ───────────────────────────────────

  /// Lưu cache 4 list lookup cho [employeeId].
  ///
  /// [fetchedAt] mặc định = now (UTC). Có thể truyền từ ngoài để đồng bộ
  /// nếu cùng 1 batch API.
  static Future<void> saveLookupCache({
    required int employeeId,
    required List<TestTableItem> testTables,
    required List<EmployeeInfoItem> employees,
    required List<ProjectItem> projects,
    required List<ApproverItem> approvers,
    DateTime? fetchedAt,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final payload = <String, dynamic>{
      'version': _cacheVersion,
      'employeeId': employeeId,
      'fetchedAt': (fetchedAt ?? DateTime.now().toUtc()).toIso8601String(),
      'testTables': testTables.map((e) => e.toJson()).toList(),
      'employees': employees.map((e) => e.toJson()).toList(),
      'projects': projects.map((e) => e.toJson()).toList(),
      'approvers': approvers.map((e) => e.toJson()).toList(),
    };

    await prefs.setString(_lookupCacheKey(employeeId), jsonEncode(payload));
    log?.logI(
      'TestTable lookup cache saved (user=$employeeId, '
      'tt=${testTables.length}, emp=${employees.length}, '
      'proj=${projects.length}, appr=${approvers.length})',
    );
  }

  /// Đọc cache cho [employeeId]. Trả `null` nếu chưa có / version lệch /
  /// parse lỗi (đồng thời tự xoá cache hỏng).
  static Future<TestTableLookupCache?> getLookupCache({
    required int employeeId,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_lookupCacheKey(employeeId));

    if (raw == null) {
      log?.logW('TestTable lookup cache: null (user=$employeeId)');
      return null;
    }

    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final version = map['version'] as int? ?? 1;
      if (version != _cacheVersion) {
        await prefs.remove(_lookupCacheKey(employeeId));
        log?.logW('TestTable lookup cache version mismatch -> removed');
        return null;
      }

      final cachedEmployeeId = map['employeeId'] as int?;
      final fetchedAtRaw = map['fetchedAt'] as String?;
      if (cachedEmployeeId == null ||
          cachedEmployeeId != employeeId ||
          fetchedAtRaw == null) {
        await prefs.remove(_lookupCacheKey(employeeId));
        log?.logW('TestTable lookup cache invalid -> removed');
        return null;
      }

      final testTables = (map['testTables'] as List? ?? const [])
          .map((e) => TestTableItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final employees = (map['employees'] as List? ?? const [])
          .map((e) => EmployeeInfoItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final projects = (map['projects'] as List? ?? const [])
          .map((e) => ProjectItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final approvers = (map['approvers'] as List? ?? const [])
          .map((e) => ApproverItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      return TestTableLookupCache(
        employeeId: cachedEmployeeId,
        fetchedAt: DateTime.parse(fetchedAtRaw).toUtc(),
        testTables: testTables,
        employees: employees,
        projects: projects,
        approvers: approvers,
      );
    } catch (e) {
      await prefs.remove(_lookupCacheKey(employeeId));
      log?.logE('Parse test_table lookup cache failed -> removed: $e');
      return null;
    }
  }

  /// Xoá cache cho [employeeId]. Gọi khi user logout / switch tài khoản.
  static Future<void> clearLookupCache({
    required int employeeId,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lookupCacheKey(employeeId));
    log?.logI('TestTable lookup cache cleared (user=$employeeId)');
  }
}

/// DTO cache cho toàn bộ lookup data.
class TestTableLookupCache {
  final int employeeId;
  final DateTime fetchedAt;
  final List<TestTableItem> testTables;
  final List<EmployeeInfoItem> employees;
  final List<ProjectItem> projects;
  final List<ApproverItem> approvers;

  const TestTableLookupCache({
    required this.employeeId,
    required this.fetchedAt,
    required this.testTables,
    required this.employees,
    required this.projects,
    required this.approvers,
  });

  /// Cache "dùng được" khi có đủ 4 list lookup cần thiết (testTables có thể
  /// rỗng nếu chưa cấu hình bàn, các list khác phải có ít nhất 1 phần tử).
  bool get isUsable =>
      testTables.isNotEmpty ||
      employees.isNotEmpty ||
      projects.isNotEmpty ||
      approvers.isNotEmpty;
}
