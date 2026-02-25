import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:share_plus/share_plus.dart';
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
import '../../../../data/datasource/models/report_model.dart';
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

  String _buildCopyContent(List<CopyResponse> reports) {
    if (reports.isEmpty) return '';

    final buffer = StringBuffer();
    final date = DateTime.tryParse(reports.first.dateReport);
    final formattedDate = date != null
        ? '${date.day.toString().padLeft(2, '0')}/'
              '${date.month.toString().padLeft(2, '0')}/'
              '${date.year}'
        : '';

    buffer.writeln('Báo cáo công việc ngày $formattedDate');
    buffer.writeln('');

    for (final r in reports) {
      final projectLine = '${r.projectCode} - ${r.projectName}'.trim();

      buffer.writeln('* Mã dự án - Tên dự án:');
      buffer.writeln(projectLine);
      buffer.writeln('');

      buffer.writeln('* Nội dung công việc:');
      buffer.writeln(_clean(r.mission));
      buffer.writeln('');

      buffer.writeln('* Kết quả công việc:');
      buffer.writeln(_clean(r.results));
      buffer.writeln('');

      buffer.writeln('* Tồn đọng:');
      buffer.writeln(_cleanOrDefault(r.backlog));
      buffer.writeln('');

      buffer.writeln('* Vấn đề phát sinh:');
      buffer.writeln(_cleanOrDefault(r.problem));
      buffer.writeln('');

      buffer.writeln('* Giải pháp cho vấn đề phát sinh:');
      buffer.writeln(_cleanOrDefault(r.problemSolve));
      buffer.writeln('');

      buffer.writeln('* Kế hoạch ngày tiếp theo:');
      buffer.writeln(_clean(r.planNextDay));
      buffer.writeln('');
    }

    return buffer.toString().trim();
  }

  String _clean(String? value) {
    if (value == null || value.trim().isEmpty) return '- Không có';
    return value.trim();
  }

  String _cleanOrDefault(String? value) {
    if (value == null || value.trim().isEmpty) return '- Không có';
    return value.trim();
  }

  Widget _buildDateHeader(TechState state) {
    String text;

    final hasFilter = state.dateStart != null && state.dateEnd != null;

    if (hasFilter) {
      final start = state.dateStart!;
      final end = state.dateEnd!;

      final isSameDay =
          start.year == end.year &&
          start.month == end.month &&
          start.day == end.day;

      if (isSameDay) {
        text = 'Hiện tại: ${_formatDate(start)}';
      } else {
        text = 'Từ: ${_formatDate(start)} - Đến: ${_formatDate(end)}';
      }
    } else {
      final now = DateTime.now();
      text = 'Hiện tại: ${_formatDate(now)}';
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  String _formatDate(DateTime d) {
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/'
        '${d.year}';
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<TechBloc, TechState>(
      listenWhen: (p, c) =>
          p.deleteSuccess != c.deleteSuccess || p.copyReports != c.copyReports,
      listener: (context, state) async {
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

        if (state.copyReports.isNotEmpty) {
          final content = _buildCopyContent(state.copyReports);

          await Clipboard.setData(ClipboardData(text: content));
          await Share.share(content);
        }
      },
      child: BaseScaffold(
        appBar: AppBarCommon(
          title: Text('report.tech'.tr(), style: AppStyles.headingTitle2),
          onBackTap: () => onBack(context),
          actions: [
            const Icon(Icons.search, size: 22),
            const SizedBox(width: 12),
          ],
        ),

        body: BlocBuilder<TechBloc, TechState>(
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

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: _buildDateHeader(state),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      bloc.add(const TechEvent.init());
                      await bloc.stream.firstWhere(
                        (s) => s.status != BaseStateStatus.loading,
                      );
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
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

                        if (!hasData) {
                          return Opacity(opacity: 0.5, child: card);
                        }

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
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.menu,
          activeIcon: Icons.close,
          backgroundColor: AppColors.primaryERP,
          foregroundColor: Colors.white,
          spacing: 8,
          spaceBetweenChildren: 8,
          overlayOpacity: 0.3,

          children: [
            /// ===== THÊM =====
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Thêm',
              onTap: () async {
                final reload = await context.push(RouteNames.reportITdepartAdd);

                if (reload == true) {
                  bloc.add(const TechEvent.init());
                }
              },
            ),

            /// ===== LỌC THEO NGÀY =====
            SpeedDialChild(
              child: const Icon(Icons.date_range),
              label: 'Lọc theo ngày',
              onTap: () {
                final state = bloc.state;
                TechDateRangePicker.open(context, bloc);
              },
            ),

            /// ===== COPY =====
            SpeedDialChild(
              child: const Icon(Icons.copy),
              label: 'Sao chép',
              onTap: () {
                final state = bloc.state;

                if (state.reports.isEmpty) return;

                bloc.add(
                  TechEvent.copyReport(
                    dateStart: state.dateStart ?? DateTime.now(),
                    dateEnd: state.dateEnd ?? DateTime.now(),
                    keyword: state.keyword ?? '',
                    teamId: state.teamId ?? 0,
                    userId: state.employeeID ?? 0,
                    departmentId: state.departmentId ?? 0,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TechDateRangePicker {
  static DateTime _safeAddMonth(DateTime d, int offset) {
    final target = DateTime(d.year, d.month + offset, 1);
    final lastDay = DateTime(target.year, target.month + 1, 0).day;
    final day = d.day.clamp(1, lastDay);
    return DateTime(target.year, target.month, day);
  }

  static void open(BuildContext context, TechBloc bloc) {
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
                        (bloc.state.dateStart != null &&
                            bloc.state.dateEnd != null)
                        ? PickerDateRange(
                            bloc.state.dateStart,
                            bloc.state.dateEnd,
                          )
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
                          onPressed: () => onBack(context),
                          child: const Text('Huỷ'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (start != null && end != null) {
                              onBack(context);

                              bloc.add(
                                TechEvent.changeDateRange(
                                  dateStart: start!,
                                  dateEnd: end!,
                                ),
                              );
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
