part of '../pages/celebration_popup_screen.dart';

/// Seniority text overlay rendered on top of a 5-year or 10-year
/// artwork. The artwork (5yrs landscape / 10yrs portrait) already
/// carries the celebratory ribbon, so this overlay only prints the
/// recipient's name + department and a short wishes line. `years`
/// switches the wishes copy and is clamped to 5 / 10 / other.
class _SeniorityOverlay extends StatelessWidget {
  const _SeniorityOverlay({required this.item, required this.years});

  final CelebrationItem item;
  final int years;

  /// 5-year artwork (landscape, name plate in the upper half).
  /// Android: fractional against the Stack size. Wishes is anchored
  /// with `wishesTop` + `wishesHeight` so the 4-line copy lands inside
  /// the tilted ribbon instead of spilling below it.
  static const _seniority5Android = _SeniorityPlacement(
    nameLeft: 0.08,
    nameRight: 0.08,
    nameTop: 0.40,
    nameHeight: 0.20,
    wishesLeft: 0.10,
    wishesRight: 0.10,
    wishesTop: 0.45,
    wishesHeight: 0.35,
    anniversaryLeft: 0.06,
    anniversaryRight: 0.55,
    anniversaryTop: 0.10,
    anniversaryHeight: 0.10,
  );

  /// 5-year artwork (landscape). iOS: unit-anchored legacy offsets.
  static const _seniority5Ios = _SeniorityPlacement(
    nameLeft: 0.10,
    nameRight: 0.10,
    nameTop: 1.02,
    nameHeight: 0.20,
    wishesLeft: 0.1,
    wishesRight: 1.0,
    wishesBottom: 0.17,
    anniversaryLeft: 0.1,
    anniversaryRight: 0.1,
    anniversaryTop: 0.33,
    anniversaryHeight: 0.12,
  );

  /// 10-year artwork (portrait, name plate lower-middle).
  /// Android: fractional against the Stack size.
  static const _seniority10Android = _SeniorityPlacement(
    nameLeft: 0.08,
    nameRight: 0.08,
    nameTop: 0.58,
    nameHeight: 0.18,
    wishesLeft: 0.12,
    wishesRight: 0.18,
    wishesBottom: 0.40,
    anniversaryLeft: 0.06,
    anniversaryRight: 0.55,
    anniversaryTop: 0.10,
    anniversaryHeight: 0.10,
  );

  /// 10-year artwork (portrait). iOS: unit-anchored legacy offsets.
  static const _seniority10Ios = _SeniorityPlacement(
    nameLeft: 0.05,
    nameRight: 0.05,
    nameTop: 0.95,
    nameHeight: 0.18,
    wishesLeft: 0.2,
    wishesRight: 0.25,
    wishesBottom: 0.49,
    anniversaryLeft: 0.1,
    anniversaryRight: 0.1,
    anniversaryTop: 0.21,
    anniversaryHeight: 0.12,
  );

  _SeniorityPlacement _pickPlacement() {
    assert(
      years == 5 || years == 10,
      '_SeniorityOverlay only supports 5-year and 10-year art; got $years.',
    );
    final isTen = years >= 10;
    final isIOS = Platform.isIOS;
    if (isTen && isIOS) return _seniority10Ios;
    if (isTen) return _seniority10Android;
    if (isIOS) return _seniority5Ios;
    return _seniority5Android;
  }

  String _wishesFor(int years) {
    switch (years) {
      case 5:
        return 'Cảm ơn bạn đã 5đồng hành\n'
            'cùng công ty suốt 5 năm qua\n'
            '— chúc bạn luôn vững vàng\n'
            'và tiếp tục tỏa sáng!';
      case 10:
        return 'Trân trọng cảm ơn 10 năm cống hiến của bạn — '
            'chúc bạn thật nhiều sức khỏe và thành công '
            'trên hành trình sắp tới!';
      default:
        return 'Trân trọng cảm ơn $years năm cống hiến của bạn — '
            'chúc bạn thật nhiều sức khỏe và thành công!';
    }
  }

  /// Badge copy — only the two supported milestones get the festive
  /// "Kỷ niệm X năm" stamp; any other value renders a generic line.
  String _anniversaryFor(int years) {
    switch (years) {
      case 5:
        return 'Kỷ niệm 5 năm';
      case 10:
        return 'Kỷ niệm 10 năm';
      default:
        return '$years năm';
    }
  }

  @override
  Widget build(BuildContext context) {
    final fullName = item.fullName ?? '';
    final departmentName = item.departmentName ?? '';
    final wishes = _wishesFor(years);
    final anniversaryText = _anniversaryFor(years);
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
            // the rendered Stack.
            double nameLeft = isIOS
                ? placement.nameLeft * unit
                : w * placement.nameLeft;
            double nameRight = isIOS
                ? placement.nameRight * unit
                : w * placement.nameRight;
            double nameTop = isIOS
                ? placement.nameTop * unit
                : h * placement.nameTop;
            double wishesLeft = isIOS
                ? placement.wishesLeft * unit
                : w * placement.wishesLeft;
            double wishesRight = isIOS
                ? placement.wishesRight * unit
                : w * placement.wishesRight;
            // Anchored by `bottom` for 10-year; 5-year uses top+height
            // so the wishes block sits inside the tilted ribbon.
            final double? wishesBottom = placement.wishesBottom == null
                ? null
                : h * placement.wishesBottom!;
            final double? wishesTop = placement.wishesTop == null
                ? null
                : (isIOS ? placement.wishesTop! * unit : h * placement.wishesTop!);
            final double? wishesHeight = placement.wishesHeight == null
                ? null
                : (isIOS
                    ? placement.wishesHeight! * unit
                    : h * placement.wishesHeight!);
            double anniversaryLeft = isIOS
                ? placement.anniversaryLeft * unit
                : w * placement.anniversaryLeft;
            double anniversaryRight = isIOS
                ? placement.anniversaryRight * unit
                : w * placement.anniversaryRight;
            double anniversaryTop = isIOS
                ? placement.anniversaryTop * unit
                : h * placement.anniversaryTop;
            double anniversaryHeight = isIOS
                ? placement.anniversaryHeight * unit
                : h * placement.anniversaryHeight;

            return Stack(
              children: [
                // Anniversary badge — "Kỷ niệm X năm" stamped on the
                // artwork like a sticker. Top-left so it doesn't fight
                // with the name plate below.
                Positioned(
                  left: anniversaryLeft,
                  right: anniversaryRight,
                  top: anniversaryTop,
                  height: anniversaryHeight,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        anniversaryText,
                        maxLines: 1,
                        softWrap: false,
                        style: GoogleFonts.dancingScript(
                          textStyle: AppStyles.s10h10w600.copyWith(
                            color: const Color(0xFFB71C1C),
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 1.1,
                            shadows: [
                              Shadow(
                                color: Colors.white.withValues(alpha: 0.9),
                                blurRadius: 6,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Name + Department — slightly rotated for a handwritten feel.
                Positioned(
                  left: nameLeft,
                  right: nameRight,
                  top: nameTop,
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
                // 5-year artwork is rotated for a handwritten vibe; 10-year
                // art is rendered upright and kept to 2 lines so it doesn't
                // spill outside the ribbon.
                Positioned(
                  left: wishesLeft,
                  right: wishesRight,
                  top: wishesTop,
                  bottom: wishesBottom,
                  height: wishesHeight,
                  child: Transform.rotate(
                    angle: years == 5 ? -0.2 : 0,
                    child: Text(
                      wishes,
                      textAlign: TextAlign.center,
                      maxLines: years == 5 ? 4 : 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.dancingScript(
                        textStyle: AppStyles.s10h10w600.copyWith(
                          color: const Color(0xFFD81B60),
                          fontSize: years == 5 ? 9 : 16,
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
