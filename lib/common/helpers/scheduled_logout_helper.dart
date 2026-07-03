import 'dart:async';

import 'package:rtc_erp/common/logger/index.dart';
import 'package:rtc_erp/common/services/permissions/permission_service.dart';
import 'package:rtc_erp/features/auth/data/repository/auth_repository.dart';
import 'package:rtc_erp/routes/app_router.dart';
import 'package:rtc_erp/routes/route_names.dart';

/// **true**: sau [testLogoutAfter] kể từ lúc [arm] (ví dụ 10:07 → 10:17).
/// **false**: mỗi ngày lúc [authDailyLogoutHour]:[authDailyLogoutMinute] theo giờ máy.
const bool authScheduledLogoutTestMode = false;

const int authDailyLogoutHour = 23;
const int authDailyLogoutMinute = 30;

const Duration testLogoutAfter = Duration(minutes: 3);

/// Hẹn giờ logout tự động (một phiên đăng nhập). Gọi [arm] khi đã có session hợp lệ;
/// gọi [cancel] khi logout tay hoặc hủy phiên.
///
/// Khi **không** test mode: nếu hôm trước không mở app lúc 23:30, [logoutIfMissedDailyBoundary]
/// buộc logout ngay khi mở app ngày hôm sau (neo ngày lưu trong prefs).
class AuthScheduledLogout {
  AuthScheduledLogout._();

  static Timer? _timer;

  static void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  /// Trả về `true` nếu đã logout bù và navigate — caller nên dừng init (emit trạng thái chưa đăng nhập).
  static Future<bool> logoutIfMissedDailyBoundary({LogUtils? log}) async {
    if (authScheduledLogoutTestMode) return false;

    await AuthRepository.ensureSessionAnchorLocalDate(log: log);
    final anchor = await AuthRepository.getSessionAnchorLocalDate(log: log);
    if (anchor == null) return false;

    final today = AuthRepository.todayLocalDateString();
    if (anchor == today) return false;

    // log?.logI(
    //   'Auth scheduled logout catch-up: anchor=$anchor today=$today → force logout',
    // );
    cancel();
    await _execute(log);
    return true;
  }

  static void arm({LogUtils? log}) {
    cancel();
    final delay = authScheduledLogoutTestMode
        ? testLogoutAfter
        : _delayUntilDailyCutoff();
    final at = DateTime.now().add(delay);
    // log?.logI(
    //   'Auth scheduled logout: testMode=$authScheduledLogoutTestMode → fire at $at',
    // );
    _timer = Timer(delay, () => _run(log));
  }

  static Duration _delayUntilDailyCutoff() {
    final now = DateTime.now();
    var target = DateTime(
      now.year,
      now.month,
      now.day,
      authDailyLogoutHour,
      authDailyLogoutMinute,
    );
    if (!now.isBefore(target)) {
      target = target.add(const Duration(days: 1));
    }
    return target.difference(now);
  }

  static void _run(LogUtils? log) {
    _timer = null;
    unawaited(_execute(log));
  }

  static Future<void> _execute(LogUtils? log) async {
    // log?.logI('Auth scheduled logout: executing');
    await AuthRepository.clearAll(log: log);
    PermissionService.reset();
    AppRouter.router.go(RouteNames.login);
  }
}
