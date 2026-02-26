import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';

import '../../../../common/logger/index.dart';
import '../../../../di/injection.dart';
import '../datasource/models/user_model.dart';
import 'auth_repo.dart';

class AuthRepository {
  AuthRepository._();

  static const _tokenKey = 'access_token';
  static const _expiresKey = 'access_token_expires';

  static const _userKey = 'current_user';

  /// ==========================
  /// SAVE LOGIN INFO
  /// ==========================
  static Future<void> saveLogin({
    required String token,
    required DateTime expires,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_tokenKey, token);
    await prefs.setString(_expiresKey, expires.toUtc().toIso8601String());

    log?.logI('AccessToken saved');
    log?.logD('Token expires at: $expires');
  }

  /// ==========================
  /// GET TOKEN
  /// ==========================
  static Future<String?> getToken({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);

    token != null
        ? log?.logD('Get accessToken')
        : log?.logW('Get accessToken: null');

    return token;
  }

  /// ==========================
  /// GET EXPIRES
  /// ==========================
  static Future<DateTime?> getExpires({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_expiresKey);

    if (raw == null) {
      log?.logW('Get expires: null');
      return null;
    }

    final expires = DateTime.parse(raw).toUtc();
    log?.logD('Get expires: $expires');

    return expires;
  }

  /// ==========================
  /// CLEAR LOGIN
  /// ==========================
  static Future<void> clearToken({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_expiresKey);

    log?.logI('AccessToken cleared');
  }

  /// ==========================
  /// CHECK LOGIN + AUTO LOGOUT
  /// ==========================
  static Future<bool> checkLogin({LogUtils? log}) async {
    final token = await getToken(log: log);
    final expires = await getExpires(log: log);

    if (token == null || expires == null) {
      log?.logI('Check login: false (missing token/expires)');
      return false;
    }

    final now = DateTime.now().toUtc();
    final isExpired = now.isAfter(expires);

    log?.logI('Now: $now');
    log?.logI('Expires: $expires');
    log?.logI('Expired: $isExpired');

    if (isExpired) {
      await clearToken(log: log);
      return false;
    }

    return true;
  }

  /// ==========================
  /// SAVE + GET + CLEAR CURRENT USER
  /// ==========================
  static Future<void> saveCurrentUser({
    required User user,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_userKey, jsonEncode(user.toJson()));

    log?.logI('Current user saved');
  }

  static Future<User?> getCurrentUser({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_userKey);

    if (raw == null) {
      log?.logW('Get current user: null');
      return null;
    }

    try {
      final user = User.fromJson(jsonDecode(raw));
      log?.logD(
        'Get current user: ${user.fullName} & ${user.departmentId} & ${user.departmentName}',
      );
      return user;
    } catch (e) {
      log?.logE('Parse cached user failed → clear cache');
      await prefs.remove(_userKey);
      return null;
    }
  }

  static Future<void> clearUser({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    log?.logI('Current user cleared');
  }

  static Future<User?> fetchAndSaveCurrentUser({
    LogUtils? log,
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        final cached = await getCurrentUser(log: log);
        if (cached != null) {
          log?.logI('Use cached current user');
          return cached;
        }
      }

      final authRepo = getIt<AuthRepo>();
      final res = await authRepo.getCurrentUser();

      return await res.fold(
        (l) async {
          log?.logE('Get current user failed: ${l.getErrorMessage}');

          /// ✅ Xử lý 401 theo BaseError hiện tại
          l.when(
            httpInternalServerError: (_) {},
            httpUnAuthorizedError: () async {
              log?.logW('Unauthorized → clear all');
              await clearAll(log: log);
            },
            httpUnknownError: (_) {},
          );

          return null;
        },
        (user) async {
          if (user == null) {
            log?.logW('User is null, skip save');
            return null;
          }

          await saveCurrentUser(user: user, log: log);
          return user;
        },
      );
    } catch (e, s) {
      log?.logE('Fetch user exception: $e');
      log?.logD('$s');
      return null;
    }
  }

  static Future<bool> isLoggedInAndValid({LogUtils? log}) async {
    final token = await getToken(log: log);
    final expires = await getExpires(log: log);

    if (token == null || expires == null) {
      log?.logI('Auth invalid: missing token/expires');
      return false;
    }

    final now = DateTime.now().toUtc();
    final isExpired = now.isAfter(expires);

    if (isExpired) {
      log?.logW('Auth expired → clear all');
      await clearAll(log: log);
      return false;
    }

    return true;
  }

  static Future<void> clearAll({LogUtils? log}) async {
    await clearToken(log: log);
    await clearUser(log: log);
  }
}
