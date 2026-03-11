import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../common/services/permissions/role_groups.dart';
import '../../../../../../../../common/utils/card/index.dart';
import '../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../routes/route_names.dart';
import '../../../../../../../auth/data/repository/auth_repository.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../bloc/sale_bloc.dart';


class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState
    extends BaseState<SaleScreen, SaleEvent, SaleState, SaleBloc> {

  bool _isSaleAdmin = false;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<SaleReportItem> _filteredReports = [];

  void _filterReports(String keyword, List<SaleReportItem> reports) {
    final lower = keyword.toLowerCase().trim();

    if (lower.isEmpty) {
      _filteredReports = reports;
      return;
    }

    _filteredReports = reports.where((r) {
      final id = r.id.toString().toLowerCase().contains(lower);
      return id ||
          (r.projectName?.toLowerCase().contains(lower) ?? false);

    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _detectSaleRole();
    bloc.add(const SaleEvent.init());
  }

  Future<void> _detectSaleRole() async {
    final user = await AuthRepository.getCurrentUser();

    final permissions = user?.permissions.split(',') ?? [];

    setState(() {
      _isSaleAdmin =
          permissions.any(PermissionGroups.saleAdminReports.contains);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildDateHeader(SaleState state) {
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
    return BlocListener<SaleBloc, SaleState>(
      listener: (context, state) {
        // TODO: implement listener
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
                // _filterReports(value, bloc.state.reports);
              });
            },
          )
              : Text('report.sale'.tr()),
          onBackTap: () => onBack(context),
          actions: [
            IconButton(
              icon: Icon(
                _isSearching ? Icons.close : Icons.search,
                size: 22,
              ),
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
        body: _isSaleAdmin
          ? _buildSaleAdminUI()
            : _buildSaleStaffUI(),

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

                final route = _isSaleAdmin
                    ? RouteNames.reportSaleAdminAdd
                    : RouteNames.reportSaleStaffAdd;

                final reload = await context.push(route);

                if (reload == true) {
                  bloc.add(const SaleEvent.init());
                }
              },
            ),

            /// ===== LỌC THEO NGÀY =====
            SpeedDialChild(
              child: const Icon(Icons.date_range),
              label: 'Lọc ngày',
              onTap: () {
                AdDateRangePicker.open(context, bloc);
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSaleAdminUI() {
    return BlocBuilder<SaleBloc, SaleState>(
      builder: (context, state) {
        return _buildReportList(state);
      },
    );
  }
  Widget _buildSaleStaffUI() {
    return BlocBuilder<SaleBloc, SaleState>(
      builder: (context, state) {
        return _buildReportList(state, canDelete: false);
      },
    );
  }
  Widget _buildReportList(SaleState state, {bool canDelete = true}) {
    final displayList = _isSearching ? _filteredReports : state.reports;

    return ListView.builder(
      itemCount: displayList.length,
      itemBuilder: (context, index) {
        final r = displayList[index];

        Widget card = AppCardReport(
          projectCode: r.customerName ?? '',
          projectName: r.content ?? '',
          time: DateTime.tryParse(r.createdDate.toString()),
          progress: 0,
        );

        if (!canDelete) return card;

        return Slidable(
          key: ValueKey(r.id),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.25,
            children: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: Colors.red,
                icon: Icons.delete,
                label: 'Xoá',
              ),
            ],
          ),
          child: card,
        );
      },
    );
  }
}

class AdDateRangePicker {
  static DateTime _safeAddMonth(DateTime d, int offset) {
    final target = DateTime(d.year, d.month + offset, 1);
    final lastDay = DateTime(target.year, target.month + 1, 0).day;
    final day = d.day.clamp(1, lastDay);
    return DateTime(target.year, target.month, day);
  }

  static void open(BuildContext context, SaleBloc bloc) {
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
                    // initialSelectedRange:
                    // (bloc.state.dateStart != null &&
                    //     bloc.state.dateEnd != null)
                    //     ? PickerDateRange(
                    //   bloc.state.dateStart,
                    //   bloc.state.dateEnd,
                    // )
                    //     : null,
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

                              // bloc.add(
                              //   AdEvent.changeDateRange(
                              //     dateStart: start!,
                              //     dateEnd: end!,
                              //   ),
                              // );
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

