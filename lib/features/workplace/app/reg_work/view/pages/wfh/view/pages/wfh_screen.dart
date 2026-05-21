import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/date_header.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/wfh_model.dart';
import '../bloc/wfh_bloc.dart';
import '../widgets/wfh_card.dart';

class WfhScreen extends StatefulWidget {
  const WfhScreen({super.key});

  @override
  State<WfhScreen> createState() => _WfhScreenState();
}

class _WfhScreenState
    extends BaseState<WfhScreen, WfhEvent, WfhState, WfhBloc> {
  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  /// Chỉ cho phép xóa phiếu có ngày thực hiện (`DateWFH`) là ngày tương lai (sau hôm nay).
  bool _canDeleteWfhByDate(WfhItem item) {
    final d = item.dateWFH;
    if (d == null) return false;
    final today = _dateOnly(DateTime.now());
    return _dateOnly(d).isAfter(today);
  }

  bool _isHrApproved(WfhItem item) {
    if (item.statusHRNumber == 1) return true;
    final text = (item.statusHRText ?? '').toLowerCase();
    if (text.contains('duyệt') && !text.contains('chờ')) return true;
    return false;
  }

  @override
  void initState() {
    super.initState();
    bloc.add(const WfhEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<WfhBloc, WfhState>(
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
          onBackTap: () => context.pop(),
          title: Text(
            'reg_work.wfh'.tr(), // key WFH
            style: AppStyles.headingTitle2,
          ),
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
                        WfhEvent.changeDateRange(
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

        /// ===== FAB: tạo đơn WFH =====
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final reload = await context.push<bool?>(RouteNames.regworkWfhAdd);
            if (!mounted) return;
            if (reload == true) {
              bloc.add(const WfhEvent.init());
            }
          },
          backgroundColor: AppColors.primaryERP,
          elevation: 6,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),

        /// ===== DANH SÁCH ĐƠN WFH =====
        body: BlocBuilder<WfhBloc, WfhState>(
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
            if (state.wfh.isEmpty) {
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
            final grouped = <DateTime, List<WfhItem>>{};
            for (final item in state.wfh) {
              final day = _dateOnly(item.dateWFH ?? DateTime.now());
              grouped.putIfAbsent(day, () => []).add(item);
            }
            final sortedDays = grouped.keys.toList()
              ..sort((a, b) => b.compareTo(a));

            final listWidgets = <Widget>[];
            for (final day in sortedDays) {
              final dayItems = grouped[day]!;
              listWidgets.addAll(
                dayItems.map((item) {
                  // TBP (`IsApproved`): đã duyệt thì không xóa / không sửa từ danh sách (chi tiết cũng khóa sửa).
                  final tbpApproved = item.isApproved == true;
                  final hrApproved = _isHrApproved(item);
                  final bgdApproved = item.isApprovedBGD == true;
                  final canSwipeDelete = !bgdApproved &&
                      !tbpApproved &&
                      !hrApproved &&
                      _canDeleteWfhByDate(item);

                  if (!canSwipeDelete) {
                    return WfhCard(
                      item: item,
                      onTap: () {
                        () async {
                          final reload = await context.push<bool?>(
                            RouteNames.regworkWfhDetail,
                            extra: item,
                          );
                          if (!mounted) return;
                          if (reload == true) {
                            bloc.add(const WfhEvent.init());
                          }
                        }();
                      },
                    );
                  }

                  return Slidable(
                    key: ValueKey('wfh_${item.id}'),
                    groupTag: 'wfh_slidable',
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
                              bloc.add(WfhEvent.onCancelSubmit(id: item.id));
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
                      builder: (slidableCtx) => WfhCard(
                        item: item,
                        onTap: () {
                          () async {
                            Slidable.of(slidableCtx)?.close();
                            final reload = await context.push<bool?>(
                              RouteNames.regworkWfhDetail,
                              extra: item,
                            );
                            if (!mounted) return;
                            if (reload == true) {
                              bloc.add(const WfhEvent.init());
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
                      bloc.add(const WfhEvent.init());
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
