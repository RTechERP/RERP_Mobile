import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import 'week_plan_dashboard_glass_container.dart';
import '../../data/datasource/models/week_plan_dashboard_models.dart';

/// Lưới 9 thẻ trạng thái:
///  - Chưa bắt đầu / Đang làm / Đang làm quá hạn
///  - Chờ phê duyệt / Chờ phê duyệt quá hạn
///  - Hoàn thành / Từ chối / Tạm hoãn / Huỷ
class WeekPlanDashboardStatusGrid extends StatelessWidget {
  const WeekPlanDashboardStatusGrid({
    super.key,
    required this.stats,
  });

  final DashboardStats stats;

  @override
  Widget build(BuildContext context) {
    final items = <_StatusItem>[
      _StatusItem(
        label: 'Chưa bắt đầu',
        value: stats.chuaBatDau,
        color: const Color(0xFF8C96B1),
        icon: Icons.schedule_outlined,
      ),
      _StatusItem(
        label: 'Đang làm',
        value: stats.dangLam,
        color: const Color(0xFF2F80ED),
        icon: Icons.play_circle_outline,
      ),
      _StatusItem(
        label: 'Đang làm quá hạn',
        value: stats.dangLamQuaHan,
        color: const Color(0xFFEB5757),
        icon: Icons.error_outline,
      ),
      _StatusItem(
        label: 'Chờ phê duyệt',
        value: stats.choPheDuyet,
        color: const Color(0xFFF2C94C),
        icon: Icons.hourglass_top_outlined,
      ),
      _StatusItem(
        label: 'Chờ phê duyệt quá hạn',
        value: stats.choPheDuyetQuaHan,
        color: const Color(0xFFF0891A),
        icon: Icons.hourglass_disabled_outlined,
      ),
      _StatusItem(
        label: 'Hoàn thành',
        value: stats.hoanThanh,
        color: const Color(0xFF33B469),
        icon: Icons.check_circle_outline,
      ),
      _StatusItem(
        label: 'Từ chối',
        value: stats.tuChoi,
        color: const Color(0xFFE94260),
        icon: Icons.thumb_down_alt_outlined,
      ),
      _StatusItem(
        label: 'Tạm hoãn',
        value: stats.tamHoan,
        color: const Color(0xFFAF52DE),
        icon: Icons.pause_circle_outline,
      ),
      _StatusItem(
        label: 'Huỷ',
        value: stats.huy,
        color: const Color(0xFF6E7191),
        icon: Icons.cancel_outlined,
      ),
    ];

    return WeekPlanDashboardGlassContainer(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WeekPlanDashboardSectionHeader(
            title: 'Trạng thái công việc',
            subtitle: 'Số lượng theo từng trạng thái',
            icon: Icons.insights_outlined,
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
            children: items
                .map(
                  (item) => _WeekPlanDashboardStatusTile(
                    item: item,
                    total: stats.total,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _StatusItem {
  const _StatusItem({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  final String label;
  final int value;
  final Color color;
  final IconData icon;
}

/// Một ô trạng thái trong lưới.
class _WeekPlanDashboardStatusTile extends StatelessWidget {
  const _WeekPlanDashboardStatusTile({
    required this.item,
    required this.total,
  });

  final _StatusItem item;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      decoration: BoxDecoration(
        color: item.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: item.color.withValues(alpha: 0.18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: item.color.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(item.icon, color: item.color, size: 14),
              ),
              const SizedBox(width: 8),
              Text(
                '${item.value}',
                style: TextStyle(
                  fontSize: 20,
                  color: item.color.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.label,
            style: const TextStyle(
              fontSize: 10.5,
              color: AppColors.textSecondaryColor,
              fontWeight: FontWeight.w500,
              height: 1.15,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
