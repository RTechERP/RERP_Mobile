import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../reg_general/view/pages/booking_vehicle/view/widgets/date_header.dart';
import '../../../../../../reg_general/view/pages/booking_vehicle/view/widgets/date_range_picker.dart';
import '../../data/datasource/models/overnight_model.dart';
import '../bloc/overnight_bloc.dart';
import '../widgets/overnight_card.dart';

class OvernightScreenPage extends StatefulWidget {
  const OvernightScreenPage({super.key});

  @override
  State<OvernightScreenPage> createState() => _OvernightScreenPageState();
}

class _OvernightScreenPageState
    extends BaseState<OvernightScreenPage, OvernightEvent, OvernightState, OvernightBloc> {
  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  (DateTime start, DateTime end) _calendarMonthBounds(DateTime d) {
    final y = d.year, m = d.month;
    return (DateTime(y, m, 1), DateTime(y, m + 1, 0));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const OvernightEvent.init());
    });
  }

  Future<void> _openOvernightDetail(
    BuildContext context,
    OvernightItem item,
  ) async {
    final reload = await context.push<bool?>('/regwork/overnight/detail', extra: item);
    if (!mounted) return;
    if (reload == true) {
      bloc.add(const OvernightEvent.init());
    }
  }

  Widget _buildBody(BuildContext context, OvernightState state) {
    final items = state.overnight;
    final loading = state.status == BaseStateStatus.loading;
    final failed = state.status == BaseStateStatus.failed;

    if (loading && !state.isDeleting) {
      return const Center(child: CircularProgressIndicator());
    }

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
              onPressed: () => bloc.add(const OvernightEvent.init()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (items.isEmpty) {
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
            currentLabel: 'Tháng',
            fromLabel: 'Từ ngày',
            toLabel: 'Đến ngày',
          )
        : DateHeader(
            now: DateTime.now(),
            currentLabel: 'Hiện tại',
            fromLabel: 'Từ ngày',
            toLabel: 'Đến ngày',
          );

    // Nhóm theo ngày (DateRegister)
    final grouped = <DateTime, List<OvernightItem>>{};
    for (final item in items) {
      final day = _dateOnly(item.dateRegister ?? DateTime.now());
      grouped.putIfAbsent(day, () => []).add(item);
    }
    final sortedDays = grouped.keys.toList()..sort((a, b) => b.compareTo(a));

    final listWidgets = <Widget>[];
    for (final day in sortedDays) {
      for (final item in grouped[day]!) {
        final canSwipe = OvernightCard.canDelete(item);

        if (!canSwipe) {
          listWidgets.add(
            OvernightCard(
              item: item,
              onTap: () => _openOvernightDetail(context, item),
            ),
          );
          continue;
        }

        listWidgets.add(
          Slidable(
            key: ValueKey('overnight_${item.id}'),
            groupTag: 'overnight_slidable',
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
                      bloc.add(OvernightEvent.onCancelSubmit(id: item.id));
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
              builder: (slidableCtx) => OvernightCard(
                item: item,
                onTap: () {
                  Slidable.of(slidableCtx)?.close();
                  _openOvernightDetail(context, item);
                },
              ),
            ),
          ),
        );
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: header,
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              bloc.add(const OvernightEvent.init());
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
  }

  @override
  Widget renderUI(BuildContext context) {
    final now = DateTime.now();
    final (monthStart, monthEnd) = _calendarMonthBounds(now);

    return BlocListener<OvernightBloc, OvernightState>(
      listenWhen: (prev, curr) =>
          prev.deleteSuccess != curr.deleteSuccess ||
          (curr.message != null &&
              curr.message!.isNotEmpty &&
              prev.message != curr.message &&
              !curr.isDeleting),
      listener: (context, state) {
        if (state.deleteSuccess) {
          showMessage(context, 'Xoá thành công', type: SnackBarType.success);
          return;
        }
        if ((state.message ?? '').isNotEmpty) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<OvernightBloc, OvernightState>(
        bloc: bloc,
        builder: (context, state) {
          return BaseScaffold(
            appBar: AppBarCommon(
              onBackTap: () => context.pop(),
              title: Text(
                'reg_work.overnight'.tr(),
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
                            OvernightEvent.changeDateRange(
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
                    await context.push<bool?>('/regwork/overnight/add');
                if (!mounted) return;
                if (reload == true) {
                  bloc.add(const OvernightEvent.init());
                }
              },
              backgroundColor: AppColors.primaryERP,
              elevation: 6,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }
}