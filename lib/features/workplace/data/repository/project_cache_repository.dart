import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/logger/index.dart';

/// Danh sách key cache dự án của toàn bộ các chức năng.
///
/// Mỗi chức năng dùng một key riêng vì model của mỗi API khác nhau — cache
/// lưu map thô (JSON) nên chỉ đọc lại được bằng đúng model đã ghi.
///
/// Danh sách này là nguồn sự thật duy nhất để xoá cache khi đăng xuất /
/// hết phiên, tránh sót dữ liệu của user trước cho user sau.
class ProjectCacheKeys {
  ProjectCacheKeys._();

  // ===== Reports (tech / ad / agv) =====
  static const String reports = 'cached_projects';

  // ===== Reg general =====
  static const String bookingGuestHouse = 'cached_projects_booking_guest_house';
  static const String bookingVehicle = 'cached_projects_booking_vehicle';
  static const String rentalVehicle = 'cached_projects_rental_vehicle';
  static const String testTable = 'cached_projects_test_table';
  static const String workCategory = 'cached_projects_work_category';

  // ===== Reg work =====
  static const String overtime = 'cached_projects_overtime';
  static const String workTrip = 'cached_projects_work_trip';

  // ===== Cache dự án dạng "gộp" (không scope theo user) =====
  // Các key dưới đây chứa danh sách dự án nhưng không gắn employeeId nên
  // có thể sót dữ liệu của user trước cho user sau → phải xoá khi logout.

  /// WorkCategory — cache dự án + assigner + loại hạng mục.
  static const String workCategoryLookup = 'workProjects';

  /// BookingVehicle — cache danh sách dự án (đọc đồng bộ từ form Add).
  static const String bookingVehicleProjects = 'booking_vehicle_projects_cache_v1';

  /// BookingVehicle — cache gộp dữ liệu form Add (chứa cả dự án).
  static const String bookingVehicleInitAdd = 'booking_vehicle_init_add_cache_v1';

  /// WeekPlan — cache danh sách dự án dùng để lập kế hoạch tuần.
  static const String weekPlan = 'weekplan_projects_cache';

  /// SaleGDN — cache lookup gộp (chứa cả dự án).
  static const String saleGdnLookup = 'sale_gdn_lookup_cache_v1';

  // ===== Prefix cache scope theo employeeId =====
  // Dạng key: `${prefix}_$employeeId`. Xoá theo prefix để dọn sạch mọi user.

  /// TestTable — cache lookup gộp (chứa cả dự án).
  static const String testTableLookupPrefix = 'test_table_lookup_cache_v1';

  /// WorkTrip — cache gộp dữ liệu form Add (chứa cả dự án).
  static const String workTripInitAddPrefix = 'work_trip_init_add_cache_v1';

  /// Leave — cache gộp dữ liệu form Add (không chứa dự án).
  static const String leaveInitAddPrefix = 'leave_init_add_cache_v1';

  /// Tất cả key cache dự án — dùng để xoá tập trung khi logout.
  static const List<String> all = [
    reports,
    bookingGuestHouse,
    bookingVehicle,
    rentalVehicle,
    testTable,
    workCategory,
    overtime,
    workTrip,
    workCategoryLookup,
    bookingVehicleProjects,
    bookingVehicleInitAdd,
    weekPlan,
    saleGdnLookup,
  ];

  /// Các prefix cache scope theo employeeId — xoá theo prefix khi logout.
  static const List<String> allPrefixes = [
    testTableLookupPrefix,
    workTripInitAddPrefix,
    leaveInitAddPrefix,
  ];
}

/// Cache cục bộ cho danh sách dự án (project) của từng chức năng.
///
/// Cache hoạt động ở 2 chiều:
///
/// 1. Sau khi gọi API thành công → lưu lại danh sách mới nhất.
/// 2. Khi API lỗi mạng hoặc trả về rỗng → đọc cache để người dùng vẫn chọn
///    được dự án offline.
class ProjectCacheRepository {
  ProjectCacheRepository._();

  /// Lưu danh sách dự án vào cache.
  ///
  /// Bỏ qua list rỗng để không xoá cache hợp lệ khi API trả về rỗng.
  static Future<void> saveProjects<T>({
    required String cacheKey,
    required List<T> projects,
    required Map<String, dynamic> Function(T item) toJson,
  }) async {
    if (projects.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(projects.map(toJson).toList());
    await prefs.setString(cacheKey, raw);
  }

  /// Đọc danh sách dự án từ cache và map sang model theo [fromJson].
  ///
  /// Trả về list rỗng khi không có cache, cache lỗi, hoặc không có entry nào
  /// map được sang model.
  static Future<List<T>> getProjects<T>({
    required String cacheKey,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(cacheKey);
    if (raw == null || raw.isEmpty) return <T>[];

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return <T>[];

      final result = <T>[];
      for (final item in decoded) {
        if (item is! Map) continue;
        try {
          result.add(fromJson(Map<String, dynamic>.from(item)));
        } catch (_) {
          // Bỏ qua entry không parse được (shape khác) thay vì làm hỏng cả list.
        }
      }
      return result;
    } catch (_) {
      return <T>[];
    }
  }

  /// Xoá cache dự án theo [cacheKey].
  static Future<void> clearProjects({
    required String cacheKey,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(cacheKey);
    log?.logI('Projects cache cleared: $cacheKey');
  }

  /// Xoá toàn bộ cache dự án của mọi chức năng.
  ///
  /// Gọi khi đăng xuất / hết phiên để không sót dữ liệu dự án của user trước.
  static Future<void> clearAllProjects({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    for (final key in ProjectCacheKeys.all) {
      await prefs.remove(key);
    }

    // Xoá cache scope theo employeeId (dạng `${prefix}_$employeeId`).
    final allKeys = prefs.getKeys();
    var prefixCount = 0;
    for (final prefix in ProjectCacheKeys.allPrefixes) {
      for (final key in allKeys) {
        if (key.startsWith(prefix)) {
          await prefs.remove(key);
          prefixCount++;
        }
      }
    }

    log?.logI(
      'All projects caches cleared '
      '(${ProjectCacheKeys.all.length} keys + $prefixCount scoped)',
    );
  }
}
