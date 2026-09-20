import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/summary_overtime_model.dart';

/// Card cho các vị trí từ Top 2 trở đi — thiết kế trung tính, không
/// kim cương/bạc/đồng, không tô đỏ "Top cuối", không hiển thị số thứ tự
/// hay nhãn "Top X" để tránh tạo cảm giác ganh đua.
class SummaryOvertimeRankItemCard extends StatelessWidget {
  const SummaryOvertimeRankItemCard({
    super.key,
    required this.person,
    required this.rank,
  });

  final SummaryOvertimePerson person;
  final int rank; // vị trí trong bảng xếp hạng (2, 3, 4...)

  String _hoursLine() {
    final h = person.hourSummary ?? 0;
    return h.toStringAsFixed(h.truncateToDouble() == h ? 0 : 1);
  }

  String _benefitLine() {
    final b = person.totalBenefitPeriod ?? 0;
    return b.toStringAsFixed(b.truncateToDouble() == b ? 0 : 1);
  }

  @override
  Widget build(BuildContext context) {
    final name = (person.fullName?.trim().isNotEmpty == true)
        ? person.fullName!
        : 'Nhân viên';
    final initial = name.characters.first.toUpperCase();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          color: AppColors.primaryERP.withValues(alpha: 0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar với ký tự đầu
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryERP.withValues(alpha: 0.15),
                  AppColors.primaryERP.withValues(alpha: 0.25),
                ],
              ),
              border: Border.all(
                color: AppColors.primaryERP.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              initial,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryERP,
                height: 1,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Nội dung
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.heading,
                          height: 1.2,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _MiniStat(
                        icon: Icons.schedule,
                        value: '${_hoursLine()}h',
                        label: 'đăng ký',
                        color: AppColors.orangeA500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: _MiniStat(
                        icon: Icons.trending_up,
                        value: '${_benefitLine()}h',
                        label: 'được hưởng',
                        color: AppColors.greenA500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: 0.18),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: color,
              height: 1,
            ),
          ),
          const SizedBox(width: 3),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: color.withValues(alpha: 0.85),
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}