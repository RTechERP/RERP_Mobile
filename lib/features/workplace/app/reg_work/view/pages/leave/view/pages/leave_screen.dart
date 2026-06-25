import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../../common/widgets/date_header.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../../../../common/utils/formatter/date_formatter.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/leave_model.dart';

import '../../leave_detail_route_args.dart';
import '../bloc/leave_bloc.dart';
import '../widgets/leave_card.dart';
import '../widgets/leave_time_stats_section.dart';

class LeaveScreenPage extends StatefulWidget {
  const LeaveScreenPage({super.key});

  @override
  State<LeaveScreenPage> createState() => _LeaveScreenPageState();
}

class _LeaveScreenPageState
    extends BaseState<LeaveScreenPage, LeaveEvent, LeaveState, LeaveBloc> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const LeaveEvent.init());
    });
  }

  Future<void> _openLeaveDetail(BuildContext context, LeaveItem item) async {
    final phaseId = item.employeeOnLeavePhaseId;
    if (phaseId == null || phaseId <= 0) {
      showMessage(
        context,
        'Thiếu mã đợt nghỉ (EmployeeOnLeavePhaseID).',
        type: SnackBarType.error,
      );
      return;
    }
    final reload = await context.push<bool?>(
      RouteNames.regworkLeaveDetail,
      extra: LeaveDetailRouteArgs(
        phaseId: phaseId,
        detailId: item.id,
        listStartDate: item.startDate,
        listTimeOnLeave: item.timeOnLeave,
      ),
    );
    if (!mounted) return;
    if (reload == true) {
      bloc.add(const LeaveEvent.init());
    }
  }


  @override
  Widget renderUI(BuildContext context) {
    final now = DateTime.now();
    final (monthStart, monthEnd) = DateFormatter.calendarMonthBounds(now);

    LeaveTimeItem? firstLeaveTime(LeaveState s) {
      if (s.leaveTime.isEmpty) return null;
      return s.leaveTime.first;
    }

    return BlocListener<LeaveBloc, LeaveState>(
      listenWhen: (prev, curr) =>
          prev.deleteSuccess != curr.deleteSuccess ||
          (curr.message != null &&
              curr.message!.isNotEmpty &&
              prev.message != curr.message &&
              !curr.isDeleting),
      listener: (context, state) {
        if (state.deleteSuccess) {
          showMessage(context, 'Xoá thành công', type: SnackBarType.success);
          bloc.add(const LeaveEvent.init());
          return;
        }
        if ((state.message ?? '').isNotEmpty) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<LeaveBloc, LeaveState>(
        bloc: bloc,
        builder: (context, state) {
          final items = state.leave;
          final loading = state.status == BaseStateStatus.loading;
          final failed = state.status == BaseStateStatus.failed;
          final isInitialLoading = loading && items.isEmpty && !state.isDeleting;

          final stat = firstLeaveTime(state);
          final header = DateHeader(
            dateStart: state.dateStart ?? monthStart,
            dateEnd: state.dateEnd ?? monthEnd,
            currentLabel: 'Ngày',
            fromLabel: 'Từ ngày',
            toLabel: 'Đến ngày',
          );

          return BaseScaffold(
            appBar: AppBarCommon(
              onBackTap: () => context.pop(),
              title: Text(
                'reg_work.leave'.tr(),
                style: AppStyles.headingTitle2,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.calendar_month_outlined),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => DateRangePicker(
                        initialStart: state.dateStart ?? monthStart,
                        initialEnd: state.dateEnd ?? monthEnd,
                        onApply: (start, end) {
                          bloc.add(
                            LeaveEvent.changeDateRange(
                              dateStart: start,
                              dateEnd: end,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final reload =
                    await context.push<bool?>(RouteNames.regworkLeaveAdd);
                if (!mounted) return;
                if (reload == true) {
                  bloc.add(const LeaveEvent.init());
                }
              },
              backgroundColor: AppColors.primaryERP,
              elevation: 6,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: header,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Skeletonizer(
                    enabled: isInitialLoading,
                    child: LeaveTimeStatsSection(
                      stat: stat,
                      showLoading: false,
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (failed && items.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(AppImages.error, width: 320),
                              const SizedBox(height: 12),
                              Text(state.message ?? 'Load dữ liệu thất bại'),
                              const SizedBox(height: 16),
                              FilledButton(
                                onPressed: () => bloc.add(const LeaveEvent.init()),
                                child: const Text('Thử lại'),
                              ),
                            ],
                          ),
                        );
                      }
                      if (items.isEmpty && !isInitialLoading) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(AppImages.missing, width: 320),
                              const SizedBox(height: 10),
                              const Text('Không có dữ liệu'),
                            ],
                          ),
                        );
                      }

                      final displayItems = isInitialLoading
                          ? List.generate(
                              1,
                              (index) => LeaveItem(
                                id: index,
                                startDate: DateTime.now(),
                                endDate: DateTime.now(),
                                typeText: 'Nghỉ phép năm',
                                timeOnLeaveText: 'Cả ngày',
                                fullName: 'Nguyễn Văn Skeleton',
                              ),
                            )
                          : items;

                      final grouped = SortDaysHelper.groupAndSort<LeaveItem>(
                        items: displayItems,
                        getDate: (item) => item.startDate ?? item.endDate ?? DateTime.now(),
                        filterStartDate: isInitialLoading ? null : state.dateStart,
                        filterEndDate: isInitialLoading ? null : state.dateEnd,
                      );

                      final listWidgets = <Widget>[];
                      for (final entry in grouped.entries) {
                        final dayItems = entry.value;
                        for (final item in dayItems) {
                          final canSwipe = SwipeHelper.canSwipeDeleteLeave(item);

                          if (!canSwipe) {
                            listWidgets.add(
                              LeaveCard(
                                item: item,
                                onTap: () => _openLeaveDetail(context, item),
                                showEmployee: state.skipLeaveDateConstraints,
                              ),
                            );
                            continue;
                          }

                          listWidgets.add(
                            Slidable(
                              key: ValueKey('leave_${item.id}'),
                              groupTag: 'leave_slidable',
                              endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                extentRatio: 0.28,
                                children: [
                                  SlidableAction(
                                    onPressed: (actionContext) async {
                                      Slidable.of(actionContext)?.close();
                                      final confirmed = await DialogService.showConfirmDelete(
                                        context: context,
                                      );
                                      if (!mounted) return;
                                      if (confirmed) {
                                        bloc.add(LeaveEvent.onCancelSubmit(id: item.id));
                                      }
                                    },
                                    backgroundColor: AppColors.alert,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete_outline,
                                    label: 'Xoá',
                                  ),
                                ],
                              ),
                              child: Builder(
                                builder: (slidableCtx) => LeaveCard(
                                  item: item,
                                  showEmployee: state.skipLeaveDateConstraints,
                                  onTap: () {
                                    Slidable.of(slidableCtx)?.close();
                                    _openLeaveDetail(context, item);
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                      }

                      return Skeletonizer(
                        containersColor: AppColors.white,
                        enabled: isInitialLoading,
                        child: RefreshIndicator(
                          onRefresh: () async {
                            bloc.add(const LeaveEvent.init());
                            await bloc.stream.firstWhere(
                              (s) => s.status != BaseStateStatus.loading,
                            );
                          },
                          child: ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: listWidgets.length,
                            itemBuilder: (context, index) => listWidgets[index],
                            separatorBuilder: (_, __) => const SizedBox(height: 8),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
