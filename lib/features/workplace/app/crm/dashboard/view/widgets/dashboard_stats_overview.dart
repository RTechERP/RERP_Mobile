import 'package:flutter/material.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/crm_dashboard_model.dart';
import 'dashboard_stats_card.dart';

/// Widget hiển thị các chỉ số thống kê tổng quan dạng thẻ.
class DashboardStatsOverview extends StatelessWidget {
  final CrmDashboardData data;

  const DashboardStatsOverview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    int totalLeads = 0;
    int totalHandover = 0;
    int totalPO = 0;
    double totalValue = 0;
    int totalReturned = 0;
    int totalLost = 0;

    for (final source in data.bySource) {
      totalLeads += source.total;
      totalHandover += source.totalHandover;
      totalPO += source.totalPO;
      totalValue += source.convertedValuePo;
      totalReturned += source.totalReturned;
      totalLost += source.totalLost;
    }

    final convertRate = totalLeads > 0 ? (totalPO / totalLeads * 100) : 0.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.dashboard,
                    size: 20,
                    color: AppColors.primaryERP,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Tổng quan',
                  style: AppStyles.headingTitle4.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          // Grid
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                DashboardStatsCard(
                  icon: Icons.leaderboard,
                  label: 'Tổng Lead',
                  value: totalLeads.toString(),
                  color: AppColors.blueA500,
                ),
                DashboardStatsCard(
                  icon: Icons.send,
                  label: 'Bàn giao Sales',
                  value: totalHandover.toString(),
                  color: AppColors.orangeA500,
                ),
                DashboardStatsCard(
                  icon: Icons.check_circle,
                  label: 'Đã chốt PO',
                  value: '$totalPO (${convertRate.toStringAsFixed(1)}%)',
                  color: AppColors.greenA500,
                ),
                DashboardStatsCard(
                  icon: Icons.attach_money,
                  label: 'Giá trị PO dự kiến',
                  value: DashboardStatsCard.formatCurrency(totalValue),
                  color: AppColors.primaryERP,
                ),
                DashboardStatsCard(
                  icon: Icons.undo,
                  label: 'Hoàn trả MKT',
                  value: '$totalReturned (${totalLeads > 0 ? (totalReturned / totalLeads * 100).toStringAsFixed(1) : "0.0"}%)',
                  color: AppColors.yellowA500,
                ),
                DashboardStatsCard(
                  icon: Icons.cancel,
                  label: 'Không thành công',
                  value: totalLost.toString(),
                  color: AppColors.redA500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
