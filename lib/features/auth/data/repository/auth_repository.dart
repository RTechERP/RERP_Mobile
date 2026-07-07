// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Static helper cho auth local storage - token, user cache, scheduled logout

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';

import '../../../../common/logger/index.dart';
import '../../../../di/injection.dart';
import '../datasource/models/user_model.dart';
import 'auth_repo.dart';

/// Static helper xử lý local storage cho auth (token, user cache).
/// Không dùng @injectable - chỉ static methods, lấy AuthRepo qua getIt.
class AuthRepository {
  AuthRepository._();

  static const _tokenKey = 'access_token';
  static const _expiresKey = 'access_token_expires';

  static const _userKey = 'current_user';

  /// Ngày (local yyyy-MM-dd) neo phiên cho logout 23:30 + cơ chế bù hôm sau.
  static const _sessionAnchorLocalDateKey = 'auth_session_anchor_local_date';

  static String _localDateString(DateTime local) {
    final y = local.year.toString().padLeft(4, '0');
    final m = local.month.toString().padLeft(2, '0');
    final d = local.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  static String todayLocalDateString() => _localDateString(DateTime.now());

  //====================================//
  // SAVE LOGIN INFO
  //====================================//

  /// Lưu access token + expires vào SharedPreferences.
  /// Gán luôn sessionAnchor = hôm nay để tính logout tự động.
  static Future<void> saveLogin({
    required String token,
    required DateTime expires,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_tokenKey, token);
    await prefs.setString(_expiresKey, expires.toUtc().toIso8601String());
    await prefs.setString(
      _sessionAnchorLocalDateKey,
      _localDateString(DateTime.now()),
    );

    // log?.logI('AccessToken saved');
    // log?.logD('Token expires at: $expires');
  }

  //====================================//
  // GET TOKEN
  //====================================//

  /// Lấy access token từ SharedPreferences.
  static Future<String?> getToken({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);

    // token != null
    //     ? log?.logD('Get accessToken')
    //     : log?.logW('Get accessToken: null');

    return token;
  }

  //====================================//
  // GET EXPIRES
  //====================================//

  /// Lấy expires DateTime (UTC) từ SharedPreferences.
  static Future<DateTime?> getExpires({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_expiresKey);

    if (raw == null) {
      // log?.logW('Get expires: null');
      return null;
    }

    final expires = DateTime.parse(raw).toUtc();
    // log?.logD('Get expires: $expires');

    return expires;
  }

  //====================================//
  // CLEAR LOGIN
  //====================================//

  /// Xóa access token và expires khỏi SharedPreferences.
  static Future<void> clearToken({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_expiresKey);
    await prefs.remove(_sessionAnchorLocalDateKey);

    // log?.logI('AccessToken cleared');
  }

  /// Lấy ngày anchor local (đã lưu khi login).
  static Future<String?> getSessionAnchorLocalDate({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sessionAnchorLocalDateKey);
  }

  /// Gán anchor = hôm nay (local). Dùng khi upgrade app: đã có token nhưng chưa có anchor.
  static Future<void> ensureSessionAnchorLocalDate({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(_sessionAnchorLocalDateKey) != null) return;
    await prefs.setString(
      _sessionAnchorLocalDateKey,
      _localDateString(DateTime.now()),
    );
    // log?.logI('Session anchor date initialized (legacy / first run)');
  }

  //====================================//
  // CHECK LOGIN + AUTO LOGOUT
  //====================================//

  /// Kiểm tra token + expires còn hạn không. Nếu hết hạn → xóa token.
  static Future<bool> checkLogin({LogUtils? log}) async {
    final token = await getToken(log: log);
    final expires = await getExpires(log: log);

    if (token == null || expires == null) {
      // log?.logI('Check login: false (missing token/expires)');
      return false;
    }

    final now = DateTime.now().toUtc();
    final isExpired = now.isAfter(expires);

    // log?.logI('Now: $now');
    // log?.logI('Expires: $expires');
    // log?.logI('Expired: $isExpired');

    if (isExpired) {
      await clearToken(log: log);
      return false;
    }

    return true;
  }

  //====================================//
  // SAVE + GET + CLEAR CURRENT USER
  //====================================//

  /// Lưu user vào SharedPreferences (JSON).
  static Future<void> saveCurrentUser({
    required User user,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_userKey, jsonEncode(user.toJson()));

    // log?.logI('Current user saved');
  }

  /// Lấy user từ SharedPreferences, parse JSON → User model.
  /// Parse fail → xóa cache và trả về null.
  static Future<User?> getCurrentUser({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_userKey);

    if (raw == null) {
      // log?.logW('Get current user: null');
      return null;
    }

    try {
      final user = User.fromJson(jsonDecode(raw));
      // log?.logD(
      //   'Get current user: ${user.fullName} & ${user.departmentId} & ${user.departmentName}',
      // );
      return user;
    } catch (e) {
      // log?.logE('Parse cached user failed → clear cache');
      await prefs.remove(_userKey);
      return null;
    }
  }

  /// Xóa user khỏi SharedPreferences.
  static Future<void> clearUser({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    // log?.logI('Current user cleared');
  }

  /// Fetch user từ API và lưu vào cache.
  /// Ưu tiên trả về cached user nếu có và forceRefresh = false.
  /// Xử lý 401 → tự động clearAll.
  static Future<User?> fetchAndSaveCurrentUser({
    LogUtils? log,
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        final cached = await getCurrentUser(log: log);
        if (cached != null) {
          // log?.logI('Use cached current user');
          return cached;
        }
      }

      final authRepo = getIt<AuthRepo>();
      final res = await authRepo.getCurrentUser();

      return await res.fold(
        (l) async {
          log?.logE('Get current user failed: ${l.getErrorMessage}');

          l.when(
            httpInternalServerError: (_) {},
            httpUnAuthorizedError: () async {
              // log?.logW('Unauthorized → clear all');
              await clearAll(log: log);
            },
            httpUnknownError: (_) {},
          );

          return null;
        },
        (user) async {
          if (user == null) {
            // log?.logW('User is null, skip save');
            return null;
          }

          await saveCurrentUser(user: user, log: log);
          return user;
        },
      );
    } catch (e, s) {
      // log?.logE('Fetch user exception: $e');
      // log?.logD('$s');
      return null;
    }
  }

  /// Kiểm tra token còn hạn, hết hạn → xóa hết token + user.
  static Future<bool> isLoggedInAndValid({LogUtils? log}) async {
    final token = await getToken(log: log);
    final expires = await getExpires(log: log);

    if (token == null || expires == null) {
      // log?.logI('Auth invalid: missing token/expires');
      return false;
    }

    final now = DateTime.now().toUtc();
    final isExpired = now.isAfter(expires);

    if (isExpired) {
      // log?.logW('Auth expired → clear all');
      await clearAll(log: log);
      return false;
    }

    return true;
  }

  /// Xóa toàn bộ auth data (token + user) khỏi SharedPreferences.
  static Future<void> clearAll({LogUtils? log}) async {
    await clearToken(log: log);
    await clearUser(log: log);
  }
}
