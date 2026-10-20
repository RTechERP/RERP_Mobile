// Bloc cho màn Duyệt phiếu yêu cầu mua hàng (ProjectPartlistPurchaseRequest).
// Quản lý:
//  - Danh sách loại phiếu mua (3 tab: ID 1, 7, 8).
//  - Toàn bộ phiếu yêu cầu mua hàng trong khoảng ngày hiện tại,
//    nhóm theo `projectPartlistPurchaseRequestTypeId` vào `itemsByType`.
//  - Khoảng ngày lọc (DateStart / DateEnd).
//  - 4 bộ danh sách lookup: tiền tệ, nhóm SP, nhà cung cấp, dự án
//    (load song song khi init, dùng làm dropdown filter cho UI).
//
// Lưu ý quan trọng:
//  - API `get-all` trả về toàn bộ phiếu trong 1 lần gọi với `Size` lớn.
//    Đổi tab chỉ việc tra cache `itemsByType` — KHÔNG gọi lại API.
//  - Chỉ `init` / `changeDateRange` / `refresh` mới gọi API.
//
// Bloc không xử lý action duyệt / từ chối — chỉ hiển thị danh sách.

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
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
        applyFilter: (projectId, supplierId) =>
            _onApplyFilter(emit, projectId, supplierId),
        resetFilter: () => _onResetFilter(emit),
        changeSearchKeyword: (keyword) =>
            _onChangeSearchKeyword(emit, keyword),
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
      items: _sliceFor(grouped, selectedId),
      filteredItems: _applyFilterTo(
        _sliceFor(grouped, selectedId),
        state.filter,
      ),
      currencies: currencies,
      productGroups: productGroups,
      suppliers: suppliers,
      projects: projects,
      message: null,
    ));
  }

  //---(Change Date Range)---//

  /// Đổi khoảng ngày → reload toàn bộ items, regroup theo loại.
  Future<void> _onChangeDateRange(
    Emitter<ApprovePurchasingState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      dateStart: dateStart,
      dateEnd: dateEnd,
      message: null,
    ));
    await _reloadAll(emit);
  }

  //---(Select Tab)---//

  /// Đổi tab — chỉ tra cache `itemsByType`, không gọi API.
  /// Phải có ít nhất 1 item mới phát emit để tránh state trùng lặp.
  Future<void> _onSelectTab(
    Emitter<ApprovePurchasingState> emit, {
    required int requestTypeId,
  }) async {
    if (requestTypeId == state.selectedRequestTypeId) return;
    final slice = _sliceFor(state.itemsByType, requestTypeId);
    final filtered =
        _applyFilterTo(slice, state.filter);
    emit(state.copyWith(
      selectedRequestTypeId: requestTypeId,
      items: slice,
      filteredItems: filtered,
    ));
  }

  //---(Filter)---//

  /// Áp dụng bộ lọc (projectIds + supplierIds) — chỉ lọc client-side
  /// trên items của tab hiện tại. Search keyword cũng được áp dụng.
  Future<void> _onApplyFilter(
    Emitter<ApprovePurchasingState> emit,
    int? projectId,
    int? supplierId,
  ) async {
    final newFilter = state.filter.copyWith(
      selectedProjectId: projectId,
      selectedSupplierId: supplierId,
    );
    final filtered = _applyFilterTo(state.items, newFilter);
    emit(state.copyWith(
      filter: newFilter,
      filteredItems: filtered,
    ));
  }

  /// Reset filter về rỗng — hiển thị lại toàn bộ items.
  Future<void> _onResetFilter(
    Emitter<ApprovePurchasingState> emit,
  ) async {
    const empty = PurchasingFilter();
    final filtered = _applyFilterTo(state.items, empty);
    emit(state.copyWith(
      filter: empty,
      filteredItems: filtered,
    ));
  }

  /// Cập nhật từ khóa tìm kiếm (mã SP / tên SP / note).
  Future<void> _onChangeSearchKeyword(
    Emitter<ApprovePurchasingState> emit,
    String keyword,
  ) async {
    final newFilter = state.filter.copyWith(searchKeyword: keyword);
    final filtered = _applyFilterTo(state.items, newFilter);
    emit(state.copyWith(
      filter: newFilter,
      filteredItems: filtered,
    ));
  }

  //---(Refresh)---//

  /// Pull-to-refresh / refresh sau action.
  Future<void> _onRefresh(Emitter<ApprovePurchasingState> emit) async {
    emit(state.copyWith(isRefreshing: true, message: null));
    await _reloadAll(
      emit,
      onSuccess: (grouped) {
        final slice = _sliceFor(grouped, state.selectedRequestTypeId);
        emit(state.copyWith(
          itemsByType: grouped,
          items: slice,
          filteredItems: _applyFilterTo(slice, state.filter),
          isRefreshing: false,
        ));
      },
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
      'DateStart': dateStart.toUtc().toIso8601String(),
      'DateEnd': DateTime(
        dateEnd.year,
        dateEnd.month,
        dateEnd.day,
        23,
        59,
        59,
      ).toUtc().toIso8601String(),
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
    void Function(Map<int, List<ApprovePurchasingItem>> grouped)? onSuccess,
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
    final grouped = _groupByType(items);
    final slice = _sliceFor(grouped, state.selectedRequestTypeId);
    emit(state.copyWith(
      status: BaseStateStatus.success,
      itemsByType: grouped,
      items: slice,
      filteredItems: _applyFilterTo(slice, state.filter),
      message: null,
    ));
    onSuccess?.call(grouped);
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

  /// Lấy slice items cho 1 tab — trả về list rỗng nếu tab chưa có data.
  List<ApprovePurchasingItem> _sliceFor(
    Map<int, List<ApprovePurchasingItem>> grouped,
    int? requestTypeId,
  ) {
    if (requestTypeId == null) return const [];
    return grouped[requestTypeId] ?? const [];
  }

  /// Áp dụng filter (search + project + supplier) lên 1 list items.
/// Trả về list mới đã filter — không mutate input.
  List<ApprovePurchasingItem> _applyFilterTo(
    List<ApprovePurchasingItem> source,
    PurchasingFilter filter,
  ) {
    if (filter.isEmpty) return source;

    final kw = filter.searchKeyword.trim().toLowerCase();

    return source.where((item) {
      // Search: mã SP / tên SP / note.
      if (kw.isNotEmpty) {
        final fields = [
          item.productCode ?? '',
          item.productName ?? '',
          item.note ?? '',
          item.notePartlist ?? '',
        ];
        final matched = fields.any(
          (f) => f.toLowerCase().contains(kw),
        );
        if (!matched) return false;
      }

      // Project filter.
      if (filter.selectedProjectId != null) {
        if (item.projectId != filter.selectedProjectId) return false;
      }

      // Supplier filter.
      if (filter.selectedSupplierId != null) {
        if (item.supplierSaleId != filter.selectedSupplierId) return false;
      }

      return true;
    }).toList(growable: false);
  }
}
