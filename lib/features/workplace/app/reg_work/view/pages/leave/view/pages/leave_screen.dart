import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/utils/card/index.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../reg_general/view/pages/booking_vehicle/view/widgets/date_range_picker.dart';
import '../../data/datasource/models/leave_model.dart';
import '../bloc/leave_bloc.dart';
import '../widgets/leave_add_constants.dart';

class LeaveScreenPage extends StatefulWidget {
  const LeaveScreenPage({super.key});

  @override
  State<LeaveScreenPage> createState() => _LeaveScreenPageState();
}

class _LeaveScreenPageState extends State<LeaveScreenPage> {
  static final _dateFmt = DateFormat('dd/MM/yyyy');

  static String _formatTotalDay(double d) =>
      d == d.roundToDouble() ? '${d.round()}' : '$d';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<LeaveBloc>().add(const LeaveEvent.init());
    });
  }

  String _typeLine(LeaveItem item) {
    final t = item.typeText?.trim();
    if (t != null && t.isNotEmpty) return t;
    final code = item.type ?? item.typeIsReal;
    if (code != null) {
      for (final o in kLeaveTypeOptions) {
        if (o.value == code) return o.label;
      }
    }
    return 'Loại nghỉ';
  }

  ApprovalStatus _statusFor(LeaveItem e) {
    if (e.deleteFlag == true ||
        e.isCancelRegister == true ||
        e.isCancelTP == true) {
      return ApprovalStatus.cancelled;
    }
    if (e.isApprovedTP == true || e.isApprovedHR == true) {
      return ApprovalStatus.approved;
    }
    final st = (e.statusText ?? '').toLowerCase();
    if (st.contains('hủy') || st.contains('huỷ')) {
      return ApprovalStatus.cancelled;
    }
    if (st.contains('duyệt') && !st.contains('chờ')) {
      return ApprovalStatus.approved;
    }
    if (st.contains('chờ')) return ApprovalStatus.pending;
    return ApprovalStatus.pending;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        final items = state.leave;
        final loading = state.status == BaseStateStatus.loading;
        final failed = state.status == BaseStateStatus.failed;

        return BaseScaffold(
          appBar: AppBarCommon(
            title: Text(
              'reg_work.leave'.tr(),
              style: AppStyles.headingTitle2,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                onPressed: () {
                  final now = DateTime.now();
                  final todayStart = DateTime(now.year, now.month, now.day);
                  final tomorrow = todayStart.add(const Duration(days: 1));

                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => DateRangePicker(
                      initialStart: state.dateStart ?? todayStart,
                      initialEnd: state.dateEnd ?? tomorrow,
                      onApply: (start, end) {
                        context.read<LeaveBloc>().add(
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
              const Icon(Icons.search_outlined),
              const SizedBox(width: 8),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final reload =
                  await context.push<bool?>(RouteNames.regworkLeaveAdd);
              if (!context.mounted) return;
              if (reload == true) {
                context.read<LeaveBloc>().add(const LeaveEvent.init());
              }
            },
            backgroundColor: AppColors.primaryERP,
            elevation: 6,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
          body: loading && items.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : failed && items.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.message ?? 'Không tải được danh sách',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            FilledButton(
                              onPressed: () => context
                                  .read<LeaveBloc>()
                                  .add(const LeaveEvent.init()),
                              child: const Text('Thử lại'),
                            ),
                          ],
                        ),
                      ),
                    )
                  : AppCardList(
                      children: [
                        if (items.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(32),
                            child: Text(
                              'Chưa có đơn nghỉ trong khoảng thời gian đã chọn.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ),
                        for (final item in items)
                          AppCardItem(
                            status: _statusFor(item),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Loại nghỉ: ${_typeLine(item)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                if (item.startDate != null)
                                  Text(
                                    'Từ ngày: ${_dateFmt.format(item.startDate!.toLocal())}',
                                  ),
                                if (item.endDate != null) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    'Đến ngày: ${_dateFmt.format(item.endDate!.toLocal())}',
                                  ),
                                ],
                                if (item.totalDay != null) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    'Số ngày: ${_formatTotalDay(item.totalDay!)}',
                                  ),
                                ],
                              ],
                            ),
                            onTap: () {
                              context.push(RouteNames.regworkLeaveDetail);
                            },
                          ),
                      ],
                    ),
        );
      },
    );
  }
}
