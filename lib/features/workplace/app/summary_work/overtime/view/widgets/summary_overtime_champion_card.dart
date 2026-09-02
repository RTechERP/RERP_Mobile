import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../data/datasource/models/summary_overtime_model.dart';

const _goldLight = Color(0xFFFFE5A0);
const _goldMid = Color(0xFFFFC857);
const _goldDeep = Color(0xFFE89B0E);

/// Card hiển thị người đứng đầu (champion) trong bảng xếp hạng giờ OT.
///
/// Đặc trưng:
/// - Nền gradient vàng dịu, không nhấp nháy.
/// - Avatar trắng với 12 ngôi sao lấp lánh trắng quanh.
/// - 2 ô thống kê (đăng ký / được hưởng) với text trắng nổi bật.
class SummaryOvertimeChampionCard extends StatefulWidget {
  const SummaryOvertimeChampionCard({
    super.key,
    required this.person,
  });

  final SummaryOvertimePerson person;

  @override
  State<SummaryOvertimeChampionCard> createState() =>
      _SummaryOvertimeChampionCardState();
}

class _SummaryOvertimeChampionCardState
    extends State<SummaryOvertimeChampionCard>
    with TickerProviderStateMixin {
  late final AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  String _hoursLine() {
    final h = widget.person.hourSummary ?? 0;
    return h.toStringAsFixed(h.truncateToDouble() == h ? 0 : 1);
  }

  String _benefitLine() {
    final b = widget.person.totalBenefitPeriod ?? 0;
    return b.toStringAsFixed(b.truncateToDouble() == b ? 0 : 1);
  }

  @override
  Widget build(BuildContext context) {
    final name = (widget.person.fullName?.trim().isNotEmpty == true)
        ? widget.person.fullName!
        : 'Nhân viên';
    final initial = name.characters.first.toUpperCase();

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [_goldLight, _goldMid, _goldDeep],
            ),
            boxShadow: [
              BoxShadow(
                color: _goldMid.withValues(alpha: 0.25),
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Avatar + ngôi sao lấp lánh
                _AvatarWithSparkles(
                  size: width * 0.22,
                  boxSize: width * 0.34,
                  controller: _shimmerController,
                  initial: initial,
                ),
                const SizedBox(height: 8),
                // Tên
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.1,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.28),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.emoji_events,
                        color: Colors.white,
                        size: 12,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'QUÁN QUÂN',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Hàng dưới: 2 ô thống kê
                Row(
                  children: [
                    Expanded(
                      child: _ChampionStat(
                        subtitle: 'Giờ đăng ký',
                        value: '${_hoursLine()}h',
                        icon: Icons.schedule,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 32,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                    Expanded(
                      child: _ChampionStat(
                        subtitle: 'Được hưởng',
                        value: '${_benefitLine()}h',
                        icon: Icons.trending_up,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ChampionStat extends StatelessWidget {
  const _ChampionStat({
    required this.subtitle,
    required this.value,
    required this.icon,
  });

  final String subtitle;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 14),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white.withValues(alpha: 0.9),
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// Avatar tròn nền trắng với ký tự đầu + 12 ngôi sao lấp lánh xung quanh.
///
/// Mỗi ngôi sao có phase lệch nhau nên tạo cảm giác nhấp nháy rải rác liên tục.
class _AvatarWithSparkles extends StatelessWidget {
  const _AvatarWithSparkles({
    required this.size,
    required this.boxSize,
    required this.controller,
    required this.initial,
  });

  final double size;
  final double boxSize;
  final AnimationController controller;
  final String initial;

  static const _sparkles = <_SparklePos>[
    _SparklePos(0.50, 0.05, 0.00, 14.0),
    _SparklePos(0.74, 0.14, 0.20, 11.0),
    _SparklePos(0.88, 0.32, 0.40, 13.0),
    _SparklePos(0.94, 0.52, 0.60, 15.0),
    _SparklePos(0.88, 0.72, 0.80, 12.0),
    _SparklePos(0.74, 0.88, 0.10, 14.0),
    _SparklePos(0.50, 0.97, 0.30, 11.0),
    _SparklePos(0.26, 0.88, 0.50, 15.0),
    _SparklePos(0.12, 0.72, 0.70, 12.0),
    _SparklePos(0.06, 0.52, 0.90, 15.0),
    _SparklePos(0.12, 0.32, 0.15, 13.0),
    _SparklePos(0.26, 0.14, 0.35, 11.0),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Vòng glow mờ bao quanh avatar
          Container(
            width: size * 1.25,
            height: size * 1.25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.5),
                  blurRadius: 16,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
          // Avatar: hình tròn nền trắng + ký tự đầu
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              initial,
              style: TextStyle(
                fontSize: size * 0.5,
                fontWeight: FontWeight.w900,
                color: _goldDeep,
                height: 1,
              ),
            ),
          ),
          // Các ngôi sao lấp lánh xung quanh avatar
          ..._sparkles.map((s) {
            return AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                final phase = (controller.value + s.phase) % 1.0;
                final opacity =
                    (math.sin(phase * 2 * math.pi) * 0.5 + 0.5).clamp(0.0, 1.0);
                final scale = 0.5 + 0.7 * opacity;
                return Positioned(
                  left: s.x * boxSize - s.size / 2,
                  top: s.y * boxSize - s.size / 2,
                  child: Opacity(
                    opacity: opacity,
                    child: Transform.scale(
                      scale: scale,
                      child: Icon(
                        Icons.auto_awesome,
                        size: s.size,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.white.withValues(alpha: 0.8),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

class _SparklePos {
  const _SparklePos(this.x, this.y, this.phase, this.size);
  final double x;
  final double y;
  final double phase;
  final double size;
}
