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
  ///
  /// Đây là nguồn dữ liệu duy nhất: mỗi tab tự resolve data của riêng nó
  /// qua [itemsFor] / [filteredItemsFor], nên không còn field `items` /
  /// `filteredItems` gắn với tab đang chọn.
  final Map<int, List<ApprovePurchasingItem>> itemsByType;

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
  /// Áp dụng lên cache `itemsByType` qua [filteredItemsFor].
  final PurchasingFilter filter;

  /// `true` khi user đã bật chế độ chọn hàng loạt (long-press trên 1
  /// card hoặc bấm nút "Chọn" trên thanh tab). Khi bật, mỗi card
  /// con sẽ hiện checkbox + nút "Duyệt" / "Huỷ duyệt" ở bottom bar.
  final bool isSelectionMode;

  /// Tập `id` các card con đang được chọn. Khi user đổi tab / filter /
  /// khoảng ngày, danh sách này được reset để tránh thao tác nhầm
  /// trên dữ liệu không còn hiển thị.
  final Set<int> selectedIds;

  /// `true` trong lúc bloc đang gọi API duyệt / huỷ duyệt hàng loạt.
  /// UI dùng để disable 2 nút "Duyệt" / "Huỷ duyệt" và (tuỳ chọn)
  /// hiển thị loading. Pattern lấy từ `approve_booking_guest_house`.
  final bool isApproving;

  /// Thông báo gần nhất của thao tác duyệt / huỷ duyệt:
  /// `success` (xanh), `error` (đỏ) hoặc `null` (không có / đã đóng).
  /// UI subscribe để show snackbar (xem `Screen`).
  final ApprovePurchasingFeedback? approveFeedback;

  /// Lịch sử giá của sản phẩm đang xem (mới nhất trước).
  /// `null` = chưa tải / đã đóng sheet.
  final List<ProductPriceHistoryItem>? priceHistory;

  /// `true` khi đang gọi API lịch sử giá.
  final bool isLoadingPriceHistory;

  /// Từ khoá (mã sản phẩm) đang xem lịch sử giá.
  final String? priceHistoryKeyword;

  /// Lỗi khi tải lịch sử giá (để hiển thị ngay trong bottom sheet).
  final String? priceHistoryError;

  const ApprovePurchasingState({
    required super.status,
    super.message,
    this.requestTypes = const [],
    this.selectedRequestTypeId,
    this.itemsByType = const {},
    this.dateStart,
    this.dateEnd,
    this.isRefreshing = false,
    this.currencies = const [],
    this.productGroups = const [],
    this.suppliers = const [],
    this.projects = const [],
    this.filter = const PurchasingFilter(),
    this.isSelectionMode = false,
    this.selectedIds = const <int>{},
    this.isApproving = false,
    this.approveFeedback,
    this.priceHistory,
    this.isLoadingPriceHistory = false,
    this.priceHistoryKeyword,
    this.priceHistoryError,
  });

  factory ApprovePurchasingState.init() => ApprovePurchasingState(
        status: BaseStateStatus.init,
        requestTypes: const [],
        selectedRequestTypeId: null,
        itemsByType: const {},
        dateStart: null,
        dateEnd: null,
        isRefreshing: false,
        currencies: const [],
        productGroups: const [],
        suppliers: const [],
        projects: const [],
        filter: const PurchasingFilter(),
        isSelectionMode: false,
        selectedIds: const <int>{},
        isApproving: false,
        approveFeedback: null,
        priceHistory: null,
        isLoadingPriceHistory: false,
        priceHistoryKeyword: null,
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

  /// Items thuộc 1 loại phiếu, chưa áp bộ lọc.
  ///
  /// Mỗi tab gọi hàm này với `requestTypeId` của riêng nó, thay vì đọc
  /// `filteredItems` (vốn chỉ chứa data của tab đang chọn) — nhờ vậy khi
  /// vuốt sang tab mới, tab đó hiện đúng data của nó chứ không phải data
  /// tab cũ.
  List<ApprovePurchasingItem> itemsFor(int requestTypeId) {
    return itemsByType[requestTypeId] ?? const [];
  }

  /// Items của 1 loại phiếu sau khi áp bộ lọc hiện tại — dùng cho UI.
  List<ApprovePurchasingItem> filteredItemsFor(int requestTypeId) {
    return applyFilter(itemsFor(requestTypeId), filter);
  }

  /// Áp bộ lọc (search + sản phẩm + trạng thái duyệt + project +
  /// supplier) lên 1 list items. Trả về list mới đã filter — không
  /// mutate input.
  static List<ApprovePurchasingItem> applyFilter(
    List<ApprovePurchasingItem> source,
    PurchasingFilter filter,
  ) {
    if (filter.isEmpty) return source;

    final kw = filter.searchKeyword.trim().toLowerCase();
    // `selectedProduct` lưu 1 hoặc 2 giá trị ghép bằng `|` tuỳ theo
    // item được chọn từ picker (có thể chỉ code, chỉ name, hoặc cả 2).
    // Logic match: với mỗi item, so `contains` từng khoá trên code
    // hoặc name của item; chỉ cần khớp 1 khoá là giữ lại (OR) — tránh
    // khớp quá chặt khiến item tương đương bị loại.
    final productKeys = filter.selectedProduct
        .trim()
        .toLowerCase()
        .split('|')
        .where((s) => s.isNotEmpty)
        .toList();

    return source.where((item) {
      // Search chung: mã SP / tên SP / note.
      if (kw.isNotEmpty) {
        final fields = [
          item.productCode ?? '',
          item.productName ?? '',
          item.note ?? '',
          item.notePartlist ?? '',
        ];
        if (!fields.any((f) => f.toLowerCase().contains(kw))) {
          return false;
        }
      }

      // Lọc theo sản phẩm đã chọn (khoá ghép bằng `|`).
      if (productKeys.isNotEmpty) {
        final code = (item.productCode ?? '').toLowerCase();
        final name = (item.productName ?? '').toLowerCase();
        // Khớp nếu BẤT KỲ khoá nào chứa code HOẶC name.
        if (!productKeys.any(
          (k) => code.contains(k) || name.contains(k),
        )) {
          return false;
        }
      }

      // Lọc theo trạng thái duyệt BGĐ.
      final approved = item.isApprovedBgd ?? false;
      switch (filter.approvalFilter) {
        case PurchasingApprovalFilter.all:
          break;
        case PurchasingApprovalFilter.pending:
          if (approved) return false;
          break;
        case PurchasingApprovalFilter.approved:
          if (!approved) return false;
          break;
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
        dateStart,
        dateEnd,
        isRefreshing,
        currencies,
        productGroups,
        suppliers,
        projects,
        filter,
        isSelectionMode,
        selectedIds,
        isApproving,
        approveFeedback,
        priceHistory,
        isLoadingPriceHistory,
        priceHistoryKeyword,
        priceHistoryError,
      ];
}

/// Kết quả thao tác duyệt / huỷ duyệt, mang theo message của BE để UI
  /// hiển thị đúng thông báo gốc.
///
/// extends [Equatable] để state so sánh theo giá trị — hai feedback
/// cùng message được coi là bằng nhau, tránh rebuild / show snackbar
/// lặp.
class ApprovePurchasingFeedback extends Equatable {
  /// Thông báo hiển thị cho user — lấy từ `message` của API.
  final String message;

  /// `true` = duyệt thành công, `false` = thất bại (UI chọn màu snackbar).
  final bool isSuccess;

  const ApprovePurchasingFeedback.success(this.message)
      : isSuccess = true;

  const ApprovePurchasingFeedback.error(this.message) : isSuccess = false;

  @override
  List<Object?> get props => [message, isSuccess];
}
