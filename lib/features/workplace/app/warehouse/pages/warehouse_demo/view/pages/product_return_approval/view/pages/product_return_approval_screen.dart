import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/utils/dialog/dialog_service.dart';
import 'package:rtc_erp/common/utils/navigation/navigation_utils.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart';
import 'package:rtc_erp/common/widgets/date_range_picker.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/rental_vehicle/view/widgets/list_header.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/datasource/models/product_return_approval_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/view/bloc/product_return_approval_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/view/widgets/product_return_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/view/widgets/product_return_detail_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/view/widgets/product_return_filter_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/view/widgets/product_return_selection_bar.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_empty_view.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_error_view.dart';

/// Màn "Duyệt trả sản phẩm": danh sách phiếu trả sản phẩm theo khoảng ngày,
/// kho và nhân viên duyệt.
class ProductReturnApprovalScreen extends StatefulWidget {
  const ProductReturnApprovalScreen({super.key});

  @override
  State<ProductReturnApprovalScreen> createState() =>
      _ProductReturnApprovalScreenState();
}

class _ProductReturnApprovalScreenState
    extends
        BaseState<
          ProductReturnApprovalScreen,
          ProductReturnApprovalEvent,
          ProductReturnApprovalState,
          ProductReturnApprovalBloc
        > {
  @override
  void initState() {
    super.initState();
    bloc.add(const ProductReturnApprovalEvent.fetch());
    bloc.add(const ProductReturnApprovalEvent.fetchEmployees());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        centerTitle: false,
        title: const Text('Duyệt trả sản phẩm'),
        onBackTap: () => onBack(context),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            tooltip: 'Chọn ngày',
            onPressed: _pickDateRange,
          ),
          BlocBuilder<ProductReturnApprovalBloc, ProductReturnApprovalState>(
            bloc: bloc,
            buildWhen: (prev, curr) =>
                prev.visibleItems.length != curr.visibleItems.length ||
                prev.isSelectionMode != curr.isSelectionMode,
            builder: (context, state) => IconButton(
              icon: Icon(
                state.isSelectionMode ? Icons.deselect : Icons.checklist_rtl,
                color: state.isSelectionMode ? AppColors.primaryERP : null,
              ),
              tooltip: state.isSelectionMode
                  ? 'Bỏ chọn tất cả'
                  : 'Chọn tất cả phiếu',
              onPressed: state.visibleItems.isEmpty
                  ? null
                  : () => bloc.add(
                      state.isSelectionMode
                          ? const ProductReturnApprovalEvent.clearSelection()
                          : const ProductReturnApprovalEvent.selectAll(),
                    ),
            ),
          ),
          BlocBuilder<ProductReturnApprovalBloc, ProductReturnApprovalState>(
            bloc: bloc,
            buildWhen: (prev, curr) =>
                prev.searchKeyword != curr.searchKeyword ||
                prev.employeeId != curr.employeeId ||
                prev.warehouseId != curr.warehouseId,
            builder: (context, state) => IconButton(
              icon: Icon(
                Icons.tune,
                color: state.hasFilter ? AppColors.primaryERP : null,
              ),
              tooltip: 'Bộ lọc',
              onPressed: _showFilterSheet,
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
          onRetry: () => bloc.add(const ProductReturnApprovalEvent.fetch()),
        );
      }
      final items = state.visibleItems;
      if (items.isEmpty) {
        return SaleGdnEmptyView(
          message: state.hasFilter
              ? 'Không tìm thấy phiếu trả sản phẩm'
              : 'Chưa có phiếu trả sản phẩm nào',
        );
      }
      return Column(
        children: [
          ListHeader(
            total: items.length,
            dateStart: state.dateStart,
            dateEnd: state.dateEnd,
            isSearching: state.searchKeyword.trim().isNotEmpty,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async =>
                  bloc.add(const ProductReturnApprovalEvent.fetch()),
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
                itemCount: items.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = items[index];
                  final id = item.id ?? 0;
                  return ProductReturnCard(
                    item: item,
                    selected: state.selectedIds.contains(id),
                    selectionEnabled: true,
                    onToggleSelection: () => bloc.add(
                      ProductReturnApprovalEvent.toggleSelection(id),
                    ),
                    onTap: () => _openDetail(item),
                  );
                },
              ),
            ),
          ),
          if (state.isSelectionMode)
            ProductReturnSelectionBar(
              selectedCount: state.selectedIds.length,
              totalCount: items.length,
              isAllSelected: state.isAllSelected,
              approveTotal: state.approveTotal,
              approvedCount: state.approvedCount,
              onSelectAll: () =>
                  bloc.add(const ProductReturnApprovalEvent.selectAll()),
              onClearSelection: () =>
                  bloc.add(const ProductReturnApprovalEvent.clearSelection()),
              onApprove: _approveSelected,
              isApproving: state.isApproving,
            ),
        ],
      );
    });
  }

  /// Mở bottom sheet chi tiết. Nếu user bấm "Duyệt phiếu này" → chạy duyệt.
  Future<void> _openDetail(ProductReturnHistoryItem item) async {
    final shouldApprove = await ProductReturnDetailSheet.show(context, item);
    if (!shouldApprove || !mounted) return;
    await _approveSingle(item);
  }

  /// Duyệt các phiếu đang chọn (có xác nhận trước).
  Future<void> _approveSelected() async {
    final count = bloc.state.selectedIds.length;
    final confirmed = await DialogService.showConfirmDialog(
      context: context,
      title: 'Duyệt trả sản phẩm',
      message: 'Bạn có muốn duyệt $count phiếu trả sản phẩm này không?',
    );
    if (!confirmed || !mounted) return;

    final round = bloc.state.approveRound;
    bloc.add(const ProductReturnApprovalEvent.approveSelected());
    // Chờ vòng duyệt kết thúc (số lần duyệt tăng lên).
    await bloc.stream.firstWhere((s) => s.approveRound > round);
    if (!mounted) return;

    _showApproveResult();
  }

  /// Duyệt 1 phiếu (từ bottom sheet chi tiết).
  Future<void> _approveSingle(ProductReturnHistoryItem item) async {
    final id = item.id ?? 0;
    if (id == 0) return;

    final confirmed = await DialogService.showConfirmDialog(
      context: context,
      title: 'Duyệt trả sản phẩm',
      message: 'Bạn có muốn duyệt phiếu trả sản phẩm này không?',
    );
    if (!confirmed || !mounted) return;

    final round = bloc.state.approveRound;
    bloc.add(ProductReturnApprovalEvent.approveSingle(id));
    await bloc.stream.firstWhere((s) => s.approveRound > round);
    if (!mounted) return;

    _showApproveResult();
  }

  /// Hiện thông báo kết quả duyệt.
  void _showApproveResult() {
    final state = bloc.state;
    if (state.failedCount > 0) {
      showMessage(
        context,
        'Duyệt ${state.approvedCount} phiếu thành công, '
        '${state.failedCount} phiếu thất bại',
        type: SnackBarType.error,
      );
    } else {
      showMessage(context, 'Đã duyệt ${state.approvedCount} phiếu thành công');
    }
  }

  /// Mở bottom sheet chọn khoảng ngày; áp dụng xong sẽ tải lại danh sách.
  void _pickDateRange() {
    final state = bloc.state;
    final now = DateTime.now();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? DateTime(now.year, now.month, 1),
        initialEnd: state.dateEnd ?? now,
        onApply: (start, end) => bloc.add(
          ProductReturnApprovalEvent.changeDateRange(
            dateStart: start,
            dateEnd: end,
          ),
        ),
      ),
    );
  }

  /// Mở bottom sheet bộ lọc (từ khoá, nhân viên duyệt, kho).
  void _showFilterSheet() {
    final state = bloc.state;

    ProductReturnFilterSheet.show(
      context,
      employees: state.employees,
      initialKeyword: state.searchKeyword,
      initialEmployeeId: state.employeeId,
      initialWarehouseId: state.warehouseId,
      onApply:
          ({
            required String keyword,
            required int? employeeId,
            required int? warehouseId,
          }) {
            bloc.add(ProductReturnApprovalEvent.search(keyword));
            bloc.add(ProductReturnApprovalEvent.selectEmployee(employeeId));
            bloc.add(
              ProductReturnApprovalEvent.changeWarehouseFilter(warehouseId),
            );
            bloc.add(const ProductReturnApprovalEvent.fetch());
          },
    );
  }
}
