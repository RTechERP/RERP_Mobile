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
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/card/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/date_header.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../bloc/lunch_bloc.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({super.key});

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState
    extends BaseState<LunchScreen, LunchEvent, LunchState, LunchBloc> {
  ApprovalStatus _mapApprovalStatus(bool? isApproved) {
    if (isApproved == true) return ApprovalStatus.approved;
    if (isApproved == false) return ApprovalStatus.pending;
    return ApprovalStatus.prepare;
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '--/--/----';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  DateTime _dateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  @override
  void initState() {
    super.initState();
    bloc.add(const LunchEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<LunchBloc, LunchState>(
      listenWhen: (prev, curr) =>
          prev.deleteSuccess != curr.deleteSuccess ||
          (curr.message != null &&
              curr.message!.isNotEmpty &&
              prev.message != curr.message &&
              !curr.isDeleting),
      listener: (context, state) {
        if (state.deleteSuccess) {
          showMessage(
            context,
            'Hủy đặt cơm thành công',
            type: SnackBarType.success,
          );
        }
        if (state.message != null &&
            state.message!.isNotEmpty &&
            !state.isDeleting) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BaseScaffold(
        appBar: AppBarCommon(
          title: Text('reg_work.lunch'.tr(), style: AppStyles.headingTitle2),
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
                        LunchEvent.changeDateRange(
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
              RouteNames.regworkLunchAdd,
            );
            if (!mounted) return;
            if (reload == true) {
              bloc.add(const LunchEvent.init());
            }
          },
          backgroundColor: AppColors.primaryERP,
          elevation: 6,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),

        body: BlocBuilder<LunchBloc, LunchState>(
          builder: (context, state) {
            if (state.status == BaseStateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.isDeleting) {
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

            if (state.lunch.isEmpty) {
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

            final hasFilter =
                state.dateStart != null && state.dateEnd != null;

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

            final grouped = <DateTime, List<dynamic>>{};
            for (final item in state.lunch) {
              final day = _dateOnly(item.dateOrder ?? DateTime.now());
              grouped.putIfAbsent(day, () => []).add(item);
            }

            final sortedDays = grouped.keys.toList()
              ..sort((a, b) => b.compareTo(a));

            final listWidgets = <Widget>[];
            for (final day in sortedDays) {
              final dayItems = grouped[day]!;
              listWidgets.addAll(
                dayItems.map((item) {
                  final status = _mapApprovalStatus(item.isApproved);
                  final employeeDisplay = item.code?.toString() ?? '--';
                  final quantityDisplay = item.quantity?.toString() ?? '0';
                  final locationText = item.locationText ?? '';

                  final canSwipeDelete = item.isApproved == false;

                  if (!canSwipeDelete) {
                    return AppCardItem(
                      status: status,
                      useStatusBackground: false,
                      useStatusBorder: false,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mã nhân viên: $employeeDisplay',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text('Ngày: ${_formatDate(item.dateOrder)}'),
                          const SizedBox(height: 4),
                          Text('Số lượng: $quantityDisplay'),
                          if (locationText.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text('Địa điểm: $locationText'),
                          ],
                        ],
                      ),
                      onTap: () async {
                        final reload = await context.push<bool?>(
                          RouteNames.regworkLunchDetail,
                          extra: item,
                        );
                        if (!mounted) return;
                        if (reload == true) {
                          bloc.add(const LunchEvent.init());
                        }
                      },
                    );
                  }

                  return Slidable(
                    key: ValueKey('lunch_${item.id}'),
                    groupTag: 'lunch_slidable',
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.28,
                      children: [
                        SlidableAction(
                          onPressed: (actionContext) async {
                            Slidable.of(actionContext)?.close();
                            if (!context.mounted) return;
                            await DialogService.showCancelLunch(
                              context: context,
                              onConfirm: () {
                                bloc.add(
                                  LunchEvent.onCancelSubmit(id: item.id),
                                );
                              },
                            );
                          },
                          backgroundColor: AppColors.alert,
                          foregroundColor: Colors.white,
                          icon: Icons.delete_outline,
                          label: 'Xoá',
                        ),
                      ],
                    ),
                    child: Builder(
                      builder: (slidableCtx) => AppCardItem(
                        status: status,
                        useStatusBackground: false,
                        useStatusBorder: false,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mã nhân viên: $employeeDisplay',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            Text('Ngày: ${_formatDate(item.dateOrder)}'),
                            const SizedBox(height: 4),
                            Text('Số lượng: $quantityDisplay'),
                            if (locationText.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text('Địa điểm: $locationText'),
                            ],
                          ],
                        ),
                        onTap: () async {
                          // Đóng Slidable trước khi điều hướng để tránh tình trạng
                          // vuốt vẫn còn lộ action sau khi chạm vào nội dung.
                          Slidable.of(slidableCtx)?.close();
                          final reload = await context.push<bool?>(
                            RouteNames.regworkLunchDetail,
                            extra: item,
                          );
                          if (!mounted) return;
                          if (reload == true) {
                            bloc.add(const LunchEvent.init());
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
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: header,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      bloc.add(const LunchEvent.init());
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
