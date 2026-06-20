import 'package:flutter/material.dart';

import 'week_plan_dashboard_glass_container.dart';

/// Hero card hiển thị tổng công việc + badge quá hạn.
///
/// Dùng gradient cam + 2 vòng tròn mờ làm hiệu ứng glassmorphism nổi bật.
class WeekPlanDashboardHeroCard extends StatelessWidget {
  const WeekPlanDashboardHeroCard({
    super.key,
    required this.total,
    required this.overdue,
  });

  final int total;
  final int overdue;

  @override
  Widget build(BuildContext context) {
    return WeekPlanDashboardGlassContainer(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFEE4623),
          Color(0xFFFF6B3D),
          Color(0xFFFFA726),
        ],
        stops: [0.0, 0.55, 1.0],
      ),
      borderColor: Colors.white.withValues(alpha: 0.35),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      useBlur: false,
      child: Stack(
        children: [
          // Decorative blurred circle (glassmorphism highlight)
          Positioned(
            right: -30,
            top: -30,
            child: WeekPlanDashboardBlurCircle(
              size: 140,
              color: Colors.white.withValues(alpha: 0.22),
            ),
          ),
          Positioned(
            left: -20,
            bottom: -40,
            child: WeekPlanDashboardBlurCircle(
              size: 120,
              color: Colors.white.withValues(alpha: 0.12),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.22),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.assignment_turned_in_outlined,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Tổng công việc',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$total',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      'công việc',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.85),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (overdue > 0) _OverdueBadge(overdue: overdue),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OverdueBadge extends StatelessWidget {
  const _OverdueBadge({required this.overdue});

  final int overdue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Colors.white,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            '$overdue quá hạn',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
