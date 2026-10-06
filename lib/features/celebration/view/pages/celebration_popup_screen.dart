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

part '../widgets/celebration_override.dart';
part '../widgets/celebration_sparkle_field.dart';
part '../widgets/celebration_entry_animation.dart';
part '../widgets/celebration_festive_card.dart';
part '../widgets/birthday_overlay.dart';
part '../widgets/seniority_placement.dart';
part '../widgets/seniority_overlay.dart';
part '../widgets/thanks_button.dart';
part '../widgets/celebration_theme.dart';

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

  // Plays the jingle while the popup is open. Created lazily so popups
  // that resolve to no celebration (no birthday/seniority flag) don't
  // pay the resource cost.
  AudioPlayer? _audioPlayer;

  // Stable seed for sparkle positions so they don't jump on rebuild.
  final int _sparkSeed =
      (DateTime.now().microsecondsSinceEpoch ^ 0x5a5a5a5a) & 0x7fffffff;

  @override
  void initState() {
    super.initState();

    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    // Play a single confetti blast when the popup appears. The package
    // handles emission, gravity, and rotation internally.
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    )..play();

    // Sparkles twinkle independently on a short loop — kept fast so the
    // scene feels alive without distracting from the artwork.
    _sparkleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat();

    // Background jingle — one track per occasion. Looped softly under the
    // celebration visuals until the user dismisses. When both flags are
    // true the birthday track wins, matching the theme chosen in
    // _CelebrationTheme.forType.
    final isBirthday = widget.item.isBirthday == true;
    final isSeniority = widget.item.isSeniority == true;
    if (isBirthday || isSeniority) {
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
            options: const {AVAudioSessionOptions.mixWithOthers},
          ),
        ),
      );

      _audioPlayer =
          AudioPlayer(
              playerId: isBirthday ? 'birthday_jingle' : 'seniority_jingle',
            )
            ..setReleaseMode(ReleaseMode.loop)
            ..setVolume(0.6)
            ..play(
              AssetSource(
                isBirthday
                    ? AppImages.birthday_music
                    : AppImages.seniority_music,
              ),
            );
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
                colors: [theme.backdropTop, theme.backdropBottom],
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
