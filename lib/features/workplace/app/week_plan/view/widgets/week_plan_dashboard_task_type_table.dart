import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import 'week_plan_dashboard_glass_container.dart';
import '../../data/datasource/models/week_plan_dashboard_models.dart';

/// Bảng thống kê trạng thái công việc theo loại.
///
/// Cột: LOẠI CV | DUYỆT | TỪ CHỐI | ĐANG LÀM | QUÁ HẠN | CHỜ DUYỆT
class WeekPlanDashboardTaskTypeTable extends StatelessWidget {
  const WeekPlanDashboardTaskTypeTable({super.key, required this.stats});

  final List<DashboardTaskTypeStat> stats;

  @override
  Widget build(BuildContext context) {
    return WeekPlanDashboardGlassContainer(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WeekPlanDashboardSectionHeader(
            title: 'Thống kê theo loại công việc',
            subtitle: 'Phân bổ trạng thái công việc',
            icon: Icons.category_outlined,
          ),
          const SizedBox(height: 12),
          if (stats.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  'Chưa có dữ liệu',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textTertiaryColor,
                  ),
                ),
              ),
            )
          else ...[
            const WeekPlanDashboardTableHeader(),
            const SizedBox(height: 6),
            ...stats.asMap().entries.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: WeekPlanDashboardTableRow(index: e.key, stat: e.value),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Header của bảng.
class WeekPlanDashboardTableHeader extends StatelessWidget {
  const WeekPlanDashboardTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 10.5,
      fontWeight: FontWeight.w700,
      color: AppColors.textTertiaryColor,
      letterSpacing: 0.3,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Expanded(flex: 28, child: Text('LOẠI CV', style: style)),
          Expanded(
            flex: 14,
            child: Text('DUYỆT', style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 14,
            child: Text('TỪ CHỐI', style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 16,
            child: Text('ĐANG LÀM', style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 14,
            child: Text('QUÁ HẠN', style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 14,
            child: Text('CHỜ DUYỆT', style: style, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

/// Một dòng trong bảng.
class WeekPlanDashboardTableRow extends StatelessWidget {
  const WeekPlanDashboardTableRow({
    super.key,
    required this.index,
    required this.stat,
  });

  final int index;
  final DashboardTaskTypeStat stat;

  @override
  Widget build(BuildContext context) {
    final isAlt = index.isOdd;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: isAlt
            ? AppColors.bgCard.withValues(alpha: 0.6)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 28,
            child: Text(
              stat.typeName,
              style: const TextStyle(
                fontSize: 12.5,
                color: AppColors.heading,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 14,
            child: WeekPlanDashboardStatBadge(
              text: '${stat.duyet}',
              color: const Color(0xFF33B469),
              bg: const Color(0xFFE7F6EC),
            ),
          ),
          Expanded(
            flex: 14,
            child: WeekPlanDashboardStatBadge(
              text: '${stat.tuChoi}',
              color: const Color(0xFFE94260),
              bg: const Color(0xFFFCE7EB),
            ),
          ),
          Expanded(
            flex: 16,
            child: WeekPlanDashboardStatBadge(
              text: '${stat.dangLam}',
              color: const Color(0xFF2F80ED),
              bg: const Color(0xFFE6F0FC),
            ),
          ),
          Expanded(
            flex: 14,
            child: WeekPlanDashboardStatBadge(
              text: '${stat.quaHan}',
              color: const Color(0xFFEB5757),
              bg: const Color(0xFFFCE7EB),
              highlight: stat.quaHan > 0,
            ),
          ),
          Expanded(
            flex: 14,
            child: WeekPlanDashboardStatBadge(
              text: '${stat.choDuyet}',
              color: const Color(0xFFF0891A),
              bg: const Color(0xFFFFF3E0),
            ),
          ),
        ],
      ),
    );
  }
}

/// Badge hiển thị số trong ô bảng.
class WeekPlanDashboardStatBadge extends StatelessWidget {
  const WeekPlanDashboardStatBadge({
    super.key,
    required this.text,
    required this.color,
    required this.bg,
    this.highlight = false,
  });

  final String text;
  final Color color;
  final Color bg;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
          border: highlight
              ? Border.all(color: color.withValues(alpha: 0.45), width: 1)
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ),
    );
  }
}
