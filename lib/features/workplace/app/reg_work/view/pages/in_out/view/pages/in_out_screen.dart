import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../../common/widgets/date_header.dart';
import '../../../../../../../../../routes/route_names.dart';

import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/in_out_model.dart';
import '../widgets/in_out_card.dart';
import '../bloc/in_out_bloc.dart';

class InOutScreenPage extends StatefulWidget {
  const InOutScreenPage({super.key});

  @override
  State<InOutScreenPage> createState() => _InOutScreenPageState();
}

class _InOutScreenPageState
    extends BaseState<InOutScreenPage, InOutEvent, InOutState, InOutBloc> {
  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  /// Khớp logic hiển thị badge HR trong [InOutCard].
  bool _isHrApproved(InOutItem item) {
    if (item.statusHRNumber == 1) return true;
    final text = (item.statusHRText ?? '').toLowerCase();
    if (text.contains('duyệt') && !text.contains('chờ')) return true;
    return false;
  }

  @override
  void initState() {
    super.initState();
    bloc.add(const InOutEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<InOutBloc, InOutState>(
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
          title: Text('Đi muộn - về sớm', style: AppStyles.headingTitle2),
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
                        InOutEvent.changeDateRange(
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
          onBackTap: () => context.pop(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final reload = await context.push<bool?>(
              RouteNames.regworkInOutAdd,
            );
            if (!mounted) return;
            if (reload == true) {
              bloc.add(const InOutEvent.init());
            }
          },
          backgroundColor: AppColors.primaryERP,
          elevation: 6,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        body: BlocBuilder<InOutBloc, InOutState>(
          builder: (context, state) {
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
                    const Text('Load dữ liệu thất bại'),
                  ],
                ),
              );
            }
            if (state.inOut.isEmpty) {
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
            final grouped = <DateTime, List<InOutItem>>{};
            for (final item in state.inOut) {
              final day = _dateOnly(item.dateStart ?? DateTime.now());
              grouped.putIfAbsent(day, () => []).add(item);
            }
            final sortedDays = grouped.keys.toList()
              ..sort((a, b) => b.compareTo(a));

            final listWidgets = <Widget>[];
            for (final day in sortedDays) {
              final dayItems = grouped[day]!;
              listWidgets.addAll(
                dayItems.map((item) {
                  final tbpApproved = item.isApprovedTP == true;
                  final hrApproved = _isHrApproved(item);
                  final canSwipeDelete = !tbpApproved && !hrApproved;

                  if (!canSwipeDelete) {
                    return InOutCard(
                      item: item,
                      onTap: () {
                        () async {
                          final reload = await context.push<bool?>(
                            RouteNames.regworkInOutDetail,
                            extra: item,
                          );
                          if (!mounted) return;
                          if (reload == true) {
                            bloc.add(const InOutEvent.init());
                          }
                        }();
                      },
                    );
                  }

                  return Slidable(
                    key: ValueKey('inout_${item.id}'),
                    groupTag: 'inout_slidable',
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
                              bloc.add(InOutEvent.onCancelSubmit(id: item.id));
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
                      builder: (slidableCtx) => InOutCard(
                        item: item,
                        onTap: () {
                          () async {
                            Slidable.of(slidableCtx)?.close();
                            final reload = await context.push<bool?>(
                              RouteNames.regworkInOutDetail,
                              extra: item,
                            );
                            if (!mounted) return;
                            if (reload == true) {
                              bloc.add(const InOutEvent.init());
                            }
                          }();
                        },
                      ),
                    ),
                  );
                }).toList(),
              );
            }

            return Column(
              children: [
                Padding(padding: const EdgeInsets.only(top: 12), child: header),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      bloc.add(const InOutEvent.init());
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
