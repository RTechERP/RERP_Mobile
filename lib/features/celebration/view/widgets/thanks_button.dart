part of '../pages/celebration_popup_screen.dart';

/// A floating, "3D-looking" dismiss button — gradient face, two-layer
/// drop shadow for depth, light highlight on the top edge, and a subtle
/// press-down animation. Sits below the artwork inside the dialog.
class _ThanksButton extends StatefulWidget {
  const _ThanksButton({required this.onPressed, required this.style});

  final VoidCallback onPressed;
  final _ButtonStyle style;

  @override
  State<_ThanksButton> createState() => _ThanksButtonState();
}

class _ThanksButtonState extends State<_ThanksButton>
    with SingleTickerProviderStateMixin {
  static const double _height = 48;
  static const double _radius = _height / 2;

  late final AnimationController _pressController;
  late final Animation<double> _press;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      reverseDuration: const Duration(milliseconds: 180),
    );
    _press = Tween<double>(
      begin: 1.0,
      end: 0.94,
    ).animate(CurvedAnimation(parent: _pressController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails _) => _pressController.forward();
  void _handleTapEnd(TapUpDetails _) {
    if (_pressController.status == AnimationStatus.forward) {
      _pressController.reverse();
    }
  }

  void _handleTapCancel() => _pressController.reverse();

  @override
  Widget build(BuildContext context) {
    final style = widget.style;

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapEnd,
      onTapCancel: _handleTapCancel,
      onTap: widget.onPressed,
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _press,
        builder: (context, child) {
          // Outer wrapper scales the whole button on press — combined with
          // the inner offset, the button face moves down a couple of px so
          // it feels like it's being pressed into its shadow.
          return Transform.scale(scale: _press.value, child: child);
        },
        child: SizedBox(
          width: 180,
          height: _height,
          child: Stack(
            children: [
              // Drop shadow layer (offset down, blurred) — gives the
              // floating "3D" feel. Glow color matches the button's
              // gradient so the shadow tints coherently.
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_radius),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.30),
                        blurRadius: 14,
                        offset: const Offset(0, 8),
                      ),
                      BoxShadow(
                        color: style.glowColor.withValues(alpha: 0.55),
                        blurRadius: 22,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
              // Button face.
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_radius),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [style.gradientTop, style.gradientBottom],
                    ),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.45),
                      width: 1.2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Top inner highlight — fakes the curvature of a
                      // glossy 3D pill.
                      Positioned(
                        left: 8,
                        right: 8,
                        top: 3,
                        child: Container(
                          height: _height * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(_radius),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withValues(alpha: 0.45),
                                Colors.white.withValues(alpha: 0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Label — icon + text in a row so it reads as a
                      // single cute CTA rather than a plain pill.
                      Center(
                        child: Material(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                style.icon,
                                size: 20,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: AppColors.black.withValues(
                                      alpha: 0.25,
                                    ),
                                    blurRadius: 4,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              Text(
                                style.label,
                                style: AppStyles.s16h20w600.copyWith(
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                  shadows: [
                                    Shadow(
                                      color: AppColors.black.withValues(
                                        alpha: 0.25,
                                      ),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Visual style for the dismiss button. One preset per celebration
/// type so the CTA matches the artwork's mood.
enum _ButtonStyle {
  /// Birthday — pink gradient, cake icon, friendly tone.
  birthday(
    gradientTop: Color(0xFFFFB199),
    gradientBottom: Color(0xFFFF6F91),
    glowColor: Color(0xFFFF6F91),
    icon: Icons.cake_rounded,
    label: 'Cảm ơn!',
  ),

  seniority(
    gradientTop: Color(0xFF64B5F6),
    gradientBottom: Color(0xFF26A69A),
    glowColor: Color(0xFF26A69A),
    icon: Icons.workspace_premium_rounded,
    label: 'Cảm ơn!',
  );

  const _ButtonStyle({
    required this.gradientTop,
    required this.gradientBottom,
    required this.glowColor,
    required this.icon,
    required this.label,
  });

  final Color gradientTop;
  final Color gradientBottom;
  final Color glowColor;
  final IconData icon;
  final String label;
}
