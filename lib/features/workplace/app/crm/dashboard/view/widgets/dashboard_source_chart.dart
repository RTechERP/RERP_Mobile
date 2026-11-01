import 'package:flutter/material.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/crm_dashboard_model.dart';

/// Widget hiển thị bảng thống kê chi tiết theo nguồn Lead.
class DashboardSourceChart extends StatelessWidget {
  final List<LeadBySource> sources;

  const DashboardSourceChart({super.key, required this.sources});

  @override
  Widget build(BuildContext context) {
    if (sources.isEmpty) {
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
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.table_chart, size: 20, color: AppColors.primaryERP),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Chi tiết theo nguồn',
                  style: AppStyles.headingTitle4.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _buildDataTable(),
          ),
        ],
      ),
    );
  }

  Widget _buildDataTable() {
    final headers = [
      'Nguồn',
      'Tổng lead',
      'Lead MKT',
      'Lead Sales',
      'Bàn giao',
      'Đã PO',
      'Không thành công',
      'Không phù hợp',
      'Hoàn trả MKT',
      'Tỷ lệ chốt',
      'Giá trị PO kiểm',
    ];

    return DataTable(
      headingRowColor: WidgetStateProperty.all(
        AppColors.backgroundLight,
      ),
      border: TableBorder.all(
        color: AppColors.borderColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      columnSpacing: 16,
      horizontalMargin: 16,
      headingRowHeight: 48,
      dataRowMinHeight: 44,
      dataRowMaxHeight: 56,
      columns: headers.map((header) {
        return DataColumn(
          label: Text(
            header,
            style: AppStyles.subtitle3.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.heading,
            ),
          ),
        );
      }).toList(),
      rows: [
        ...sources.map((source) => _buildDataRow(source)),
        _buildTotalRow(),
      ],
    );
  }

  DataRow _buildDataRow(LeadBySource source) {
    return DataRow(
      cells: [
        DataCell(
          Container(
            constraints: const BoxConstraints(minWidth: 80),
            child: Text(
              source.leadSourceName ?? 'N/A',
              style: AppStyles.body2.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.heading,
              ),
            ),
          ),
        ),
        DataCell(_buildCell(source.total.toString())),
        DataCell(_buildCell(source.totalMarketing.toString())),
        DataCell(_buildCell(source.totalSales.toString())),
        DataCell(_buildCell(source.totalHandover.toString())),
        DataCell(
          _buildCell(
            source.totalPO.toString(),
            color: AppColors.greenA500,
          ),
        ),
        DataCell(_buildCell(source.totalLost.toString())),
        DataCell(_buildCell(source.totalDisqualified.toString())),
        DataCell(_buildCell(source.totalReturned.toString())),
        DataCell(
          _buildCell(
            '${source.convertRate.toStringAsFixed(1)}%',
            color: AppColors.blueA500,
          ),
        ),
        DataCell(
          _buildCell(
            _formatCurrency(source.convertedValuePo),
            color: AppColors.primaryERP,
          ),
        ),
      ],
    );
  }

  DataRow _buildTotalRow() {
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

    final convertRate = totalLeads > 0
        ? (totalPO / totalLeads * 100).toStringAsFixed(1)
        : '0.0';

    return DataRow(
      color: WidgetStateProperty.all(
        AppColors.primaryERP.withValues(alpha: 0.05),
      ),
      cells: [
        DataCell(
          Text(
            'Tổng',
            style: AppStyles.subtitle2.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.heading,
            ),
          ),
        ),
        DataCell(_buildCell(totalLeads.toString(), isBold: true)),
        DataCell(_buildCell(totalMarketing.toString(), isBold: true)),
        DataCell(_buildCell(totalSales.toString(), isBold: true)),
        DataCell(_buildCell(totalHandover.toString(), isBold: true)),
        DataCell(_buildCell(totalPO.toString(), isBold: true, color: AppColors.greenA500)),
        DataCell(_buildCell(totalLost.toString(), isBold: true)),
        DataCell(_buildCell(totalDisqualified.toString(), isBold: true)),
        DataCell(_buildCell(totalReturned.toString(), isBold: true)),
        DataCell(_buildCell('$convertRate%', isBold: true, color: AppColors.blueA500)),
        DataCell(_buildCell(_formatCurrency(totalValue), isBold: true, color: AppColors.primaryERP)),
      ],
    );
  }

  Widget _buildCell(String text, {bool isBold = false, Color? color}) {
    return Text(
      text,
      style: AppStyles.body2.copyWith(
        fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
        color: color ?? AppColors.heading,
      ),
      textAlign: TextAlign.center,
    );
  }

  String _formatCurrency(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}K';
    }
    return value.toStringAsFixed(0);
  }
}
