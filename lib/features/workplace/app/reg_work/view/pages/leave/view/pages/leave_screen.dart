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
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../reg_general/view/pages/booking_vehicle/view/widgets/date_header.dart';
import '../../../../../../reg_general/view/pages/booking_vehicle/view/widgets/date_range_picker.dart';
import '../../data/datasource/models/leave_model.dart';
import '../bloc/leave_bloc.dart';
import '../widgets/leave_card.dart';

class LeaveScreenPage extends StatefulWidget {
  const LeaveScreenPage({super.key});

  @override
  State<LeaveScreenPage> createState() => _LeaveScreenPageState();
}

class _LeaveScreenPageState
    extends BaseState<LeaveScreenPage, LeaveEvent, LeaveState, LeaveBloc> {
  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  (DateTime start, DateTime end) _calendarMonthBounds(DateTime d) {
    final y = d.year, m = d.month;
    return (DateTime(y, m, 1), DateTime(y, m + 1, 0));
  }

  /// Không cho xoá: (1) ngày/quá khứ; (2) hôm nay nhưng đã quá mốc đăng ký theo buổi.
  /// Sáng (1) / cả ngày (3): từ 8:01 cùng ngày bắt đầu không xoá. Chiều (2): từ 13:31.
  bool _isLeaveSwipeBlockedByDateTime(LeaveItem item) {
    final startRaw = item.startDate;
    if (startRaw == null) return true;

    final now = DateTime.now();
    final today = _dateOnly(now);
    final start = startRaw.toLocal();
    final startDay = _dateOnly(start);

    final endRaw = item.endDate ?? item.startDate;
    if (endRaw == null) return true;
    final endDay = _dateOnly(endRaw.toLocal());

    // Kết thúc trước hôm nay → quá khứ
    if (endDay.isBefore(today)) return true;

    // Đã bắt đầu trước hôm nay → có ngày nghỉ đã qua
    if (startDay.isBefore(today)) return true;

    // Chỉ bắt đầu trong tương lai → chưa tới ngày, không chặn theo giờ hôm nay
    if (startDay.isAfter(today)) return false;

    // Bắt đầu đúng hôm nay: chặn sau mốc theo buổi
    final y = today.year, m = today.month, d = today.day;
    final session = item.timeOnLeave;
    final DateTime deadline = session == 2
        ? DateTime(y, m, d, 13, 31)
        : DateTime(y, m, d, 8, 1);

    return !now.isBefore(deadline);
  }

  bool _leaveIsCancelled(LeaveItem item) {
    return item.deleteFlag == true ||
        item.isCancelRegister == true ||
        item.isCancelTP == true;
  }

  bool _hrApproved(LeaveItem item) {
    if (item.isApprovedHR == true) return true;
    if (item.statusHRNumber == 1) return true;
    final text = (item.statusHRText ?? '').toLowerCase();
    if (text.contains('duyệt') && !text.contains('chờ')) return true;
    return false;
  }

  bool _canSwipeDeleteLeave(LeaveItem item) {
    if (_isLeaveSwipeBlockedByDateTime(item) || _leaveIsCancelled(item)) {
      return false;
    }
    final bgdApproved = item.isApprovedBGD == true;
    final tbpApproved = item.isApprovedTP == true;
    final hrApproved = _hrApproved(item);
    return !bgdApproved && !tbpApproved && !hrApproved;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const LeaveEvent.init());
    });
  }

  Future<void> _openLeaveDetail(BuildContext context, LeaveItem item) async {
    final reload = await context.push<bool?>(
      RouteNames.regworkLeaveDetail,
      extra: item,
    );
    if (!mounted) return;
    if (reload == true) {
      bloc.add(const LeaveEvent.init());
    }
  }

  Widget _buildBody(BuildContext context, LeaveState state) {
    final items = state.leave;
    final loading = state.status == BaseStateStatus.loading;
    final failed = state.status == BaseStateStatus.failed;

    // Init / đổi tháng: luôn full loading. (Khi xoá, bloc cũng loading nhưng isDeleting=true — giữ list.)
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
              onPressed: () => bloc.add(const LeaveEvent.init()),
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

    final grouped = <DateTime, List<LeaveItem>>{};
    for (final item in items) {
      final day = _dateOnly(
        item.startDate ?? item.endDate ?? DateTime.now(),
      );
      grouped.putIfAbsent(day, () => []).add(item);
    }
    final sortedDays = grouped.keys.toList()..sort((a, b) => b.compareTo(a));

    final listWidgets = <Widget>[];
    for (final day in sortedDays) {
      final dayItems = grouped[day]!;
      for (final item in dayItems) {
        final canSwipe = _canSwipeDeleteLeave(item);

        if (!canSwipe) {
          listWidgets.add(
            LeaveCard(
              item: item,
              onTap: () => _openLeaveDetail(context, item),
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: header,
        ),
        Expanded(
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
        ),
      ],
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    final now = DateTime.now();
    final (monthStart, monthEnd) = _calendarMonthBounds(now);

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
          return;
        }
        if ((state.message ?? '').isNotEmpty) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<LeaveBloc, LeaveState>(
        bloc: bloc,
        builder: (context, state) {
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
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }
}
