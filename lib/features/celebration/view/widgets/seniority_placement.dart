part of '../pages/celebration_popup_screen.dart';

/// Per-platform layout for [_SeniorityOverlay].
///
/// iOS keeps the legacy `unit`-anchored offsets (tuned against the
/// artwork's reference frame), Android scales against the rendered
/// Stack size via fractional offsets. Splitting them up front makes it
/// easy to retune each platform combo independently.
class _SeniorityPlacement {
  const _SeniorityPlacement({
    required this.nameLeft,
    required this.nameRight,
    required this.nameTop,
    required this.wishesLeft,
    required this.wishesRight,
    required this.wishesBottom,
    required this.yearsLeft,
    required this.yearsRight,
    required this.yearsTop,
  });

  /// Fractions of `width` (for `left` / `right`) or `height` (for `top`,
  /// `*Height`, `wishesBottom`). On iOS these are multiplied by the
  /// artwork reference unit instead of the Stack size.
  final double nameLeft;
  final double nameRight;
  final double nameTop;
  final double wishesLeft;
  final double wishesRight;
  final double wishesBottom;

  /// Standalone year numeral ("10") stamped in gold near the top of the
  /// artwork, above the name plate.
  final double yearsLeft;
  final double yearsRight;
  final double yearsTop;
}
