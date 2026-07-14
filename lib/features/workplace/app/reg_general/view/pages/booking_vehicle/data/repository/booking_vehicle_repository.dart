import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../common/logger/index.dart';
import '../datasource/models/booking_vehicle_model.dart';

class BookingVehicleRepository {
  BookingVehicleRepository._();

  // Bump khi đổi model/payload mapping để auto invalidate cache cũ.
  static const _cacheVersion = 2;
  static const _initAddCacheKey = 'booking_vehicle_init_add_cache_v1';
  static const _currentUserCacheKey = 'booking_vehicle_current_user_cache_v1';
  static const _projectsCacheKey = 'booking_vehicle_projects_cache_v1';
  static const _approversCacheKey = 'booking_vehicle_approvers_cache_v1';

  //---(Projects in-memory cache)---//
  // Cho phép form đọc cache ngay lập tức (sync) — không cần qua state/projects
  // cũng không cần FutureBuilder. Preload 1 lần qua [loadProjectsCacheToMemory].
  static List<BookingVehicleProjectItem> _cachedProjects = const [];
  static bool _projectsCacheLoaded = false;

  /// Sync getter — trả về list đã được hydrate từ SharedPreferences.
  /// Trả `const []` nếu chưa load hoặc cache rỗng.
  static List<BookingVehicleProjectItem> get projectsSync => _cachedProjects;

  /// Hydrate in-memory cache từ SharedPreferences (an toàn gọi nhiều lần).
  /// Trả về list sau khi load — phù hợp cho [fire-and-await 1 lần ở _onInit].
  static Future<List<BookingVehicleProjectItem>>
      loadProjectsCacheToMemory({LogUtils? log}) async {
    if (_projectsCacheLoaded) return _cachedProjects;
    final cache = await getProjectsCache(log: log);
    _cachedProjects = cache?.projects ?? const [];
    _projectsCacheLoaded = true;
    log?.logI(
        'Booking vehicle projects in-memory cache hydrated: ${_cachedProjects.length} items');
    return _cachedProjects;
  }

  //---(Approvers in-memory cache)---//
  // Cùng pattern với projects — preload từ màn list, form đọc sync tại Add/Edit.
  static List<ApproverItem> _cachedApprovers = const [];
  static bool _approversCacheLoaded = false;

  /// Sync getter — trả về list người duyệt đã hydrate từ SharedPreferences.
  static List<ApproverItem> get approversSync => _cachedApprovers;

  /// Hydrate in-memory cache approvers từ SharedPreferences.
  static Future<List<ApproverItem>> loadApproversCacheToMemory({
    LogUtils? log,
  }) async {
    if (_approversCacheLoaded) return _cachedApprovers;
    final cache = await getApproversCache(log: log);
    _cachedApprovers = cache?.approvers ?? const [];
    _approversCacheLoaded = true;
    log?.logI(
        'Booking vehicle approvers in-memory cache hydrated: ${_cachedApprovers.length} items');
    return _cachedApprovers;
  }

  static Future<void> saveInitAddCache({
    required int employeeId,
    required List<ProvinceArrivesItem> provinceArrives,
    required List<ProvinceDepartureItem> provinceDeparture,
    required List<BookingVehiclePersonalItem> employees,
    required List<BookingVehicleProjectItem> projects,
    required List<ApproverItem> approvers,
    required BookingVehiclePersonalItem? currentEmployee,
    DateTime? fetchedAt,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final payload = <String, dynamic>{
      'version': _cacheVersion,
      'employeeId': employeeId,
      'fetchedAt': (fetchedAt ?? DateTime.now().toUtc()).toIso8601String(),
      'provinceArrives': provinceArrives.map((e) => e.toJson()).toList(),
      'provinceDeparture': provinceDeparture.map((e) => e.toJson()).toList(),
      'employees': employees.map((e) => e.toJson()).toList(),
      'projects': projects.map((e) => e.toJson()).toList(),
      'approvers': approvers.map((e) => e.toJson()).toList(),
      'currentEmployee': currentEmployee?.toJson(),
    };

    await prefs.setString(_initAddCacheKey, jsonEncode(payload));
    log?.logI('Booking vehicle initAdd cache saved');
  }

  static Future<BookingVehicleInitAddCache?> getInitAddCache({
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_initAddCacheKey);

    if (raw == null) {
      log?.logW('Booking vehicle initAdd cache: null');
      return null;
    }

    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final version = map['version'] as int? ?? 1;
      if (version != _cacheVersion) {
        await prefs.remove(_initAddCacheKey);
        log?.logW('Booking vehicle initAdd cache version mismatch -> removed');
        return null;
      }

      final employeeId = map['employeeId'] as int?;
      final fetchedAtRaw = map['fetchedAt'] as String?;

      if (employeeId == null || fetchedAtRaw == null) {
        await prefs.remove(_initAddCacheKey);
        log?.logW('Booking vehicle initAdd cache invalid -> removed');
        return null;
      }

      final provinceArrives = (map['provinceArrives'] as List? ?? const [])
          .map((e) => ProvinceArrivesItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final provinceDeparture =
          (map['provinceDeparture'] as List? ?? const [])
              .map((e) => ProvinceDepartureItem.fromJson(Map<String, dynamic>.from(e)))
              .toList();
      final employees = (map['employees'] as List? ?? const [])
          .map((e) => BookingVehiclePersonalItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final projects = (map['projects'] as List? ?? const [])
          .map((e) => BookingVehicleProjectItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final approvers = (map['approvers'] as List? ?? const [])
          .map((e) => ApproverItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      final currentEmployeeMap = map['currentEmployee'];
      BookingVehiclePersonalItem? currentEmployee;
      if (currentEmployeeMap is Map<String, dynamic>) {
        currentEmployee = BookingVehiclePersonalItem.fromJson(currentEmployeeMap);
      } else if (currentEmployeeMap is Map) {
        currentEmployee = BookingVehiclePersonalItem.fromJson(
          Map<String, dynamic>.from(currentEmployeeMap),
        );
      }

      return BookingVehicleInitAddCache(
        employeeId: employeeId,
        fetchedAt: DateTime.parse(fetchedAtRaw).toUtc(),
        provinceArrives: provinceArrives,
        provinceDeparture: provinceDeparture,
        employees: employees,
        projects: projects,
        approvers: approvers,
        currentEmployee: currentEmployee,
      );
    } catch (e) {
      await prefs.remove(_initAddCacheKey);
      log?.logE('Parse booking vehicle initAdd cache failed -> removed');
      return null;
    }
  }

  static Future<void> clearInitAddCache({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_initAddCacheKey);
    log?.logI('Booking vehicle initAdd cache cleared');
  }

  //---(CurrentUser cache)---//

  static Future<void> saveCurrentUserCache({
    required BookingVehiclePersonalItem currentEmployee,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _currentUserCacheKey,
      jsonEncode(currentEmployee.toJson()),
    );
    log?.logI('✅ Booking vehicle currentUser cache saved: ${currentEmployee.fullName}');
  }

  static Future<BookingVehiclePersonalItem?> getCurrentUserCache({
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_currentUserCacheKey);
    if (raw == null) {
      log?.logW('Booking vehicle currentUser cache: null');
      return null;
    }
    try {
      return BookingVehiclePersonalItem.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (e) {
      await prefs.remove(_currentUserCacheKey);
      log?.logE('Parse currentUser cache failed → removed: $e');
      return null;
    }
  }

  static Future<void> clearCurrentUserCache({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentUserCacheKey);
    log?.logI('🏁 Booking vehicle currentUser cache cleared');
  }

  static Future<bool> isInitAddCacheValid({
    required int employeeId,
    Duration ttl = const Duration(minutes: 2),
    LogUtils? log,
  }) async {
    final cache = await getInitAddCache(log: log);
    if (cache == null) return false;
    if (cache.employeeId != employeeId) return false;
    return DateTime.now().toUtc().difference(cache.fetchedAt) <= ttl;
  }

  //---(Projects cache)---//
  // Cache riêng cho getProject — preload từ màn list, màn Add/Edit chỉ đọc.
  // Độc lập với initAddCache để dễ invalidate / refresh riêng.

  static Future<void> saveProjectsCache({
    required List<BookingVehicleProjectItem> projects,
    DateTime? fetchedAt,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final payload = <String, dynamic>{
      'version': _cacheVersion,
      'fetchedAt': (fetchedAt ?? DateTime.now().toUtc()).toIso8601String(),
      'projects': projects.map((e) => e.toJson()).toList(),
    };

    await prefs.setString(_projectsCacheKey, jsonEncode(payload));
    // Cập nhật in-memory cache để form đọc ngay không cần đợi load.
    _cachedProjects = List.unmodifiable(projects);
    _projectsCacheLoaded = true;
    log?.logI('Booking vehicle projects cache saved: ${projects.length} items');
  }

  static Future<BookingVehicleProjectsCache?> getProjectsCache({
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_projectsCacheKey);

    if (raw == null) {
      log?.logW('Booking vehicle projects cache: null');
      return null;
    }

    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final version = map['version'] as int? ?? 1;
      if (version != _cacheVersion) {
        await prefs.remove(_projectsCacheKey);
        log?.logW('Booking vehicle projects cache version mismatch -> removed');
        return null;
      }

      final fetchedAtRaw = map['fetchedAt'] as String?;
      if (fetchedAtRaw == null) {
        await prefs.remove(_projectsCacheKey);
        log?.logW('Booking vehicle projects cache invalid -> removed');
        return null;
      }

      final projects = (map['projects'] as List? ?? const [])
          .map((e) => BookingVehicleProjectItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      return BookingVehicleProjectsCache(
        fetchedAt: DateTime.parse(fetchedAtRaw).toUtc(),
        projects: projects,
      );
    } catch (e) {
      await prefs.remove(_projectsCacheKey);
      log?.logE('Parse booking vehicle projects cache failed -> removed: $e');
      return null;
    }
  }

  static Future<void> clearProjectsCache({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_projectsCacheKey);
    _cachedProjects = const [];
    _projectsCacheLoaded = true; // đã "loaded", chỉ là rỗng
    log?.logI('Booking vehicle projects cache cleared');
  }

  //---(Approvers persistence)---//

  static Future<void> saveApproversCache({
    required List<ApproverItem> approvers,
    DateTime? fetchedAt,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final payload = <String, dynamic>{
      'version': _cacheVersion,
      'fetchedAt': (fetchedAt ?? DateTime.now().toUtc()).toIso8601String(),
      'approvers': approvers.map((e) => e.toJson()).toList(),
    };

    await prefs.setString(_approversCacheKey, jsonEncode(payload));
    // Đồng bộ in-memory cache.
    _cachedApprovers = List.unmodifiable(approvers);
    _approversCacheLoaded = true;
    log?.logI('Booking vehicle approvers cache saved: ${approvers.length} items');
  }

  static Future<BookingVehicleApproversCache?> getApproversCache({
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_approversCacheKey);

    if (raw == null) {
      log?.logW('Booking vehicle approvers cache: null');
      return null;
    }

    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final version = map['version'] as int? ?? 1;
      if (version != _cacheVersion) {
        await prefs.remove(_approversCacheKey);
        log?.logW('Booking vehicle approvers cache version mismatch -> removed');
        return null;
      }

      final fetchedAtRaw = map['fetchedAt'] as String?;
      if (fetchedAtRaw == null) {
        await prefs.remove(_approversCacheKey);
        log?.logW('Booking vehicle approvers cache invalid -> removed');
        return null;
      }

      final approvers = (map['approvers'] as List? ?? const [])
          .map((e) => ApproverItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      return BookingVehicleApproversCache(
        fetchedAt: DateTime.parse(fetchedAtRaw).toUtc(),
        approvers: approvers,
      );
    } catch (e) {
      await prefs.remove(_approversCacheKey);
      log?.logE('Parse booking vehicle approvers cache failed -> removed: $e');
      return null;
    }
  }

  static Future<void> clearApproversCache({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_approversCacheKey);
    _cachedApprovers = const [];
    _approversCacheLoaded = true;
    log?.logI('Booking vehicle approvers cache cleared');
  }
}

class BookingVehicleInitAddCache {
  final int employeeId;
  final DateTime fetchedAt;
  final List<ProvinceArrivesItem> provinceArrives;
  final List<ProvinceDepartureItem> provinceDeparture;
  final List<BookingVehiclePersonalItem> employees;
  final List<BookingVehicleProjectItem> projects;
  final List<ApproverItem> approvers;
  final BookingVehiclePersonalItem? currentEmployee;

  const BookingVehicleInitAddCache({
    required this.employeeId,
    required this.fetchedAt,
    required this.provinceArrives,
    required this.provinceDeparture,
    required this.employees,
    required this.projects,
    required this.approvers,
    required this.currentEmployee,
  });
}

/// DTO cache riêng cho danh sách dự án (BookingVehicleProjectItem).
/// Preload từ màn list, màn Add/Edit chỉ việc đọc từ cache.
class BookingVehicleProjectsCache {
  final DateTime fetchedAt;
  final List<BookingVehicleProjectItem> projects;

  const BookingVehicleProjectsCache({
    required this.fetchedAt,
    required this.projects,
  });
}

/// DTO cache riêng cho danh sách người duyệt (ApproverItem).
/// Preload từ màn list, màn Add/Edit chỉ việc đọc từ cache.
class BookingVehicleApproversCache {
  final DateTime fetchedAt;
  final List<ApproverItem> approvers;

  const BookingVehicleApproversCache({
    required this.fetchedAt,
    required this.approvers,
  });
}

