import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../common/logger/index.dart';
import '../datasource/models/leave_model.dart';

/// Repository lưu trữ local cho feature Leave — dùng [SharedPreferences]
/// để cache danh sách approvers / employees / leaveTime / approver mặc định,
/// giúp màn Add hiển thị form đầy đủ ngay khi mở mà không phải chờ gọi API.
///
/// Cache scope: per-user (key ghép với employeeId). Toàn bộ API là [static]
/// để dùng thẳng từ bloc mà không cần inject / DI.
class LeaveRepository {
  LeaveRepository._();

  // Bump khi đổi model/payload mapping để auto invalidate cache cũ.
  static const _cacheVersion = 1;
  static const _initAddCacheKeyPrefix = 'leave_init_add_cache_v1';

  static String _initAddCacheKey(int employeeId) =>
      '${_initAddCacheKeyPrefix}_$employeeId';

  // ── Init add cache (gộp tất cả fields) ───────────────────────────────

  static Future<void> saveInitAddCache({
    required int employeeId,
    required List<ApproverItem> approvers,
    required List<LeaveTimeItem> leaveTime,
    required List<EmployeeLeave> employees,
    FillApproverItem? defaultApprover,
    DateTime? fetchedAt,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final payload = <String, dynamic>{
      'version': _cacheVersion,
      'employeeId': employeeId,
      'fetchedAt': (fetchedAt ?? DateTime.now().toUtc()).toIso8601String(),
      'approvers': approvers.map((e) => e.toJson()).toList(),
      'leaveTime': leaveTime.map((e) => e.toJson()).toList(),
      'employees': employees.map((e) => e.toJson()).toList(),
      'defaultApprover': defaultApprover?.toJson(),
    };

    await prefs.setString(_initAddCacheKey(employeeId), jsonEncode(payload));
    log?.logI('Leave initAdd cache saved for user=$employeeId');
  }

  static Future<LeaveInitAddCache?> getInitAddCache({
    required int employeeId,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_initAddCacheKey(employeeId));

    if (raw == null) {
      log?.logW('Leave initAdd cache: null (user=$employeeId)');
      return null;
    }

    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final version = map['version'] as int? ?? 1;
      if (version != _cacheVersion) {
        await prefs.remove(_initAddCacheKey(employeeId));
        log?.logW('Leave initAdd cache version mismatch -> removed');
        return null;
      }

      final cachedEmployeeId = map['employeeId'] as int?;
      final fetchedAtRaw = map['fetchedAt'] as String?;
      if (cachedEmployeeId == null ||
          cachedEmployeeId != employeeId ||
          fetchedAtRaw == null) {
        await prefs.remove(_initAddCacheKey(employeeId));
        log?.logW('Leave initAdd cache invalid -> removed');
        return null;
      }

      final approvers = (map['approvers'] as List? ?? const [])
          .map((e) => ApproverItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final leaveTime = (map['leaveTime'] as List? ?? const [])
          .map((e) => LeaveTimeItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final employees = (map['employees'] as List? ?? const [])
          .map((e) => EmployeeLeave.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      FillApproverItem? defaultApprover;
      final rawDefault = map['defaultApprover'];
      if (rawDefault is Map<String, dynamic>) {
        defaultApprover = FillApproverItem.fromJson(rawDefault);
      } else if (rawDefault is Map) {
        defaultApprover =
            FillApproverItem.fromJson(Map<String, dynamic>.from(rawDefault));
      }

      return LeaveInitAddCache(
        employeeId: cachedEmployeeId,
        fetchedAt: DateTime.parse(fetchedAtRaw).toUtc(),
        approvers: approvers,
        leaveTime: leaveTime,
        employees: employees,
        defaultApprover: defaultApprover,
      );
    } catch (e) {
      await prefs.remove(_initAddCacheKey(employeeId));
      log?.logE('Parse leave initAdd cache failed -> removed: $e');
      return null;
    }
  }

  static Future<void> clearInitAddCache({
    required int employeeId,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_initAddCacheKey(employeeId));
    log?.logI('🏁 Leave initAdd cache cleared (user=$employeeId)');
  }
}

/// DTO cache cho toàn bộ dữ liệu form Add.
class LeaveInitAddCache {
  final int employeeId;
  final DateTime fetchedAt;
  final List<ApproverItem> approvers;
  final List<LeaveTimeItem> leaveTime;
  final List<EmployeeLeave> employees;
  final FillApproverItem? defaultApprover;

  const LeaveInitAddCache({
    required this.employeeId,
    required this.fetchedAt,
    required this.approvers,
    required this.leaveTime,
    required this.employees,
    this.defaultApprover,
  });

  /// Cache "dùng được" khi có approvers + leaveTime (form thiếu 2 cái này là không dùng được).
  bool get isUsable => approvers.isNotEmpty && leaveTime.isNotEmpty;
}