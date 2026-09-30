part of '../pages/celebration_popup_screen.dart';

/// Visual theme for the celebration dialog.
class _CelebrationTheme {
  const _CelebrationTheme({
    required this.backgroundImage,
    required this.aspectRatio,
    required this.backdropTop,
    required this.backdropBottom,
    required this.buttonStyle,
    this.overlayBuilder,
  });

  /// Festive birthday artwork (750 x 1167) with editable text overlay.
  factory _CelebrationTheme.birthday() {
    return _CelebrationTheme(
      backgroundImage: AppImages.birthday,
      aspectRatio: 0.55,
      backdropTop: const Color(0xFFFFCDD2),
      backdropBottom: const Color(0xFFFFE0B2),
      buttonStyle: _ButtonStyle.birthday,
      overlayBuilder: (item) => _BirthdayOverlay(item: item),
    );
  }

  /// Festive seniority artwork for 10+ years (square).
  factory _CelebrationTheme.seniorityHigh() {
    return _CelebrationTheme(
      backgroundImage: AppImages.seniority_10yrs,
      aspectRatio: 0.55,
      backdropTop: const Color(0xFFE1BEE7),
      backdropBottom: const Color(0xFFFFCCBC),
      buttonStyle: _ButtonStyle.seniorityHigh,
      overlayBuilder: (item) => _SeniorityOverlay(item: item, years: 10),
    );
  }

  /// Festive seniority artwork for 5+ years (landscape).
  factory _CelebrationTheme.seniorityMid() {
    return _CelebrationTheme(
      backgroundImage: AppImages.seniority_5yrs,
      aspectRatio: 0.55,
      backdropTop: const Color(0xFFBBDEFB),
      backdropBottom: const Color(0xFFB2EBF2),
      buttonStyle: _ButtonStyle.seniorityMid,
      overlayBuilder: (item) => _SeniorityOverlay(item: item, years: 5),
    );
  }

  factory _CelebrationTheme.forType({
    required bool isBirthday,
    required int seniorityYears,
  }) {
    if (isBirthday) return _CelebrationTheme.birthday();
    if (seniorityYears >= 10) return _CelebrationTheme.seniorityHigh();
    return _CelebrationTheme.seniorityMid();
  }

  final String backgroundImage;
  final double aspectRatio;
  final Color backdropTop;
  final Color backdropBottom;
  final _ButtonStyle buttonStyle;
  final Widget Function(CelebrationItem item)? overlayBuilder;
}
