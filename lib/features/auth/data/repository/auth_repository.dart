import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/logger/index.dart';

class AuthRepository {
  AuthRepository._();

  static const _tokenKey = 'access_token';
  static const _expiresKey = 'access_token_expires';

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
    await prefs.setString(
      _expiresKey,
      expires.toUtc().toIso8601String(),
    );

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
}
