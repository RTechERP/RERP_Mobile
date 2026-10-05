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

  /// Festive seniority artwork. [seniorityYears] is the `SeniorityYears`
  /// value from the API and drives the overlay copy.
  factory _CelebrationTheme.seniorityMid({required int seniorityYears}) {
    return _CelebrationTheme(
      backgroundImage: AppImages.seniority,
      aspectRatio: 0.55,
      backdropTop: const Color(0xFFBBDEFB),
      backdropBottom: const Color(0xFFB2EBF2),
      buttonStyle: _ButtonStyle.seniority,
      overlayBuilder: (item) =>
          _SeniorityOverlay(item: item, years: seniorityYears),
    );
  }

  factory _CelebrationTheme.forType({
    required bool isBirthday,
    required int seniorityYears,
  }) {
    if (isBirthday) return _CelebrationTheme.birthday();
    return _CelebrationTheme.seniorityMid(seniorityYears: seniorityYears);
  }

  final String backgroundImage;
  final double aspectRatio;
  final Color backdropTop;
  final Color backdropBottom;
  final _ButtonStyle buttonStyle;
  final Widget Function(CelebrationItem item)? overlayBuilder;
}
