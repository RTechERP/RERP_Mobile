import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../routes/route_names.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../bloc/marketing_bloc.dart';
import '../widgets/marketing_report_card.dart';

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
          p.deleteSuccess != c.deleteSuccess,
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
            IconButton(
              icon: const Icon(Icons.date_range, size: 22),
              onPressed: () {
                _showDateRangePicker(context);
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

                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Slidable(
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
                                  borderRadius: BorderRadius.circular(20),
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Xoá',
                                ),
                              ],
                            ),
                            child: MarketingReportCard(
                              employeeName: r.fullName,
                              position: state.positionName,
                              projectCode: r.projectCode,
                              departmentName: state.departmentName,
                              planNextDay: r.planNextDay,
                              time: parsedDate,
                              showProgress: false,
                              mission: r.mission,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final reload = await context.push(
              RouteNames.reportMarketingdepartAdd,
            );

            if (reload == true) {
              bloc.add(const MarketingEvent.init());
            }
          },
          backgroundColor: AppColors.primaryERP,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showDateRangePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DateRangePicker(
        initialStart: bloc.state.dateStart,
        initialEnd: bloc.state.dateEnd,
        onApply: (start, end) {
          bloc.add(MarketingEvent.changeDateRange(
            dateStart: start,
            dateEnd: end,
          ));
        },
      ),
    );
  }
}
