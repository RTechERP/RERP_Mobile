import 'dart:convert';

import 'package:rtc_erp/common/logger/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Lookup data cache for SaleGDN.
/// Holds suppliers, senders, customers, projects, warehouses, productGroups, and users.
/// Pre-fetched on sale_gdn_screen.dart so detail screens have data ready synchronously.
class SaleGdnRepository {
  // =========================================================================
  // Cache keys and version
  // =========================================================================

  static const _cacheVersion = 1;
  static const _lookupCacheKey = 'sale_gdn_lookup_cache_v1';

  // =========================================================================
  // In-memory cache for lookup data
  // =========================================================================

  /// In-memory cache for lookup data (suppliers, senders, customers, etc.)
  /// Pre-fetched from sale_gdn_screen.dart so detail screen has data ready.
  static List<SupplierResponse> _cachedSuppliers = const [];
  static List<SenderResponse> _cachedSenders = const [];
  static List<CustomerResponse> _cachedCustomers = const [];
  static List<ProjectGDNResponse> _cachedProjects = const [];
  static List<WarehouseResponse> _cachedWarehouses = const [];
  static List<ProductGroupNewResponse> _cachedProductGroups = const [];
  static List<BillExportUserResponse> _cachedUsers = const [];
  static bool _lookupCacheLoaded = false;

  /// Sync getter for suppliers — returns cached list immediately.
  static List<SupplierResponse> get suppliersSync => _cachedSuppliers;

  /// Sync getter for senders — returns cached list immediately.
  static List<SenderResponse> get sendersSync => _cachedSenders;

  /// Sync getter for customers — returns cached list immediately.
  static List<CustomerResponse> get customersSync => _cachedCustomers;

  /// Sync getter for projects — returns cached list immediately.
  static List<ProjectGDNResponse> get projectsSync => _cachedProjects;

  /// Sync getter for warehouses — returns cached list immediately.
  static List<WarehouseResponse> get warehousesSync => _cachedWarehouses;

  /// Sync getter for product groups — returns cached list immediately.
  static List<ProductGroupNewResponse> get productGroupsSync =>
      _cachedProductGroups;

  /// Sync getter for users — returns cached list immediately.
  static List<BillExportUserResponse> get usersSync => _cachedUsers;

  /// Check if lookup cache has been loaded into memory.
  static bool get isLookupCacheLoaded => _lookupCacheLoaded;

  /// Hydrate in-memory cache from SharedPreferences.
  /// Fire-and-forget from sale_gdn_screen.dart, or await from detail screen.
  /// Returns true if cache was valid and hydrated, false otherwise.
  static Future<bool> loadLookupCacheToMemory({LogUtils? log}) async {
    if (_lookupCacheLoaded) return true;
    final cache = await getLookupCache(log: log);
    if (cache == null) {
      _lookupCacheLoaded = true; // Mark as loaded (but empty)
      return false;
    }
    _cachedSuppliers = List.unmodifiable(cache.suppliers);
    _cachedSenders = List.unmodifiable(cache.senders);
    _cachedCustomers = List.unmodifiable(cache.customers);
    _cachedProjects = List.unmodifiable(cache.projects);
    _cachedWarehouses = List.unmodifiable(cache.warehouses);
    _cachedProductGroups = List.unmodifiable(cache.productGroups);
    _cachedUsers = List.unmodifiable(cache.users);
    _lookupCacheLoaded = true;
    log?.logI(
        'SaleGdn lookup cache hydrated: ${cache.suppliers.length} suppliers, '
        '${cache.senders.length} senders, ${cache.customers.length} customers, '
        '${cache.projects.length} projects, ${cache.warehouses.length} warehouses, '
        '${cache.productGroups.length} productGroups, ${cache.users.length} users');
    return true;
  }

  /// Save all lookup data to SharedPreferences and update in-memory cache.
  static Future<void> saveLookupCache({
    required List<SupplierResponse> suppliers,
    required List<SenderResponse> senders,
    required List<CustomerResponse> customers,
    required List<ProjectGDNResponse> projects,
    required List<WarehouseResponse> warehouses,
    required List<ProductGroupNewResponse> productGroups,
    required List<BillExportUserResponse> users,
    DateTime? fetchedAt,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final payload = <String, dynamic>{
      'version': _cacheVersion,
      'fetchedAt': (fetchedAt ?? DateTime.now().toUtc()).toIso8601String(),
      'suppliers': suppliers.map((e) => e.toJson()).toList(),
      'senders': senders.map((e) => e.toJson()).toList(),
      'customers': customers.map((e) => e.toJson()).toList(),
      'projects': projects.map((e) => e.toJson()).toList(),
      'warehouses': warehouses.map((e) => e.toJson()).toList(),
      'productGroups': productGroups.map((e) => e.toJson()).toList(),
      'users': users.map((e) => e.toJson()).toList(),
    };
    await prefs.setString(_lookupCacheKey, jsonEncode(payload));

    // Update in-memory cache for immediate access
    _cachedSuppliers = List.unmodifiable(suppliers);
    _cachedSenders = List.unmodifiable(senders);
    _cachedCustomers = List.unmodifiable(customers);
    _cachedProjects = List.unmodifiable(projects);
    _cachedWarehouses = List.unmodifiable(warehouses);
    _cachedProductGroups = List.unmodifiable(productGroups);
    _cachedUsers = List.unmodifiable(users);
    _lookupCacheLoaded = true;

    log?.logI(
        'SaleGdn lookup cache saved: ${suppliers.length} suppliers, '
        '${senders.length} senders, ${customers.length} customers, '
        '${projects.length} projects, ${warehouses.length} warehouses, '
        '${productGroups.length} productGroups, ${users.length} users');
  }

  /// Load lookup cache from SharedPreferences.
  static Future<SaleGdnLookupCache?> getLookupCache({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_lookupCacheKey);
    if (raw == null) {
      log?.logW('SaleGdn lookup cache: null');
      return null;
    }
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final version = map['version'] as int? ?? 1;
      if (version != _cacheVersion) {
        await prefs.remove(_lookupCacheKey);
        log?.logW('SaleGdn lookup cache version mismatch -> removed');
        return null;
      }
      final fetchedAtRaw = map['fetchedAt'] as String?;
      if (fetchedAtRaw == null) {
        await prefs.remove(_lookupCacheKey);
        log?.logW('SaleGdn lookup cache invalid -> removed');
        return null;
      }

      final suppliers = (map['suppliers'] as List? ?? const [])
          .map((e) => SupplierResponse.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final senders = (map['senders'] as List? ?? const [])
          .map((e) => SenderResponse.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final customers = (map['customers'] as List? ?? const [])
          .map((e) => CustomerResponse.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final projects = (map['projects'] as List? ?? const [])
          .map((e) => ProjectGDNResponse.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final warehouses = (map['warehouses'] as List? ?? const [])
          .map((e) => WarehouseResponse.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final productGroups = (map['productGroups'] as List? ?? const [])
          .map((e) =>
              ProductGroupNewResponse.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      final users = (map['users'] as List? ?? const [])
          .map(
              (e) => BillExportUserResponse.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      return SaleGdnLookupCache(
        fetchedAt: DateTime.parse(fetchedAtRaw).toUtc(),
        suppliers: suppliers,
        senders: senders,
        customers: customers,
        projects: projects,
        warehouses: warehouses,
        productGroups: productGroups,
        users: users,
      );
    } catch (e) {
      await prefs.remove(_lookupCacheKey);
      log?.logE('Parse SaleGdn lookup cache failed -> removed: $e');
      return null;
    }
  }

  /// Check if lookup cache is still valid (within TTL).
  static Future<bool> isLookupCacheValid({
    Duration ttl = const Duration(minutes: 10),
    LogUtils? log,
  }) async {
    final cache = await getLookupCache(log: log);
    if (cache == null) return false;
    return DateTime.now().toUtc().difference(cache.fetchedAt) <= ttl;
  }

  /// Clear lookup cache from SharedPreferences and in-memory cache.
  static Future<void> clearLookupCache({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lookupCacheKey);
    _cachedSuppliers = const [];
    _cachedSenders = const [];
    _cachedCustomers = const [];
    _cachedProjects = const [];
    _cachedWarehouses = const [];
    _cachedProductGroups = const [];
    _cachedUsers = const [];
    _lookupCacheLoaded = false;
    log?.logI('SaleGdn lookup cache cleared');
  }
}
