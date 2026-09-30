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

  /// Fetch celebration info. Returns the item when the user has either
  /// birthday or seniority, otherwise `null`.
  static Future<CelebrationItem?> fetchIfCelebration() async {
    try {
      final repo = getIt<CelebrationRepo>();
      final result = await repo.checkBirthdaySeniority();
      return result.fold((_) => null, (item) {
        final isBirthday = item.isBirthday ?? false;
        final isSeniority = item.isSeniority ?? false;
        if (!isBirthday && !isSeniority) return null;
        return item;
      });
    } catch (_) {
      return null;
    }
  }

  /// Show the celebration popup as a fullscreen general dialog.
  ///
  /// - Skips when [context] is not mounted.
  /// - Skips when the API returns no birthday/seniority flag.
  /// - Skips when a popup was already shown in the current session
  ///   for the same employee + flag combination.
  static Future<void> tryShowPopup(BuildContext context) async {
    if (!context.mounted) return;

    final item = await fetchIfCelebration();
    if (item == null) return;

    final key =
        '${item.employeeID ?? 0}-${item.isBirthday ?? false}-${item.isSeniority ?? false}';
    if (_hasShownInSession && _shownKey == key) return;
    _hasShownInSession = true;
    _shownKey = key;

    if (!context.mounted) return;

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
