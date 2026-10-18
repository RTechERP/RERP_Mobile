import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../datasource/models/contact_model.dart';

/// Repository lưu trữ local cho feature Contact — dùng [SharedPreferences]
/// để cache danh sách contacts, giúp hiển thị ngay khi mở mà không phải chờ gọi API.
class ContactRepository {
  ContactRepository._();

  static const _cacheVersion = 1;
  static const _contactCacheKey = 'contact_cache_v$_cacheVersion';
  static const _contactCacheTimestampKey = 'contact_cache_timestamp_v$_cacheVersion';
  static const _cacheDuration = Duration(hours: 1);

  /// Lưu contacts vào SharedPreferences.
  static Future<void> saveContactCache(List<ContactPersonalItem> contacts) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = contacts.map((c) => c.toJson()).toList();
    await prefs.setString(_contactCacheKey, jsonEncode(jsonList));
    await prefs.setString(
      _contactCacheTimestampKey,
      DateTime.now().toUtc().toIso8601String(),
    );
  }

  /// Lấy contacts từ SharedPreferences.
  static Future<List<ContactPersonalItem>?> getContactCache() async {
    final prefs = await SharedPreferences.getInstance();
    final timestampStr = prefs.getString(_contactCacheTimestampKey);

    if (timestampStr == null) return null;

    final timestamp = DateTime.tryParse(timestampStr);
    if (timestamp == null) return null;

    // Check if cache is still valid
    if (DateTime.now().toUtc().difference(timestamp) > _cacheDuration) {
      return null;
    }

    final raw = prefs.getString(_contactCacheKey);
    if (raw == null) return null;

    try {
      final decoded = jsonDecode(raw) as List;
      return decoded
          .map((json) => ContactPersonalItem.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return null;
    }
  }

  /// Xóa cache contacts.
  static Future<void> clearContactCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_contactCacheKey);
    await prefs.remove(_contactCacheTimestampKey);
  }
}
