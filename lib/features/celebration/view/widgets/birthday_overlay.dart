part of '../pages/celebration_popup_screen.dart';

/// Text overlay rendered on top of the birthday PNG artwork.
///
/// NOTE: The current `birthday.png` still has placeholder text baked in
/// ("Birthday", "06/08", "SAMPLE FARE BYOU"). Once designer replaces it
/// with a blank template, this overlay is the only text visible.
class _BirthdayOverlay extends StatelessWidget {
  const _BirthdayOverlay({required this.item});

  final CelebrationItem item;

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    final dd = date.day.toString().padLeft(2, '0');
    final mm = date.month.toString().padLeft(2, '0');
    final yyyy = date.year.toString();
    return '$dd/$mm/$yyyy';
  }

  @override
  Widget build(BuildContext context) {
    final fullName = item.fullName ?? '';
    final departmentName = item.departmentName ?? '';
    final birthday = _formatDate(item.birthOfDate);

    // Only show the date line when the API actually returned a birth date,
    // so we never render a bare "Sinh nhật " with nothing after it.
    final dateLabel = birthday.isEmpty ? 'Sinh nhật' : 'Sinh nhật $birthday';

    // Use artworkHeight as the reference unit so offsets are stable across
    // screen sizes. The overlay always sits on top of an artwork panel of
    // fixed height (see CelebrationSizes.artworkHeight = 220), so ratios
    // relative to that height keep the visual layout intact on every
    // device while still letting width scale via fractional coords.
    const double unit = CelebrationSizes.artworkHeight;

    // Clamp the system text scaler so accessibility settings don't push
    // text off the artwork. textScaler > 1.4 already degrades the layout
    // on small phones, so we cap it to 1.2 here.
    final mq = MediaQuery.of(context);
    final scaler = mq.textScaler.clamp(maxScaleFactor: 1.2);

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        // iOS keeps the legacy `unit`-anchored offsets (tuned for the
        // artwork's 750x1167 reference frame). Android drifts visually
        // at typical phone densities, so it switches to fractional
        // offsets that scale with the rendered Stack size.
        final isIOS = Platform.isIOS;

        return MediaQuery(
          data: mq.copyWith(textScaler: scaler),
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                // All three text blocks are rotated slightly to the left
                // (~-4°) for a hand-written feel.
                // Date — top-right block (was "06/08" placeholder).
                // Offsets are absolute (px) relative to the artwork unit so
                // they don't drift on tall vs short devices.
                //
                // Box width must fit "Sinh nhật dd/MM/yyyy" (~240px at
                // fontSize 12). The old artwork only baked in a short
                // "06/08", so this block was far narrower and clipped the
                // date away. FittedBox is a safety net: it only shrinks the
                // text when the available width is genuinely too small.
                Positioned(
                  left: isIOS ? unit * 0.10 : w * 0.10,
                  right: isIOS ? unit * 0.45 : w * 0.3,
                  top: isIOS ? unit * 0.44 : h * 0.153,
                  child: Transform.rotate(
                    angle: -0.03,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: Text(
                        dateLabel,
                        maxLines: 1,
                        softWrap: false,
                        textAlign: TextAlign.right,
                        style: AppStyles.s12h18w600.copyWith(
                          color: const Color(0xFFB71C1C),
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              color: AppColors.black.withValues(alpha: 0.12),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Name + Department — anchored to a unit-derived y so the
                // group sits in the same vertical spot on every screen.
                Positioned(
                  left: isIOS ? unit * 0.10 : w * 0.06,
                  right: isIOS ? unit * 0.10 : w * 0.06,
                  top: isIOS ? unit * 1.15 : h * 0.40,
                  height: isIOS ? unit * 0.20 : h * 0.18,
                  child: Transform.rotate(
                    angle: -0.05,
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
                ),
                // Wishes — handwriting font for a festive, personal feel.
                // Anchored by bottom so it floats above the artwork edge
                // consistently across screen sizes.
                Positioned(
                  left: isIOS ? unit * 0.18 : w * 0.12,
                  right: isIOS ? unit * 0.30 : w * 0.18,
                  bottom: h * 0.45,
                  child: Transform.rotate(
                    angle: -0.07, // ~ -4°
                    child: Text(
                      'Chúc bạn bước sang tuổi mới thật nhiều sức khỏe, vui vẻ và rực rỡ thành công!',
                      textAlign: TextAlign.center,
                      maxLines: 2,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
