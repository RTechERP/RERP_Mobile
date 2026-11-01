import 'package:flutter/material.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/crm_dashboard_model.dart';

/// Widget hiển thị danh sách team Sale với số lượng Lead.
class DashboardTeamList extends StatelessWidget {
  final List<LeadByTeam> teams;

  const DashboardTeamList({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    if (teams.isEmpty) {
      return const SizedBox.shrink();
    }

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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.groups, size: 20, color: Colors.orange),
              ),
              const SizedBox(width: 12),
              Text(
                'Theo team Sale',
                style: AppStyles.headingTitle4.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...teams.map((team) => _buildTeamItem(team)),
        ],
      ),
    );
  }

  Widget _buildTeamItem(LeadByTeam team) {
    final color = _getColor(teams.indexOf(team));
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withValues(alpha: 0.7)],
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                team.total.toString(),
                style: AppStyles.headingTitle6.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  team.teamName ?? 'N/A',
                  style: AppStyles.subtitle2.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.heading,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${team.total} Lead',
                  style: AppStyles.caption2.copyWith(
                    color: AppColors.label,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.label.withValues(alpha: 0.5)),
        ],
      ),
    );
  }

  Color _getColor(int index) {
    final colors = [
      const Color(0xFFFF6B35),
      const Color(0xFFF7931E),
      const Color(0xFFFDC830),
      const Color(0xFFFF5733),
    ];
    return colors[index % colors.length];
  }
}
