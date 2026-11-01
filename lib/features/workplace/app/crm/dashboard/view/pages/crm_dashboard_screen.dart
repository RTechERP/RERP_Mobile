import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../di/injection.dart';
import '../bloc/crm_dashboard_bloc.dart';
import '../widgets/dashboard_stats_overview.dart';
import '../widgets/dashboard_source_detail_tabs.dart';

/// Màn hình Dashboard CRM - hiển thị báo cáo tổng quan.
class CrmDashboardScreen extends StatefulWidget {
  const CrmDashboardScreen({super.key});

  @override
  State<CrmDashboardScreen> createState() => _CrmDashboardScreenState();
}

class _CrmDashboardScreenState extends BaseShareState<
    CrmDashboardScreen,
    CrmDashboardEvent,
    CrmDashboardState,
    CrmDashboardBloc> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const CrmDashboardEvent.init());
    });
  }

  @override
  CrmDashboardBloc provideBloc(BuildContext context) => getIt<CrmDashboardBloc>();

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Báo cáo CRM'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: () => _showDateRangePicker(bloc.state),
          ),
        ],
      ),
      body: blocBuilder((context, state) {
        if (state.status == BaseStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BaseStateStatus.failed) {
          return Center(
            child: Text(
              state.message ?? 'Có lỗi xảy ra',
              style: AppStyles.body2.copyWith(color: AppColors.heading),
            ),
          );
        }

        if (state.data == null) {
          return Center(
            child: Text(
              'Chưa có dữ liệu',
              style: AppStyles.body2.copyWith(color: AppColors.heading),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            bloc.add(const CrmDashboardEvent.refresh());
            await Future<void>.delayed(const Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header với khoảng thời gian
                _buildDateRangeHeader(state),
                const SizedBox(height: 16),

                // Thống kê tổng quan
                DashboardStatsOverview(data: state.data!),
                const SizedBox(height: 16),

                // Tab chi tiết: Theo nguồn, NV Sales, Tăng trưởng
                DashboardSourceDetailTabs(
                  sources: state.data!.bySource,
                  salesEmployees: state.data!.bySale,
                  industryGrowth: state.data!.byIndustryGrowth,
                  categoryGrowth: state.data!.byCategoryGrowth,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildDateRangeHeader(CrmDashboardState state) {
    final formatter = DateFormat('dd/MM/yyyy');
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today, size: 20, color: AppColors.primaryERP),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Khoảng thời gian',
                  style: AppStyles.caption2.copyWith(color: AppColors.label),
                ),
                const SizedBox(height: 4),
                Text(
                  '${formatter.format(state.dateStart)} - ${formatter.format(state.dateEnd)}',
                  style: AppStyles.subtitle2.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDateRangePicker(CrmDashboardState state) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart,
        initialEnd: state.dateEnd,
        onApply: (start, end) {
          bloc.add(CrmDashboardEvent.changeDateRange(
            dateStart: start,
            dateEnd: end,
          ));
        },
      ),
    );
  }
}
