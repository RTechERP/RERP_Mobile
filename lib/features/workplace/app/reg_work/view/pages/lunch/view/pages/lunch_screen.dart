import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/card/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../reg_general/view/pages/booking_vehicle/view/widgets/date_header.dart';
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

  DateTime _dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);

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
          actions: const [Icon(Icons.calendar_month), SizedBox(width: 8)],
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
            if (state.status == BaseStateStatus.loading && state.lunch.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.isDeleting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.lunch.isEmpty) {
              return const Center(
                child: Text('Chưa có dữ liệu cơm ca'),
              );
            }

            final grouped = <DateTime, List<dynamic>>{};
            for (final item in state.lunch) {
              final day = _dateOnly(item.dateOrder ?? DateTime.now());
              grouped.putIfAbsent(day, () => []).add(item);
            }

            final sortedDays = grouped.keys.toList()
              ..sort((a, b) => b.compareTo(a));

            final children = <Widget>[];
            for (final day in sortedDays) {
              children.add(
                DateHeader(
                  dateStart: day,
                  dateEnd: day,
                ),
              );

              final dayItems = grouped[day]!;
              children.addAll(
                dayItems.map((item) {
                  final status = _mapApprovalStatus(item.isApproved);
                  final employeeDisplay = item.employeeId?.toString() ?? '--';
                  final quantityDisplay = item.quantity?.toString() ?? '0';
                  final locationText = item.locationText ?? '';

                  final canSwipeDelete = item.isApproved == false;

                  final card = AppCardItem(
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

                  if (!canSwipeDelete) return card;

                  return Slidable(
                    key: ValueKey('lunch_${item.id}'),
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
                    child: card,
                  );
                }),
              );
            }

            return AppCardList(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
              spacing: 8,
              children: children,
            );
          },
        ),
      ),
    );
  }
}
