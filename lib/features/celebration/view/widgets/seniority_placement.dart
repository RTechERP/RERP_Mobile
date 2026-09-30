part of '../pages/celebration_popup_screen.dart';

/// Per-platform layout for [_SeniorityOverlay].
///
/// iOS keeps the legacy `unit`-anchored offsets (tuned against the
/// artwork's reference frame), Android scales against the rendered
/// Stack size via fractional offsets. Splitting them up front makes it
/// easy to retune each artwork / platform combo independently.
class _SeniorityPlacement {
  const _SeniorityPlacement({
    required this.nameLeft,
    required this.nameRight,
    required this.nameTop,
    required this.nameHeight,
    required this.wishesLeft,
    required this.wishesRight,
    // Wishes is anchored by either `bottom` (10-year) or
    // `top` + `wishesHeight` (5-year) so it can land inside the
    // tilted ribbon instead of being clipped against its edge.
    this.wishesBottom,
    this.wishesTop,
    this.wishesHeight,
    required this.anniversaryLeft,
    required this.anniversaryRight,
    required this.anniversaryTop,
    required this.anniversaryHeight,
  })  : assert(
          wishesBottom != null || (wishesTop != null && wishesHeight != null),
          'Placement needs either wishesBottom or wishesTop+wishesHeight',
        );

  /// Fractions of `width` (for `left` / `right`) or `height` (for `top`,
  /// `*Height`, `wishesBottom`). On iOS these are multiplied by the
  /// artwork reference unit instead of the Stack size.
  final double nameLeft;
  final double nameRight;
  final double nameTop;
  final double nameHeight;
  final double wishesLeft;
  final double wishesRight;
  final double? wishesBottom;
  final double? wishesTop;
  final double? wishesHeight;
  final double anniversaryLeft;
  final double anniversaryRight;
  final double anniversaryTop;
  final double anniversaryHeight;
}
