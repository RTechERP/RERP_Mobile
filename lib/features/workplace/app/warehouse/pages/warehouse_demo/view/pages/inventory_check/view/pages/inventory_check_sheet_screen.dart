import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/base/widgets/qr_barcode_scanner_page.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/services/device/pda_helper.dart';
import 'package:rtc_erp/common/utils/dialog/dialog_service.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart' show SnackBarType;
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/bloc/inventory_check_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_scan_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_scan_status_banner.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_filter_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_detail_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_edit_sheet.dart';
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
  /// Subscription nhận kết quả quét từ phần cứng PDA.
  StreamSubscription<Map<String, dynamic>>? _scanSub;

  @override
  void initState() {
    super.initState();
    bloc.add(InventoryCheckEvent.fetchSheet(widget.countId));
  }

  @override
  void dispose() {
    _scanSub?.cancel();
    super.dispose();
  }

  @override
  bool listenWhen(InventoryCheckState previous, InventoryCheckState current) {
    return previous.sheet != current.sheet ||
        previous.message != current.message ||
        previous.saveCountDetailsSuccess != current.saveCountDetailsSuccess ||
        previous.confirmCompleteSuccess != current.confirmCompleteSuccess ||
        previous.confirmCompleteError != current.confirmCompleteError;
  }

  @override
  void listener(BuildContext context, InventoryCheckState state) {
    if (state.status == BaseStateStatus.failed &&
        (state.message ?? '').isNotEmpty) {
      context.showMessage(state.message!, type: SnackBarType.error);
      return;
    }

    // Lưu kết quả kiểm kê thành công → báo cho người dùng (phiếu đã được
    // tải lại trong bloc).
    if (state.saveCountDetailsSuccess) {
      context.showMessage(
        'Cập nhật kết quả kiểm kê thành công',
        type: SnackBarType.success,
      );
      return;
    }

    // Xác nhận hoàn thành / mở lại đợt kiểm kê thành công → tải lại phiếu để
    // cập nhật trạng thái hiển thị.
    if (state.confirmCompleteSuccess) {
      context.showMessage(
        state.confirmCompleteMessage ?? '',
        type: SnackBarType.success,
      );
      bloc.add(InventoryCheckEvent.fetchSheet(widget.countId));
      return;
    }

    final confirmCompleteError = state.confirmCompleteError;
    if (confirmCompleteError != null && confirmCompleteError.isNotEmpty) {
      context.showMessage(confirmCompleteError, type: SnackBarType.error);
      return;
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
        centerTitle: false,
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
            prev.sheetProductGroupId != curr.sheetProductGroupId ||
            prev.sheetScanMode != curr.sheetScanMode ||
            prev.sheetScanCode != curr.sheetScanCode ||
            prev.sheetScanCount != curr.sheetScanCount ||
            prev.sheetScanMessage != curr.sheetScanMessage,
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

          return Column(
            children: [
              /// ===== PANEL TRẠNG THÁI QUÉT =====
              if (state.sheetScanMode != null)
                InventoryCheckScanStatusBanner(
                  mode: state.sheetScanMode!,
                  lastCode: state.sheetScanCode,
                  scanCount: state.sheetScanCount,
                  matchedCount: state.visibleSheetItems.length,
                  message: state.sheetScanMessage,
                  onClose: _stopScanMode,
                ),
              Expanded(child: _buildContent(context, state, sheet)),
            ],
          );
        },
      ),
      floatingActionButton: BlocBuilder<InventoryCheckBloc, InventoryCheckState>(
        bloc: bloc,
        buildWhen: (prev, curr) => prev.sheetScanMode != curr.sheetScanMode,
        builder: (context, state) => FloatingActionButton(
          backgroundColor: state.sheetScanMode == null
              ? AppColors.primaryERP
              : AppColors.backgroundLight,
          foregroundColor: state.sheetScanMode == null
              ? Colors.white
              : AppColors.primaryERP,
          elevation: 4,
          tooltip: state.sheetScanMode == null
              ? 'Quét mã'
              : 'Đổi chế độ quét',
          onPressed: _handleScanAction,
          child: const Icon(Icons.qr_code_scanner),
        ),
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

        /// ===== NÚT XÁC NHẬN HOÀN THÀNH / MỞ LẠI =====
        SliverToBoxAdapter(
          child: _CompleteActionButton(
            isComplete: sheet.master?.isComplete ?? false,
            onPressed: () =>
                _handleCompleteAction(sheet.master?.isComplete ?? false),
          ),
        ),

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
                const Spacer(),
                if (state.sheetScanCode != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.primaryERP.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.filter_alt,
                          size: 11,
                          color: AppColors.primaryERP,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Lọc theo mã quét',
                          style: const TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryERP,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),

        /// ===== DANH SÁCH SẢN PHẨM =====
        if (items.isEmpty)
          SliverToBoxAdapter(child: _EmptyItems(scanCode: state.sheetScanCode))
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
                  onTap: () => _handleItemTap(items[index]),
                );
              },
            ),
          ),
      ],
    );
  }

  /// Xử lý nút hoàn thành / mở lại đợt kiểm kê ở AppBar.
  ///
  /// [isComplete] = `true` → đang hoàn thành → hiện dialog mở lại.
  /// `false` → đang kiểm kê → hiện dialog xác nhận hoàn thành.
  Future<void> _handleCompleteAction(bool isComplete) async {
    final master = bloc.state.sheet?.master;
    if (master == null) return;

    final confirmed = await DialogService.showConfirmInventoryCountComplete(
      context: context,
      countCode: master.code ?? '',
      isComplete: !isComplete,
    );
    if (!mounted || !confirmed) return;

    bloc.add(
      InventoryCheckEvent.confirmComplete(
        id: widget.countId,
        isComplete: !isComplete,
      ),
    );
  }

  /// Xử lý khi bấm vào card một dòng sản phẩm.
  ///
  /// - Đợt kiểm kê đã hoàn thành → mở sheet chi tiết thông tin.
  /// - Đợt kiểm kê đang thực hiện → mở sheet nhập số lượng thực tế + ghi chú
  ///   để cập nhật kết quả kiểm kê.
  void _handleItemTap(InventoryCountSheetItem item) {
    final isComplete = bloc.state.sheet?.master?.isComplete ?? false;
    if (isComplete) {
      InventoryCheckSheetItemDetailSheet.show(context, item);
      return;
    }
    _openEditItemSheet(item);
  }

  /// Mở bottom sheet nhập số lượng thực tế + ghi chú rồi lưu kết quả kiểm kê.
  Future<void> _openEditItemSheet(InventoryCountSheetItem item) async {
    final result = await InventoryCheckSheetItemEditSheet.show(context, item);
    if (!mounted || result == null) return;

    final productRtcId = item.productRtcId;
    if (productRtcId == null) return;

    bloc.add(
      InventoryCheckEvent.saveCountDetails(
        countId: widget.countId,
        changedItems: [
          {
            'ID': item.id ?? 0,
            'ProductRTCID': productRtcId,
            'QuantityActual': result.quantityActual,
            'Note': result.note,
          },
        ],
      ),
    );
  }

  /// Đang có bộ lọc đang áp dụng hay không.
  bool _hasFilter(InventoryCheckState state) =>
      state.sheetKeyword.isNotEmpty ||
      state.sheetProductGroupId != null ||
      (state.sheetFilter != null &&
          state.sheetFilter != InventoryCheckSheetFilter.all);

  /// Xử lý khi bấm action quét trong phiếu.
  ///
  /// Chọn chế độ quét (sản phẩm / vị trí) rồi:
  /// - Là PDA → bật chế độ quét liên tục bằng phần cứng.
  /// - Không phải PDA → dùng camera quét từng mã một.
  Future<void> _handleScanAction() async {
    // Đang quét mode cũ → tắt trước khi chọn mode mới.
    if (bloc.state.sheetScanMode != null) {
      _stopScanMode();
    }

    final mode = await InventoryCheckScanSheet.show(context);
    if (mode == null || !mounted) return;

    final isPda = await PdaHelper.isPdaDevice();
    if (!mounted) return;

    if (isPda) {
      _startScanMode(mode);
      return;
    }

    bloc.add(InventoryCheckEvent.startSheetScan(mode));
    await _scanWithCamera(mode);
  }

  /// Quét bằng camera, mỗi lần quét được thì lọc theo mã và quét tiếp.
  Future<void> _scanWithCamera(InventoryScanMode mode) async {
    while (mounted && bloc.state.sheetScanMode == mode) {
      final code = await QrBarcodeScannerPage.open(
        context,
        scanMode: ScanMode.all,
        title: mode == InventoryScanMode.product
            ? 'Quét mã sản phẩm'
            : 'Quét mã vị trí',
      );
      if (!mounted) return;
      if (code == null || code.trim().isEmpty) break;

      bloc.add(InventoryCheckEvent.sheetScanned(code.trim()));
    }
  }

  /// Bật chế độ quét [mode] và bắt đầu lắng nghe phần cứng PDA.
  ///
  /// - [InventoryScanMode.product] → lọc ra đúng sản phẩm vừa quét.
  /// - [InventoryScanMode.location] → lọc ra tất cả sản phẩm cùng mã vị trí.
  void _startScanMode(InventoryScanMode mode) {
    _scanSub?.cancel();
    bloc.add(InventoryCheckEvent.startSheetScan(mode));

    _scanSub = PdaHelper.scanStream.listen((event) {
      if (!mounted) return;

      // Sự kiện bấm nút quét native — mã quét sẽ đến ở event tiếp theo.
      if (event.containsKey('keyEvent')) {
        return;
      }

      final code = event['code']?.toString().trim();
      if (code == null || code.isEmpty) return;

      bloc.add(InventoryCheckEvent.sheetScanned(code));
    });
  }

  /// Tắt chế độ quét PDA và bỏ lọc theo mã quét.
  void _stopScanMode() {
    _scanSub?.cancel();
    _scanSub = null;
    bloc.add(InventoryCheckEvent.stopSheetScan());
  }

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

/// Nút xác nhận hoàn thành / mở lại đợt kiểm kê trong header chi tiết.
///
/// Đặt ngay dưới header gradient để người dùng thấy rõ thao tác đang có
/// thể thực hiện với phiếu đang xem.
class _CompleteActionButton extends StatelessWidget {
  const _CompleteActionButton({
    required this.isComplete,
    required this.onPressed,
  });

  /// Đợt kiểm kê đã hoàn thành hay chưa.
  final bool isComplete;

  /// Callback khi bấm nút.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final color = isComplete
        ? AppColors.stateWarningColor
        : AppColors.stateSuccessColor;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          isComplete ? Icons.restart_alt : Icons.task_alt,
          size: 18,
          color: Colors.white,
        ),
        label: Text(
          isComplete ? 'Mở lại đợt kiểm kê' : 'Xác nhận hoàn thành',
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
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
///
/// [scanCode] khác null = đang lọc theo mã vừa quét nhưng không khớp sản
/// phẩm nào → hiển thị thông báo phù hợp.
class _EmptyItems extends StatelessWidget {
  const _EmptyItems({this.scanCode});

  /// Mã vừa quét đang dùng để lọc (null = không lọc theo quét).
  final String? scanCode;

  @override
  Widget build(BuildContext context) {
    final isScanning = (scanCode ?? '').isNotEmpty;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 40),
      child: Column(
        children: [
          Icon(
            isScanning
                ? Icons.search_off_outlined
                : Icons.inventory_2_outlined,
            size: 46,
            color: AppColors.gray.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 12),
          Text(
            isScanning
                ? 'Không có sản phẩm nào khớp mã "$scanCode"'
                : 'Chưa có sản phẩm nào trong phiếu kiểm kê',
            style: const TextStyle(color: AppColors.gray, fontSize: 13),
            textAlign: TextAlign.center,
          ),
          if (isScanning) ...[
            const SizedBox(height: 4),
            const Text(
              'Quét mã khác hoặc tắt chế độ quét để xem toàn bộ sản phẩm',
              style: TextStyle(color: AppColors.gray, fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
