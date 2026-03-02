import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/card/index.dart';
import '../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../routes/route_names.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../bloc/marketing_bloc.dart';

class MarketingScreen extends StatefulWidget {
  const MarketingScreen({super.key});

  @override
  State<MarketingScreen> createState() => _MarketingScreenState();
}

class _MarketingScreenState
    extends
        BaseState<
          MarketingScreen,
          MarketingEvent,
          MarketingState,
          MarketingBloc
        > {
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
    bloc.add(const MarketingEvent.init());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildDateHeader(MarketingState state) {
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
    return BlocListener<MarketingBloc, MarketingState>(
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
              : Text('report.marketing'.tr()),
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
        body: BlocBuilder<MarketingBloc, MarketingState>(
          builder: (context, state) {
            if (state.status == BaseStateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.isDeleting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == BaseStateStatus.failed) {
              return const Center(child: Text('Load dữ liệu thất bại'));
            }

            if (state.reports.isEmpty) {
              return const Center(child: Text('Không có báo cáo'));
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
                      bloc.add(const MarketingEvent.init());
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

                                  bloc.add(MarketingEvent.deleteReport(r.id));
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
                                RouteNames.reportMarketingdepartDetail,
                                extra: r.id,
                              );

                              if (reload == true) {
                                bloc.add(const MarketingEvent.init());
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
                  RouteNames.reportMarketingdepartAdd,
                );

                if (reload == true) {
                  bloc.add(const MarketingEvent.init());
                }
              },
            ),

            /// ===== LỌC THEO NGÀY =====
            SpeedDialChild(
              child: const Icon(Icons.date_range),
              label: 'Lọc ngày',
              onTap: () {
                MarketingDateRangePicker.open(context, bloc);
              },
            ),

          ],
        ),
      ),
    );
  }
}

class MarketingDateRangePicker {
  static DateTime _safeAddMonth(DateTime d, int offset) {
    final target = DateTime(d.year, d.month + offset, 1);
    final lastDay = DateTime(target.year, target.month + 1, 0).day;
    final day = d.day.clamp(1, lastDay);
    return DateTime(target.year, target.month, day);
  }

  static void open(BuildContext context, MarketingBloc bloc) {
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
                                MarketingEvent.changeDateRange(
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
