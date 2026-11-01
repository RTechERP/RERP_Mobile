import 'package:flutter/material.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/crm_dashboard_model.dart';

/// Widget hiển thị thống kê tăng trưởng theo nhóm ngành và loại khách hàng.
class DashboardGrowthSection extends StatelessWidget {
  final List<LeadByIndustryGrowth> industryGrowth;
  final List<LeadByCategoryGrowth> categoryGrowth;

  const DashboardGrowthSection({
    super.key,
    required this.industryGrowth,
    required this.categoryGrowth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (industryGrowth.isNotEmpty) ...[
          _buildIndustrySection(),
          const SizedBox(height: 16),
        ],
        if (categoryGrowth.isNotEmpty) _buildCategorySection(),
      ],
    );
  }

  Widget _buildIndustrySection() {
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
                  color: AppColors.blueA500.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.trending_up,
                  size: 20,
                  color: AppColors.blueA500,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Tăng trưởng nhóm ngành',
                  style: AppStyles.headingTitle4.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDataTable(
            headers: ['Nhóm ngành', 'Tháng', 'Tổng'],
            rows: industryGrowth.map((item) {
              final month = item.month != null && item.year != null
                  ? 'T${item.month}/${item.year}'
                  : 'N/A';
              return [
                item.poType ?? 'N/A',
                month,
                item.total.toString(),
              ];
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
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
                  color: AppColors.purpleA500.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.category,
                  size: 20,
                  color: AppColors.purpleA500,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Tăng trưởng nhóm KH',
                  style: AppStyles.headingTitle4.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDataTable(
            headers: ['Loại khách hàng', 'Tháng', 'Tổng'],
            rows: categoryGrowth.map((item) {
              final month = item.month != null && item.year != null
                  ? 'T${item.month}/${item.year}'
                  : 'N/A';
              return [
                item.customerTypeName ?? 'N/A',
                month,
                item.total.toString(),
              ];
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDataTable({
    required List<String> headers,
    required List<List<String>> rows,
  }) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: headers.map((header) {
              final isLast = header == headers.last;
              return Expanded(
                flex: isLast ? 1 : 2,
                child: Text(
                  header,
                  style: AppStyles.subtitle3.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.heading,
                  ),
                  textAlign: isLast ? TextAlign.right : TextAlign.left,
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        // Rows
        ...rows.map((row) => _buildTableRow(row)),
        // Total row
        if (rows.isNotEmpty) _buildTotalRow(rows),
      ],
    );
  }

  Widget _buildTableRow(List<String> cells) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: cells.asMap().entries.map((entry) {
          final index = entry.key;
          final cell = entry.value;
          final isLast = index == cells.length - 1;
          
          return Expanded(
            flex: isLast ? 1 : 2,
            child: Text(
              cell,
              style: AppStyles.body2.copyWith(
                color: AppColors.heading,
                fontWeight: isLast ? FontWeight.w600 : FontWeight.w400,
              ),
              textAlign: isLast ? TextAlign.right : TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTotalRow(List<List<String>> rows) {
    final total = rows.fold<int>(
      0,
      (sum, row) => sum + (int.tryParse(row.last) ?? 0),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryERP.withValues(alpha: 0.1),
            AppColors.primaryERP.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryERP.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Tổng',
              style: AppStyles.subtitle2.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.heading,
              ),
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
          Expanded(
            flex: 1,
            child: Text(
              total.toString(),
              style: AppStyles.subtitle2.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryERP,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
