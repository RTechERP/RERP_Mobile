import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'newsfeed_season_theme.dart';

/// Lớp hạt theo mùa rơi chậm rãi trên nền màn hình.
///
/// Hat hoa anh dao (mua xuan), hat dua (mua ha), la roi (mua thu) va tuyet
/// (mua dong) rơi cham rai, tao nen chuyen dong nhe theo mua.
///
/// Lớp này luon bo qua cham de khong can thao tac cuon va bam.
class SeasonParticleLayer extends StatefulWidget {
  const SeasonParticleLayer({super.key, required this.palette});

  final SeasonPalette palette;

  @override
  State<SeasonParticleLayer> createState() => _SeasonParticleLayerState();
}

class _SeasonParticleLayerState extends State<SeasonParticleLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => CustomPaint(
            painter: _ParticlePainter(
              palette: widget.palette,
              progress: _controller.value,
            ),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}

/// Lop nen gradient theo mua phu toan man hinh, kem quang sang tran mo.
///
/// Chi ve nen, khong chua noi dung nao. Hat theo mua duoc ve rieng boi
/// [SeasonParticleLayer] de quyet dinh ve hat o phia truoc hay phia sau noi dung.
class SeasonParticleField extends StatelessWidget {
  const SeasonParticleField({super.key, required this.palette});

  final SeasonPalette palette;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: palette.screenGradient,
              ),
            ),
          ),
        ),
        Positioned(
          top: -140,
          right: -90,
          child: _GlowOrb(color: palette.primary, size: 300),
        ),
        Positioned(
          bottom: -160,
          left: -110,
          child: _GlowOrb(color: palette.secondary, size: 320),
        ),
      ],
    );
  }
}

/// Quang sang tron mo.
class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withValues(alpha: 0.14), color.withValues(alpha: 0.0)],
        ),
      ),
    );
  }
}

/// Ve cac hat theo mua roi cham rai xuong dua theo thoi gian.
class _ParticlePainter extends CustomPainter {
  _ParticlePainter({required this.palette, required this.progress});

  final SeasonPalette palette;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;

    final random = math.Random(11);
    final count = _countForSeason;

    for (var i = 0; i < count; i++) {
      final seedX = random.nextDouble();
      final seedY = random.nextDouble();
      final speed = 0.5 + random.nextDouble() * 0.8;
      final size_ = _sizeForSeason * (0.6 + random.nextDouble() * 0.8);
      final drift = (random.nextDouble() - 0.5) * 40;

      final y = (seedY + progress * speed) % 1.0 * size.height;
      final x =
          seedX * size.width + math.sin(progress * math.pi * 2 + i) * drift;

      _paintParticle(canvas, Offset(x, y), size_, i);
    }
  }

  /// So hat cua tung mua.
  int get _countForSeason {
    switch (palette.season) {
      case Season.xuan:
        return 26;
      case Season.ha:
        return 18;
      case Season.thu:
        return 22;
      case Season.dong:
        return 34;
    }
  }

  /// Kich thuoc hat cua tung mua.
  double get _sizeForSeason {
    switch (palette.season) {
      case Season.xuan:
        return 7;
      case Season.ha:
        return 5;
      case Season.thu:
        return 8;
      case Season.dong:
        return 3.4;
    }
  }

  /// Ve mot hat theo dac diem cua mua.
  void _paintParticle(Canvas canvas, Offset center, double radius, int index) {
    final paint = Paint()..color = _colorForSeason.withValues(alpha: 0.62);

    switch (palette.season) {
      case Season.xuan:
        // Canh hoa anh dao: nhip hinh tron.
        canvas.drawCircle(center, radius, paint);
      case Season.ha:
        // Hat dua: nhip ellipse.
        canvas.drawOval(
          Rect.fromCenter(
            center: center,
            width: radius * 2,
            height: radius * 1.2,
          ),
          paint,
        );
      case Season.thu:
        // La roi: ellipse xoay nghieng.
        canvas.save();
        canvas.translate(center.dx, center.dy);
        canvas.rotate(index.isEven ? 0.7 : -0.7);
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset.zero,
            width: radius * 2.2,
            height: radius,
          ),
          paint,
        );
        canvas.restore();
      case Season.dong:
        // Tuyet: nhip tron nho.
        canvas.drawCircle(center, radius, paint);
    }
  }

  /// Mau cua hat cua mua.
  Color get _colorForSeason {
    switch (palette.season) {
      case Season.xuan:
        return palette.primary;
      case Season.ha:
        return palette.primary;
      case Season.thu:
        return palette.primary;
      case Season.dong:
        return Colors.white;
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.palette != palette;
}
