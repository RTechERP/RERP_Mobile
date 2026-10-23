import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/approve_purchasing_model.dart';
import '../../data/repository/approve_purchasing_repo.dart';

part 'approve_purchasing_event.dart';
part 'approve_purchasing_state.dart';
part 'approve_purchasing_bloc.g.dart';
part 'approve_purchasing_bloc.freezed.dart';

@injectable
class ApprovePurchasingBloc
    extends BaseBloc<ApprovePurchasingEvent, ApprovePurchasingState> {
  final LogUtils _log;
  final ApprovePurchasingRepo _repo;

  ApprovePurchasingBloc(this._repo, this._log)
      : super(ApprovePurchasingState.init()) {
    on<ApprovePurchasingEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) => _onChangeDateRange(
          emit,
          dateStart: dateStart,
          dateEnd: dateEnd,
        ),
        selectTab: (requestTypeId) =>
            _onSelectTab(emit, requestTypeId: requestTypeId),
        refresh: () => _onRefresh(emit),
        selectProject: (projectId) =>
            _onSelectProject(emit, projectId),
        selectSupplier: (supplierId) =>
            _onSelectSupplier(emit, supplierId),
        resetFilter: () => _onResetFilter(emit),
        changeSearchKeyword: (keyword) =>
            _onChangeSearchKeyword(emit, keyword),
        selectProduct: (product) =>
            _onSelectProduct(emit, product),
        selectApprovalFilter: (filter) =>
            _onSelectApprovalFilter(emit, filter),
        exitSelectionMode: () => _onExitSelectionMode(emit),
        toggleSelection: (itemId) =>
            _onToggleSelection(emit, itemId),
        selectAllVisible: () => _onSelectAllVisible(emit),
        clearSelection: () => _onClearSelection(emit),
        approveSelected: (isApproved) =>
            _onApproveSelected(emit, isApproved: isApproved),
        clearApproveFeedback: () => _onClearApproveFeedback(emit),
        loadPriceHistory: (keyword) =>
            _onLoadPriceHistory(emit, keyword: keyword),
        clearPriceHistory: () => _onClearPriceHistory(emit),
      );
    });
  }

  //---(Init)---//

  /// Load song song: danh sách loại phiếu mua + toàn bộ phiếu trong
  /// khoảng ngày hiện tại + 4 bộ lookup (tiền tệ, nhóm SP, NCC, dự án).
  /// Sau khi load xong, chọn tab đầu tiên (theo whitelist {1, 7, 8})
  /// làm mặc định.
  Future<void> _onInit(Emitter<ApprovePurchasingState> emit) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      message: null,
      dateStart: state.dateStart ?? ApprovePurchasingState.defaultDateStart(),
      dateEnd: state.dateEnd ?? ApprovePurchasingState.defaultDateEnd(),
    ));

    // Gọi song song 6 API: request-types, items + 4 lookup.
    final typesRes = await _repo.getRequestTypes();
    if (emit.isDone) return;

    final items = await _fetchAllItems();
    if (emit.isDone) return;

    final currenciesRes = await _repo.getCurrencies();
    final productGroupsRes = await _repo.getProductGroups();
    final suppliersRes = await _repo.getSuppliers();
    final projectsRes = await _repo.getProjects();

    final types = typesRes.fold<List<ApprovePurchasingRequestTypeItem>>(
      (err) {
        _log.logE('❌ getRequestTypes failed: $err');
        return const <ApprovePurchasingRequestTypeItem>[];
      },
      (t) => t,
    );

    // Lấy dữ liệu 4 bộ lookup — lỗi từng API không chặn UI, fallback
    // về list rỗng để dropdown không vỡ.
    final currencies = currenciesRes.fold<List<CurrencyItem>>(
      (err) {
        _log.logE('❌ getCurrencies failed: $err');
        return const <CurrencyItem>[];
      },
      (v) => v,
    );
    final productGroups = productGroupsRes.fold<List<ProductGroupItem>>(
      (err) {
        _log.logE('❌ getProductGroups failed: $err');
        return const <ProductGroupItem>[];
      },
      (v) => v,
    );
    final suppliers = suppliersRes.fold<List<SupplierItem>>(
      (err) {
        _log.logE('❌ getSuppliers failed: $err');
        return const <SupplierItem>[];
      },
      (v) => v,
    );
    final projects = projectsRes.fold<List<ProjectFilterItem>>(
      (err) {
        _log.logE('❌ getProjects failed: $err');
        return const <ProjectFilterItem>[];
      },
      (v) => v,
    );

    if (items == null) {
      // Lỗi get-all — nếu cũng lỗi get-types thì ưu tiên message của
      // get-all (thường quan trọng hơn).
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: state.message ?? 'Lỗi tải dữ liệu',
        requestTypes: _filterAllowedTypes(types),
        currencies: currencies,
        productGroups: productGroups,
        suppliers: suppliers,
        projects: projects,
      ));
      return;
    }

    final grouped = _groupByType(items);
    final allowed = ApprovePurchasingState.kAllowedRequestTypeIds;
    final filteredTypes = _filterAllowedTypes(types);

    // Chọn tab đầu tiên theo whitelist nếu tab hiện tại không hợp lệ.
    final selectedId = state.selectedRequestTypeId != null &&
            allowed.contains(state.selectedRequestTypeId)
        ? state.selectedRequestTypeId
        : (filteredTypes.isNotEmpty ? filteredTypes.first.id : null);

    emit(state.copyWith(
      status: BaseStateStatus.success,
      requestTypes: filteredTypes,
      selectedRequestTypeId: selectedId,
      itemsByType: grouped,
      currencies: currencies,
      productGroups: productGroups,
      suppliers: suppliers,
      projects: projects,
      message: null,
    ));
  }

  //---(Change Date Range)---//

  /// Đổi khoảng ngày → reload toàn bộ items, regroup theo loại.
  /// Dùng cờ `isRefreshing` thay vì `status = loading` để UI chỉ hiện
  /// spinner pull-to-refresh phía trên, không phủ overlay đen cả list.
  Future<void> _onChangeDateRange(
    Emitter<ApprovePurchasingState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    emit(state.copyWith(
      isRefreshing: true,
      dateStart: dateStart,
      dateEnd: dateEnd,
      message: null,
      selectedIds: const <int>{},
    ));
    await _reloadAll(
      emit,
      onDone: () => emit(state.copyWith(
        isRefreshing: false,
        selectedIds: const <int>{},
      )),
      onFailure: () => emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: 'Lỗi tải dữ liệu',
        isRefreshing: false,
      )),
    );
  }

  //---(Select Tab)---//

  /// Đổi tab — không gọi API, chỉ đổi `selectedRequestTypeId`.
  ///
  /// Không emit lại `items` / `filteredItems` vì UI đã tự resolve data
  /// theo `requestTypeId` của từng tab qua `filteredItemsFor`. Giữ lại
  /// emit ở đây sẽ khiến tab cũ nhảy dữ liệu của tab mới trong lúc
  /// animation đang chạy.
  Future<void> _onSelectTab(
    Emitter<ApprovePurchasingState> emit, {
    required int requestTypeId,
  }) async {
    if (requestTypeId == state.selectedRequestTypeId) return;
    emit(state.copyWith(
      selectedRequestTypeId: requestTypeId,
      selectedIds: const <int>{},
      isSelectionMode: false,
    ));
  }

  //---(Filter)---//

  /// Chọn dự án để lọc. `null` = bỏ lọc theo dự án.
  Future<void> _onSelectProject(
    Emitter<ApprovePurchasingState> emit,
    int? projectId,
  ) async {
    final newFilter = state.filter.copyWith(
      selectedProjectId: projectId,
      clearProject: projectId == null,
    );
    emit(state.copyWith(
      filter: newFilter,
      selectedIds: const <int>{},
    ));
  }

  /// Chọn nhà cung cấp để lọc. `null` = bỏ lọc theo nhà cung cấp.
  Future<void> _onSelectSupplier(
    Emitter<ApprovePurchasingState> emit,
    int? supplierId,
  ) async {
    final newFilter = state.filter.copyWith(
      selectedSupplierId: supplierId,
      clearSupplier: supplierId == null,
    );
    emit(state.copyWith(
      filter: newFilter,
      selectedIds: const <int>{},
    ));
  }

  /// Reset filter về rỗng — hiển thị lại toàn bộ items.
  Future<void> _onResetFilter(
    Emitter<ApprovePurchasingState> emit,
  ) async {
    emit(state.copyWith(
      filter: const PurchasingFilter(),
      selectedIds: const <int>{},
    ));
  }

  /// Cập nhật từ khóa tìm kiếm chung.
  Future<void> _onChangeSearchKeyword(
    Emitter<ApprovePurchasingState> emit,
    String keyword,
  ) async {
    final newFilter = state.filter.copyWith(searchKeyword: keyword);
    emit(state.copyWith(
      filter: newFilter,
      selectedIds: const <int>{},
    ));
  }

  /// Chọn sản phẩm để lọc (giá trị rỗng = bỏ lọc). Logic so khớp nằm
  /// trong `ApprovePurchasingState.applyFilter`.
  Future<void> _onSelectProduct(
    Emitter<ApprovePurchasingState> emit,
    String product,
  ) async {
    final newFilter = state.filter.copyWith(selectedProduct: product);
    emit(state.copyWith(
      filter: newFilter,
      selectedIds: const <int>{},
    ));
  }

  /// Chọn trạng thái duyệt BGĐ.
  Future<void> _onSelectApprovalFilter(
    Emitter<ApprovePurchasingState> emit,
    PurchasingApprovalFilter filter,
  ) async {
    final newFilter = state.filter.copyWith(approvalFilter: filter);
    emit(state.copyWith(
      filter: newFilter,
      selectedIds: const <int>{},
    ));
  }

  //---(Refresh)---//

  /// Pull-to-refresh / refresh sau action.
  Future<void> _onRefresh(Emitter<ApprovePurchasingState> emit) async {
    emit(state.copyWith(isRefreshing: true, message: null));
    await _reloadAll(
      emit,
      onDone: () => emit(state.copyWith(isRefreshing: false)),
      onFailure: () => emit(state.copyWith(isRefreshing: false)),
    );
  }

  //---(Fetch)---//

  /// Gọi API `/get-all` (không filter theo loại trên BE) → trả về
  /// `List<ApprovePurchasingItem>` hoặc `null` nếu lỗi.
  Future<List<ApprovePurchasingItem>?> _fetchAllItems() async {
    final dateStart = state.dateStart;
    final dateEnd = state.dateEnd;
    if (dateStart == null || dateEnd == null) {
      _log.logE('fetchAllItems: missing date range');
      return null;
    }

    final payload = <String, dynamic>{
      // Không `.toUtc()` để khớp format mẫu của web
      // (`2026-09-01T00:00:00` không có `Z`). Nếu BE parse local time,
      // vẫn ra đúng ngày user chọn; ngược lại cần xác nhận với BE.
      'DateStart': DateTime(
        dateStart.year,
        dateStart.month,
        dateStart.day,
      ).toIso8601String(),
      'DateEnd': DateTime(
        dateEnd.year,
        dateEnd.month,
        dateEnd.day,
        23,
        59,
        59,
      ).toIso8601String(),
      'StatusRequest': 1,
      'ProjectID': 0,
      'Keyword': '',
      'SupplierSaleID': 0,
      'IsApprovedTBP': -1,
      'IsApprovedBGD': -1,
      'IsCommercialProduct': -1,
      'POKHID': 0,
      'ProductRTCID': -1,
      'IsDeleted': 0,
      'IsTechBought': -1,
      'IsJobRequirement': -1,
      'IsRequestApproved': 1,
      'EmployeeID': 0,
      'Page': 1,
      'Size': 100000,
      // Lưu ý: KHÔNG gửi `ProjectPartlistPurchaseRequestTypeID` để BE
      // trả về toàn bộ phiếu trong khoảng ngày; client sẽ tự nhóm.
    };

    _log.logI(
      '📋 fetch approvePurchasing (all) '
      'from=${dateStart.toIso8601String()} to=${dateEnd.toIso8601String()}',
    );

    final res = await _repo.getAllPurchasing(payload: payload);
    return res.fold(
      (err) {
        _log.logE('❌ getAllPurchasing failed: $err');
        return null;
      },
      (items) {
        _log.logI('✅ getAllPurchasing success - total: ${items.length}');
        return items;
      },
    );
  }

  /// Regroup + emit. Dùng cho cả `changeDateRange` và `refresh`.
  Future<void> _reloadAll(
    Emitter<ApprovePurchasingState> emit, {
    VoidCallback? onDone,
    VoidCallback? onFailure,
  }) async {
    final items = await _fetchAllItems();
    if (emit.isDone) return;
    if (items == null) {
      onFailure?.call();
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: 'Lỗi tải dữ liệu',
      ));
      return;
    }
    emit(state.copyWith(
      status: BaseStateStatus.success,
      itemsByType: _groupByType(items),
      message: null,
    ));
    onDone?.call();
  }

  //---(Helpers)---//

  /// Lọc các loại phiếu thuộc whitelist {1, 7, 8}.
  List<ApprovePurchasingRequestTypeItem> _filterAllowedTypes(
    List<ApprovePurchasingRequestTypeItem> types,
  ) {
    final allowed = ApprovePurchasingState.kAllowedRequestTypeIds;
    return types
        .where((t) => t.id != null && allowed.contains(t.id))
        .toList(growable: false);
  }

  /// Nhóm items theo `projectPartlistPurchaseRequestTypeId`.
  /// Item nào thiếu ID sẽ bị bỏ qua (không hiển thị trên tab nào).
  Map<int, List<ApprovePurchasingItem>> _groupByType(
    List<ApprovePurchasingItem> items,
  ) {
    final map = <int, List<ApprovePurchasingItem>>{};
    for (final item in items) {
      final id = item.projectPartlistPurchaseRequestTypeId;
      if (id == null) continue;
      map.putIfAbsent(id, () => <ApprovePurchasingItem>[]).add(item);
    }
    return Map.unmodifiable(map);
  }

//---(Selection Mode)---//

  /// Thoát chế độ chọn + clear hết lựa chọn.
  Future<void> _onExitSelectionMode(
    Emitter<ApprovePurchasingState> emit,
  ) async {
    emit(state.copyWith(
      isSelectionMode: false,
      selectedIds: const <int>{},
    ));
  }

  /// Toggle 1 card. Chọn card đầu tiên sẽ tự bật `isSelectionMode` để
  /// bottom action bar (Duyệt / Huỷ duyệt) và nút "Huỷ" hiện ra. Bỏ
  /// chọn hết thì tự thoát mode.
  Future<void> _onToggleSelection(
    Emitter<ApprovePurchasingState> emit,
    int itemId,
  ) async {
    final next = Set<int>.from(state.selectedIds);
    if (!next.add(itemId)) {
      next.remove(itemId);
    }
    emit(state.copyWith(
      selectedIds: next,
      isSelectionMode: next.isNotEmpty,
    ));
  }

  /// Chọn tất cả card con đang hiển thị (theo filter hiện tại của
  /// tab đang chọn).
  Future<void> _onSelectAllVisible(
    Emitter<ApprovePurchasingState> emit,
  ) async {
    final typeId = state.selectedRequestTypeId;
    if (typeId == null) return;
    final ids = <int>{
      for (final i in state.filteredItemsFor(typeId))
        if (i.id != null) i.id!,
    };
    emit(state.copyWith(
      selectedIds: ids,
      isSelectionMode: ids.isNotEmpty,
    ));
  }

  /// Bỏ chọn tất cả nhưng vẫn ở chế độ chọn.
  Future<void> _onClearSelection(
    Emitter<ApprovePurchasingState> emit,
  ) async {
    emit(state.copyWith(selectedIds: const <int>{}));
  }

  //---(Approve / Reject)---//

  /// Gọi API duyệt (isApproved=true) hoặc huỷ duyệt (isApproved=false)
  /// cho toàn bộ id đã chọn. Sau khi BE xác nhận, reload lại danh sách
  /// để cập nhật trạng thái mới (`IsApprovedBGD`).
  ///
  /// Bloc phát `approveFeedback` để UI show snackbar. Một số id có thể
  /// BE từ chối vẫn n trả về `status == 1` (endpoint không phân biệt
  /// từng dòng); trong trường hợp đó, đếm lại theo `data` là an toàn.
  Future<void> _onApproveSelected(
    Emitter<ApprovePurchasingState> emit, {
    required bool isApproved,
  }) async {
    final ids = state.selectedIds;
    if (ids.isEmpty) return;

    // Thu thập đầy đủ object phiếu (không chỉ id) vì BE cần body đầy
    // đủ field cho mỗi item. Lấy từ mọi tab — BE nhận list phẳng,
    // không quan tâm tab.
    final items = <ApprovePurchasingItem>[];
    for (final list in state.itemsByType.values) {
      for (final it in list) {
        if (it.id != null && ids.contains(it.id)) items.add(it);
      }
    }
    if (items.isEmpty) return;

    emit(state.copyWith(isApproving: true, approveFeedback: null));

    final res = await _repo.approvePurchasing(
      status: isApproved,
      items: items,
    );
    if (emit.isDone) return;

    await res.fold(
      (err) async {
        final msg = err.getErrorMessage;
        _log.logE('❌ approvePurchasing failed: $msg');
        emit(state.copyWith(
          isApproving: false,
          approveFeedback: ApprovePurchasingFeedback.error(msg),
        ));
      },
      (result) async {
        _log.logI(
          '✅ approvePurchasing ok (isApproved=$isApproved, '
          'updated=${result.updatedItems.length}): ${result.message}',
        );
        // Reload danh sách để cập nhật trạng thái mới trên UI.
        final refreshed = await _fetchAllItems();
        if (emit.isDone) return;
        if (refreshed != null) {
          emit(state.copyWith(
            status: BaseStateStatus.success,
            itemsByType: _groupByType(refreshed),
            message: null,
          ));
        }
        emit(state.copyWith(
          isApproving: false,
          isSelectionMode: false,
          selectedIds: const <int>{},
          // Message lấy nguyên từ BE, ví dụ
          // "Đã cập nhật trạng thái 1 yêu cầu duyệt thành công.".
          approveFeedback: ApprovePurchasingFeedback.success(result.message),
        ));
      },
    );
  }

  /// Reset `approveFeedback` về `null` sau khi UI đã hiện snackbar.
  /// Không emit nếu đã là `null` để tránh notify thừa.
  Future<void> _onClearApproveFeedback(
    Emitter<ApprovePurchasingState> emit,
  ) async {
    if (state.approveFeedback == null) return;
    emit(state.copyWith(approveFeedback: null));
  }

  //---(Price History)---//

  /// Tải lịch sử giá của sản phẩm theo từ khoá (mã sản phẩm).
  /// Lỗi được phát qua `priceHistoryError` để sheet hiển thị thông báo
  /// ngay trong sheet thay vì snackbar chung.
  Future<void> _onLoadPriceHistory(
    Emitter<ApprovePurchasingState> emit, {
    required String keyword,
  }) async {
    if (keyword.trim().isEmpty) return;

    emit(state.copyWith(
      isLoadingPriceHistory: true,
      priceHistoryKeyword: keyword,
      priceHistoryError: null,
    ));

    final res = await _repo.getProductPriceHistory(keyword: keyword);
    if (emit.isDone) return;

    await res.fold(
      (err) async {
        final msg = err.getErrorMessage;
        _log.logE('❌ getProductPriceHistory failed: $msg');
        emit(state.copyWith(
          isLoadingPriceHistory: false,
          priceHistory: const [],
          priceHistoryError: msg,
        ));
      },
      (items) async {
        _log.logI('✅ getProductPriceHistory ok (${items.length} records)');
        emit(state.copyWith(
          isLoadingPriceHistory: false,
          priceHistory: items,
          priceHistoryError: null,
        ));
      },
    );
  }

  /// Xoá lịch sử giá khỏi state (sau khi user đóng sheet).
  Future<void> _onClearPriceHistory(
    Emitter<ApprovePurchasingState> emit,
  ) async {
    if (state.priceHistory == null && state.priceHistoryKeyword == null) return;
    emit(state.copyWith(
      priceHistory: null,
      priceHistoryKeyword: null,
      priceHistoryError: null,
    ));
  }
}
