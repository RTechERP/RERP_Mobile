import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../common/utils/card/index.dart';
import '../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../routes/route_names.dart';
import '../bloc/tech_bloc.dart';

class TechScreen extends StatefulWidget {
  const TechScreen({super.key});

  @override
  State<TechScreen> createState() => _TechScreenState();
}

class _TechScreenState
    extends BaseState<TechScreen, TechEvent, TechState, TechBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const TechEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<TechBloc, TechState>(
      listenWhen: (p, c) =>
          p.deleteSuccess != c.deleteSuccess || p.message != c.message,
      listener: (context, state) {
        if (state.deleteSuccess) {
          showMessage(
            context,
            'Xóa báo cáo thành công',
            type: SnackBarType.success,
          );
        }

        if (state.status == BaseStateStatus.failed && state.message != null) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BaseScaffold(
        appBar: AppBarCommon(
          title: Text('report.tech'.tr(), style: AppStyles.headingTitle2),
          onBackTap: () => onBack(context),
          actions: [
            _DateRangeAction(
              stateSelector: (ctx) => ctx.read<TechBloc>().state,
            ),
            const SizedBox(width: 12),
            const Icon(Icons.search, size: 22),
            const SizedBox(width: 12),
          ],
        ),

        body: BlocBuilder<TechBloc, TechState>(
          buildWhen: (p, c) =>
              p.status != c.status ||
              p.reports != c.reports ||
              p.dateStart != c.dateStart ||
              p.dateEnd != c.dateEnd ||
              p.isDeleting != c.isDeleting,

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

            if (state.reports.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppImages.missing, width: 320),
                    const SizedBox(height: 12),
                    const Text('Không có báo cáo'),
                  ],
                ),
              );
            }

            if (state.isDeleting) {
              return const Center(child: CircularProgressIndicator());
            }
            return RefreshIndicator(
              onRefresh: () async {
                bloc.add(const TechEvent.init());

                // đợi load xong
                await bloc.stream.firstWhere(
                  (s) => s.status != BaseStateStatus.loading,
                );
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.reports.length,
                itemBuilder: (context, index) {
                  final r = state.reports[index];

                  final hasData =
                      (r.projectCode?.isNotEmpty == true) &&
                      (r.projectName?.isNotEmpty == true);

                  final parsedDate = DateTime.tryParse(r.dateReport);

                  Widget card = AppCardReport(
                    projectCode: r.projectCode,
                    projectName: r.projectName,
                    time: parsedDate,
                    progress: (r.percentComplete / 100).clamp(0.0, 1.0),
                    onTap: hasData
                        ? () => context.push(
                            RouteNames.reportITdepartDetail,
                            extra: r.id,
                          )
                        : null,
                  );

                  /// Nếu không đủ dữ liệu → disable hoàn toàn (không tap, không slide)
                  if (!hasData) {
                    return Opacity(opacity: 0.5, child: card);
                  }

                  /// Nếu hợp lệ → cho slide delete
                  return Slidable(
                    key: ValueKey(r.id),
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.25,
                      children: [
                        SlidableAction(
                          onPressed: (_) async {
                            final confirmed =
                                await DialogService.showConfirmDelete(
                                  context: context,
                                );
                            if (!confirmed) return;

                            bloc.add(TechEvent.deleteReport(r.id));
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Xoá',
                        ),
                      ],
                    ),
                    child: card,
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final reload = await context.push(RouteNames.reportITdepartAdd);

            if (reload == true) {
              bloc.add(const TechEvent.init()); // reload API
            }
          },
          backgroundColor: AppColors.primaryERP,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class _DateRangeAction extends StatelessWidget {
  const _DateRangeAction({required this.stateSelector});

  final TechState Function(BuildContext) stateSelector;

  DateTime _safeAddMonth(DateTime d, int offset) {
    final target = DateTime(d.year, d.month + offset, 1);
    final lastDay = DateTime(target.year, target.month + 1, 0).day;
    final day = d.day.clamp(1, lastDay);
    return DateTime(target.year, target.month, day);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openSfPicker(context),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Icon(Icons.date_range, size: 22),
      ),
    );
  }

  void _openSfPicker(BuildContext context) {
    final state = stateSelector(context);
    final now = DateTime.now();
    final minDate = _safeAddMonth(now, -1);
    final maxDate = _safeAddMonth(now, 1);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        DateTime? start;
        DateTime? end;

        return SafeArea(
          child: SizedBox(
            height: 420,
            child: Column(
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Chọn ngày / khoảng ngày',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: SfDateRangePicker(
                    selectionMode: DateRangePickerSelectionMode.range,
                    minDate: minDate,
                    maxDate: maxDate,
                    initialSelectedRange:
                        (state.dateStart != null && state.dateEnd != null)
                        ? PickerDateRange(state.dateStart, state.dateEnd)
                        : null,
                    onSelectionChanged: (args) {
                      final range = args.value as PickerDateRange?;
                      start = range?.startDate;
                      end = range?.endDate ?? range?.startDate;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Huỷ'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (start != null && end != null) {
                              context.read<TechBloc>().add(
                                TechEvent.changeDateRange(
                                  dateStart: start!,
                                  dateEnd: end!,
                                ),
                              );
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Áp dụng'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
