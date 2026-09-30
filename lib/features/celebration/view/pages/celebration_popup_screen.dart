import 'dart:io';
import 'dart:math' as math;
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../base/bloc/index.dart';
import '../../../../../common/app_theme/app_colors.dart';
import '../../../../../common/app_theme/app_styles.dart';
import '../../../../common/constants/index.dart';
import '../../data/datasource/model/celebration_model.dart';
import '../bloc/celebration_bloc.dart';
import '../widgets/celebration_sizes.dart';

/// Inherited override that supplies a preloaded [CelebrationItem]
/// (used by the dev test button to preview the UI without an API call).
class CelebrationOverride extends InheritedWidget {
  const CelebrationOverride({
    super.key,
    required this.item,
    required super.child,
  });

  final CelebrationItem item;

  static CelebrationItem? of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<CelebrationOverride>();
    return widget?.item;
  }

  @override
  bool updateShouldNotify(CelebrationOverride oldWidget) =>
      oldWidget.item != item;
}

/// Popup-style screen showing the user's birthday or seniority celebration.
///
/// Renders a rounded PNG artwork for the occasion — no text, no buttons,
/// no floating decorations.
class CelebrationPopupScreen extends StatefulWidget {
  const CelebrationPopupScreen({super.key});

  @override
  State<CelebrationPopupScreen> createState() => _CelebrationPopupScreenState();
}

class _CelebrationPopupScreenState extends State<CelebrationPopupScreen> {
  @override
  Widget build(BuildContext context) {
    final overrideItem = CelebrationOverride.of(context);
    if (overrideItem != null) {
      return _CelebrationContent(item: overrideItem);
    }

    return BlocBuilder<CelebrationBloc, CelebrationState>(
      builder: (context, state) {
        final item = state.celebrationItem;
        if (state.status == BaseStateStatus.loading || item == null) {
          return const SizedBox.shrink();
        }
        return _CelebrationContent(item: item);
      },
    );
  }
}

class _CelebrationContent extends StatefulWidget {
  const _CelebrationContent({required this.item});

  final CelebrationItem item;

  @override
  State<_CelebrationContent> createState() => _CelebrationContentState();
}

class _CelebrationContentState extends State<_CelebrationContent>
    with TickerProviderStateMixin {
  late final AnimationController _entryController;
  late final ConfettiController _confettiController;
  late final AnimationController _sparkleController;

  // Plays the birthday jingle while the popup is open. Created lazily so
  // seniority popups (no music) don't pay the resource cost.
  AudioPlayer? _audioPlayer;

  // Stable seed for sparkle positions so they don't jump on rebuild.
  final int _sparkSeed = (DateTime.now().microsecondsSinceEpoch ^ 0x5a5a5a5a) &
      0x7fffffff;

  @override
  void initState() {
    super.initState();

    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    // Play a single confetti blast when the popup appears. The package
    // handles emission, gravity, and rotation internally.
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2))
          ..play();

    // Sparkles twinkle independently on a short loop — kept fast so the
    // scene feels alive without distracting from the artwork.
    _sparkleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat();

    // Background jingle — only for birthday popups. Looped softly under
    // the celebration visuals until the user dismisses.
    if (widget.item.isBirthday == true) {
      // Mix with the user's currently playing music (don't kill their
      // song) and duck it slightly so the jingle stays audible.
      AudioPlayer.global.setAudioContext(
        AudioContext(
          android: const AudioContextAndroid(
            isSpeakerphoneOn: false,
            stayAwake: false,
            contentType: AndroidContentType.music,
            usageType: AndroidUsageType.assistanceSonification,
            audioFocus: AndroidAudioFocus.gainTransientMayDuck,
          ),
          iOS: AudioContextIOS(
            category: AVAudioSessionCategory.playback,
            options: const {
              AVAudioSessionOptions.mixWithOthers,
            },
          ),
        ),
      );

      _audioPlayer = AudioPlayer(playerId: 'birthday_jingle')
        ..setReleaseMode(ReleaseMode.loop)
        ..setVolume(0.6)
        ..play(AssetSource(AppImages.birthday_music));
    }
  }

  @override
  void dispose() {
    _entryController.dispose();
    _confettiController.dispose();
    _sparkleController.dispose();
    _audioPlayer?.stop();
    _audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final isBirthday = item.isBirthday ?? false;
    final seniorityYears = item.seniorityYears ?? 0;

    final theme = _CelebrationTheme.forType(
      isBirthday: isBirthday,
      seniorityYears: seniorityYears,
    );

    return Stack(
      children: [
        // Backdrop gradient (matches the card so the dim feels cohesive).
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.backdropTop,
                  theme.backdropBottom,
                ],
              ),
            ),
            child: Container(color: AppColors.black.withValues(alpha: 0.35)),
          ),
        ),
        // Foreground artwork + dismiss button.
        Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: CelebrationSizes.horizontalPadding,
              right: CelebrationSizes.horizontalPadding,
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: _EntryAnimation(
              controller: _entryController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _FestiveCard(
                    imagePath: theme.backgroundImage,
                    aspectRatio: theme.aspectRatio,
                    overlay: theme.overlayBuilder?.call(item),
                    footer: _ThanksButton(
                      onPressed: () {
                        // Stop the jingle synchronously before popping so
                        // the audio cuts off the moment the user
                        // confirms, instead of lingering until dispose.
                        _audioPlayer?.stop();
                        Navigator.of(context).pop();
                      },
                      style: theme.buttonStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Twinkling stars around the card — sits above everything but
        // below the confetti so falling paper appears in front.
        Positioned.fill(
          child: IgnorePointer(
            child: _SparkleField(
              controller: _sparkleController,
              seed: _sparkSeed,
            ),
          ),
        ),
        // Confetti blast from the top center of the screen. The widget
        // is full-screen so falling pieces reach the bottom edge. Sits
        // above sparkles so paper appears in front.
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: math.pi / 2, // straight down
            blastDirectionality: BlastDirectionality.explosive,
            emissionFrequency: 0.05,
            numberOfParticles: 25,
            maxBlastForce: 20,
            minBlastForce: 8,
            gravity: 0.25,
            shouldLoop: false,
            colors: const [
              Color(0xFFFF5252),
              Color(0xFFFFD740),
              Color(0xFF40C4FF),
              Color(0xFF69F0AE),
              Color(0xFFFF80AB),
              Color(0xFFB388FF),
            ],
          ),
        ),
      ],
    );
  }
}

/// Twinkling stars scattered around the card. Each star pulses opacity
/// on its own phase so the field feels alive.
class _SparkleField extends StatelessWidget {
  const _SparkleField({required this.controller, required this.seed});

  final AnimationController controller;
  final int seed;

  @override
  Widget build(BuildContext context) {
    final rng = Random(seed);
    final stars = List<_Spark>.generate(16, (i) {
      return _Spark(
        x: rng.nextDouble(),
        y: rng.nextDouble(),
        size: 14 + rng.nextDouble() * 14,
        phase: rng.nextDouble(),
        speed: 0.7 + rng.nextDouble() * 0.8,
        color: i.isEven
            ? const Color(0xFFFFEB3B)
            : const Color(0xFFFFFFFF),
      );
    });

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _SparklePainter(t: controller.value, stars: stars),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Spark {
  const _Spark({
    required this.x,
    required this.y,
    required this.size,
    required this.phase,
    required this.speed,
    required this.color,
  });

  final double x;
  final double y;
  final double size;
  final double phase;
  final double speed;
  final Color color;
}

class _SparklePainter extends CustomPainter {
  _SparklePainter({required this.t, required this.stars});

  final double t;
  final List<_Spark> stars;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (final s in stars) {
      // Per-star pulse: sine mapped to 0.2..1.0 opacity range.
      final phase = (t * s.speed * 2 * math.pi) + s.phase * 2 * math.pi;
      final opacity = 0.2 + 0.8 * (0.5 + 0.5 * math.sin(phase));
      paint.color = s.color.withValues(alpha: opacity);

      final cx = s.x * size.width;
      final cy = s.y * size.height;
      final r = s.size / 2;

      // 4-pointed star drawn as two thin diamonds crossed.
      final path = Path()
        ..moveTo(cx, cy - r)
        ..lineTo(cx + r * 0.18, cy)
        ..lineTo(cx, cy + r)
        ..lineTo(cx - r * 0.18, cy)
        ..close()
        ..moveTo(cx - r, cy)
        ..lineTo(cx, cy - r * 0.18)
        ..lineTo(cx + r, cy)
        ..lineTo(cx, cy + r * 0.18)
        ..close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SparklePainter oldDelegate) =>
      oldDelegate.t != t || oldDelegate.stars != stars;
}

/// Entry scale + fade animation.
class _EntryAnimation extends StatelessWidget {
  const _EntryAnimation({required this.controller, required this.child});

  final AnimationController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scale = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut),
    );
    final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.4)),
    );
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Opacity(
          opacity: fade.value,
          child: Transform.scale(scale: scale.value, child: child),
        );
      },
    );
  }
}

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
                Positioned(
                  left: isIOS ? unit * 0.52 : w * 0.34,
                  right: isIOS ? unit * 0.45 : w * 0.28,
                  top: isIOS ? unit * 0.432 : h * 0.149,
                  child: Transform.rotate(
                    angle: -0.03,
                    child: Text(
                      'Sinh nhật $birthday',
                      maxLines: 1,
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

/// A floating, "3D-looking" dismiss button — gradient face, two-layer
/// drop shadow for depth, light highlight on the top edge, and a subtle
/// press-down animation. Sits below the artwork inside the dialog.
class _ThanksButton extends StatefulWidget {
  const _ThanksButton({
    required this.onPressed,
    required this.style,
  });

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
    _press = Tween<double>(begin: 1.0, end: 0.94).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeOut),
    );
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
          return Transform.scale(
            scale: _press.value,
            child: child,
          );
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
                      colors: [
                        style.gradientTop,
                        style.gradientBottom,
                      ],
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
                                    color: AppColors.black
                                        .withValues(alpha: 0.25),
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
                                      color: AppColors.black
                                          .withValues(alpha: 0.25),
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

  /// Seniority 10+ years — gold/amber gradient, trophy icon, premium feel.
  seniorityHigh(
    gradientTop: Color(0xFFFFD54F),
    gradientBottom: Color(0xFFFF8F00),
    glowColor: Color(0xFFFFB300),
    icon: Icons.emoji_events_rounded,
    label: 'Cảm ơn!',
  ),

  /// Seniority 5–9 years — blue→teal gradient, badge icon, fresh tone.
  seniorityMid(
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

  /// Festive seniority artwork for 10+ years (square).
  factory _CelebrationTheme.seniorityHigh() {
    return const _CelebrationTheme(
      backgroundImage: AppImages.seniority,
      aspectRatio: 1,
      backdropTop: Color(0xFFE1BEE7),
      backdropBottom: Color(0xFFFFCCBC),
      buttonStyle: _ButtonStyle.seniorityHigh,
    );
  }

  /// Festive seniority artwork for 5+ years (square).
  factory _CelebrationTheme.seniorityMid() {
    return const _CelebrationTheme(
      backgroundImage: AppImages.seniority,
      aspectRatio: 1,
      backdropTop: Color(0xFFBBDEFB),
      backdropBottom: Color(0xFFB2EBF2),
      buttonStyle: _ButtonStyle.seniorityMid,
    );
  }

  factory _CelebrationTheme.forType({
    required bool isBirthday,
    required int seniorityYears,
  }) {
    if (isBirthday) return _CelebrationTheme.birthday();
    if (seniorityYears >= 10) return _CelebrationTheme.seniorityHigh();
    return _CelebrationTheme.seniorityMid();
  }

  final String backgroundImage;
  final double aspectRatio;
  final Color backdropTop;
  final Color backdropBottom;
  final _ButtonStyle buttonStyle;
  final Widget Function(CelebrationItem item)? overlayBuilder;
}