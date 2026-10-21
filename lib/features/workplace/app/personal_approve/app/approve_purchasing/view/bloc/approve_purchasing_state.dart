part of 'approve_purchasing_bloc.dart';

/// State cho màn Duyệt phiếu yêu cầu mua hàng.
@CopyWith()
class ApprovePurchasingState extends BaseBlocState {
  /// Danh sách loại phiếu mua (sau khi filter theo whitelist 1/7/8).
  final List<ApprovePurchasingRequestTypeItem> requestTypes;

  /// ID loại phiếu đang được chọn trên UI.
  /// `null` → chưa chọn tab nào (khi API request-types lỗi).
  final int? selectedRequestTypeId;

  /// Toàn bộ phiếu yêu cầu mua hàng trong khoảng ngày hiện tại,
  /// đã được nhóm theo `projectPartlistPurchaseRequestTypeId`.
  ///
  /// Cache này được fill từ 1 lần gọi `get-all` (không filter theo
  /// loại trên BE) — đổi tab chỉ việc tra `itemsByType[id]` thay vì
  /// gọi lại API.
  final Map<int, List<ApprovePurchasingItem>> itemsByType;

  /// Danh sách phiếu của tab đang chọn (resolved từ `itemsByType`).
  /// UI bind thẳng vào field này.
  final List<ApprovePurchasingItem> items;

  /// Khoảng ngày đang lọc.
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Loading khi refresh / pull-to-refresh.
  final bool isRefreshing;

  /// Danh sách loại tiền tệ (cho dropdown đơn vị tiền).
  final List<CurrencyItem> currencies;

  /// Danh sách nhóm sản phẩm (cho dropdown nhóm SP).
  final List<ProductGroupItem> productGroups;

  /// Danh sách nhà cung cấp (cho dropdown NCC).
  final List<SupplierItem> suppliers;

  /// Danh sách dự án (cho dropdown dự án).
  final List<ProjectFilterItem> projects;

  /// Bộ lọc client-side hiện tại (search + project + supplier).
  /// Áp dụng lên cache `itemsByType` qua `filteredItems`.
  final PurchasingFilter filter;

  /// Items sau khi áp dụng filter cho tab đang chọn.
  /// UI bind vào field này thay vì `items` thô.
  final List<ApprovePurchasingItem> filteredItems;

  const ApprovePurchasingState({
    required super.status,
    super.message,
    this.requestTypes = const [],
    this.selectedRequestTypeId,
    this.itemsByType = const {},
    this.items = const [],
    this.dateStart,
    this.dateEnd,
    this.isRefreshing = false,
    this.currencies = const [],
    this.productGroups = const [],
    this.suppliers = const [],
    this.projects = const [],
    this.filter = const PurchasingFilter(),
    this.filteredItems = const [],
  });

  factory ApprovePurchasingState.init() => ApprovePurchasingState(
        status: BaseStateStatus.init,
        requestTypes: const [],
        selectedRequestTypeId: null,
        itemsByType: const {},
        items: const [],
        dateStart: null,
        dateEnd: null,
        isRefreshing: false,
        currencies: const [],
        productGroups: const [],
        suppliers: const [],
        projects: const [],
        filter: const PurchasingFilter(),
        filteredItems: const [],
      );

  /// Whitelist 3 ID loại phiếu mua được phép hiển thị trên UI.
  /// Theo yêu cầu nghiệp vụ: chỉ các tab có ID nằm trong tập này mới
  /// được render trên thanh tab.
  static const kAllowedRequestTypeIds = <int>{1, 7, 8};

  /// Ngày bắt đầu mặc định = ngày 1 của tháng trước.
  static DateTime defaultDateStart() {
    final now = DateTime.now();
    return DateTime(now.year, now.month - 1, 1);
  }

  /// Ngày kết thúc mặc định = ngày cuối của tháng sau (cuối ngày).
  static DateTime defaultDateEnd() {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 2, 0, 23, 59, 59);
  }

  /// `true` khi user đã chọn khoảng ngày khác với khoảng mặc định
  /// (từ đầu tháng trước đến cuối tháng sau).
  /// UI dùng để highlight icon lịch trên app bar.
  bool get isDateFiltered {
    if (dateStart == null || dateEnd == null) return false;
    final defaultStart = defaultDateStart();
    final defaultEnd = defaultDateEnd();
    return dateStart!.year != defaultStart.year ||
        dateStart!.month != defaultStart.month ||
        dateStart!.day != defaultStart.day ||
        dateEnd!.year != defaultEnd.year ||
        dateEnd!.month != defaultEnd.month ||
        dateEnd!.day != defaultEnd.day;
  }

  /// Loại phiếu đang được chọn (resolved từ `requestTypes`).
  /// Trả về `null` khi chưa load xong hoặc ID không tồn tại.
  ApprovePurchasingRequestTypeItem? get selectedRequestType {
    final id = selectedRequestTypeId;
    if (id == null) return null;
    for (final t in requestTypes) {
      if (t.id == id) return t;
    }
    return null;
  }

  /// Đếm số phiếu thuộc 1 loại — dùng để hiển thị badge trên tab.
  int countFor(int requestTypeId) {
    return itemsByType[requestTypeId]?.length ?? 0;
  }

  /// Nhóm items theo `ProjectID` để hiển thị 1 card = 1 project.
  /// `null` key = những item không có project.
  Map<int?, List<ApprovePurchasingItem>> groupByProject(
      List<ApprovePurchasingItem> items) {
    final map = <int?, List<ApprovePurchasingItem>>{};
    for (final item in items) {
      map.putIfAbsent(item.projectId, () => <ApprovePurchasingItem>[]).add(item);
    }
    return Map.unmodifiable(map);
  }

  @override
  List get props => [
        status,
        message,
        requestTypes,
        selectedRequestTypeId,
        itemsByType,
        items,
        dateStart,
        dateEnd,
        isRefreshing,
        currencies,
        productGroups,
        suppliers,
        projects,
        filter,
        filteredItems,
      ];
}
