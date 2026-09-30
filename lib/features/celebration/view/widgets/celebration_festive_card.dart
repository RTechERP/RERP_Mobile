part of '../pages/celebration_popup_screen.dart';

/// The dialog body — the rounded PNG artwork with optional text overlay.
/// When [overlay] is null, just shows the artwork as-is.
class _FestiveCard extends StatelessWidget {
  const _FestiveCard({
    required this.imagePath,
    required this.aspectRatio,
    required this.overlay,
    this.footer,
  });

  final String imagePath;
  final double aspectRatio;
  final Widget? overlay;

  /// Optional widget pinned to the bottom-center of the card, drawn on
  /// top of the artwork so it visually overlaps the image.
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(CelebrationSizes.cardRadius),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            if (overlay != null) overlay!,
            if (footer != null)
              Positioned(
                left: 0,
                right: 0,
                bottom: 18,
                child: Center(child: footer!),
              ),
          ],
        ),
      ),
    );
  }
}
