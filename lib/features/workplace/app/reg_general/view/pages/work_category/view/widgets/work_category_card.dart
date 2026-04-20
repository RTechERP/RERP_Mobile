import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/work_category_model.dart';

class WorkCategoryCard extends StatelessWidget {
  const WorkCategoryCard({
    super.key,
    required this.item,
    required this.isParent,
    this.onTap,
  });

  final WorkCategoryItem item;
  final bool isParent;
  final VoidCallback? onTap;

  static final _dateFmt = DateFormat('dd/MM/yyyy');

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  // Status info (label + accent color)
  _StatusInfo _statusInfo(int status) {
    switch (status) {
      case 0:
        return _StatusInfo('Chưa làm', AppColors.orangeA500);
      case 1:
        return _StatusInfo('Đang làm', AppColors.blueA500);
      case 2:
        return _StatusInfo('Hoàn thành', AppColors.greenA500);
      case 3:
        return _StatusInfo('Pending', AppColors.purpleA500);
      default:
        return _StatusInfo(
          item.statusText.isNotEmpty ? item.statusText : 'Khác',
          AppColors.gray,
        );
    }
  }

  _CardTheme _cardTheme() {
    // Priority 1 – trễ nghiêm trọng
    if (item.itemLate == 2 || item.itemLateActual == 2) {
      return const _CardTheme(
        bg: Color(0xFFFFCDD2), // red-100
        textColor: Color(0xFFC62828), // red-800
      );
    }

    // Priority 2 – trễ nhẹ
    if (item.itemLate == 1 || item.itemLateActual == 1) {
      return const _CardTheme(
        bg: Color(0xFFFFE0B2), // orange-100
        textColor: null,
      );
    }

    // Priority 3 – parent node
    if (isParent) {
      return const _CardTheme(
        bg: Color(0xFFF3F4F6), // neutral-100
        textColor: null,
      );
    }

    // Priority 4 – sắp hết hạn
    final soonExpiry =
        item.totalDayExpridSoon <= 3 &&
        item.planEndDate != null &&
        item.actualEndDate == null;
    if (soonExpiry) {
      return const _CardTheme(
        bg: Color(0xFFFFF9C4), // yellow-100
        textColor: null,
      );
    }

    // Default
    return const _CardTheme(bg: Colors.white, textColor: null);
  }

  @override
  Widget build(BuildContext context) {
    final si = _statusInfo(item.status);
    final percent = (item.percentageActual / 100).clamp(0.0, 1.0);
    final ct = _cardTheme();

    final bodyTextColor = ct.textColor ?? AppColors.enableText;
    final subtleColor = ct.textColor != null
        ? ct.textColor!.withValues(alpha: 0.7)
        : AppColors.gray;

    return Material(
      color: ct.bg,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: ct.bg == Colors.white
                  ? const Color(0xFFE0E0E0)
                  : ct.bg.withValues(alpha: 0.0),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- Left: info block ---
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mã hạng mục
                    Text(
                      item.code.isNotEmpty ? item.code : '—',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: bodyTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Kiểu dự án
                    Row(
                      children: [
                        Icon(
                          Icons.folder_outlined,
                          size: 15,
                          color: subtleColor,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            item.projectTypeName.isNotEmpty
                                ? item.projectTypeName
                                : '—',
                            style: TextStyle(fontSize: 13, color: subtleColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // Trạng thái badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: si.color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: si.color.withValues(alpha: 0.4),
                          width: 0.8,
                        ),
                      ),
                      child: Text(
                        si.label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: si.color,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Kế hoạch: ngày bắt đầu – ngày kết thúc
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: subtleColor,
                        ),
                        const SizedBox(width: 4),

                        Text(
                          'KH: ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: subtleColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            '${_formatDate(item.planStartDate)}  →  ${_formatDate(item.planEndDate)}',
                            style: TextStyle(
                              fontSize: 12.5,
                              color: subtleColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    // Thực tế: ngày bắt đầu – ngày kết thúc
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: subtleColor,
                        ),
                        const SizedBox(width: 4),

                        Text(
                          'TT: ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: subtleColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            '${_formatDate(item.actualStartDate)}  →  ${_formatDate(item.actualEndDate)}',
                            style: TextStyle(
                              fontSize: 12.5,
                              color: subtleColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // --- Right: circular progress ---
              _PercentCircle(percent: percent, color: si.color),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

class _StatusInfo {
  const _StatusInfo(this.label, this.color);
  final String label;
  final Color color;
}

class _CardTheme {
  const _CardTheme({required this.bg, required this.textColor});
  final Color bg;

  /// Null → dùng màu mặc định (enableText / gray).
  final Color? textColor;
}

class _PercentCircle extends StatelessWidget {
  const _PercentCircle({required this.percent, required this.color});

  final double percent; // 0.0 – 1.0
  final Color color;

  @override
  Widget build(BuildContext context) {
    final pct = (percent * 100).round();
    return SizedBox(
      width: 60,
      height: 60,
      child: CustomPaint(
        painter: _CirclePainter(percent: percent, color: color),
        child: Center(
          child: Text(
            '$pct%',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  _CirclePainter({required this.percent, required this.color});

  final double percent;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 3;
    const strokeWidth = 5.0;

    final trackPaint = Paint()
      ..color = color.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, trackPaint);

    if (percent > 0) {
      final progressPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        2 * math.pi * percent,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_CirclePainter old) =>
      old.percent != percent || old.color != color;
}
