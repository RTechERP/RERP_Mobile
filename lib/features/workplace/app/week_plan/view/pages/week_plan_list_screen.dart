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
import '../../../../../../common/utils/dialog/index.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../common/widgets/date_header.dart';
import '../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../di/injection.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';
import '../bloc/week_plan_approval_bloc.dart';
import '../week_plan_helper.dart';
import '../widgets/week_plan_card.dart';
import '../../week_plan_extra.dart';

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

class _WeekPlanListScreenState
    extends
        BaseState<
          WeekPlanListScreen,
          WeekPlanEvent,
          WeekPlanState,
          WeekPlanBloc
        > {
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
    if (state.status == BaseStateStatus.failed && state.message != null) {
      context.showMessage(state.message!, type: SnackBarType.error);
    }
    if (state.checkInSuccess &&
        state.checkInTaskId != null &&
        state.checkInTaskNewValue != null) {
      if (state.checkInTaskNewValue == true) {
        context.showMessage('Điểm danh thành công', type: SnackBarType.success);
      } else {
        context.showMessage(
          'Huỷ điểm danh thành công',
          type: SnackBarType.success,
        );
      }
      bloc.add(const WeekPlanEvent.clearCheckInState());
    }
  }

  //---(_Screen)---//
  @override
  Widget renderUI(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeekPlanApprovalBloc>(
          create: (_) => getIt<WeekPlanApprovalBloc>(),
        ),
      ],
      child: BlocListener<WeekPlanApprovalBloc, WeekPlanApprovalState>(
        listenWhen: (prev, curr) =>
            prev.approvalSuccess != curr.approvalSuccess ||
            prev.needsRefresh != curr.needsRefresh,
        listener: (context, state) {
          if (state.approvalSuccess) {
            if (state.approvalIsApprove == true) {
              context.showMessage(
                'Duyệt công việc thành công',
                type: SnackBarType.success,
              );
            } else {
              context.showMessage(
                'Từ chối công việc thành công',
                type: SnackBarType.success,
              );
            }
          }
          if (state.needsRefresh) {
            bloc.add(const WeekPlanEvent.refresh());
          }
          if (state.status == BaseStateStatus.failed && state.message != null) {
            context.showMessage(state.message!, type: SnackBarType.error);
          }
        },
        child: BlocListener<WeekPlanBloc, WeekPlanState>(
          listenWhen: (prev, curr) =>
              prev.checkInSuccess != curr.checkInSuccess,
          listener: (context, state) {
            if (state.checkInSuccess &&
                state.checkInTaskId != null &&
                state.checkInTaskNewValue != null) {
              if (state.checkInTaskNewValue == true) {
                context.showMessage(
                  'Điểm danh thành công',
                  type: SnackBarType.success,
                );
              } else {
                context.showMessage(
                  'Huỷ điểm danh thành công',
                  type: SnackBarType.success,
                );
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
                      prev.selectedStatuses != curr.selectedStatuses ||
                      prev.selectedStatusNos.length !=
                          curr.selectedStatusNos.length ||
                      prev.selectedApproveNos.length !=
                          curr.selectedApproveNos.length,
                  builder: (context, s) => IconButton(
                    icon: const Icon(Icons.filter_list),
                    tooltip: 'Lọc trạng thái',
                    onPressed: () => _showStatusFilter(),
                  ),
                ),
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
              buildWhen: (prev, curr) =>
                  prev.status != curr.status ||
                  prev.checkInSuccess != curr.checkInSuccess ||
                  prev.myTasks.length != curr.myTasks.length ||
                  prev.relatedTasks.length != curr.relatedTasks.length ||
                  prev.assignedTasks.length != curr.assignedTasks.length ||
                  prev.allTasks.length != curr.allTasks.length ||
                  prev.selectedStatuses.length !=
                      curr.selectedStatuses.length ||
                  prev.projectTaskStatuses.length !=
                      curr.projectTaskStatuses.length ||
                  prev.searchKeyword != curr.searchKeyword ||
                  prev.dateStart != curr.dateStart ||
                  prev.dateEnd != curr.dateEnd ||
                  prev.projects.length != curr.projects.length ||
                  prev.taskTypes.length != curr.taskTypes.length ||
                  prev.projectTypes.length != curr.projectTypes.length ||
                  prev.employees.length != curr.employees.length,
              builder: (context, state) =>
                  BlocBuilder<WeekPlanApprovalBloc, WeekPlanApprovalState>(
                    buildWhen: (prev, curr) =>
                        prev.selectedTaskIds.length !=
                            curr.selectedTaskIds.length ||
                        prev.selectedTaskIds != curr.selectedTaskIds,
                    builder: (context, approvalState) =>
                        _buildBody(context, state, approvalState),
                  ),
            ),
            floatingActionButton: widget.viewNumber != 3
                ? (widget.viewNumber == 1 || widget.viewNumber == -1)
                      ? FloatingActionButton(
                          onPressed: () async {
                            final result = await context.push<bool>(
                              RouteNames.weekplanAdd,
                              extra: WeekPlanAddExtra(
                                projects: bloc.state.projects,
                                taskTypes: bloc.state.taskTypes,
                                projectTypes: bloc.state.projectTypes,
                                employees: bloc.state.employees,
                              ),
                            );
                            if (result == true) {
                              bloc.add(const WeekPlanEvent.refresh());
                            }
                          },
                          backgroundColor: AppColors.primaryERP,
                          child: const Icon(Icons.add, color: Colors.white),
                        )
                      : null
                : null,
          ),
        ),
      ),
    );
  }

  //---(_Screen)---//
  Widget _buildBody(
    BuildContext context,
    WeekPlanState state,
    WeekPlanApprovalState approvalState,
  ) {
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
    // Đếm task đang chờ duyệt (status=2, chưa approve/reject)
    final pendingTasks = filtered
        .where((t) => t.status == 2 && t.approvalStatus == null)
        .toList();
    final hasSelection = approvalState.selectedTaskIds.isNotEmpty;

    return Column(
      children: [
        if (widget.viewNumber == 1 || widget.viewNumber == 3)
          Builder(
            builder: (context) {
              if (widget.viewNumber == 1) {
                // Count incomplete (not done = status 0 or 1) and overdue tasks
                final incompleteTasks = filtered
                    .where((t) => t.status == 0 || t.status == 1)
                    .toList();
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);
                final overdueTasks = filtered.where((t) {
                  if (t.status != 0 && t.status != 1) return false;
                  final deadlineDate = t.deadline;
                  return deadlineDate != null && deadlineDate.isBefore(today);
                }).toList();

                return Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primaryERP.withValues(alpha: 0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryERP.withValues(alpha: 0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildStatItem(
                          icon: Icons.assignment_outlined,
                          label: 'Chưa hoàn thành',
                          count: incompleteTasks.length,
                          color: AppColors.warning,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: AppColors.borderColor.withValues(alpha: 0.5),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      Expanded(
                        child: _buildStatItem(
                          icon: Icons.warning_amber_rounded,
                          label: 'Quá hạn',
                          count: overdueTasks.length,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (widget.viewNumber == 3 && pendingTasks.isNotEmpty) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primaryERP.withValues(alpha: 0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryERP.withValues(alpha: 0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          final allIds = pendingTasks
                              .map((t) => t.id ?? 0)
                              .toSet();
                          if (hasSelection) {
                            context.read<WeekPlanApprovalBloc>().add(
                              const WeekPlanApprovalEvent.clearSelection(),
                            );
                          } else {
                            for (final id in allIds) {
                              context.read<WeekPlanApprovalBloc>().add(
                                WeekPlanApprovalEvent.toggleSelectTask(id),
                              );
                            }
                          }
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: hasSelection
                                      ? AppColors.primaryERP
                                      : AppColors.borderColor,
                                  width: 2,
                                ),
                                color: hasSelection
                                    ? AppColors.primaryERP
                                    : Colors.transparent,
                              ),
                              child: hasSelection
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              hasSelection ? 'Bỏ chọn tất cả' : 'Chọn tất cả',
                              style: const TextStyle(
                                color: AppColors.primaryERP,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryERP.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.schedule,
                              size: 16,
                              color: AppColors.primaryERP,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${pendingTasks.length} chờ duyệt',
                              style: const TextStyle(
                                color: AppColors.primaryERP,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        Expanded(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              //   child: DateHeader(dateStart: state.dateStart, dateEnd: state.dateEnd),
              // ),
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
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final task = filtered[index];
                          final isSelected = approvalState.selectedTaskIds
                              .contains(task.id);
                          return WeekPlanCard(
                            approvalBloc: context.read<WeekPlanApprovalBloc>(),
                            task: task,
                            isAssigned: widget.isAssigned,
                            showCheckIn:
                                widget.viewNumber != 2 &&
                                widget.viewNumber != 3,
                            showApproval: widget.viewNumber == 3,
                            viewNumber: widget.viewNumber,
                            isSelectionMode: widget.viewNumber == 3,
                            isSelected: isSelected,
                            onSelect: () =>
                                context.read<WeekPlanApprovalBloc>().add(
                                  WeekPlanApprovalEvent.toggleSelectTask(
                                    task.id ?? 0,
                                  ),
                                ),
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
          ),
        ),
        if (widget.viewNumber == 3 && hasSelection)
          _buildBulkActionBar(context, state, approvalState),
      ],
    );
  }

  //---(_BulkActions)---//
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
    List<WeekPlanTaskItem> list,
    WeekPlanState state,
  ) {
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
            t.approvalStatus == true)
          return true;
        if (state.selectedStatuses.contains('Chưa duyệt') &&
            t.approvalStatus == false)
          return true;
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

    // Với viewNumber == 3, sắp xếp task cần duyệt lên đầu
    if (widget.viewNumber == 3 && result.isNotEmpty) {
      final pending = <WeekPlanTaskItem>[];
      final others = <WeekPlanTaskItem>[];
      for (final t in result) {
        if (t.status == 2 && t.approvalStatus == null) {
          pending.add(t);
        } else {
          others.add(t);
        }
      }
      result = [...pending, ...others];
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
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return _StatusFilterSheet(
          selectedStatuses: bloc.state.selectedStatuses,
          selectedStatusNos: bloc.state.selectedStatusNos,
          selectedApproveNos: bloc.state.selectedApproveNos,
          onApply: (statusNos, approveNos) {
            bloc.add(
              WeekPlanEvent.filterByStatusNos(
                statusNos: statusNos,
                approveNos: approveNos,
              ),
            );
          },
        );
      },
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
              bloc.add(
                WeekPlanEvent.changeDateRange(dateStart: start, dateEnd: end),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required int count,
    required Color color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$count',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  //---(_BulkActions)---//
  Widget _buildBulkActionBar(
    BuildContext context,
    WeekPlanState state,
    WeekPlanApprovalState approvalState,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.borderColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Đã chọn ${approvalState.selectedTaskIds.length} công việc',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.heading,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => context.read<WeekPlanApprovalBloc>().add(
                  const WeekPlanApprovalEvent.clearSelection(),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.textSecondaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Bỏ chọn',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.stateErrorColor.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => _onBulkReject(context, state),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.close,
                            color: AppColors.stateErrorColor,
                            size: 20,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Từ chối',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.stateErrorColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.stateSuccessColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.stateSuccessColor.withValues(
                          alpha: 0.3,
                        ),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => _onBulkApprove(context, state),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.check, color: Colors.white, size: 20),
                          SizedBox(width: 6),
                          Text(
                            'Duyệt',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onBulkApprove(BuildContext context, WeekPlanState state) {
    DialogService.showApproveTask(
      context: context,
      onConfirm: (rating, comment) {
        context.read<WeekPlanApprovalBloc>().add(
          WeekPlanApprovalEvent.bulkApproveTasks(
            taskIds: context
                .read<WeekPlanApprovalBloc>()
                .state
                .selectedTaskIds
                .toList(),
            review: comment,
            completionRating: rating,
          ),
        );
        context.read<WeekPlanApprovalBloc>().add(
          const WeekPlanApprovalEvent.clearSelection(),
        );
      },
    );
  }

  void _onBulkReject(BuildContext context, WeekPlanState state) {
    DialogService.showRejectTask(
      context: context,
      onConfirm: (reason) {
        context.read<WeekPlanApprovalBloc>().add(
          WeekPlanApprovalEvent.bulkRejectTasks(
            taskIds: context
                .read<WeekPlanApprovalBloc>()
                .state
                .selectedTaskIds
                .toList(),
            reason: reason,
          ),
        );
        context.read<WeekPlanApprovalBloc>().add(
          const WeekPlanApprovalEvent.clearSelection(),
        );
      },
    );
  }
}

//---(_StatusFilterSheet)---//
class _StatusFilterSheet extends StatefulWidget {
  const _StatusFilterSheet({
    required this.selectedStatuses,
    required this.selectedStatusNos,
    required this.selectedApproveNos,
    required this.onApply,
  });

  final List<String> selectedStatuses;
  final List<int> selectedStatusNos;
  final List<int> selectedApproveNos;
  final void Function(List<int> statusNos, List<int> approveNos) onApply;

  @override
  State<_StatusFilterSheet> createState() => _StatusFilterSheetState();
}

class _StatusFilterSheetState extends State<_StatusFilterSheet> {
  late List<int> _selectedStatusNos;
  late List<int> _selectedApproveNos;
  List<WeekPlanFilterItem> _statuses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _selectedStatusNos = List<int>.from(widget.selectedStatusNos);
    _selectedApproveNos = List<int>.from(widget.selectedApproveNos);

    // Check if data already available (fetched during initScreenWithView)
    final bloc = context.read<WeekPlanBloc>();
    if (bloc.state.projectTaskStatuses.isNotEmpty) {
      _statuses = bloc.state.projectTaskStatuses;
      _isLoading = false;
    } else {
      _fetchStatuses();
    }
  }

  void _fetchStatuses() {
    final bloc = context.read<WeekPlanBloc>();
    bloc.add(const WeekPlanEvent.fetchProjectTaskStatuses());
  }

  Widget _buildStatusList() {
    final type1Items = _statuses.where((s) => s.type == 1).toList();
    final type2Items = _statuses.where((s) => s.type == 2).toList();

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        // Type 1: Work Status
        if (type1Items.isNotEmpty) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Trạng thái công việc',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.heading,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: type1Items
                .map((item) => _buildWorkStatusChip(item))
                .toList(),
          ),
        ],
        // Divider
        if (type1Items.isNotEmpty && type2Items.isNotEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1),
          ),
        // Type 2: Approval Status
        if (type2Items.isNotEmpty) ...[
          const SizedBox(height: 8),
          const Text(
            'Trạng thái duyệt',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: type2Items.map((item) {
              final isSelected = _selectedApproveNos.contains(item.no);
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: item == type2Items.last ? 0 : 8,
                  ),
                  child: _buildApprovalChip(item, isSelected),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildWorkStatusChip(WeekPlanFilterItem item) {
    final isSelected = _selectedStatusNos.contains(item.no);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedStatusNos.remove(item.no);
          } else {
            _selectedStatusNos.add(item.no ?? 0);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryERP.withValues(alpha: 0.1)
              : AppColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryERP : AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primaryERP : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryERP
                      : AppColors.borderColor,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 12, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                item.title ?? '',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: AppColors.heading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApprovalChip(WeekPlanFilterItem item, bool isSelected) {
    String displayTitle = item.title ?? '';
    if (displayTitle == 'Done') {
      displayTitle = 'Approved';
    } else if (displayTitle == 'Reject') {
      displayTitle = 'Pending';
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedApproveNos.remove(item.no);
          } else {
            _selectedApproveNos.clear();
            _selectedApproveNos.add(item.no ?? 0);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryERP.withValues(alpha: 0.1)
              : AppColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryERP : AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primaryERP : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryERP
                      : AppColors.borderColor,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 12, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                displayTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: AppColors.heading,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeekPlanBloc, WeekPlanState>(
      listenWhen: (prev, curr) =>
          curr.projectTaskStatuses.isNotEmpty && _isLoading,
      listener: (context, state) {
        setState(() {
          _statuses = state.projectTaskStatuses;
          _isLoading = false;
        });
      },
      child: Container(
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
                child: _isLoading
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : _buildStatusList(),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onApply(_selectedStatusNos, _selectedApproveNos);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryERP,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Áp dụng',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
