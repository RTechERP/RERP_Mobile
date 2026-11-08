import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart' show SnackBarType;
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/bloc/inventory_check_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_filter_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_detail_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_report_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_error_view.dart';

/// Màn chi tiết phiếu kiểm kê: thông tin đợt kiểm kê + danh sách sản phẩm
/// đã kiểm kê.
///
/// Dữ liệu lấy từ API `GET /WarehouseInventoryCount/get-inventory-sheet?countId=X`.
class InventoryCheckSheetScreen extends StatefulWidget {
  const InventoryCheckSheetScreen({super.key, required this.countId});

  /// Id của đợt kiểm kê cần xem chi tiết.
  final int countId;

  @override
  State<InventoryCheckSheetScreen> createState() =>
      _InventoryCheckSheetScreenState();
}

class _InventoryCheckSheetScreenState
    extends
        BaseState<
          InventoryCheckSheetScreen,
          InventoryCheckEvent,
          InventoryCheckState,
          InventoryCheckBloc
        > {
  @override
  void initState() {
    super.initState();
    bloc.add(InventoryCheckEvent.fetchSheet(widget.countId));
  }

  @override
  bool listenWhen(InventoryCheckState previous, InventoryCheckState current) {
    return previous.sheet != current.sheet ||
        previous.message != current.message;
  }

  @override
  void listener(BuildContext context, InventoryCheckState state) {
    if (state.status == BaseStateStatus.failed &&
        (state.message ?? '').isNotEmpty) {
      context.showMessage(state.message!, type: SnackBarType.error);
    }

    // Nhóm sản phẩm phụ thuộc kho của phiếu → tải lại khi biết kho.
    final warehouseId = state.sheet?.master?.warehouseId;
    if (warehouseId == null) return;
    if (warehouseId == state.productGroupsRtcWarehouseId) return;

    bloc.add(
      InventoryCheckEvent.fetchProductGroupsRtc(
        warehouseId: warehouseId,
        warehouseType: warehouseId,
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết đợt kiểm kê'),
        onBackTap: () => context.pop(),
        actions: [
          BlocBuilder<InventoryCheckBloc, InventoryCheckState>(
            bloc: bloc,
            buildWhen: (prev, curr) =>
                prev.sheetKeyword != curr.sheetKeyword ||
                prev.sheetFilter != curr.sheetFilter ||
                prev.sheetProductGroupId != curr.sheetProductGroupId,
            builder: (context, state) => IconButton(
              icon: Icon(
                Icons.tune,
                color: _hasFilter(state) ? AppColors.primaryERP : null,
              ),
              tooltip: 'Bộ lọc',
              onPressed: _showFilterSheet,
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: BlocBuilder<InventoryCheckBloc, InventoryCheckState>(
        bloc: bloc,
        buildWhen: (prev, curr) =>
            prev.sheet != curr.sheet ||
            prev.isLoadingSheet != curr.isLoadingSheet ||
            prev.sheetKeyword != curr.sheetKeyword ||
            prev.sheetFilter != curr.sheetFilter ||
            prev.sheetProductGroupId != curr.sheetProductGroupId,
        builder: (context, state) {
          if (state.isLoadingSheet) {
            return const Center(child: CircularProgressIndicator());
          }

          final sheet = state.sheet;
          if (sheet == null) {
            return SaleGdnErrorView(
              message: 'Không tải được dữ liệu phiếu kiểm kê',
              onRetry: () =>
                  bloc.add(InventoryCheckEvent.fetchSheet(widget.countId)),
            );
          }

          return _buildContent(context, state, sheet);
        },
      ),
    );
  }

  /// Nội dung màn: header thông tin đợt + thanh tìm kiếm + danh sách sản phẩm.
  Widget _buildContent(
    BuildContext context,
    InventoryCheckState state,
    InventoryCountSheet sheet,
  ) {
    final items = state.visibleSheetItems;

    return CustomScrollView(
      slivers: [
        /// ===== HEADER THÔNG TIN ĐỢT KIỂM KÊ =====
        SliverToBoxAdapter(child: _MasterHeader(master: sheet.master)),

        /// ===== BẢNG BÁO CÁO =====
        SliverToBoxAdapter(
          child: InventoryCheckSheetReportCard(report: state.sheetReport),
        ),

        /// ===== THÔNG TIN CHUNG (kho, người kiểm kê, ngày...) =====
        SliverToBoxAdapter(child: _MasterInfoCard(master: sheet.master)),

        /// ===== TIÊU ĐỀ DANH SÁCH SẢN PHẨM =====
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: Row(
              children: [
                const Icon(
                  Icons.inventory_2_outlined,
                  size: 16,
                  color: AppColors.secondaryERP,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Sản phẩm đã kiểm kê',
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '(${items.length})',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          ),
        ),

        /// ===== DANH SÁCH SẢN PHẨM =====
        if (items.isEmpty)
          const SliverToBoxAdapter(child: _EmptyItems())
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            sliver: SliverList.separated(
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return InventoryCountSheetItemCard(
                  item: items[index],
                  index: index + 1,
                  onTap: () => _showItemDetail(items[index]),
                );
              },
            ),
          ),
      ],
    );
  }

  /// Mở bottom sheet chi tiết một dòng sản phẩm kiểm kê.
  void _showItemDetail(InventoryCountSheetItem item) {
    InventoryCheckSheetItemDetailSheet.show(context, item);
  }

  /// Đang có bộ lọc đang áp dụng hay không.
  bool _hasFilter(InventoryCheckState state) =>
      state.sheetKeyword.isNotEmpty ||
      state.sheetProductGroupId != null ||
      (state.sheetFilter != null &&
          state.sheetFilter != InventoryCheckSheetFilter.all);

  /// Mở bottom sheet bộ lọc sản phẩm (gồm tìm kiếm, trạng thái, nhóm SP).
  void _showFilterSheet() {
    final state = bloc.state;
    InventoryCheckSheetFilterSheet.show(
      context,
      initialKeyword: state.sheetKeyword,
      initialFilter: state.sheetFilter ?? InventoryCheckSheetFilter.all,
      productGroups: state.productGroupsRtc,
      initialProductGroupId: state.sheetProductGroupId,
      onApply: ({
        required String keyword,
        required InventoryCheckSheetFilter? filter,
        required int? productGroupId,
      }) {
        bloc.add(InventoryCheckEvent.searchSheet(keyword));
        bloc.add(InventoryCheckEvent.filterSheet(filter));
        bloc.add(InventoryCheckEvent.filterSheetProductGroup(productGroupId));
      },
    );
  }
}

/// Header gradient: mã đợt, tên đợt và trạng thái.
///
/// Số liệu tổng hợp nằm ở bảng báo cáo bên dưới nên không lặp lại ở đây.
class _MasterHeader extends StatelessWidget {
  const _MasterHeader({required this.master});

  final InventoryCountSheetMaster? master;

  @override
  Widget build(BuildContext context) {
    final m = master;
    if (m == null) return const SizedBox.shrink();

    final isComplete = m.isComplete ?? false;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.secondaryERP, AppColors.heading],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryERP.withValues(alpha: 0.22),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.assignment_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _orDash(m.code),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  _orDash(m.name),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _StatusBadge(isComplete: isComplete),
        ],
      ),
    );
  }
}

/// Card thông tin chung của đợt kiểm kê: kho, người kiểm kê, ngày kiểm kê,
/// ngày tạo và ghi chú.
///
/// Bố cục dạng lưới 2 cột (nhãn nhỏ ở trên, giá trị ở dưới) để giá trị dài
/// vẫn hiển thị đầy đủ, không bị cắt.
class _MasterInfoCard extends StatelessWidget {
  const _MasterInfoCard({required this.master});

  final InventoryCountSheetMaster? master;

  @override
  Widget build(BuildContext context) {
    final m = master;
    if (m == null) return const SizedBox.shrink();

    final note = (m.note ?? '').trim();

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== TIÊU ĐỀ KHỐI =====
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 15,
                  color: AppColors.secondaryERP,
                ),
                SizedBox(width: 8),
                Text(
                  'Thông tin đợt kiểm kê',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
          ),

          /// ===== LƯỚI THÔNG TIN =====
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              children: [
                _gridRow(
                  _gridCell('Kho', _orDash(m.warehouseName)),
                  _gridCell('Người kiểm kê', _employeeLabel(m)),
                ),
                _gridRow(
                  _gridCell('Ngày kiểm kê', _formatDateTime(m.dateCount)),
                ),
                if (note.isNotEmpty) _gridRow(_gridCell('Ghi chú', note)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Hàng lưới thông tin — tối đa 2 ô trên một hàng.
  ///
  /// Khi chỉ có 1 ô thì ô đó chiếm toàn bộ chiều rộng, tránh giá trị dài bị
  /// wrap vô ích.
  Widget _gridRow(Widget first, [Widget? second]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: first),
          if (second != null) ...[
            const SizedBox(width: 14),
            Expanded(child: second),
          ],
        ],
      ),
    );
  }

  /// Một ô trong lưới thông tin: nhãn nhỏ ở trên, giá trị ở dưới.
  Widget _gridCell(String label, String value) {
    final isEmpty = value == '--';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w500,
            color: AppColors.gray,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: isEmpty ? FontWeight.w400 : FontWeight.w700,
            color: isEmpty ? AppColors.disableText : AppColors.enableText,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}

/// Nhãn người kiểm kê kèm mã (nếu có).
String _employeeLabel(InventoryCountSheetMaster m) {
  final name = _orDash(m.employeeName);
  final code = (m.employeeCode ?? '').trim();
  return code.isEmpty ? name : '$name ($code)';
}

/// Text hiển thị, `--` nếu rỗng.
String _orDash(String? value) {
  final trimmed = (value ?? '').trim();
  return trimmed.isEmpty ? '--' : trimmed;
}

/// Format ngày ISO sang `dd/MM/yyyy HH:mm`.
String _formatDateTime(String? raw) {
  final date = DateTime.tryParse(raw ?? '');
  if (date == null) return '--';
  return DateFormat('dd/MM/yyyy HH:mm').format(date);
}

/// Badge trạng thái đợt kiểm kê trên nền gradient.
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.isComplete});

  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isComplete ? Icons.check_circle : Icons.pending_outlined,
            size: 13,
            color: Colors.white,
          ),
          const SizedBox(width: 5),
          Text(
            isComplete ? 'Hoàn thành' : 'Đang kiểm kê',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

/// Trạng thái rỗng khi phiếu không có sản phẩm nào.
class _EmptyItems extends StatelessWidget {
  const _EmptyItems();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 40),
      child: Column(
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 46,
            color: AppColors.gray.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 12),
          const Text(
            'Chưa có sản phẩm nào trong phiếu kiểm kê',
            style: TextStyle(color: AppColors.gray, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
