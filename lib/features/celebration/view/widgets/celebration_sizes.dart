import 'package:flutter/material.dart';

/// Shared layout constants for the celebration popup. Tuned so the card
/// looks balanced across iOS & Android phones (375 → 412 logical width).
class CelebrationSizes {
  CelebrationSizes._();

  /// Horizontal margin from screen edge to the card.
  static const double horizontalPadding = 20;

  /// Upper cap so the card never grows too wide on tablets / Pro Max.
  static const double maxCardWidth = 360;

  /// Card outer corner radius (Material card shape).
  static const double cardRadius = 24;

  /// Emblem badge square size.
  static const double emblemSize = 96;

  /// How much the emblem sits above the card's top edge.
  /// Half of [emblemSize] plus a small inset.
  static const double emblemTopOffset = 8;

  /// Legacy top margin kept equal to emblemSize/2 + small gap.
  static const double cardTopMargin = emblemSize / 2 + 8;

  /// Inner padding of the card body. Reduced top because there is no
  /// longer a circular emblem above the card; the artwork fills the space.
  static const EdgeInsets cardInnerPadding =
      EdgeInsets.fromLTRB(20, 20, 20, 22);

  /// Reference height used as a layout unit for the text overlay
  /// (date / name / wishes). The actual artwork size is driven by
  /// `aspectRatio` in `_CelebrationTheme` and the card width — this
  /// constant is only kept stable so overlay offsets don't drift.
  static const double artworkHeight = 220;

  /// Standard Material touch target height.
  static const double ctaHeight = 48;
  static const double ctaRadius = ctaHeight / 2; // pill

  /// Headline (title).
  static const double headlineSize = 28;

  /// Soft-cap on wish text lines.
  static const int wishMaxLines = 5;

  /// Clamp a width to the card's allowable range.
  static double clampCardWidth(double availableWidth) {
    final maxW = availableWidth - 2 * horizontalPadding;
    if (maxW > maxCardWidth) return maxCardWidth;
    if (maxW < 240) return 240;
    return maxW;
  }
}