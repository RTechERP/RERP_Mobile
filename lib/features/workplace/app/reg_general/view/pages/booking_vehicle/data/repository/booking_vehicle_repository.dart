import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../common/logger/index.dart';
import '../datasource/models/booking_vehicle_model.dart';

class BookingVehicleRepository {
  BookingVehicleRepository._();

  // Bump khi đổi model/payload mapping để auto invalidate cache cũ.
  static const _cacheVersion = 2;
  static const _initAddCacheKey = 'booking_vehicle_init_add_cache_v1';

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

