import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import 'poll_hero_card.dart';

class BlurredBackgroundCard extends StatelessWidget {
  const BlurredBackgroundCard({
    super.key,
    required this.imageUrl,
    required this.accentColor,
    required this.child,
    required this.borderColor,
    this.borderRadius = 24,
    this.blurSigma = 24,
    this.boxShadow = const [],
    this.imageOverlayColors,
    this.fallbackOverlayColors,
  });

  final String? imageUrl;
  final Color accentColor;
  final Widget child;
  final Color borderColor;
  final double borderRadius;
  final double blurSigma;
  final List<BoxShadow> boxShadow;
  final List<Color>? imageOverlayColors;
  final List<Color>? fallbackOverlayColors;

  bool get _hasImage => imageUrl?.trim().isNotEmpty == true;

  @override
  Widget build(BuildContext context) {
    final overlayColors = _hasImage
        ? (imageOverlayColors ??
            [
              Colors.white.withValues(alpha: 0.06),
              Colors.black.withValues(alpha: 0.10),
            ])
        : (fallbackOverlayColors ??
            [
              AppColors.white.withValues(alpha: 0.14),
              accentColor.withValues(alpha: 0.18),
              const Color(0xFF1E3A8A).withValues(alpha: 0.48),
            ]);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: blurSigma,
                    sigmaY: blurSigma,
                    tileMode: TileMode.decal,
                  ),
                  child: PollBackgroundImage(
                    imageUrl: imageUrl,
                    accentColor: accentColor,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: overlayColors,
                  ),
                  border: Border.all(color: borderColor),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
