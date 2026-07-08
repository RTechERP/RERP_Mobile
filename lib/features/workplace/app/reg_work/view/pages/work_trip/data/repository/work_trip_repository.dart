import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../common/logger/index.dart';
import '../datasource/models/work_trip_model.dart';

/// Repository lưu trữ local cho feature WorkTrip — dùng [SharedPreferences]
/// để cache danh sách approvers / projects / types / vehicles / fillApprover,
/// giúp màn Add hiển thị form đầy đủ ngay khi mở mà không phải chờ gọi API.
///
/// Cache scope: per-user (key ghép với employeeId). Toàn bộ API là [static]
/// để dùng thẳng từ bloc mà không cần inject / DI.
class WorkTripRepository {
  WorkTripRepository._();

  // Bump khi đổi model/payload mapping để auto invalidate cache cũ.
  static const _cacheVersion = 1;
  static const _initAddCacheKeyPrefix = 'work_trip_init_add_cache_v1';

  static String _initAddCacheKey(int employeeId) =>
      '${_initAddCacheKeyPrefix}_$employeeId';

  // ── Init add cache (gộp tất cả fields) ───────────────────────────────

  static Future<void> saveInitAddCache({
    required int employeeId,
    required List<ApproverItem> approvers,
    required List<WorkTripProject> projects,
    required List<WorkTripTypeItem> types,
    required List<WorkTripTypeVehicle> vehicles,
    FillApproverItem? fillApprover,
    DateTime? fetchedAt,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final payload = <String, dynamic>{
      'version': _cacheVersion,
      'employeeId': employeeId,
      'fetchedAt': (fetchedAt ?? DateTime.now().toUtc()).toIso8601String(),
      'approvers': approvers.map((e) => e.toJson()).toList(),
      'projects': projects.map((e) => e.toJson()).toList(),
      'types': types.map((e) => e.toJson()).toList(),
      'vehicles': vehicles.map((e) => e.toJson()).toList(),
      'fillApprover': fillApprover?.toJson(),
    };

    await prefs.setString(_initAddCacheKey(employeeId), jsonEncode(payload));
    log?.logI('WorkTrip initAdd cache saved for user=$employeeId');
  }

  static Future<WorkTripInitAddCache?> getInitAddCache({
    required int employeeId,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_initAddCacheKey(employeeId));

    if (raw == null) {
      log?.logW('WorkTrip initAdd cache: null (user=$employeeId)');
      return null;
    }

    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final version = map['version'] as int? ?? 1;
      if (version != _cacheVersion) {
        await prefs.remove(_initAddCacheKey(employeeId));
        log?.logW('WorkTrip initAdd cache version mismatch -> removed');
        return null;
      }

      final cachedEmployeeId = map['employeeId'] as int?;
      final fetchedAtRaw = map['fetchedAt'] as String?;
      if (cachedEmployeeId == null ||
          cachedEmployeeId != employeeId ||
          fetchedAtRaw == null) {
        await prefs.remove(_initAddCacheKey(employeeId));
        log?.logW('WorkTrip initAdd cache invalid -> removed');
        return null;
      }

      final approvers = (map['approvers'] as List? ?? const [])
          .map((e) => ApproverItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final projects = (map['projects'] as List? ?? const [])
          .map((e) => WorkTripProject.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final types = (map['types'] as List? ?? const [])
          .map((e) => WorkTripTypeItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final vehicles = (map['vehicles'] as List? ?? const [])
          .map((e) => WorkTripTypeVehicle.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      FillApproverItem? fillApprover;
      final rawFillApprover = map['fillApprover'];
      if (rawFillApprover is Map<String, dynamic>) {
        fillApprover = FillApproverItem.fromJson(rawFillApprover);
      } else if (rawFillApprover is Map) {
        fillApprover =
            FillApproverItem.fromJson(Map<String, dynamic>.from(rawFillApprover));
      }

      return WorkTripInitAddCache(
        employeeId: cachedEmployeeId,
        fetchedAt: DateTime.parse(fetchedAtRaw).toUtc(),
        approvers: approvers,
        projects: projects,
        types: types,
        vehicles: vehicles,
        fillApprover: fillApprover,
      );
    } catch (e) {
      await prefs.remove(_initAddCacheKey(employeeId));
      log?.logE('Parse work_trip initAdd cache failed -> removed: $e');
      return null;
    }
  }

  static Future<void> clearInitAddCache({
    required int employeeId,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_initAddCacheKey(employeeId));
    log?.logI('WorkTrip initAdd cache cleared (user=$employeeId)');
  }
}

/// DTO cache cho toàn bộ dữ liệu form Add.
class WorkTripInitAddCache {
  final int employeeId;
  final DateTime fetchedAt;
  final List<ApproverItem> approvers;
  final List<WorkTripProject> projects;
  final List<WorkTripTypeItem> types;
  final List<WorkTripTypeVehicle> vehicles;
  final FillApproverItem? fillApprover;

  const WorkTripInitAddCache({
    required this.employeeId,
    required this.fetchedAt,
    required this.approvers,
    required this.projects,
    required this.types,
    required this.vehicles,
    this.fillApprover,
  });

  /// Cache "dùng được" khi có đủ dữ liệu cần thiết.
  bool get isUsable =>
      approvers.isNotEmpty &&
      types.isNotEmpty &&
      vehicles.isNotEmpty &&
      projects.isNotEmpty;
}
