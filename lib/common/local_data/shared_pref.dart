import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../di/injection.dart';

abstract class LocalStorage {
  Future<T?> get<T>(String key);

  Future<T?> getStringList<T>(String key);

  Future<bool> validateKey(String key);

  Future<bool> remove(String key);

  Future<bool> clearSession();

  Future<void> reload();

  Future<dynamic> save(String key, dynamic value);

  Future<bool> getBool(String key);
  Future<void> setBool(String key, bool value);

  Future<void> saveProjectList(String key, List<Map<String, dynamic>> projects);
  Future<List<Map<String, dynamic>>?> getProjectList(String key);
  Future<void> removeProjectList(String key);
}

@Injectable(as: LocalStorage)
class LocalStorageImpl extends LocalStorage {
  Future<dynamic> _doWork(Function(SharedPreferences) work) {
    return SharedPreferences.getInstance()
        .then(work)
        .catchError((e) => throw Exception(e));
  }

  @override
  Future<T?> get<T>(String key) async {
    return await _doWork((pref) {
      if (!pref.containsKey(key)) {
        return null;
      }

      // Nếu là đối tượng, lấy chuỗi JSON và khôi phục lại thành Map
      if (T == Map<String, dynamic>) {
        String? jsonString = pref.getString(key);
        if (jsonString != null) {
          return jsonDecode(jsonString) as T;
        } else {
          return null;
        }
      }

      // Các loại dữ liệu khác
      return pref.get(key);
    }).catchError((e) => throw Exception(e)) as T?;
  }

  @override
  Future<T?> getStringList<T>(String key) async {
    return await _doWork((pref) {
      return (pref.containsKey(key)) ? pref.getStringList(key) : null;
    }).catchError((e) => throw Exception(e)) as T?;
  }

  @override
  Future<bool> validateKey(String key) async {
    return await _doWork((pref) {
      return pref.containsKey(key);
    }).catchError((e) => throw Exception(e)) as bool;
  }

  @override
  Future<bool> remove(String key) async {
    return await _doWork((pref) {
      return pref.remove(key);
    }).catchError((e) => throw Exception(e)) as bool;
  }

  @override
  Future<bool> clearSession() async {
    return await _doWork((pref) {
      return pref.clear();
    }).catchError((e) => throw Exception(e)) as bool;
  }

  @override
  Future<void> reload() {
    return _doWork((pref) {
      pref.reload();
    }).catchError((e) => throw Exception(e));
  }

  @override
  Future<dynamic> save(String key, value) {
    return _doWork((pref) {
      try {
        if (value is String) {
          return pref.setString(key, value);
        } else if (value is int) {
          return pref.setInt(key, value);
        } else if (value is bool) {
          return pref.setBool(key, value);
        } else if (value is double) {
          return pref.setDouble(key, value);
        } else if (value is List<String>) {
          return pref.setStringList(key, value);
        } else if (value is Map<String, dynamic>) {
          // Lưu đối tượng dưới dạng JSON
          String jsonString = jsonEncode(value);
          return pref.setString(key, jsonString);
        } else {
          throw Exception('Type ${value.runtimeType} is undefined');
        }
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        throw Exception('Failed to save $key: ${value.toString()}');
      }
    }).catchError((e) => throw Exception(e));
  }

  @override
  Future<bool> getBool(String key) async {
    return await _doWork((pref) {
      return pref.getBool(key) ?? false;
    }).catchError((e) => throw Exception(e));
  }

  @override
  Future<void> setBool(String key, bool value) async {
    return await _doWork((pref) async {
      await pref.setBool(key, value);
    }).catchError((e) => throw Exception(e));
  }

  @override
  Future<void> saveProjectList(
      String key, List<Map<String, dynamic>> projects) async {
    final jsonString = jsonEncode(projects);
    await _doWork((pref) => pref.setString(key, jsonString))
        .catchError((e) => throw Exception(e));
  }

  @override
  Future<List<Map<String, dynamic>>?> getProjectList(String key) async {
    return await _doWork((pref) {
      final jsonString = pref.getString(key);
      if (jsonString == null) return null;
      final decoded = jsonDecode(jsonString) as List;
      return decoded.cast<Map<String, dynamic>>();
    }).catchError((e) => null);
  }

  @override
  Future<void> removeProjectList(String key) async {
    await _doWork((pref) => pref.remove(key))
        .catchError((e) => throw Exception(e));
  }
}

class LocalStorageService {
  static const _firstLoginDialogKeyPrefix = 'firstLoginDialogShown_';

  static Future<bool> hasShownFirstLoginDialog(String userId) async {
    final key = '$_firstLoginDialogKeyPrefix$userId';
    return await getIt<LocalStorage>().getBool(key);
  }

  static Future<void> markFirstLoginDialogAsShown(String userId) async {
    final key = '$_firstLoginDialogKeyPrefix$userId';
    await getIt<LocalStorage>().setBool(key, true);
  }
}
