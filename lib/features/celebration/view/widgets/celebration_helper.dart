import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rtc_erp/di/injection.dart';

import '../../data/datasource/model/celebration_model.dart';
import '../../data/repository/celebration_repo.dart';
import '../bloc/celebration_bloc.dart';
import '../pages/celebration_popup_screen.dart';

/// Helper that triggers the celebration popup after a successful action.
///
/// The popup will only show when the API reports either `IsBirthday == true`
/// or `IsSeniority == true`. If the user is not in a celebration window,
/// the popup is silently skipped.
class CelebrationHelper {
  CelebrationHelper._();

  static bool _hasShownInSession = false;
  static String? _shownKey;

  /// Reset guard — call on logout so the next login can show again.
  static void resetGuard() {
    _hasShownInSession = false;
    _shownKey = null;
  }

  /// Fetch celebration info for [currentUserId]. Returns the item when
  /// the API's `EmployeeID` matches the logged-in user AND `IsBirthday`
  /// is true. Returns `null` otherwise — including when the API returns
  /// a celebration flag for someone else (different employee).
  ///
  /// TODO: chúc mừng thâm niên (seniority) tạm thời chưa cho chạy.
  /// Bỏ comment nhánh `isSeniority` bên dưới khi mở lại tính năng.
  static Future<CelebrationItem?> fetchIfCelebration(int currentUserId) async {
    try {
      debugPrint('[CelebrationHelper] resolving CelebrationRepo from getIt');
      final repo = getIt<CelebrationRepo>();
      debugPrint('[CelebrationHelper] calling checkBirthdaySeniority API');
      final result = await repo.checkBirthdaySeniority();
      return result.fold((_) {
        debugPrint('[CelebrationHelper] API returned error');
        return null;
      }, (item) {
        debugPrint('[CelebrationHelper] API item: employeeID=${item.employeeID} '
            'isBirthday=${item.isBirthday} isSeniority=${item.isSeniority}');
        // Defensive: API is keyed on the session user, but if the
        // backend ever drifts (cache, impersonation, etc.) we still
        // refuse to show the popup for a different employee.
        if ((item.employeeID ?? -1) != currentUserId) {
          debugPrint('[CelebrationHelper] employeeID mismatch (api=${item.employeeID} vs current=$currentUserId), skip');
          return null;
        }
        final isBirthday = item.isBirthday ?? false;
        // Tạm thời chỉ cho chạy chúc mừng sinh nhật, thâm niên để lại để sau.
        // if (!isBirthday && !isSeniority) return null;
        if (!isBirthday) return null;
        return item;
      });
    } catch (e, st) {
      debugPrint('[CelebrationHelper] fetchIfCelebration EXCEPTION: $e\n$st');
      return null;
    }
  }

  /// Show the celebration popup as a fullscreen general dialog.
  ///
  /// - Skips when [context] is not mounted.
  /// - Skips when the API returns no birthday/seniority flag.
  /// - Skips when the API's `EmployeeID` doesn't match [currentUserId].
  /// - Skips when a popup was already shown in the current session
  ///   for the same employee + flag combination.
  static Future<void> tryShowPopup(
    BuildContext context, {
    required int currentUserId,
  }) async {
    debugPrint('[CelebrationHelper] tryShowPopup called, currentUserId=$currentUserId');
    if (!context.mounted) {
      debugPrint('[CelebrationHelper] context not mounted, skip');
      return;
    }

    final item = await fetchIfCelebration(currentUserId);
    debugPrint('[CelebrationHelper] fetchIfCelebration returned ${item?.employeeID} '
        'isBirthday=${item?.isBirthday} isSeniority=${item?.isSeniority}');
    if (item == null) return;

    final key =
        '${item.employeeID ?? 0}-${item.isBirthday ?? false}-${item.isSeniority ?? false}';
    debugPrint('[CelebrationHelper] key=$key hasShown=$_hasShownInSession');
    if (_hasShownInSession && _shownKey == key) return;
    _hasShownInSession = true;
    _shownKey = key;

    if (!context.mounted) return;

    debugPrint('[CelebrationHelper] showing popup dialog');
    await showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel:
          MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      transitionDuration: const Duration(milliseconds: 320),
      pageBuilder: (ctx, _, _) {
        return BlocProvider(
          create: (_) => CelebrationBloc(getIt<CelebrationRepo>())
            ..add(const CelebrationEvent.checkBirthdaySeniority()),
          child: const CelebrationPopupScreen(),
        );
      },
      transitionBuilder: (ctx, animation, _, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.92, end: 1.0).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}
