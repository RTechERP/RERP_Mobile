part of '../pages/celebration_popup_screen.dart';

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
        color: i.isEven ? const Color(0xFFFFEB3B) : const Color(0xFFFFFFFF),
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
