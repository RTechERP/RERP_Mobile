import 'package:flutter/material.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/crm_dashboard_model.dart';

/// Widget hiển thị bảng thống kê nhân viên Marketing và Sales.
class DashboardActivityChart extends StatelessWidget {
  final List<LeadByEmployee> marketingEmployees;
  final List<LeadByEmployee> salesEmployees;

  const DashboardActivityChart({
    super.key,
    required this.marketingEmployees,
    required this.salesEmployees,
  });

  @override
  Widget build(BuildContext context) {
    if (marketingEmployees.isEmpty && salesEmployees.isEmpty) {
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
                  color: AppColors.orangeA500.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.people, size: 20, color: AppColors.orangeA500),
              ),
              const SizedBox(width: 12),
              Text(
                'Theo nhân viên',
                style: AppStyles.headingTitle4.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: AppColors.primaryERP,
                  unselectedLabelColor: AppColors.label,
                  indicatorColor: AppColors.primaryERP,
                  labelStyle: AppStyles.subtitle2.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: AppStyles.subtitle2,
                  tabs: [
                    Tab(text: 'Theo NV Sales (${salesEmployees.length})'),
                    Tab(text: 'Theo nguồn (${marketingEmployees.length})'),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    children: [
                      _buildEmployeeTable(salesEmployees, 'NV Sales'),
                      _buildEmployeeTable(marketingEmployees, 'NV Marketing'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeTable(List<LeadByEmployee> employees, String type) {
    if (employees.isEmpty) {
      return Center(
        child: Text(
          'Không có dữ liệu',
          style: AppStyles.body2.copyWith(color: AppColors.label),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    type,
                    style: AppStyles.subtitle3.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.heading,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Tổng lead',
                    style: AppStyles.subtitle3.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.heading,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Employee rows
          ...employees.asMap().entries.map((entry) {
            final index = entry.key;
            final employee = entry.value;
            return _buildEmployeeRow(employee, index);
          }),
          // Total row
          _buildTotalRow(employees),
        ],
      ),
    );
  }

  Widget _buildEmployeeRow(LeadByEmployee employee, int index) {
    final colors = [
      AppColors.blueA500,
      AppColors.greenA500,
      AppColors.orangeA500,
      AppColors.purpleA500,
      AppColors.pinkA500,
    ];
    final color = colors[index % colors.length];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                (index + 1).toString(),
                style: AppStyles.subtitle3.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Text(
              employee.employeeName ?? 'N/A',
              style: AppStyles.body2.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.heading,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                employee.total.toString(),
                style: AppStyles.subtitle2.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(List<LeadByEmployee> employees) {
    final total = employees.fold<int>(
      0,
      (sum, emp) => sum + emp.total,
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
          const SizedBox(width: 44),
          Expanded(
            flex: 3,
            child: Text(
              'Tổng',
              style: AppStyles.subtitle2.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.heading,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              total.toString(),
              style: AppStyles.subtitle2.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryERP,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
