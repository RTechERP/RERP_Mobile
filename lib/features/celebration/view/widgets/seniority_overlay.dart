part of '../pages/celebration_popup_screen.dart';

/// Seniority text overlay rendered on top of the seniority artwork.
/// The artwork already carries the celebratory ribbon, so this overlay
/// only prints the year milestone, the recipient's name + department
/// and a short wishes line. `years` is the `SeniorityYears` value
/// coming from the API, so the copy always matches the real milestone.
class _SeniorityOverlay extends StatelessWidget {
  const _SeniorityOverlay({required this.item, required this.years});

  final CelebrationItem item;
  final int years;

  /// Layout for the single seniority artwork (portrait, name plate in
  /// the lower-middle). Android scales against the rendered Stack size
  /// via fractional offsets.
  static const _seniorityAndroid = _SeniorityPlacement(
    nameLeft: 0.08,
    nameRight: 0.08,
    nameTop: 0.275,
    wishesLeft: 0.12,
    wishesRight: 0.18,
    wishesBottom: 0.54,
    yearsLeft: 0.555,
    yearsRight: 0.10,
    yearsTop: 0.555,
  );

  /// Same artwork. iOS: unit-anchored legacy offsets.
  static const _seniorityIos = _SeniorityPlacement(
    nameLeft: 0.05,
    nameRight: 0.05,
    nameTop: 0.8,
    wishesLeft: 0.2,
    wishesRight: 0.25,
    wishesBottom: 1.55,
    yearsLeft: 0.85,
    yearsRight: 0.1,
    yearsTop: 1.58,
  );

  _SeniorityPlacement _pickPlacement() {
    return Platform.isIOS ? _seniorityIos : _seniorityAndroid;
  }

  /// Wishes copy driven by the API's `SeniorityYears` value.
  String _wishesFor() {
    return 'Trân trọng cảm ơn $years năm cống hiến của bạn — '
        'chúc bạn thật nhiều sức khỏe và thành công '
        'trên hành trình sắp tới!';
  }

  /// Big year numeral ("10") stamped in bright metallic gold.
  ///
  /// Cinzel is a formal Roman-capital serif, so the numeral reads as a
  /// milestone badge rather than handwriting.
  ///
  /// The numeral is two layers:
  ///
  /// 1. A stroked copy in dark gold acts as a thin bevel around the glyphs
  ///    and carries the drop shadow that lifts the badge off the artwork
  ///    (nổi).
  /// 2. The diagonal bright-gold gradient sits on top as the fill.
  ///
  /// Both layers use [BlendMode.srcIn] so the gradient *replaces* the glyph
  /// pixels instead of blending with them. This matters: the default
  /// `srcATop` mixes the shader with the text's own color, which at the
  /// anti-aliased edges drags the gold toward the dark theme text color
  /// and makes the whole numeral look black. The gradient therefore also
  /// keeps to gold tones only — no brown/black stops — and the fill layer
  /// carries no shadows, so nothing dark bleeds into the gold.
  ///
  /// Each [ShaderMask] builds its gradient from the child's real bounds,
  /// so the sheen still tracks the glyphs after [FittedBox] scales the
  /// numeral down to fit.
  Widget _yearNumeral() {
    final baseStyle = AppStyles.s10h10w600.copyWith(
      fontSize: 75,
      fontWeight: FontWeight.w600,
      height: 1.0,
      letterSpacing: 2,
    );
    final numeral = GoogleFonts.cinzel(textStyle: baseStyle);

    // Dark bevel + drop shadow. The shadow lives on this layer so the
    // bright fill on top stays free of dark pixels. Kept light so the
    // numeral reads bright rather than heavy.
    final bevel = Text(
      '$years',
      maxLines: 1,
      softWrap: false,
      style: numeral.copyWith(
        shadows: const [
          Shadow(color: Color(0x4D7A5200), blurRadius: 8, offset: Offset(0, 3)),
        ],
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.6
          ..strokeJoin = StrokeJoin.round,
      ),
    );

    // Bright diagonal gold fill = the metallic sheen. No shadows here.
    final fill = Text(
      '$years',
      maxLines: 1,
      softWrap: false,
      style: numeral.copyWith(color: Colors.white),
    );

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (b) => const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFB07C10), Color(0xFF8A5D00)],
            ).createShader(b),
            child: bevel,
          ),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            // Light, high-key gold ramp — bright champagne at the top-left
            // easing to a soft honey tone. Deliberately avoids the dark
            // amber/bronze stops that made the numeral look heavy.
            shaderCallback: (b) => const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFFFDF2),
                Color(0xFFFFF8E1),
                Color(0xFFFFE9A8),
                Color(0xFFFFE082),
                Color(0xFFFFD54F),
              ],
              stops: [0.0, 0.24, 0.5, 0.74, 1.0],
            ).createShader(b),
            child: fill,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fullName = item.fullName ?? '';
    final departmentName = item.departmentName ?? '';
    final wishes = _wishesFor();
    final placement = _pickPlacement();

    // Reference unit for iOS legacy offsets. Same constant the artwork
    // panel uses (see CelebrationSizes.artworkHeight).
    const double unit = CelebrationSizes.artworkHeight;
    final isIOS = Platform.isIOS;

    // Clamp system text scaler — accessibility settings >1.4 degrade the
    // layout on small phones, so cap at 1.2 here.
    final mq = MediaQuery.of(context);
    final scaler = mq.textScaler.clamp(maxScaleFactor: 1.2);

    return MediaQuery(
      data: mq.copyWith(textScaler: scaler),
      child: Material(
        color: Colors.transparent,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;

            // iOS keeps `unit`-anchored offsets; Android scales with
            // the rendered Stack. Horizontal offsets are fractions of
            // the width, vertical ones fractions of the height.
            double hOffset(double f) => isIOS ? f * unit : w * f;
            double vOffset(double f) => isIOS ? f * unit : h * f;

            return Stack(
              children: [
                // Big year numeral — formal Cinzel in metallic gold, in the
                // blank band above the name plate.
                if (years > 0)
                  Positioned(
                    left: hOffset(placement.yearsLeft),
                    right: hOffset(placement.yearsRight),
                    top: vOffset(placement.yearsTop),
                    child: _yearNumeral(),
                  ),
                // Name + Department — slightly rotated for a handwritten feel.
                Positioned(
                  left: hOffset(placement.nameLeft),
                  right: hOffset(placement.nameRight),
                  top: vOffset(placement.nameTop),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        fullName,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.s16h20w700.copyWith(
                          color: const Color(0xFF1A237E),
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow(
                              color: AppColors.black.withValues(alpha: 0.12),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        departmentName,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.s14h14w400.copyWith(
                          color: const Color(0xFF1A237E),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // Wishes — handwriting font for a festive, personal feel.
                // Rendered upright and capped at 3 lines so it doesn't
                // spill outside the ribbon.
                Positioned(
                  left: hOffset(placement.wishesLeft),
                  right: hOffset(placement.wishesRight),
                  bottom: vOffset(placement.wishesBottom),
                  child: Text(
                    wishes,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.dancingScript(
                      textStyle: AppStyles.s10h10w600.copyWith(
                        color: const Color(0xFFD81B60),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.white.withValues(alpha: 0.85),
                            blurRadius: 6,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
