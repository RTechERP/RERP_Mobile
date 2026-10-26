import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/utils/navigation/navigation_utils.dart';
import 'package:rtc_erp/common/widgets/date_range_picker.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/view/bloc/history_import_export_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/view/widgets/history_import_export_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_empty_view.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_error_view.dart';

/// Màn "Lịch sử nhập xuất": danh sách dòng nhập/xuất kho theo khoảng ngày,
/// kho (suy ra từ khu vực đang chọn) và từ khoá tìm kiếm.
class HistoryImportExportScreen extends StatefulWidget {
  /// `areaId` của khu vực đang chọn (ví dụ `warehouse_area:ha_noi`).
  /// Null/không khớp = giữ mặc định "HN".
  final String? areaId;

  const HistoryImportExportScreen({super.key, this.areaId});

  @override
  State<HistoryImportExportScreen> createState() =>
      _HistoryImportExportScreenState();
}

class _HistoryImportExportScreenState
    extends
        BaseState<
          HistoryImportExportScreen,
          HistoryImportExportEvent,
          HistoryImportExportState,
          HistoryImportExportBloc
        >
    with SingleTickerProviderStateMixin {
  /// Điều khiển tab loại phiếu; thứ tự tab theo `HistoryTypeFilter.values`.
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: HistoryTypeFilter.values.length,
      vsync: this,
    );
    bloc.add(
      HistoryImportExportEvent.setWarehouseCode(
        _mapAreaIdToWarehouseCode(widget.areaId),
      ),
    );
    bloc.add(const HistoryImportExportEvent.fetch());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Map `areaId` từ màn chọn khu vực sang `WarehouseCode` của API:
  /// Hà Nội → HN, Hồ Chí Minh → HCM, Bắc Ninh → BN. Không khớp → null.
  static String? _mapAreaIdToWarehouseCode(String? areaId) {
    switch (areaId) {
      case 'warehouse_area:ha_noi':
        return 'HN';
      case 'warehouse_area:ho_chi_minh':
        return 'HCM';
      case 'warehouse_area:bac_ninh':
        return 'BN';
      default:
        return null;
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Lịch sử nhập xuất', style: TextStyle(fontSize: 17)),
        onBackTap: () => onBack(context),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: BlocBuilder<HistoryImportExportBloc, HistoryImportExportState>(
            bloc: bloc,
            buildWhen: (prev, curr) => prev.items != curr.items,
            builder: (context, state) => _TypeTabBar(
              controller: _tabController,
              state: state,
              onSelected: (filter) =>
                  bloc.add(HistoryImportExportEvent.changeTypeFilter(filter)),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            tooltip: 'Chọn ngày',
            onPressed: _pickDateRange,
          ),
          BlocBuilder<HistoryImportExportBloc, HistoryImportExportState>(
            bloc: bloc,
            buildWhen: (prev, curr) => prev.searchKeyword != curr.searchKeyword,
            builder: (context, state) => IconButton(
              icon: Icon(
                Icons.search,
                color: state.searchKeyword.isNotEmpty
                    ? AppColors.primaryERP
                    : null,
              ),
              tooltip: 'Tìm kiếm',
              onPressed: _showSearchDialog,
            ),
          ),
        ],
      ),
      body: _buildContent(),
    );
  }

  /// Nội dung chính: loading / lỗi / rỗng / danh sách theo bộ lọc hiện tại.
  Widget _buildContent() {
    return blocBuilder((context, state) {
      if (state.status == BaseStateStatus.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state.status == BaseStateStatus.failed) {
        return SaleGdnErrorView(
          message: state.message ?? 'Đã xảy ra lỗi',
          onRetry: () => bloc.add(const HistoryImportExportEvent.fetch()),
        );
      }
      final items = state.visibleItems;
      if (items.isEmpty) {
        return SaleGdnEmptyView(
          message:
              state.searchKeyword.isNotEmpty ||
                  state.typeFilter != HistoryTypeFilter.all
              ? 'Không tìm thấy dữ liệu'
              : 'Chưa có lịch sử nhập xuất',
        );
      }
      return RefreshIndicator(
        onRefresh: () async => bloc.add(const HistoryImportExportEvent.fetch()),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: items.length + 1,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _ListHeader(
                total: items.length,
                dateStart: state.dateStart,
                dateEnd: state.dateEnd,
                isSearching: state.searchKeyword.isNotEmpty,
              );
            }
            return HistoryImportExportCard(item: items[index - 1]);
          },
        ),
      );
    });
  }

  /// Mở bottom sheet chọn khoảng ngày; áp dụng xong sẽ tải lại danh sách.
  void _pickDateRange() {
    final state = bloc.state;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart:
            state.dateStart ?? today.subtract(const Duration(days: 30)),
        initialEnd: state.dateEnd ?? today,
        onApply: (start, end) => bloc.add(
          HistoryImportExportEvent.changeDateRange(
            dateStart: start,
            dateEnd: end,
          ),
        ),
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (_) => _SearchDialog(
        initialKeyword: bloc.state.searchKeyword,
        onSearch: (keyword) =>
            bloc.add(HistoryImportExportEvent.search(keyword)),
        onClear: () => bloc.add(const HistoryImportExportEvent.clearSearch()),
      ),
    );
  }
}

/// Dialog nhập từ khoá tìm kiếm. Tự sở hữu và dispose `TextEditingController`
/// theo vòng đời widget để không bị dùng sau khi dispose trong lúc dialog
/// còn đang chạy animation đóng. Tìm với ô trống tương đương "Xóa".
class _SearchDialog extends StatefulWidget {
  const _SearchDialog({
    required this.initialKeyword,
    required this.onSearch,
    required this.onClear,
  });

  final String initialKeyword;
  final ValueChanged<String> onSearch;
  final VoidCallback onClear;

  @override
  State<_SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<_SearchDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialKeyword);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final keyword = _controller.text.trim();
    if (keyword.isEmpty) {
      widget.onClear();
    } else {
      widget.onSearch(keyword);
    }
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Icon(Icons.search, color: AppColors.primaryERP, size: 28),
                SizedBox(width: 12),
                Text(
                  'Tìm kiếm lịch sử',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _controller,
              autofocus: true,
              textInputAction: TextInputAction.search,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Mã phiếu, sản phẩm, dự án...',
                hintStyle: TextStyle(
                  color: AppColors.gray.withValues(alpha: 0.6),
                ),
                prefixIcon: const Icon(
                  Icons.receipt_long_outlined,
                  color: AppColors.gray,
                ),
                filled: true,
                fillColor: AppColors.grey_bg,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primaryERP,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      widget.onClear();
                      context.pop();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryERP,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: AppColors.primaryERP),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Xóa', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryERP,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Tìm',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Tab loại phiếu (Tất cả / Phiếu nhập / Phiếu xuất) đặt dưới AppBar, cùng
/// style với màn Tổng hợp cá nhân. Mỗi tab kèm badge số dòng của loại đó.
class _TypeTabBar extends StatelessWidget {
  const _TypeTabBar({
    required this.controller,
    required this.state,
    required this.onSelected,
  });

  final TabController controller;
  final HistoryImportExportState state;
  final ValueChanged<HistoryTypeFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.gray.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TabBar(
          controller: controller,
          onTap: (index) => onSelected(HistoryTypeFilter.values[index]),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryERP,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryERP.withValues(alpha: 0.35),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.gray,
          labelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          tabs: [
            for (final filter in HistoryTypeFilter.values)
              Tab(
                // Tab chia đều chiều ngang nên màn hẹp có thể không đủ chỗ
                // cho nhãn + badge; scaleDown thu nhỏ thay vì tràn.
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(filter.label),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.blueA400,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${state.countOf(filter)}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Header hiển thị tổng số dòng và khoảng ngày đang lọc.
class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.total,
    required this.dateStart,
    required this.dateEnd,
    required this.isSearching,
  });

  final int total;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd/MM/yyyy');
    final hasRange = dateStart != null && dateEnd != null;
    final isSameDay =
        hasRange &&
        dateStart!.year == dateEnd!.year &&
        dateStart!.month == dateEnd!.month &&
        dateStart!.day == dateEnd!.day;
    final rangeText = !hasRange
        ? null
        : (isSameDay
              ? df.format(dateStart!)
              : '${df.format(dateStart!)} - ${df.format(dateEnd!)}');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryERP,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryERP.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      child: Text(
                        '$total',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.1,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'dòng',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  isSearching ? 'Đang tìm kiếm' : 'Tổng số dòng',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          if (rangeText != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.event_outlined,
                    size: 14,
                    color: AppColors.primaryERP,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    rangeText,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryERP,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
