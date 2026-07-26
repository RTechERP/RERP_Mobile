import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';
import '../week_plan_helper.dart';
import '../widgets/index.dart';

/// Màn hình Dashboard tổng quan công việc.
///
/// Dữ liệu lấy từ `WeekPlanBloc.myTasks` (API getTask với viewNumber = 1).
/// Hiển thị:
///  - Tổng công việc (hero card)
///  - Lưới thẻ trạng thái (9 trạng thái)
///  - Biểu đồ tròn tỉ lệ trạng thái (Syncfusion SfCircularChart)
///  - Bảng thống kê theo loại công việc
///
/// Các phần UI được tách thành widget riêng trong `widgets/`.
class WeekPlanDashboardScreen extends StatefulWidget {
  const WeekPlanDashboardScreen({super.key});

  @override
  State<WeekPlanDashboardScreen> createState() =>
      _WeekPlanDashboardScreenState();
}

class _WeekPlanDashboardScreenState
    extends
        BaseState<
          WeekPlanDashboardScreen,
          WeekPlanEvent,
          WeekPlanState,
          WeekPlanBloc
        > {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const WeekPlanEvent.initDashboard());
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Tổng quan công việc'),
        onBackTap: () => onBack(context),
        actions: [
          BlocBuilder<WeekPlanBloc, WeekPlanState>(
            buildWhen: (prev, curr) =>
                prev.dateStart != curr.dateStart ||
                prev.dateEnd != curr.dateEnd,
            builder: (context, s) => IconButton(
              icon: const Icon(Icons.calendar_month),
              tooltip: 'Lọc ngày',
              onPressed: () => _showDateRangePicker(),
            ),
          ),
        ],
      ),
      body: BlocBuilder<WeekPlanBloc, WeekPlanState>(
        buildWhen: (p, c) =>
            p.status != c.status ||
            p.myTasks.length != c.myTasks.length ||
            p.message != c.message,
        builder: (context, state) {
          if (state.status == BaseStateStatus.loading &&
              state.myTasks.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == BaseStateStatus.failed && state.myTasks.isEmpty) {
            return _ErrorView(
              message: state.message,
              onRetry: () => bloc.add(const WeekPlanEvent.initDashboard()),
            );
          }

          final stats = _computeStats(state.myTasks);
          final taskTypeStats = _computeTaskTypeStats(state.myTasks);

          return RefreshIndicator(
            onRefresh: () async {
              bloc.add(const WeekPlanEvent.initDashboard());
            },
            color: AppColors.primaryERP,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                WeekPlanDashboardHeroCard(
                  total: stats.total,
                  overdue: stats.totalOverdue,
                ),
                // const SizedBox(height: 16),
                // WeekPlanDashboardStatusGrid(stats: stats),
                const SizedBox(height: 16),
                WeekPlanDashboardTaskTypeTable(stats: taskTypeStats),
                const SizedBox(height: 16),
                WeekPlanDashboardPieChart(stats: stats),
              ],
            ),
          );
        },
      ),
    );
  }

  //===============================================================
  // STATS HELPERS
  //===============================================================

  /// Chỉ công việc đã hoàn thành nhưng chưa có kết quả duyệt mới chờ duyệt.
  bool _isAwaitingApproval(WeekPlanTaskItem task) =>
      task.status == 2 && task.approvalStatus == null;

  /// Chỉ công việc đã hoàn thành bị đánh trượt mới được tính là từ chối.
  bool _isRejected(WeekPlanTaskItem task) =>
      task.status == 2 && task.approvalStatus == false;

  /// Quá hạn trên dashboard chỉ áp dụng cho công việc chưa hoàn thành hoặc
  /// đang chờ duyệt; công việc đã duyệt hoàn thành không còn là việc tồn đọng.
  bool _isDashboardOverdue(WeekPlanTaskItem task) {
    if (task.isDeleted == true) return false;

    final isTrackable =
        task.status == 0 || task.status == 1 || _isAwaitingApproval(task);
    return isTrackable && weekPlanIsOverdue(task);
  }

  /// Tính toán số liệu thống kê theo từng trạng thái từ danh sách task.
  DashboardStats _computeStats(List<WeekPlanTaskItem> tasks) {
    var chuaBatDau = 0;
    var chuaBatDauQuaHan = 0;
    var dangLam = 0;
    var dangLamQuaHan = 0;
    var choPheDuyet = 0;
    var choPheDuyetQuaHan = 0;
    var hoanThanh = 0;
    var tuChoi = 0;
    var tamHoan = 0;
    var huy = 0;

    for (final t in tasks) {
      if (t.isDeleted == true) {
        huy++;
        continue;
      }

      final isOverdue = _isDashboardOverdue(t);
      final isAwaitingApproval = _isAwaitingApproval(t);

      if (t.status == 3) {
        tamHoan++;
        continue;
      }

      if (isAwaitingApproval) {
        if (isOverdue) {
          choPheDuyetQuaHan++;
        } else {
          choPheDuyet++;
        }
        continue;
      }

      if (_isRejected(t)) {
        tuChoi++;
        continue;
      }

      switch (t.status) {
        case 0:
          if (isOverdue) {
            chuaBatDauQuaHan++;
          } else {
            chuaBatDau++;
          }
          break;
        case 1:
          if (isOverdue) {
            dangLamQuaHan++;
          } else {
            dangLam++;
          }
          break;
        case 2:
          hoanThanh++;
          break;
        default:
          break;
      }
    }

    final total = tasks.length;
    final totalOverdue = chuaBatDauQuaHan + dangLamQuaHan + choPheDuyetQuaHan;

    return DashboardStats(
      total: total,
      totalOverdue: totalOverdue,
      chuaBatDau: chuaBatDau,
      chuaBatDauQuaHan: chuaBatDauQuaHan,
      dangLam: dangLam,
      dangLamQuaHan: dangLamQuaHan,
      choPheDuyet: choPheDuyet,
      choPheDuyetQuaHan: choPheDuyetQuaHan,
      hoanThanh: hoanThanh,
      tuChoi: tuChoi,
      tamHoan: tamHoan,
      huy: huy,
    );
  }

  /// Thống kê các chỉ số theo loại công việc dùng cùng quy tắc với dashboard.
  List<DashboardTaskTypeStat> _computeTaskTypeStats(
    List<WeekPlanTaskItem> tasks,
  ) {
    final map = <String, DashboardTaskTypeStat>{};
    for (final t in tasks) {
      final name = t.projectTaskTypeName ?? 'Khác';
      final isActive = t.isDeleted != true;
      final isAwaitingApproval = isActive && _isAwaitingApproval(t);
      final isRejected = isActive && _isRejected(t);
      final isApproved = isActive && t.status == 2 && t.approvalStatus == true;
      final isOverdue = isActive && _isDashboardOverdue(t);
      final stat =
          map[name] ??
          DashboardTaskTypeStat(
            typeName: name,
            total: 0,
            duyet: 0,
            tuChoi: 0,
            dangLam: 0,
            quaHan: 0,
            choDuyet: 0,
          );
      map[name] = DashboardTaskTypeStat(
        typeName: stat.typeName,
        total: stat.total + (isActive ? 1 : 0),
        duyet: stat.duyet + (isApproved ? 1 : 0),
        tuChoi: stat.tuChoi + (isRejected ? 1 : 0),
        dangLam:
            stat.dangLam + ((isActive && t.status == 1 && !isOverdue) ? 1 : 0),
        quaHan: stat.quaHan + (isOverdue ? 1 : 0),
        choDuyet: stat.choDuyet + (isAwaitingApproval ? 1 : 0),
      );
    }
    final list = map.values.toList();
    list.sort((a, b) => b.total.compareTo(a.total));
    return list;
  }

  void _showDateRangePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: DateRangePicker(
            initialStart: bloc.state.dateStart,
            initialEnd: bloc.state.dateEnd,
            onApply: (start, end) {
              bloc.add(
                WeekPlanEvent.changeDateRange(dateStart: start, dateEnd: end),
              );
            },
          ),
        ),
      ),
    );
  }
}

//===============================================================
// ERROR VIEW
//===============================================================

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String? message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 56, color: AppColors.alert),
          const SizedBox(height: 12),
          Text(
            message ?? 'Tải dữ liệu thất bại',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text('Thử lại'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryERP,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
