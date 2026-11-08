import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/services/device/pda_helper.dart';
import 'package:rtc_erp/common/utils/dialog/dialog_service.dart';
import 'package:rtc_erp/common/utils/navigation/navigation_utils.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart' show SnackBarType;
import 'package:rtc_erp/common/widgets/date_range_picker.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/bloc/inventory_check_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_menu_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_filter_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_scan_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_scan_status_banner.dart';
import 'package:rtc_erp/routes/route_names.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_empty_view.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_error_view.dart';

/// Màn "Kiểm kê kho": danh sách đợt kiểm kê theo khoảng ngày, kho và nhân viên
/// kiểm kê.
class InventoryCheckScreen extends StatefulWidget {
  const InventoryCheckScreen({super.key});

  @override
  State<InventoryCheckScreen> createState() => _InventoryCheckScreenState();
}

class _InventoryCheckScreenState
    extends
        BaseState<
          InventoryCheckScreen,
          InventoryCheckEvent,
          InventoryCheckState,
          InventoryCheckBloc
        > {
  /// Subscription nhận kết quả quét từ phần cứng PDA.
  StreamSubscription<Map<String, dynamic>>? _scanSub;

  /// Chế độ quét đang bật (null = chưa bật chế độ quét nào).
  InventoryScanMode? _scanMode;

  /// Mã vừa quét gần nhất từ PDA.
  String? _lastScannedCode;

  /// Thông báo kết quả quét (đang chờ BE chốt flow xử lý).
  String? _scanMessage;

  /// Số lần quét trong phiên hiện tại.
  int _scanCount = 0;

  @override
  void initState() {
    super.initState();
    bloc.add(const InventoryCheckEvent.fetch());
    bloc.add(const InventoryCheckEvent.fetchEmployees());
  }

  @override
  void dispose() {
    _scanSub?.cancel();
    super.dispose();
  }

  @override
  bool listenWhen(InventoryCheckState previous, InventoryCheckState current) {
    return previous.deleteSuccess != current.deleteSuccess ||
        previous.deleteError != current.deleteError;
  }

  @override
  void listener(BuildContext context, InventoryCheckState state) {
    if (state.deleteSuccess) {
      context.showMessage(
        'Xoá đợt kiểm kê thành công',
        type: SnackBarType.success,
      );
      bloc.add(const InventoryCheckEvent.fetch());
      return;
    }
    final deleteError = state.deleteError;
    if (deleteError != null && deleteError.isNotEmpty) {
      context.showMessage(deleteError, type: SnackBarType.error);
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        centerTitle: false,
        title: const Text('Kiểm kê kho'),
        onBackTap: () => onBack(context),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            tooltip: 'Quét bằng PDA',
            onPressed: _handleScanAction,
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            tooltip: 'Chọn ngày',
            onPressed: _pickDateRange,
          ),
          BlocBuilder<InventoryCheckBloc, InventoryCheckState>(
            bloc: bloc,
            buildWhen: (prev, curr) =>
                prev.searchKeyword != curr.searchKeyword ||
                prev.employeeId != curr.employeeId ||
                prev.warehouseId != curr.warehouseId,
            builder: (context, state) => IconButton(
              icon: Icon(
                Icons.tune,
                color: _hasFilter(state) ? AppColors.primaryERP : null,
              ),
              tooltip: 'Bộ lọc',
              onPressed: _showFilterSheet,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          /// ===== BANNER TRẠNG THÁI QUÉT PDA =====
          if (_scanMode != null)
            InventoryCheckScanStatusBanner(
              mode: _scanMode!,
              lastCode: _lastScannedCode,
              scanCount: _scanCount,
              message: _scanMessage,
              onClose: _disableScanMode,
            ),

          Expanded(child: _buildContent()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryERP,
        foregroundColor: Colors.white,
        elevation: 6,
        tooltip: 'Tạo đợt kiểm kê',
        onPressed: () async {
          final created = await context.push<bool>(
            RouteNames.warehouseDemoInventoryCheckAdd,
          );
          if (!mounted) return;
          if (created == true) {
            bloc.add(const InventoryCheckEvent.fetch());
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Đang có ít nhất một bộ lọc đang áp dụng hay không.
  bool _hasFilter(InventoryCheckState state) =>
      state.searchKeyword.isNotEmpty ||
      state.employeeId != null ||
      state.warehouseId != null;

  /// Nội dung chính: loading / lỗi / rỗng / danh sách theo bộ lọc hiện tại.
  Widget _buildContent() {
    return blocBuilder((context, state) {
      if (state.status == BaseStateStatus.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state.status == BaseStateStatus.failed) {
        return SaleGdnErrorView(
          message: state.message ?? 'Đã xảy ra lỗi',
          onRetry: () => bloc.add(const InventoryCheckEvent.fetch()),
        );
      }
      final items = state.visibleItems;
      if (items.isEmpty) {
        return SaleGdnEmptyView(
          message: _hasFilter(state)
              ? 'Không tìm thấy đợt kiểm kê'
              : 'Chưa có đợt kiểm kê nào',
        );
      }
      return RefreshIndicator(
        onRefresh: () async => bloc.add(const InventoryCheckEvent.fetch()),
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
                isFiltered: _hasFilter(state),
              );
            }
            final item = items[index - 1];
            final itemId = item.id;
            return InventoryCheckCard(
              item: item,
              onTap: itemId == null ? null : () => _openMenu(item),
            );
          },
        ),
      );
    });
  }

  /// Xử lý khi bấm action quét bằng PDA.
  ///
  /// Kiểm tra thiết bị có phải PDA không:
  /// - Không phải PDA → hiện dialog yêu cầu dùng thiết bị PDA.
  /// - Là PDA → cho chọn chế độ quét (sản phẩm / vị trí) rồi bật chế độ quét.
  Future<void> _handleScanAction() async {
    final isPda = await PdaHelper.isPdaDevice();
    if (!mounted) return;

    if (!isPda) {
      await DialogService.showPdaDeviceRequired(context: context);
      return;
    }

    final mode = await InventoryCheckScanSheet.show(context);
    if (mode == null || !mounted) return;

    _enableScanMode(mode);
  }

  /// Bật chế độ quét với [mode] và bắt đầu lắng nghe phần cứng PDA.
  void _enableScanMode(InventoryScanMode mode) {
    _scanSub?.cancel();
    setState(() {
      _scanMode = mode;
      _lastScannedCode = null;
      _scanMessage = null;
      _scanCount = 0;
    });

    _scanSub = PdaHelper.scanStream.listen((event) {
      if (!mounted) return;

      // Sự kiện bấm nút quét native — mã quét sẽ đến ở event tiếp theo.
      if (event.containsKey('keyEvent')) {
        return;
      }

      final code = event['code']?.toString().trim();
      if (code == null || code.isEmpty) return;

      _handleScannedCode(code, event['barcodeType']?.toString());
    });
  }

  /// Xử lý mã vừa quét từ PDA.
  ///
  /// TODO: chờ BE chốt flow — hiện tại chỉ log + hiển thị mã vừa quét.
  ///
  /// [barcodeType] là mã số loại mã của máy quét (ví dụ 11 = Code128).
  void _handleScannedCode(String code, [String? barcodeType]) {
    if (!mounted) return;

    debugPrint('[PDA] quét ${_scanMode?.name}: $code (type=$barcodeType)');

    setState(() {
      _lastScannedCode = code;
      _scanCount++;
      _scanMessage = barcodeType == null || barcodeType.isEmpty
          ? 'Đã quét mã "$code"'
          : 'Đã quét mã "$code" (loại $barcodeType)';
    });
  }

  /// Tắt chế độ quét PDA.
  void _disableScanMode() {
    _scanSub?.cancel();
    _scanSub = null;
    setState(() {
      _scanMode = null;
      _lastScannedCode = null;
      _scanMessage = null;
    });
  }

  /// Mở menu thao tác khi bấm vào card đợt kiểm kê.
  ///
  /// Menu gồm: chi tiết, chỉnh sửa, xoá.
  Future<void> _openMenu(InventoryCountItem item) async {
    final id = item.id;
    if (id == null) return;

    final actionId = await InventoryCheckMenuSheet.show(
      context,
      countCode: item.code,
    );
    if (!mounted || actionId == null) return;

    switch (actionId) {
      case 'detail':
        await _openSheetScreen(id);
        break;
      case 'edit':
        await _openEditScreen(id);
        break;
      case 'delete':
        await _confirmDelete(item);
        break;
    }
  }

  /// Mở màn chỉnh sửa đợt kiểm kê, quay lại sẽ tải lại danh sách.
  Future<void> _openEditScreen(int id) async {
    final updated = await context.push<bool>(
      RouteNames.warehouseDemoInventoryCheckEdit,
      extra: id,
    );
    if (!mounted) return;
    if (updated == true) {
      bloc.add(const InventoryCheckEvent.fetch());
    }
  }

  /// Mở màn chi tiết phiếu kiểm kê (danh sách sản phẩm đã kiểm kê).
  Future<void> _openSheetScreen(int id) async {
    await context.push<bool>(
      RouteNames.warehouseDemoInventoryCheckSheet,
      extra: id,
    );
  }

  /// Xác nhận xoá đợt kiểm kê — toàn bộ chi tiết kiểm kê liên quan cũng
  /// bị xoá theo.
  Future<void> _confirmDelete(InventoryCountItem item) async {
    final id = item.id;
    if (id == null) return;

    final confirmed = await DialogService.showConfirmDelete(
      context: context,
      title: 'Xác nhận xoá',
      description:
          'Bạn có chắc muốn xoá đợt kiểm kê "${(item.code ?? '').trim()}" không? '
          'Toàn bộ chi tiết kiểm kê liên quan cũng sẽ bị xoá.',
    );
    if (!mounted || !confirmed) return;

    bloc.add(InventoryCheckEvent.delete(id));
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
          InventoryCheckEvent.changeDateRange(dateStart: start, dateEnd: end),
        ),
      ),
    );
  }

  /// Mở bottom sheet bộ lọc (từ khoá, nhân viên kiểm kê, kho, khoảng ngày).
  void _showFilterSheet() {
    final state = bloc.state;

    InventoryCheckFilterSheet.show(
      context,
      employees: state.employees,
      initialKeyword: state.searchKeyword,
      initialEmployeeId: state.employeeId,
      initialWarehouseId: state.warehouseId,
      initialDateStart: state.dateStart,
      initialDateEnd: state.dateEnd,
      onApply:
          ({
            required String keyword,
            required int? employeeId,
            required int? warehouseId,
            required DateTime? dateStart,
            required DateTime? dateEnd,
          }) {
            bloc.add(InventoryCheckEvent.search(keyword));
            bloc.add(InventoryCheckEvent.selectEmployee(employeeId));
            bloc.add(InventoryCheckEvent.changeWarehouseFilter(warehouseId));
            // Khoảng ngày là tham số server → chỉ gọi lại API khi thực sự đổi.
            if (dateStart != null &&
                dateEnd != null &&
                !_isSameRange(dateStart, dateEnd, state)) {
              bloc.add(
                InventoryCheckEvent.changeDateRange(
                  dateStart: dateStart,
                  dateEnd: dateEnd,
                ),
              );
            }
          },
      onPickDateRange: (start, end) => _pickDateRangeFromSheet(start, end),
    );
  }

  /// Khoảng ngày đang chọn có giống khoảng ngày đang lọc hay không.
  bool _isSameRange(
    DateTime dateStart,
    DateTime dateEnd,
    InventoryCheckState state,
  ) {
    final start = state.dateStart;
    final end = state.dateEnd;
    if (start == null || end == null) return false;
    return start.year == dateStart.year &&
        start.month == dateStart.month &&
        start.day == dateStart.day &&
        end.year == dateEnd.year &&
        end.month == dateEnd.month &&
        end.day == dateEnd.day;
  }

  /// Mở màn chọn khoảng ngày từ trong sheet lọc và trả về khoảng đã chọn.
  Future<DateTimeRange?> _pickDateRangeFromSheet(
    DateTime? start,
    DateTime? end,
  ) async {
    final now = DateTime.now();
    DateTimeRange? picked;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: start ?? DateTime(now.year, now.month, 1),
        initialEnd: end ?? now,
        onApply: (from, to) => picked = DateTimeRange(start: from, end: to),
      ),
    );

    return picked;
  }
}

/// Header hiển thị tổng số đợt kiểm kê và khoảng ngày đang lọc.
class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.total,
    required this.dateStart,
    required this.dateEnd,
    required this.isFiltered,
  });

  final int total;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final bool isFiltered;

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
                      'đợt',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  isFiltered ? 'Đang lọc' : 'Tổng số đợt kiểm kê',
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
