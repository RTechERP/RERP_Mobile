import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/services/device/pda_helper.dart';
import 'package:rtc_erp/common/utils/dialog/dialog_service.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart' show SnackBarType;
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/bloc/inventory_check_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_location_list.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_location_progress_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_filter_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_detail_sheet.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_sheet_item_edit_sheet.dart';
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

  /// Subscription nhận mã quét từ phần cứng PDA ở tab sản phẩm.
  ///
  /// Màn là nguồn quét duy nhất: mỗi mã quét đúng sản phẩm sẽ mở bottom
  /// sheet của sản phẩm đó (hoặc tăng số lượng nếu sheet đang mở); mã không
  /// khớp thì hiện thông báo lỗi.
  StreamSubscription<Map<String, dynamic>>? _scanSub;

  /// Cầu nối điều khiển bottom sheet đang mở trong chế độ quét.
  final InventoryCheckSheetItemEditController _editController =
      InventoryCheckSheetItemEditController();

  /// Sản phẩm đang mở bottom sheet trong chế độ quét.
  InventoryCountSheetItem? _scanSheetItem;

  /// Bottom sheet hiện đang mở (chưa bị đóng).
  bool _scanSheetOpen = false;

  /// Future hoàn tất khi bottom sheet quét đóng lại.
  Future<void>? _scanSheetDone;

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
    // tải lại trong bloc) và quay lại tab vị trí, vị trí đã chọn vẫn giữ.
    if (state.saveCountDetailsSuccess) {
      context.showMessage(
        'Cập nhật kết quả kiểm kê thành công',
        type: SnackBarType.success,
      );
      // Quay lại tab vị trí, vị trí đang chọn vẫn được giữ nguyên.
      _switchTab(_SheetTab.locations);
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
            prev.stagedCountEdits != curr.stagedCountEdits ||
            prev.scannedItemKeys != curr.scannedItemKeys ||
            prev.visibleCountedCount != curr.visibleCountedCount,
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
              Expanded(child: _buildContent(context, state, sheet)),
            ],
          );
        },
      ),
      floatingActionButton: null,
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
  ///   kho lẫn Modula (danh sách tự sắp xếp chưa kiểm lên trước).
  /// - Ô "Kho" / "Modula" → chỉ đổi danh sách vị trí bên dưới, không nhảy tab.
  ///   Người dùng bấm 1 vị trí cụ thể mới lọc sản phẩm.
  void _handleLocationGroupSelected(InventoryLocationGroup group) {
    setState(() => _locationGroup = group);

    bloc.add(InventoryCheckEvent.selectLocationScope(group));

    if (group == InventoryLocationGroup.noLocation) {
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

    // Vào tab sản phẩm: bắt đầu nghe mã quét từ phần cứng PDA. Danh sách
    // không lọc trạng thái — đã được sắp xếp sẵn (chưa kiểm ở trên, đã kiểm
    // ở dưới).
    if (tab == _SheetTab.products) {
      bloc.add(const InventoryCheckEvent.filterSheet(null));
      _startScanListening();
      return;
    }

    // Rời khỏi tab sản phẩm → ngừng nghe quét và đóng bottom sheet đang mở
    // (lưu nháp trước). Số liệu tiến độ theo vị trí không cần gọi lại API vì
    // đã được cập nhật từ dữ liệu server + nháp trong phiếu.
    _stopScanListening();
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
        /// ===== THANH VỊ TRÍ ĐANG LỌC =====
        SliverToBoxAdapter(
          child: _SelectedLocationBar(
            locationName: _selectedLocationName(),
            onClear: _clearLocationFilter,
          ),
        ),

        /// ===== NÚT XÁC NHẬN ĐÃ KIỂM VỊ TRÍ =====
        SliverToBoxAdapter(
          child: _ConfirmLocationButton(
            stagedCount: state.stagedCountEdits.length,
            onPressed: () => _handleConfirmLocation(),
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
                  '(${state.visibleCountedCount}/${items.length})',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gray,
                  ),
                ),
                const Spacer(),
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
          SliverToBoxAdapter(child: const _EmptyItems())
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            sliver: SliverList.separated(
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = items[index];
                return InventoryCountSheetItemCard(
                  item: item,
                  index: index + 1,
                  stagedQuantity:
                      state.stagedCountEdits[item.stagedKey]?.quantityActual,
                  isScanned: state.isScanned(item),
                  onTap: () => _handleItemTap(item),
                );
              },
            ),
          ),
      ],
    );
  }

  /// Xác nhận đã kiểm vị trí → gửi toàn bộ kết quả đã nhập lên server.
  ///
  /// Gửi tất cả các dòng đang chờ lưu trong phiếu (nháp), không phụ thuộc
  /// đang xem vị trí / bộ lọc nào.
  Future<void> _handleConfirmLocation() async {
    final staged = bloc.state.stagedCountEdits.values.toList();
    if (staged.isEmpty) {
      context.showMessage(
        'Chưa có sản phẩm nào được cập nhật',
        type: SnackBarType.info,
      );
      return;
    }

    final confirmed = await DialogService.showConfirmInventoryCountLocation(
      context: context,
      countCode: bloc.state.sheet?.master?.code ?? '',
      stagedCount: staged.length,
    );
    if (!mounted || !confirmed) return;

    bloc.add(
      InventoryCheckEvent.saveCountDetails(
        countId: widget.countId,
        changedItems: staged.map((edit) => edit.toJson()).toList(),
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

  /// Mở bottom sheet nhập số lượng thực tế + ghi chú rồi lưu vào nháp.
  ///
  /// Nháp chỉ được gửi lên server khi người dùng bấm nút
  /// "Xác nhận đã kiểm vị trí".
  Future<void> _openEditItemSheet(InventoryCountSheetItem item) async {
    final result = await _openItemSheet(item, scanDriven: false);
    if (!mounted || result == null) return;

    _stageCountEdit(item, result);

    context.showMessage(
      'Đã cập nhật số lượng thực tế — bấm "Xác nhận đã kiểm vị trí" để lưu',
      type: SnackBarType.success,
    );
  }

  /// Mở bottom sheet nhập số lượng cho một sản phẩm.
  ///
  /// Màn ngoài luôn là nguồn quét duy nhất: bottom sheet không tự nghe phần cứng
  /// (tránh đếm trùng 2 lần), mọi lượt quét đều do màn ngoài đẩy vào.
  ///
  /// - [scanDriven] = `true` → sheet được mở do 1 lượt quét: lượt quét đó
  ///   được tính vào số lượng.
  /// - [scanDriven] = `false` → người dùng tự bấm vào sản phẩm: bỏ các lượt
  ///   tăng còn dư.
  ///
  /// Trả về kết quả nhập của bottom sheet (null = người dùng huỷ).
  Future<InventoryCountItemEditResult?> _openItemSheet(
    InventoryCountSheetItem item, {
    required bool scanDriven,
  }) {
    final staged = bloc.state.stagedCountEdits[item.stagedKey];
    _scanSheetItem = item;

    // Sheet không do màn quét điều khiển → bỏ các lần tăng còn dư.
    if (!scanDriven) {
      _editController.resetPending();
    }

    final completer = Completer<InventoryCountItemEditResult?>();
    _scanSheetDone = completer.future;
    _scanSheetOpen = true;

    InventoryCheckSheetItemEditSheet.show(
      context,
      item,
      stagedQuantity: staged?.quantityActual,
      stagedNote: staged?.note,
      controller: _editController,
      onScanned: _markItemScanned,
    ).then((result) {
      if (identical(_scanSheetItem, item)) {
        _scanSheetItem = null;
      }
      _scanSheetOpen = false;
      completer.complete(result);
    });

    return completer.future;
  }

  /// Đánh dấu dòng sản phẩm là "đã quét" → hiện chip + đẩy xuống cuối.
  void _markItemScanned(String rowKey) {
    bloc.add(InventoryCheckEvent.markItemScanned(rowKey));
  }

  /// Lưu kết quả kiểm kê của 1 sản phẩm vào nháp trong phiếu.
  ///
  /// Nháp chỉ được gửi lên server khi người dùng bấm "Xác nhận đã kiểm vị trí".
  void _stageCountEdit(
    InventoryCountSheetItem item,
    InventoryCountItemEditResult result,
  ) {
    final productRtcId = item.productRtcId;
    if (productRtcId == null) return;

    bloc.add(
      InventoryCheckEvent.stageCountDetail(
        InventoryCountStagedEdit(
          rowKey: item.stagedKey,
          itemId: item.id ?? 0,
          productRtcId: productRtcId,
          quantityActual: result.quantityActual,
          note: result.note,
        ),
      ),
    );
  }

  // ==========================================================================
  // QUÉT MÃ TỪ PHẦN CỨNG PDA (tab sản phẩm)
  // ==========================================================================

  /// Bắt đầu nghe mã quét từ phần cứng PDA.
  ///
  /// Màn là nguồn quét duy nhất ở tab sản phẩm: mỗi mã quét đúng sản phẩm
  /// sẽ mở bottom sheet của sản phẩm đó và tự tăng số lượng.
  void _startScanListening() {
    if (_scanSub != null) return;
    _scanSub = PdaHelper.scanStream.listen(_handleScanEvent);
  }

  /// Ngừng nghe mã quét + đóng bottom sheet đang mở (lưu nháp trước).
  Future<void> _stopScanListening() async {
    _scanSub?.cancel();
    _scanSub = null;

    if (_scanSheetDone == null) return;

    // Lưu nháp sản phẩm đang mở rồi đóng sheet.
    _saveOpenSheetDraft();
    await _closeScanSheet();
  }

  /// Nhận sự kiện quét từ phần cứng PDA.
  void _handleScanEvent(Map<String, dynamic> event) {
    if (!mounted) return;

    // Sự kiện bấm nút quét native — mã quét sẽ đến ở event tiếp theo.
    if (event.containsKey('keyEvent')) return;

    final code = event['code']?.toString().trim();
    if (code == null || code.isEmpty) return;

    _handleScannedCode(code);
  }

  /// Xử lý mã vừa quét ở tab sản phẩm.
  ///
  /// - Đang mở bottom sheet của đúng sản phẩm → tăng số lượng lên 1.
  /// - Đang mở bottom sheet của sản phẩm khác → lưu nháp sản phẩm cũ rồi mở
  ///   bottom sheet của sản phẩm mới (người dùng có thể quay lại sản phẩm cũ
  ///   sau, số liệu đã lưu trong nháp).
  /// - Chưa mở bottom sheet nào → mở bottom sheet của sản phẩm vừa quét.
  /// - Mã không khớp sản phẩm nào trong danh sách → báo lỗi, không mở gì.
  Future<void> _handleScannedCode(String code) async {
    final openItem = _scanSheetItem;

    if (openItem != null && _matchesItemCode(openItem, code)) {
      _markItemScanned(openItem.stagedKey);
      _editController.increment();
      return;
    }

    final target = _findItemByCode(code);
    if (target == null) {
      context.showMessage(
        'Mã "$code" không khớp sản phẩm nào trong danh sách',
        type: SnackBarType.error,
      );
      return;
    }

    // Lưu nháp sản phẩm đang mở (nếu có số lượng) trước khi chuyển sản phẩm —
    // số liệu của sản phẩm cũ không bị mất, người dùng quay lại là thấy.
    final savedQuantity = _saveOpenSheetDraft();
    await _closeScanSheet();

    if (!mounted) return;

    if (savedQuantity != null && openItem != null) {
      context.showMessage(
        'Đã lưu nháp "${openItem.productCode ?? ''}": $savedQuantity — '
        'chuyển sang "${target.productCode ?? ''}"',
        type: SnackBarType.info,
      );
    }

    await _openScanSheet(target);
  }

  /// Tìm dòng sản phẩm trong danh sách đang xem khớp mã vừa quét.
  ///
  /// Không tìm thấy trả về `null` — người dùng có thể đang lọc theo vị trí
  /// nên sản phẩm cần kiểm không nằm trong danh sách hiện tại.
  InventoryCountSheetItem? _findItemByCode(String code) {
    final target = code.trim().toLowerCase();

    for (final item in bloc.state.visibleSheetItems) {
      if (_matchesItemCode(item, target)) return item;
    }
    return null;
  }

  /// Mã vừa quét có khớp sản phẩm hay không.
  ///
  /// So khớp chính xác với các mã nhận diện của sản phẩm: mã sản phẩm, mã
  /// nội bộ, serial, serial number và part number.
  bool _matchesItemCode(InventoryCountSheetItem item, String code) {
    final target = code.trim().toLowerCase();
    if (target.isEmpty) return false;

    return _equalsCode(item.productCode, target) ||
        _equalsCode(item.productCodeRtc, target) ||
        _equalsCode(item.serialNumber, target) ||
        _equalsCode(item.serial, target) ||
        _equalsCode(item.partNumber, target);
  }

  /// So khớp chính xác một mã trong sản phẩm với mã vừa quét.
  static bool _equalsCode(String? value, String code) {
    return (value ?? '').trim().toLowerCase() == code;
  }

  /// Mở bottom sheet nhập số lượng cho sản phẩm vừa quét (chế độ quét).
  ///
  /// Lượt quét đã mở sheet này cũng được tính vào số lượng.
  Future<void> _openScanSheet(InventoryCountSheetItem item) async {
    // Huỷ đăng ký callback của sheet vừa đóng (nếu có) — sheet cũ còn sống
    // tới hết animation đóng nên nếu không huỷ, lượt tăng của sản phẩm mới
    // sẽ bị sheet cũ nhận mất và sheet mới mở ra vẫn hiển thị 0.
    _editController.resetAttachment();

    final future = _openItemSheet(item, scanDriven: true);

    // Lượt quét đã mở sheet → cộng 1 (được áp dụng khi sheet mount xong).
    _markItemScanned(item.stagedKey);
    _editController.increment();

    final result = await future;
    if (!mounted || result == null) return;

    _stageCountEdit(item, result);
  }

  /// Lưu nháp số lượng của sản phẩm đang mở trong bottom sheet.
  ///
  /// Trả về số lượng đã lưu (null = sản phẩm đang mở chưa nhập gì).
  double? _saveOpenSheetDraft() {
    final item = _scanSheetItem;
    if (item == null) return null;

    final result = _editController.readResult?.call();
    if (result == null) return null;

    _stageCountEdit(item, result);
    return result.quantityActual;
  }

  /// Đóng bottom sheet đang mở (nếu có) và chờ nó đóng hẳn.
  Future<void> _closeScanSheet() async {
    final done = _scanSheetDone;
    _scanSheetDone = null;
    _scanSheetItem = null;

    if (done == null) return;
    if (!mounted) return;

    // Sheet đã đóng (người dùng bấm Lưu / Huỷ) → chỉ cần chờ future hoàn tất.
    if (!_scanSheetOpen) {
      await done;
      return;
    }

    Navigator.of(context).pop();
    await done;
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

/// Nút "Xác nhận đã kiểm vị trí" — gửi toàn bộ kết quả đã nhập lên server.
///
/// Hiển thị số dòng đang chờ lưu để người dùng biết còn bao nhiêu sản
/// phẩm chưa được gửi đi.
class _ConfirmLocationButton extends StatelessWidget {
  const _ConfirmLocationButton({
    required this.stagedCount,
    required this.onPressed,
  });

  /// Số dòng sản phẩm đã nhập nhưng chưa lưu lên server.
  final int stagedCount;

  /// Callback khi bấm nút.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.verified_outlined, size: 18, color: Colors.white),
        label: Text(
          stagedCount > 0
              ? 'Xác nhận đã kiểm vị trí ($stagedCount)'
              : 'Xác nhận đã kiểm vị trí',
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.stateSuccessColor,
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

/// Trạng thái rỗng khi phiếu không có sản phẩm nào.
class _EmptyItems extends StatelessWidget {
  const _EmptyItems();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 40),
      child: Column(
        children: [
          const Icon(
            Icons.inventory_2_outlined,
            size: 46,
            color: AppColors.gray,
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
