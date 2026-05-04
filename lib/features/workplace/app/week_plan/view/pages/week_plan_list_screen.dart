import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../base/network/errors/extension.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../common/utils/snack_bar_helper.dart';
import '../../../reg_general/view/pages/booking_vehicle/view/widgets/date_header.dart';
import '../../../reg_general/view/pages/booking_vehicle/view/widgets/date_range_picker.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';
import '../week_plan_helper.dart';
import '../widgets/week_plan_card.dart';

class _WeekPlanAddExtra {
  const _WeekPlanAddExtra({
    required this.projects,
    required this.taskTypes,
  });

  final List<ProjectTaskItem> projects;
  final List<TaskTypeItem> taskTypes;
}

/// Widget base hiển thị 1 danh sách công việc — không có TabBar.
///
/// Dùng chung cho 4 màn: Công việc, Liên quan, Giao việc, Tổng công việc.
class WeekPlanListScreen extends StatefulWidget {
  const WeekPlanListScreen({
    super.key,
    required this.viewNumber,
    required this.title,
    this.isAssigned = false,
  });

  final int viewNumber;
  final String title;
  final bool isAssigned;

  @override
  State<WeekPlanListScreen> createState() => _WeekPlanListScreenState();
}

class _WeekPlanListScreenState extends State<WeekPlanListScreen> {

  @override
  void initState() {
    super.initState();
    context.read<WeekPlanBloc>().add(
          WeekPlanEvent.initScreenWithView(widget.viewNumber),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeekPlanBloc, WeekPlanState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status || curr.message != null,
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed && state.message != null) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<WeekPlanBloc, WeekPlanState>(
        buildWhen: (prev, curr) =>
            prev.status != curr.status ||
            prev.myTasks.length != curr.myTasks.length ||
            prev.relatedTasks.length != curr.relatedTasks.length ||
            prev.assignedTasks.length != curr.assignedTasks.length ||
            prev.allTasks.length != curr.allTasks.length,
        builder: (context, state) {
          return _buildBody(context, state);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, WeekPlanState state) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(widget.title),
        onBackTap: () => onBack(context),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Tìm kiếm',
            onPressed: () => _showSearchDialog(),
          ),
          BlocBuilder<WeekPlanBloc, WeekPlanState>(
            buildWhen: (prev, curr) =>
                prev.selectedStatus != curr.selectedStatus,
            builder: (context, s) => IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.filter_list),
                  if (s.selectedStatus != 'Tất cả')
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryERP,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              tooltip: 'Lọc trạng thái',
              onPressed: () => _showStatusFilter(),
            ),
          ),
          BlocBuilder<WeekPlanBloc, WeekPlanState>(
            buildWhen: (prev, curr) =>
                prev.dateStart != curr.dateStart ||
                prev.dateEnd != curr.dateEnd,
            builder: (context, s) => IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.calendar_month),
                  if (s.dateStart != null || s.dateEnd != null)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryERP,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              tooltip: 'Lọc ngày',
              onPressed: () => _showDateRangePicker(),
            ),
          ),
        ],
      ),
      body: _buildContent(context, state),
      floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildContent(BuildContext context, WeekPlanState state) {
    if (state.status == BaseStateStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 320),
            const SizedBox(height: 12),
            const Text('Tải dữ liệu thất bại'),
          ],
        ),
      );
    }

    final tasks = _getTasks(state);
    final filtered = _filterTasks(tasks);

    return Column(
      children: [
        if (state.dateStart != null || state.dateEnd != null)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: DateHeader(
              dateStart: state.dateStart,
              dateEnd: state.dateEnd,
            ),
          ),
        _buildActiveFilters(state),
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(AppImages.missing, width: 320),
                      const SizedBox(height: 12),
                      const Text('Không có công việc'),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final task = filtered[index];
                    return WeekPlanCard(
                      task: task,
                      isAssigned: widget.isAssigned,
                      onTap: () {},
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget? _buildFab(BuildContext context) {
    if (widget.viewNumber == 1 || widget.viewNumber == 3) {
      return BlocBuilder<WeekPlanBloc, WeekPlanState>(
        buildWhen: (prev, curr) =>
            prev.projects.length != curr.projects.length ||
            prev.taskTypes.length != curr.taskTypes.length,
        builder: (context, state) => FloatingActionButton(
          onPressed: () => context.push(
            RouteNames.weekplanAdd,
            extra: _WeekPlanAddExtra(
              projects: state.projects,
              taskTypes: state.taskTypes,
            ),
          ),
          backgroundColor: AppColors.primaryERP,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      );
    }
    return null;
  }

  List<WeekPlanTaskItem> _getTasks(WeekPlanState state) {
    switch (widget.viewNumber) {
      case 1:
        return state.myTasks;
      case 2:
        return state.relatedTasks;
      case 3:
        return state.assignedTasks;
      case -1:
        return state.allTasks;
      default:
        return state.myTasks;
    }
  }

  List<WeekPlanTaskItem> _filterTasks(List<WeekPlanTaskItem> list) {
    final state = context.read<WeekPlanBloc>().state;

    var result = list;

    if (state.searchKeyword.isNotEmpty) {
      final kw = state.searchKeyword.toLowerCase();
      result = result
          .where(
            (t) =>
                (t.mission ?? '').toLowerCase().contains(kw) ||
                (t.projectCode ?? '').toLowerCase().contains(kw) ||
                (t.projectName ?? '').toLowerCase().contains(kw),
          )
          .toList();
    }

    if (state.selectedStatus != 'Tất cả') {
      result = result
          .where((t) => weekPlanStatusLabel(t) == state.selectedStatus)
          .toList();
    }

    if (state.dateStart != null || state.dateEnd != null) {
      final start = state.dateStart;
      final end = state.dateEnd;
      result = result.where((t) {
        if (t.deadline == null) return true;
        if (start != null && t.deadline!.isBefore(start)) return false;
        if (end != null && t.deadline!.isAfter(end)) return false;
        return true;
      }).toList();
    }

    return result;
  }

  //---(_ActiveFilters)---//
  Widget _buildActiveFilters(WeekPlanState state) {
    final hasSearch = state.searchKeyword.isNotEmpty;
    final hasStatus = state.selectedStatus != 'Tất cả';
    final hasDate = state.dateStart != null || state.dateEnd != null;
    if (!hasSearch && !hasStatus && !hasDate) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          if (hasSearch)
            _FilterChip(
              label: 'Tìm: "${state.searchKeyword}"',
              onClear: () => context.read<WeekPlanBloc>().add(const WeekPlanEvent.clearSearch()),
            ),
          if (hasStatus)
            _FilterChip(
              label: state.selectedStatus,
              color: _statusColor(state.selectedStatus),
              onClear: () => context.read<WeekPlanBloc>().add(const WeekPlanEvent.clearStatusFilter()),
            ),
          if (hasDate)
            _FilterChip(
              label:
                  '${state.dateStart != null ? DateFormat('dd/MM').format(state.dateStart!) : ''}'
                  '${state.dateEnd != null ? ' - ${DateFormat('dd/MM').format(state.dateEnd!)}' : ''}',
              onClear: () => context.read<WeekPlanBloc>().add(const WeekPlanEvent.clearDateFilter()),
            ),
        ],
      ),
    );
  }

  //---(_Dialogs)---//
  void _showSearchDialog() {
    final controller = TextEditingController(
        text: context.read<WeekPlanBloc>().state.searchKeyword);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Tìm kiếm'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Nhập từ khoá...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onSubmitted: (_) {
            context.read<WeekPlanBloc>().add(WeekPlanEvent.search(controller.text.trim()));
            Navigator.pop(ctx);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.read<WeekPlanBloc>().add(const WeekPlanEvent.clearSearch());
              Navigator.pop(ctx);
            },
            child: const Text('Xoá'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<WeekPlanBloc>().add(WeekPlanEvent.search(controller.text.trim()));
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryERP,
            ),
            child: const Text('Tìm'),
          ),
        ],
      ),
    );
  }

  void _showStatusFilter() {
    final statuses = [
      'Tất cả',
      'Chưa bắt đầu',
      'Đang thực hiện',
      'Hoàn thành',
      'Quá hạn',
    ];
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.borderColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Lọc theo trạng thái',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.heading,
                ),
              ),
              const SizedBox(height: 8),
              ...statuses.map(
                (s) => ListTile(
                  onTap: () {
                    context.read<WeekPlanBloc>().add(WeekPlanEvent.filterByStatus(s));
                    Navigator.pop(context);
                  },
                  leading: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.read<WeekPlanBloc>().state.selectedStatus == s
                            ? AppColors.primaryERP
                            : AppColors.borderColor,
                        width: 2,
                      ),
                      color: context.read<WeekPlanBloc>().state.selectedStatus == s
                          ? AppColors.primaryERP
                          : Colors.transparent,
                    ),
                    child: context.read<WeekPlanBloc>().state.selectedStatus == s
                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                        : null,
                  ),
                  title: Text(
                    s,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: context.read<WeekPlanBloc>().state.selectedStatus == s
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: context.read<WeekPlanBloc>().state.selectedStatus == s
                          ? AppColors.primaryERP
                          : AppColors.heading,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _showDateRangePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DateRangePicker(
        initialStart: context.read<WeekPlanBloc>().state.dateStart,
        initialEnd: context.read<WeekPlanBloc>().state.dateEnd,
        onApply: (start, end) {
          context.read<WeekPlanBloc>().add(
            WeekPlanEvent.changeDateRange(dateStart: start, dateEnd: end),
          );
        },
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Hoàn thành':
        return AppColors.stateSuccessColor;
      case 'Đang thực hiện':
        return AppColors.stateInfoColor;
      case 'Quá hạn':
        return AppColors.alert;
      case 'Chưa bắt đầu':
        return AppColors.gray;
      default:
        return AppColors.warning;
    }
  }
}

//---(_FilterChip)---//
class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, this.color, required this.onClear});

  final String label;
  final Color? color;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.primaryERP;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: effectiveColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: effectiveColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: effectiveColor,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onClear,
            child: Icon(Icons.close, size: 14, color: effectiveColor),
          ),
        ],
      ),
    );
  }
}
