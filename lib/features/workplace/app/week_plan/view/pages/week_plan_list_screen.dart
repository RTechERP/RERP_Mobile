import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../base/network/errors/extension.dart';
import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../base/widgets/base_widget.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../common/widgets/date_header.dart';
import '../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';
import '../week_plan_helper.dart';
import '../widgets/week_plan_card.dart';
import '../../week_plan_extra.dart';

/// Danh sách filter trạng thái công việc.
const _kStatusFilters = [
  // 'Tất cả',
  'Chưa làm',
  'Đang làm',
  'Hoàn thành',
  'Chưa làm quá hạn',
  'Đang làm quá hạn',
  'Hoàn thành quá hạn',
  'Đã duyệt',
  'Chưa duyệt',
];

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

class _WeekPlanListScreenState extends BaseState<
    WeekPlanListScreen,
    WeekPlanEvent,
    WeekPlanState,
    WeekPlanBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(WeekPlanEvent.initScreenWithView(widget.viewNumber));
  }

  //---(_BaseState)---//
  @override
  bool listenWhen(WeekPlanState prev, WeekPlanState curr) =>
      prev.status != curr.status ||
      prev.message != curr.message ||
      prev.checkInSuccess != curr.checkInSuccess;

  @override
  void listener(BuildContext context, WeekPlanState state) {
    if (state.status == BaseStateStatus.failed &&
        state.message != null) {
      context.showMessage(state.message!, type: SnackBarType.error);
    }
    if (state.checkInSuccess &&
        state.checkInTaskId != null &&
        state.checkInTaskNewValue != null) {
      if (state.checkInTaskNewValue == true) {
        context.showMessage('Điểm danh thành công',
            type: SnackBarType.success);
      } else {
        context.showMessage('Huỷ điểm danh thành công',
            type: SnackBarType.success);
      }
      bloc.add(const WeekPlanEvent.clearCheckInState());
    }
  }

  //---(_Screen)---//
  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<WeekPlanBloc, WeekPlanState>(
      listenWhen: (prev, curr) =>
          prev.checkInSuccess != curr.checkInSuccess,
      listener: (context, state) {
        if (state.checkInSuccess &&
            state.checkInTaskId != null &&
            state.checkInTaskNewValue != null) {
          if (state.checkInTaskNewValue == true) {
            context.showMessage('Điểm danh thành công',
                type: SnackBarType.success);
          } else {
            context.showMessage('Huỷ điểm danh thành công',
                type: SnackBarType.success);
          }
          bloc.add(const WeekPlanEvent.clearCheckInState());
        }
      },
      child: BaseScaffold(
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
                prev.selectedStatuses != curr.selectedStatuses,
            builder: (context, s) => IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.filter_list),
                  if (s.selectedStatuses.isEmpty ||
                      s.selectedStatuses.contains('Tất cả') == false)
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
      body: BlocBuilder<WeekPlanBloc, WeekPlanState>(
        buildWhen: (prev, curr) =>
            prev.status != curr.status ||
            prev.checkInSuccess != curr.checkInSuccess ||
            prev.myTasks.length != curr.myTasks.length ||
            prev.relatedTasks.length != curr.relatedTasks.length ||
            prev.assignedTasks.length != curr.assignedTasks.length ||
            prev.allTasks.length != curr.allTasks.length ||
            prev.selectedStatuses.length != curr.selectedStatuses.length ||
            prev.searchKeyword != curr.searchKeyword ||
            prev.dateStart != curr.dateStart ||
            prev.dateEnd != curr.dateEnd ||
            prev.projects.length != curr.projects.length ||
            prev.taskTypes.length != curr.taskTypes.length ||
            prev.projectTypes.length != curr.projectTypes.length ||
            prev.employees.length != curr.employees.length,
        builder: (context, state) => _buildBody(context, state),
      ),
      floatingActionButton: BlocBuilder<WeekPlanBloc, WeekPlanState>(
        buildWhen: (prev, curr) =>
            prev.projects.length != curr.projects.length ||
            prev.taskTypes.length != curr.taskTypes.length ||
            prev.projectTypes.length != curr.projectTypes.length ||
            prev.employees.length != curr.employees.length,
        builder: (context, state) {
          if (widget.viewNumber == 1 || widget.viewNumber == 3) {
            return FloatingActionButton(
              onPressed: () async {
                final result = await context.push<bool>(
                  RouteNames.weekplanAdd,
                  extra: WeekPlanAddExtra(
                    projects: state.projects,
                    taskTypes: state.taskTypes,
                    projectTypes: state.projectTypes,
                    employees: state.employees,
                  ),
                );
                if (result == true) {
                  bloc.add(const WeekPlanEvent.refresh());
                }
              },
              backgroundColor: AppColors.primaryERP,
              child: const Icon(Icons.add, color: Colors.white),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    ));
  }

  //---(_Screen)---//
  Widget _buildBody(BuildContext context, WeekPlanState state) {
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
    final filtered = _filterTasks(tasks, state);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: DateHeader(
            dateStart: state.dateStart,
            dateEnd: state.dateEnd,
          ),
        ),
        // _buildSummaryBar(tasks),
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
                      showCheckIn: widget.viewNumber != 2 && widget.viewNumber != 3,
                      onTap: () async {
                        final result = await context.push<bool>(
                          RouteNames.weekplanDetail,
                          extra: {
                            'taskId': task.id,
                            'addExtra': WeekPlanAddExtra(
                              projects: state.projects,
                              taskTypes: state.taskTypes,
                              projectTypes: state.projectTypes,
                              employees: state.employees,
                            ),
                          },
                        );
                        if (result == true) {
                          bloc.add(const WeekPlanEvent.refresh());
                        }
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  //---(_Screen)---//
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

  //---(_Screen)---//
  List<WeekPlanTaskItem> _filterTasks(
      List<WeekPlanTaskItem> list, WeekPlanState state) {
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

    if (state.selectedStatuses.isNotEmpty &&
        !state.selectedStatuses.contains('Tất cả')) {
      result = result.where((t) {
        if (state.selectedStatuses.contains('Đã duyệt') &&
            t.approvalStatus == true) return true;
        if (state.selectedStatuses.contains('Chưa duyệt') &&
            t.approvalStatus == false) return true;
        final label = weekPlanStatusLabel(t);
        if (state.selectedStatuses.contains(label)) return true;
        return false;
      }).toList();
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

  //---(_Dialogs)---//
  void _showSearchDialog() {
    final controller = TextEditingController(text: bloc.state.searchKeyword);
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
            bloc.add(WeekPlanEvent.search(controller.text.trim()));
            Navigator.pop(ctx);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              bloc.add(const WeekPlanEvent.clearSearch());
              Navigator.pop(ctx);
            },
            child: const Text('Xoá'),
          ),
          ElevatedButton(
            onPressed: () {
              bloc.add(WeekPlanEvent.search(controller.text.trim()));
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

  //---(_Dialogs)---//
  void _showStatusFilter() {
    final selected = List<String>.from(bloc.state.selectedStatuses);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setSheetState) => Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
          ),
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
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: _kStatusFilters.map(
                      (s) => ListTile(
                        onTap: () {
                          setSheetState(() {
                            if (s == 'Tất cả') {
                              selected.clear();
                            } else {
                              if (selected.contains(s)) {
                                selected.remove(s);
                              } else {
                                selected.add(s);
                              }
                            }
                          });
                        },
                        leading: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: selected.contains(s)
                                  ? AppColors.primaryERP
                                  : AppColors.borderColor,
                              width: 2,
                            ),
                            color: selected.contains(s)
                                ? AppColors.primaryERP
                                : Colors.transparent,
                          ),
                          child: selected.contains(s)
                              ? const Icon(Icons.check,
                                  size: 14, color: Colors.white)
                              : null,
                        ),
                        title: Text(
                          s,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: selected.contains(s)
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: selected.contains(s)
                                ? AppColors.primaryERP
                                : AppColors.heading,
                          ),
                        ),
                      ),
                    ).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            bloc.add(const WeekPlanEvent
                                .filterByStatuses(['Chưa làm', 'Đang làm']));
                            Navigator.pop(ctx);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primaryERP,
                            side: const BorderSide(color: AppColors.primaryERP),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Mặc định'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            bloc.add(WeekPlanEvent.filterByStatuses(selected));
                            Navigator.pop(ctx);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryERP,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Áp dụng',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //---(_Dialogs)---//
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
              bloc.add(WeekPlanEvent.changeDateRange(
                dateStart: start,
                dateEnd: end,
              ));
            },
          ),
        ),
      ),
    );
  }

}