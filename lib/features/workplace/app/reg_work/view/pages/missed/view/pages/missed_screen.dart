import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/date_header.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/missed_model.dart';
import '../bloc/missed_bloc.dart';
import '../widgets/missed_card.dart';

class MissedScreen extends StatefulWidget {
  const MissedScreen({super.key});

  @override
  State<MissedScreen> createState() => _MissedScreenState();
}

class _MissedScreenState
    extends BaseState<MissedScreen, MissedEvent, MissedState, MissedBloc> {
  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  bool _isHrApproved(MissedItem item) {
    if (item.statusHRNumber == 1) return true;
    final text = (item.statusHRText ?? '').toLowerCase();
    if (text.contains('duyệt') && !text.contains('chờ')) return true;
    return false;
  }

  @override
  void initState() {
    super.initState();
    bloc.add(const MissedEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<MissedBloc, MissedState>(
      listenWhen: (prev, curr) =>
          // delete
          prev.deleteSuccess != curr.deleteSuccess ||
          // message (error chung)
          (curr.message != null &&
              curr.message!.isNotEmpty &&
              prev.message != curr.message &&
              !curr.isDeleting), // tránh spam khi đang delete
      listener: (context, state) {
        // ===== DELETE SUCCESS =====
        if (state.deleteSuccess) {
          showMessage(context, 'Xoá thành công', type: SnackBarType.success);
          return;
        }

        // ===== ERROR =====
        if ((state.message ?? '').isNotEmpty) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BaseScaffold(
        appBar: AppBarCommon(
          title: Text('Quên chấm công', style: AppStyles.headingTitle2),
          onBackTap: () => context.pop(),
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: () {
                final now = DateTime.now();
                final todayStart = DateTime(now.year, now.month, now.day);
                final tomorrow = todayStart.add(const Duration(days: 1));

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => DateRangePicker(
                    initialStart: bloc.state.dateStart ?? todayStart,
                    initialEnd: bloc.state.dateEnd ?? tomorrow,
                    onApply: (start, end) {
                      bloc.add(
                        MissedEvent.changeDateRange(
                          dateStart: start,
                          dateEnd: end,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
          ],
        ),

        /// FAB
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final reload = await context.push<bool?>(
              RouteNames.regworkMissedAdd,
            );
            if (!mounted) return;
            if (reload == true) {
              bloc.add(const MissedEvent.init());
            }
          },
          backgroundColor: AppColors.primaryERP,
          elevation: 6,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),

        body: BlocBuilder<MissedBloc, MissedState>(
          builder: (context, state) {
            if (state.status == BaseStateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == BaseStateStatus.failed) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(AppImages.error, width: 320),
                      const SizedBox(height: 12),
                      Text(
                        (state.message ?? '').trim().isNotEmpty
                            ? state.message!.trim()
                            : 'Load dữ liệu thất bại',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state.isDeleting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.missed.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppImages.missing, width: 320),
                    const SizedBox(height: 12),
                    const Text('Không có dữ liệu'),
                  ],
                ),
              );
            }

            final hasFilter = state.dateStart != null && state.dateEnd != null;

            final header = hasFilter
                ? DateHeader(
                    dateStart: state.dateStart,
                    dateEnd: state.dateEnd,
                    currentLabel: 'Từ ngày',
                    fromLabel: 'Từ ngày',
                    toLabel: 'Đến ngày',
                  )
                : DateHeader(
                    now: DateTime.now(),
                    currentLabel: 'Hiện tại',
                    fromLabel: 'Từ ngày',
                    toLabel: 'Đến ngày',
                  );

            // Sắp xếp theo ngày giảm dần giống lunch_screen.
            final grouped = <DateTime, List<MissedItem>>{};
            for (final item in state.missed) {
              final day = _dateOnly(item.dayWork ?? DateTime.now());
              grouped.putIfAbsent(day, () => []).add(item);
            }
            final sortedDays = grouped.keys.toList()
              ..sort((a, b) => b.compareTo(a));

            final listWidgets = <Widget>[];

            for (final day in sortedDays) {
              final dayItems = grouped[day]!;

              listWidgets.addAll(
                dayItems.map((item) {
                  // TBP: đã duyệt hoặc HR đã duyệt → không cho xoá từ danh sách.
                  final tbpApproved = item.isApprovedTP == true;
                  final hrApproved = _isHrApproved(item);
                  final canSwipeDelete = !tbpApproved && !hrApproved;

                  if (!canSwipeDelete) {
                    return MissedCard(
                      item: item,
                      onTap: () async {
                        final reload = await context.push<bool?>(
                          RouteNames.regworkMissedDetail,
                          extra: item,
                        );
                        if (!mounted) return;
                        if (reload == true) {
                          bloc.add(const MissedEvent.init());
                        }
                      },
                    );
                  }

                  return Slidable(
                    key: ValueKey('missed_${item.id}'),
                    groupTag: 'missed_slidable',
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.28,
                      children: [
                        SlidableAction(
                          onPressed: (actionContext) async {
                            Slidable.of(actionContext)?.close();
                            final confirmed =
                                await DialogService.showConfirmDelete(
                                  context: context,
                                );
                            if (!mounted) return;
                            if (confirmed) {
                              bloc.add(MissedEvent.onCancelSubmit(id: item.id));
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
                      builder: (slidableCtx) => MissedCard(
                        item: item,
                        onTap: () async {
                          Slidable.of(slidableCtx)?.close();
                          final reload = await context.push<bool?>(
                            RouteNames.regworkMissedDetail,
                            extra: item,
                          );
                          if (!mounted) return;
                          if (reload == true) {
                            bloc.add(const MissedEvent.init());
                          }
                        },
                      ),
                    ),
                  );
                }),
              );
            }

            return Column(
              children: [
                Padding(padding: const EdgeInsets.only(top: 12), child: header),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      bloc.add(const MissedEvent.init());
                      await bloc.stream.firstWhere(
                        (s) => s.status != BaseStateStatus.loading,
                      );
                    },
                    child: SlidableAutoCloseBehavior(
                      closeWhenOpened: true,
                      closeWhenTapped: true,
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: listWidgets.length,
                        itemBuilder: (context, index) => listWidgets[index],
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
