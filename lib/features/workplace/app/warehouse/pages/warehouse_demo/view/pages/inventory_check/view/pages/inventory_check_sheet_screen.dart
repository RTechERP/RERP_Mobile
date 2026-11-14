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
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_location_list.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_location_progress_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_scan_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_scan_status_banner.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_filter_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_detail_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_edit_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_report_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_error_view.dart';

/// Tab hiển thị trong màn chi tiết đợt kiểm kê.
enum _SheetTab {
  /// Danh sách vị trí kiểm kê (vị trí kho / tủ Modula / ô Modula).
  locations,

  /// Danh sách sản phẩm của vị trí đang chọn.
  products,
}

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

  /// Đang xem tab nào: vị trí hay sản phẩm.
  ///
  /// Mặc định hiển thị danh sách vị trí; chỉ khi người dùng chọn 1 vị trí
  /// mới chuyển sang tab sản phẩm của vị trí đó.
  _SheetTab _tab = _SheetTab.locations;

  /// Nhóm vị trí đang xem trong tab vị trí.
  InventoryLocationGroup _locationGroup = InventoryLocationGroup.productLocation;
  /// Người dùng đã chọn vị trí (hoặc "Tất cả") để xem sản phẩm hay chưa.
  bool _hasPickedLocation = false;

  /// Đang ở chế độ tìm kiếm: tiêu đề AppBar đổi thành ô nhập.
  bool _isSearching = false;

  /// Controller của ô nhập tìm kiếm trên AppBar.
  final TextEditingController _searchController = TextEditingController();

  /// Focus node của ô nhập tìm kiếm để tự mở bàn phím.
  final FocusNode _searchFocusNode = FocusNode();

  /// Từ khoá tìm kiếm vị trí (lọc cục bộ danh sách vị trí).
  String _locationKeyword = '';

  /// Tên vị trí đang lọc sản phẩm (null = không lọc theo vị trí).
  ///
  /// Lưu cục bộ vì một số lựa chọn không suy ra được tên từ API
  /// (vd. "Tất cả vị trí kho" là bộ lọc rỗng).
  String? _locationFilterLabel;

  @override
  void initState() {
    super.initState();
    bloc.add(InventoryCheckEvent.fetchSheet(widget.countId));
    bloc.add(InventoryCheckEvent.fetchLocationProgress(countId: widget.countId));
  }

  @override
  void dispose() {
    _scanSub?.cancel();
    _searchController.dispose();
    _searchFocusNode.dispose();
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
        title: _isSearching
            ? _buildSearchField()
            : const Text('Chi tiết đợt kiểm kê'),
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
              onPressed: _tab == _SheetTab.products ? _showFilterSheet : null,
            ),
          ),
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: _isSearching ? AppColors.primaryERP : null,
            ),
            tooltip: 'Tìm kiếm',
            onPressed: _toggleSearch,
          ),
          const SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: _buildTabBar(),
        ),
      ),
      body: BlocBuilder<InventoryCheckBloc, InventoryCheckState>(
        bloc: bloc,
        buildWhen: (prev, curr) =>
            prev.sheet != curr.sheet ||
            prev.isLoadingSheet != curr.isLoadingSheet ||
            prev.locationProgress != curr.locationProgress ||
            prev.isLoadingLocationProgress != curr.isLoadingLocationProgress ||
            prev.isLoadingLocationCounts != curr.isLoadingLocationCounts ||
            prev.locationCounts != curr.locationCounts ||
            prev.sheetKeyword != curr.sheetKeyword ||
            prev.sheetFilter != curr.sheetFilter ||
            prev.sheetProductGroupId != curr.sheetProductGroupId ||
            prev.productLocationId != curr.productLocationId ||
            prev.modulaLocationId != curr.modulaLocationId ||
            prev.modulaLocationDetailId != curr.modulaLocationDetailId ||
            prev.sheetScanMode != curr.sheetScanMode ||
            prev.sheetScanCode != curr.sheetScanCode ||
            prev.sheetScanCount != curr.sheetScanCount ||
            prev.sheetScanMessage != curr.sheetScanMessage,
        builder: (context, state) {
          if (_tab == _SheetTab.locations) {
            return _buildLocationsTab(context, state);
          }

          // Chưa chọn vị trí nào → nhắc người dùng chọn vị trí trước.
          if (!_hasPickedLocation) {
            return _buildNoLocationSelected(context);
          }

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
        builder: (context, state) {
          if (_tab != _SheetTab.products) return const SizedBox.shrink();
          return FloatingActionButton(
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
          );
        },
      ),
    );
  }

  /// Bật/tắt chế độ tìm kiếm (tiêu đề AppBar ↔ ô nhập).
  void _toggleSearch() {
    if (_isSearching) {
      setState(() => _isSearching = false);
      _searchController.clear();
      // Xoá từ khoá theo tab đang mở để không ảnh hưởng tab còn lại.
      if (_tab == _SheetTab.locations) {
        _applyLocationKeyword('');
      } else {
        bloc.add(const InventoryCheckEvent.searchSheet(''));
      }
      return;
    }

    setState(() => _isSearching = true);
    // Mở bàn phím ngay sau khi ô nhập được dựng.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _searchFocusNode.requestFocus();
    });
  }

  /// Ô nhập tìm kiếm thay cho tiêu đề AppBar.
  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      focusNode: _searchFocusNode,
      autofocus: true,
      textInputAction: TextInputAction.search,
      onChanged: _onSearchChanged,
      onSubmitted: (_) => _searchController.clear(),
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        isDense: true,
        hintText: _tab == _SheetTab.locations
            ? 'Tìm vị trí theo tên / mã'
            : 'Tìm sản phẩm theo mã / tên',
        hintStyle: const TextStyle(fontSize: 14, color: AppColors.gray),
        prefixIcon: const Icon(Icons.search, size: 18, color: AppColors.gray),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 34,
          minHeight: 34,
        ),
        filled: true,
        fillColor: AppColors.backgroundLight,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.secondaryERP,
            width: 1.4,
          ),
        ),
      ),
    );
  }

  /// Xử lý nhập từ khoá → lọc theo tab đang mở.
  ///
  /// - Tab vị trí → lọc cục bộ danh sách vị trí.
  /// - Tab sản phẩm → lọc danh sách sản phẩm trong phiếu.
  void _onSearchChanged(String value) {
    if (_tab == _SheetTab.locations) {
      _applyLocationKeyword(value);
      return;
    }
    bloc.add(InventoryCheckEvent.searchSheet(value));
  }

  /// Áp dụng từ khoá lọc danh sách vị trí.
  void _applyLocationKeyword(String value) {
    final keyword = value.trim();
    if (keyword == _locationKeyword) return;
    setState(() => _locationKeyword = keyword);
  }

  /// Thanh chuyển tab: Vị trí / Sản phẩm.
  Widget _buildTabBar() {
    return Container(
      height: 52,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _SheetTabButton(
              label: 'Vị trí',
              icon: Icons.place_outlined,
              isActive: _tab == _SheetTab.locations,
              onTap: () => _switchTab(_SheetTab.locations),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _SheetTabButton(
              label: 'Sản phẩm',
              icon: Icons.inventory_2_outlined,
              isActive: _tab == _SheetTab.products,
              onTap: () => _switchTab(_SheetTab.products),
            ),
          ),
        ],
      ),
    );
  }

  /// Nội dung khi vào tab sản phẩm mà chưa chọn vị trí nào.
  Widget _buildNoLocationSelected(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.place_outlined,
              size: 46,
              color: AppColors.gray.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 14),
            const Text(
              'Chưa chọn vị trí kiểm kê',
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                color: AppColors.enableText,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Vui lòng chọn vị trí ở tab "Vị trí" để xem danh sách sản phẩm',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.5, color: AppColors.gray),
            ),
            const SizedBox(height: 18),
            ElevatedButton.icon(
              onPressed: () => _switchTab(_SheetTab.locations),
              icon: const Icon(Icons.arrow_back, size: 16),
              label: const Text('Chọn vị trí'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Nội dung tab vị trí: card tiến độ + danh sách vị trí theo nhóm.
  Widget _buildLocationsTab(BuildContext context, InventoryCheckState state) {
    if (state.isLoadingLocationProgress && state.locationProgress == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final progress = state.locationProgress;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// ===== CARD TIẾN ĐỘ THEO VỊ TRÍ =====
        InventoryCheckLocationProgressCard(
          progress: progress,
          counts: state.locationCounts,
          isLoadingCounts: state.isLoadingLocationCounts,
          activeGroup: _locationGroup,
          onSelectGroup: _handleLocationGroupSelected,
        ),

        /// ===== DANH SÁCH VỊ TRÍ =====
        Expanded(
          child: InventoryCheckLocationList(
            group: _locationGroup,
            keyword: _locationKeyword,
            productLocations: state.visibleProductLocations,
            modulaLocationGroups: state.visibleModulaLocationGroups,
            modulaLocations: state.visibleModulaLocations,
            selectedProductLocationId: state.productLocationId,
            selectedModulaLocationDetailId: state.modulaLocationDetailId,
            onSelectProductLocation: _handleProductLocationSelected,
            onSelectModulaDetail: _handleModulaDetailSelected,
          ),
        ),
      ],
    );
  }

  /// Xử lý bấm 1 trong 3 ô của card "Tiến độ theo vị trí".
  ///
  /// - Ô "Chưa có" → nhảy sang tab sản phẩm, lọc sản phẩm chưa có vị trí
  ///   kho lẫn Modula, mặc định chỉ hiện phần **chưa kiểm** để người dùng
  ///   biết cần kiểm mã nào.
  /// - Ô "Kho" / "Modula" → chỉ đổi danh sách vị trí bên dưới, không nhảy tab.
  ///   Người dùng bấm 1 vị trí cụ thể mới lọc sản phẩm.
  void _handleLocationGroupSelected(InventoryLocationGroup group) {
    setState(() => _locationGroup = group);

    bloc.add(InventoryCheckEvent.selectLocationScope(group));

    if (group == InventoryLocationGroup.noLocation) {
      bloc.add(
        const InventoryCheckEvent.filterSheet(
          InventoryCheckSheetFilter.notCounted,
        ),
      );
      setState(() {
        _hasPickedLocation = true;
        _locationFilterLabel = 'Chưa có vị trí';
      });
      _switchTab(_SheetTab.products);
      return;
    }

    // Ô "Kho" / "Modula" chỉ đổi danh sách vị trí bên dưới — bỏ lọc vị trí
    // đang áp dụng và đưa về trạng thái chưa chọn vị trí.
    setState(() {
      _hasPickedLocation = false;
      _locationFilterLabel = null;
    });
  }

  /// Chọn 1 vị trí kho → lọc sản phẩm theo vị trí đó rồi chuyển tab.
  ///
  /// [locationId] = `null` → bỏ lọc vị trí kho, xem toàn bộ sản phẩm.
  void _handleProductLocationSelected(int? locationId) {
    bloc.add(InventoryCheckEvent.selectProductLocation(locationId));
    setState(() {
      _hasPickedLocation = true;
      _locationFilterLabel = locationId == null
          ? 'Tất cả vị trí kho'
          : _productLocationName(locationId);
    });
    _switchTab(_SheetTab.products);
  }

  /// Chọn ô Modula chi tiết → lọc sản phẩm theo ô đó rồi chuyển tab.
  void _handleModulaDetailSelected(int? detailId) {
    bloc.add(InventoryCheckEvent.selectModulaLocationDetail(detailId: detailId));
    setState(() {
      _hasPickedLocation = true;
      _locationFilterLabel = detailId == null
          ? null
          : _modulaDetailName(detailId);
    });
    _switchTab(_SheetTab.products);
  }

  /// Tên vị trí kho theo id (fallback về mã id nếu không tìm thấy).
  String _productLocationName(int locationId) {
    for (final location
        in bloc.state.locationProgress?.productLocations ?? const []) {
      if (location.id == locationId) {
        return location.locationName ?? 'Chưa có vị trí';
      }
    }
    return 'Chưa có vị trí';
  }

  /// Tên ô Modula chi tiết theo id (fallback về mã id nếu không tìm thấy).
  String _modulaDetailName(int detailId) {
    for (final location
        in bloc.state.locationProgress?.modulaLocations ?? const []) {
      if (location.detailId == detailId) {
        return location.locationName ?? 'Chưa có vị trí';
      }
    }
    return 'Chưa có vị trí';
  }

  /// Chuyển tab hiển thị.
  void _switchTab(_SheetTab tab) {
    if (_tab == tab) return;

    // Đang tìm kiếm thì xoá từ khoá vì 2 tab lọc theo 2 tiêu chí khác nhau.
    if (_isSearching) {
      _searchController.clear();
      if (_tab == _SheetTab.locations) _applyLocationKeyword('');
      if (tab == _SheetTab.products) {
        bloc.add(const InventoryCheckEvent.searchSheet(''));
      }
    }

    setState(() => _tab = tab);
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

        /// ===== THANH VỊ TRÍ ĐANG LỌC =====
        SliverToBoxAdapter(
          child: _SelectedLocationBar(
            locationName: _selectedLocationName(),
            onClear: _clearLocationFilter,
          ),
        ),

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
                if (_sheetFilterLabel(state) != null) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.stateWarningColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.stateWarningColor.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.filter_alt,
                          size: 11,
                          color: AppColors.stateWarningColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _sheetFilterLabel(state)!,
                          style: const TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.stateWarningColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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

  /// Bỏ lọc theo vị trí → tải lại toàn bộ sản phẩm của đợt.
  void _clearLocationFilter() {
    bloc.add(InventoryCheckEvent.clearLocationFilter());
    setState(() {
      _hasPickedLocation = true;
      _locationFilterLabel = null;
    });
    _switchTab(_SheetTab.products);
  }

  /// Tên vị trí đang được chọn để lọc (null = không lọc theo vị trí).
  String? _selectedLocationName() => _locationFilterLabel;

  /// Nhãn bộ lọc trạng thái kiểm kê đang áp dụng (null = không lọc trạng thái).
  ///
  /// Hiển thị trên tiêu đề danh sách sản phẩm để người dùng biết đang xem
  /// phần nào — ví dụ sau khi bấm ô "Chưa có" thì lọc "Chưa kiểm".
  String? _sheetFilterLabel(InventoryCheckState state) {
    return switch (state.sheetFilter) {
      null => null,
      InventoryCheckSheetFilter.all => null,
      InventoryCheckSheetFilter.counted => 'Đã kiểm',
      InventoryCheckSheetFilter.notCounted => 'Chưa kiểm',
      InventoryCheckSheetFilter.difference => 'Chênh lệch',
    };
  }

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

  /// Mở bottom sheet bộ lọc sản phẩm (trạng thái, nhóm SP).
  void _showFilterSheet() {
    final state = bloc.state;
    InventoryCheckSheetFilterSheet.show(
      context,
      initialFilter: state.sheetFilter ?? InventoryCheckSheetFilter.all,
      productGroups: state.productGroupsRtc,
      initialProductGroupId: state.sheetProductGroupId,
      onApply: ({
        required InventoryCheckSheetFilter? filter,
        required int? productGroupId,
      }) {
        bloc.add(InventoryCheckEvent.filterSheet(filter));
        bloc.add(InventoryCheckEvent.filterSheetProductGroup(productGroupId));
      },
    );
  }
}

/// Header gradient: mã đợt, tên đợt và trạng thái.
///
/// Số liệu tổng hợp nằm ở bảng báo cáo bên dưới nên không lặp lại ở đây.
/// Thanh hiển thị vị trí đang lọc sản phẩm, kèm nút quay lại danh sách vị trí.
class _SelectedLocationBar extends StatelessWidget {
  const _SelectedLocationBar({
    required this.locationName,
    required this.onClear,
  });

  /// Tên vị trí đang lọc (null = không lọc theo vị trí).
  final String? locationName;

  /// Callback bỏ lọc theo vị trí.
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final name = locationName;
    if (name == null) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.fromLTRB(12, 9, 6, 9),
      decoration: BoxDecoration(
        color: AppColors.secondaryERP.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.secondaryERP.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.place,
            size: 15,
            color: AppColors.secondaryERP,
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Vị trí đang kiểm',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryERP,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onClear,
            icon: const Icon(
              Icons.close,
              size: 16,
              color: AppColors.secondaryERP,
            ),
            tooltip: 'Bỏ lọc vị trí',
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}

/// Nút chuyển tab Vị trí / Sản phẩm.
class _SheetTabButton extends StatelessWidget {
  const _SheetTabButton({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  /// Nhãn tab.
  final String label;

  /// Icon tab.
  final IconData icon;

  /// Tab đang active.
  final bool isActive;

  /// Callback khi bấm tab.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primaryERP.withValues(alpha: 0.1)
                : AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isActive
                  ? AppColors.primaryERP.withValues(alpha: 0.4)
                  : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 15,
                color: isActive ? AppColors.primaryERP : AppColors.gray,
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: isActive ? AppColors.primaryERP : AppColors.gray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
