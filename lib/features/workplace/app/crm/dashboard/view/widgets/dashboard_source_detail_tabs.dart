import 'package:flutter/material.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/crm_dashboard_model.dart';
import 'dashboard_stats_card.dart';

/// Widget hiển thị bảng chi tiết theo tab: Theo nguồn, Theo NV Sales, Tăng trưởng nhóm ngành, Tăng trưởng nhóm KH.
class DashboardSourceDetailTabs extends StatelessWidget {
  final List<LeadBySource> sources;
  final List<LeadByEmployee> salesEmployees;
  final List<LeadByIndustryGrowth> industryGrowth;
  final List<LeadByCategoryGrowth> categoryGrowth;

  const DashboardSourceDetailTabs({
    super.key,
    required this.sources,
    required this.salesEmployees,
    required this.industryGrowth,
    required this.categoryGrowth,
  });

  @override
  Widget build(BuildContext context) {
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
      child: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.blueA500.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.analytics,
                    size: 20,
                    color: AppColors.blueA500,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Bảng số liệu',
                  style: AppStyles.headingTitle4.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TabBar(
              labelColor: AppColors.primaryERP,
              unselectedLabelColor: AppColors.label,
              indicatorColor: AppColors.primaryERP,
              labelStyle: AppStyles.subtitle3.copyWith(
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: AppStyles.subtitle3,
              isScrollable: true,
              tabs: [
                Tab(text: 'Theo nguồn (${sources.length})'),
                Tab(text: 'Theo NV Sales (${salesEmployees.length})'),
                Tab(text: 'Tổng trưởng nhóm ngành (${industryGrowth.length})'),
                Tab(text: 'Tăng trưởng nhóm KH (${categoryGrowth.length})'),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 400,
              child: TabBarView(
                children: [
                  _buildSourceTable(),
                  _buildSalesTable(),
                  _buildIndustryTable(),
                  _buildCategoryTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceTable() {
    if (sources.isEmpty) {
      return Center(
        child: Text(
          'Không có dữ liệu',
          style: AppStyles.body2.copyWith(color: AppColors.label),
        ),
      );
    }

    return ListView.builder(
      itemCount: sources.length,
      itemBuilder: (context, index) {
        final source = sources[index];
        final color = _getColor(index);
        return _buildSourceCard(source, color);
      },
    );
  }

  Widget _buildSourceCard(LeadBySource source, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.08),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        source.leadSourceName ?? 'N/A',
                        style: AppStyles.subtitle2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.heading,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${source.total} Lead tổng',
                        style: AppStyles.caption2.copyWith(
                          color: AppColors.label,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${source.convertRate.toStringAsFixed(1)}%',
                    style: AppStyles.subtitle3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Stats grid
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildStatItem(
                        'Lead MKT',
                        source.totalMarketing.toString(),
                        Icons.campaign,
                        AppColors.orangeA500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatItem(
                        'Lead Sales',
                        source.totalSales.toString(),
                        Icons.person,
                        AppColors.blueA500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatItem(
                        'Bàn giao',
                        source.totalHandover.toString(),
                        Icons.swap_horiz,
                        AppColors.purpleA500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatItem(
                        'Đã PO',
                        source.totalPO.toString(),
                        Icons.check_circle,
                        AppColors.greenA500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatItem(
                        'Không TC',
                        source.totalLost.toString(),
                        Icons.cancel,
                        AppColors.redA500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatItem(
                        'Không phù hợp',
                        source.totalDisqualified.toString(),
                        Icons.block,
                        AppColors.label,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatItem(
                        'Hoàn trả MKT',
                        source.totalReturned.toString(),
                        Icons.undo,
                        AppColors.yellowA500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatItem(
                        'Giá trị PO',
                        DashboardStatsCard.formatCurrency(source.convertedValuePo),
                        Icons.attach_money,
                        AppColors.primaryERP,
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

  Widget _buildStatItem(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: AppStyles.caption2.copyWith(
                    color: AppColors.label,
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppStyles.subtitle2.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.heading,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Color _getColor(int index) {
    final colors = [
      AppColors.blueA500,
      AppColors.greenA500,
      AppColors.orangeA500,
      AppColors.purpleA500,
      AppColors.pinkA500,
    ];
    return colors[index % colors.length];
  }

  Widget _buildSalesTable() {
    if (salesEmployees.isEmpty) {
      return Center(
        child: Text(
          'Không có dữ liệu',
          style: AppStyles.body2.copyWith(color: AppColors.label),
        ),
      );
    }

    return ListView.builder(
      itemCount: salesEmployees.length,
      itemBuilder: (context, index) {
        final employee = salesEmployees[index];
        final color = _getColor(index);
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: AppStyles.subtitle2.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee.employeeName ?? 'N/A',
                      style: AppStyles.subtitle2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.heading,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tổng lead',
                      style: AppStyles.caption2.copyWith(
                        color: AppColors.label,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  employee.total.toString(),
                  style: AppStyles.headingTitle6.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIndustryTable() {
    if (industryGrowth.isEmpty) {
      return Center(
        child: Text(
          'Không có dữ liệu',
          style: AppStyles.body2.copyWith(color: AppColors.label),
        ),
      );
    }

    return ListView.builder(
      itemCount: industryGrowth.length,
      itemBuilder: (context, index) {
        final item = industryGrowth[index];
        final month = item.month != null && item.year != null
            ? 'Tháng ${item.month}/${item.year}'
            : 'N/A';
        final color = _getColor(index);

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 56,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.poType ?? 'N/A',
                      style: AppStyles.subtitle2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.heading,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      month,
                      style: AppStyles.caption2.copyWith(
                        color: AppColors.label,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      item.total.toString(),
                      style: AppStyles.headingTitle6.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lead',
                      style: AppStyles.caption2.copyWith(
                        color: color,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryTable() {
    if (categoryGrowth.isEmpty) {
      return Center(
        child: Text(
          'Không có dữ liệu',
          style: AppStyles.body2.copyWith(color: AppColors.label),
        ),
      );
    }

    return ListView.builder(
      itemCount: categoryGrowth.length,
      itemBuilder: (context, index) {
        final item = categoryGrowth[index];
        final month = item.month != null && item.year != null
            ? 'Tháng ${item.month}/${item.year}'
            : 'N/A';
        final color = _getColor(index);

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 56,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.customerTypeName ?? 'N/A',
                      style: AppStyles.subtitle2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.heading,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      month,
                      style: AppStyles.caption2.copyWith(
                        color: AppColors.label,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      item.total.toString(),
                      style: AppStyles.headingTitle6.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lead',
                      style: AppStyles.caption2.copyWith(
                        color: color,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  DataColumn _buildColumn(String label) {
    return DataColumn(
      label: Text(
        label,
        style: AppStyles.subtitle3.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.heading,
        ),
      ),
    );
  }

  DataRow _buildSourceRow(LeadBySource source) {
    return DataRow(cells: [
      DataCell(
        Container(
          constraints: const BoxConstraints(minWidth: 100),
          child: Text(
            source.leadSourceName ?? 'N/A',
            style: AppStyles.body2.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      DataCell(_buildCellText(source.total.toString())),
      DataCell(_buildCellText(source.totalMarketing.toString())),
      DataCell(_buildCellText(source.totalSales.toString())),
      DataCell(_buildCellText(source.totalHandover.toString())),
      DataCell(_buildCellText(source.totalPO.toString(), color: AppColors.greenA500)),
      DataCell(_buildCellText(source.totalLost.toString())),
      DataCell(_buildCellText(source.totalDisqualified.toString())),
      DataCell(_buildCellText(source.totalReturned.toString())),
      DataCell(_buildCellText('${source.convertRate.toStringAsFixed(1)}%', color: AppColors.blueA500)),
      DataCell(_buildCellText(DashboardStatsCard.formatCurrency(source.convertedValuePo), color: AppColors.primaryERP)),
    ]);
  }

  DataRow _buildSourceTotalRow() {
    int totalLeads = 0;
    int totalMarketing = 0;
    int totalSales = 0;
    int totalHandover = 0;
    int totalPO = 0;
    int totalLost = 0;
    int totalDisqualified = 0;
    int totalReturned = 0;
    double totalValue = 0;

    for (final source in sources) {
      totalLeads += source.total;
      totalMarketing += source.totalMarketing;
      totalSales += source.totalSales;
      totalHandover += source.totalHandover;
      totalPO += source.totalPO;
      totalLost += source.totalLost;
      totalDisqualified += source.totalDisqualified;
      totalReturned += source.totalReturned;
      totalValue += source.convertedValuePo;
    }

    final convertRate = totalLeads > 0 ? (totalPO / totalLeads * 100).toStringAsFixed(1) : '0.0';

    return DataRow(
      color: WidgetStateProperty.all(AppColors.primaryERP.withValues(alpha: 0.05)),
      cells: [
        DataCell(Text('Tổng', style: AppStyles.subtitle2.copyWith(fontWeight: FontWeight.bold))),
        DataCell(_buildCellText(totalLeads.toString(), isBold: true)),
        DataCell(_buildCellText(totalMarketing.toString(), isBold: true)),
        DataCell(_buildCellText(totalSales.toString(), isBold: true)),
        DataCell(_buildCellText(totalHandover.toString(), isBold: true)),
        DataCell(_buildCellText(totalPO.toString(), isBold: true, color: AppColors.greenA500)),
        DataCell(_buildCellText(totalLost.toString(), isBold: true)),
        DataCell(_buildCellText(totalDisqualified.toString(), isBold: true)),
        DataCell(_buildCellText(totalReturned.toString(), isBold: true)),
        DataCell(_buildCellText('$convertRate%', isBold: true, color: AppColors.blueA500)),
        DataCell(_buildCellText(DashboardStatsCard.formatCurrency(totalValue), isBold: true, color: AppColors.primaryERP)),
      ],
    );
  }

  Widget _buildCellText(String text, {bool isBold = false, Color? color}) {
    return Text(
      text,
      style: AppStyles.body2.copyWith(
        fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
        color: color ?? AppColors.heading,
      ),
      textAlign: TextAlign.center,
    );
  }
}
