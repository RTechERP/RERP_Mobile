import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/utils/card/index.dart';
import '../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../routes/route_names.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../bloc/hr_bloc.dart';

class HrAdminScreen extends StatefulWidget {
  const HrAdminScreen({super.key});

  @override
  State<HrAdminScreen> createState() => _HrAdminScreenState();
}

class _HrAdminScreenState
    extends BaseState<HrAdminScreen, HrEvent, HrState, HrBloc> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<ReportResponse> _filteredReports = [];

  void _filterReports(String keyword, List<ReportResponse> reports) {
    final lower = keyword.toLowerCase().trim();

    if (lower.isEmpty) {
      _filteredReports = reports;
      return;
    }

    _filteredReports = reports.where((r) {
      final code = (r.projectCode ?? '').toLowerCase();
      final name = (r.projectName ?? '').toLowerCase();
      return code.contains(lower) || name.contains(lower);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    bloc.add(const HrEvent.initAd());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _buildCopyContent(List<CopyNullResponse> reports) {
    if (reports.isEmpty) return '';

    final buffer = StringBuffer();
    final date = DateTime.tryParse(reports.first.dateReport ?? '');
    final formattedDate = date != null
        ? '${date.day.toString().padLeft(2, '0')}/'
              '${date.month.toString().padLeft(2, '0')}/'
              '${date.year}'
        : '';

    buffer.writeln('Báo cáo công việc ngày $formattedDate');

    for (final r in reports) {

      buffer.writeln('* Nội dung công việc:');
      buffer.writeln(_clean(r.mission));
      buffer.writeln('');

      buffer.writeln('* Kết quả công việc:');
      buffer.writeln(_clean(r.results));
      buffer.writeln('');

      buffer.writeln('* Tồn đọng:');
      buffer.writeln(_cleanOrDefault(r.backlog));
      buffer.writeln('');

      buffer.writeln('* Ghi chú:');
      buffer.writeln(_cleanOrDefault(r.note));
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

  Widget _buildDateHeader(HrState state) {
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
      decoration: const BoxDecoration(color: Colors.white),
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
    return BlocListener<HrBloc, HrState>(
      listenWhen: (p, c) =>
          p.deleteSuccess != c.deleteSuccess ||
          p.copyReports != c.copyReports ||
          p.copyError != c.copyError,
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

        /// COPY ERROR
        if (state.copyError != null) {
          showMessage(context, state.copyError!, type: SnackBarType.error);
          return;
        }

        /// COPY SUCCESS
        if (state.copyReports.isNotEmpty) {
          final content = _buildCopyContent(state.copyReports);

          await Clipboard.setData(ClipboardData(text: content));

          showMessage(
            context,
            'Đã copy nội dung thành công',
            type: SnackBarType.success,
          );

          await SharePlus.instance.share(
              ShareParams(
                text: content,
                sharePositionOrigin: Rect.fromLTWH(
                  0,
                  0,
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height / 2,
                ),
              ),
          );
          // reset sau khi xử lý xong
          // bloc.add(const HrEvent.resetCopyReport());
        }
      },
      child: BaseScaffold(
        appBar: AppBarCommon(
          title: _isSearching
              ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Tìm theo mã hoặc tên dự án',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _filterReports(value, bloc.state.reports);
                    });
                  },
                )
              : Text('report.thr'.tr()),
          onBackTap: () => onBack(context),
          actions: [
            IconButton(
              icon: Icon(_isSearching ? Icons.close : Icons.search, size: 22),
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                  _searchController.clear();
                  _filteredReports = [];
                });
              },
            ),
          ],
        ),

        body: BlocBuilder<HrBloc, HrState>(
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

            final displayList = _isSearching ? _filteredReports : state.reports;

            if (!_isSearching) {
              _filteredReports = state.reports;
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
                      bloc.add(const HrEvent.initAd());
                      await bloc.stream.firstWhere(
                            (s) => s.status != BaseStateStatus.loading,
                      );
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      itemCount: displayList.length,
                      itemBuilder: (context, index) {
                        final r = displayList[index];
                        final parsedDate = DateTime.tryParse(r.dateReport);

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

                                  bloc.add(HrEvent.deleteReport(r.id));
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Xoá',
                              ),
                            ],
                          ),
                          child: AppCardReport(
                            category: state.departmentName,
                            employeeName: r.fullName,
                            position: state.positionName,
                            planNextDay: r.planNextDay,
                            time: parsedDate,
                            showProgress: false,
                            onTap: () async {
                              final reload = await context.push(
                                RouteNames.reportHRAdminDetail,
                                extra: r.id,
                              );

                              if (reload == true) {
                                bloc.add(const HrEvent.initAd());
                              }
                            },
                          ),
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
                final reload = await context.push(
                  RouteNames.reportHRAdd,
                  extra: DepartmentType.hr_admin,
                );

                if (reload == true) {
                  bloc.add(const HrEvent.initAd());
                }
              },
            ),

            /// ===== LỌC THEO NGÀY =====
            SpeedDialChild(
              child: const Icon(Icons.date_range),
              label: 'Lọc ngày',
              onTap: () {
                TechDateRangePicker.open(context, bloc);
              },
            ),

            /// ===== COPY =====
            SpeedDialChild(
              child: const Icon(Icons.copy),
              label: 'Sao chép',
              onTap: () {
                final state = bloc.state;

                if (state.reports.isEmpty) {
                  showMessage(context, 'Không có dữ liệu để copy!');
                  return;
                }

                final uniqueDates = state.reports
                    .map((e) => e.dateReport)
                    .toSet()
                    .toList();

                if (uniqueDates.length != 1) {
                  showMessage(
                    context,
                    'Bạn không thể copy nội dung của ${uniqueDates.length} ngày!',
                    type: SnackBarType.error,
                  );
                  return;
                }

                bloc.add(
                  HrEvent.copyReport(
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

  static void open(BuildContext context, HrBloc bloc) {
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
                                HrEvent.changeDateRange(
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
