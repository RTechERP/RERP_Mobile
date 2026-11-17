part of 'inventory_check_bloc.dart';

/// Nhóm vị trí đang chọn trong card "Tiến độ theo vị trí".
///
/// Mỗi nhóm là 1 ô trong card và quyết định cấu trúc danh sách chi tiết
/// hiển thị bên dưới:
///
/// - [noLocation]: sản phẩm chưa có vị trí nào (gom cả vị trí kho lẫn
///   vị trí Modula).
/// - [productLocation]: vị trí kho / kệ — hiển thị phẳng, mỗi kệ 1 dòng.
/// - [modula]: vị trí Modula — hiển thị dạng cây tủ (cha) → ô chi tiết.
enum InventoryLocationGroup {
  /// Sản phẩm chưa có vị trí nào (gom cả vị trí kho lẫn vị trí Modula).
  noLocation,

  /// Vị trí kho / kệ (ProductLocations).
  productLocation,

  /// Vị trí Modula — 2 cấp: tủ cha → ô chi tiết.
  modula,
}

/// Số sản phẩm thuộc từng nhóm vị trí.
///
/// Lấy từ chính API `get-inventory-sheet-mobile` nên số hiển thị luôn khớp
/// với danh sách sản phẩm hiện ra khi bấm vào nhóm tương ứng.
///
/// Không lấy từ API `get-location-progress-mobile` vì các dòng `ID = 0` của 3
/// mảng đếm trùng nhau (ví dụ `ModulaLocationGroups` và `ModulaLocations`
/// cùng trả về một tập sản phẩm chưa có vị trí Modula).
///
/// Số "đã kiểm" gộp cả kết quả server đã lưu lẫn các dòng đang có nháp
/// trong phiếu (xem [InventoryCheckState.stagedCountEdits]) nên số liệu cập
/// nhật ngay khi người dùng đếm, không cần gọi lại API.
class InventoryLocationCounts extends Equatable {
  const InventoryLocationCounts({
    this.noLocation = 0,
    this.noLocationCounted = 0,
    this.warehouse = 0,
    this.warehouseCounted = 0,
    this.modula = 0,
    this.modulaCounted = 0,
  });

  /// Số sản phẩm không có cả vị trí kho lẫn vị trí Modula.
  final int noLocation;

  /// Số sản phẩm không có vị trí nào đã được kiểm.
  final int noLocationCounted;

  /// Tổng số sản phẩm của đợt kiểm kê.
  final int warehouse;

  /// Số sản phẩm đã được kiểm.
  final int warehouseCounted;

  /// Số sản phẩm đang có vị trí Modula.
  final int modula;

  /// Số sản phẩm có vị trí Modula đã được kiểm.
  final int modulaCounted;

  @override
  List<Object?> get props => [
    noLocation,
    noLocationCounted,
    warehouse,
    warehouseCounted,
    modula,
    modulaCounted,
  ];
}

/// Một dòng kiểm kê đã nhập nhưng chưa lưu lên server.
///
/// Dùng làm "nháp" cho đến khi người dùng bấm "Xác nhận đã kiểm vị trí" thì
/// mới gửi toàn bộ lên API `save-count-details`.
class InventoryCountStagedEdit {
  const InventoryCountStagedEdit({
    required this.rowKey,
    required this.itemId,
    required this.productRtcId,
    required this.quantityActual,
    required this.note,
  });

  /// Khoá duy nhất của dòng sản phẩm (xem [InventoryCountSheetItem.stagedKey]).
  ///
  /// Dùng làm key trong [InventoryCheckState.stagedCountEdits] vì `ID` dòng
  /// chi tiết có thể = 0 cho nhiều sản phẩm khác nhau.
  final String rowKey;

  /// Id dòng chi tiết trong phiếu (0 nếu sản phẩm chưa từng được lưu).
  final int itemId;

  /// Id sản phẩm (theo hệ thống RTC).
  final int productRtcId;

  /// Số lượng thực tế đã kiểm.
  final double quantityActual;

  /// Ghi chú kèm theo.
  final String note;

  /// Payload gửi API `save-count-details`.
  Map<String, dynamic> toJson() => {
    'ID': itemId,
    'ProductRTCID': productRtcId,
    'QuantityActual': quantityActual,
    'Note': note,
  };
}

/// Bộ lọc sắp xếp danh sách sản phẩm trong phiếu kiểm kê.
enum InventoryCheckSheetFilter {
  /// Hiển thị tất cả sản phẩm.
  all('Tất cả'),

  /// Chỉ hiển thị sản phẩm đã kiểm kê.
  counted('Đã kiểm'),

  /// Chỉ hiển thị sản phẩm chưa kiểm kê.
  notCounted('Chưa kiểm'),

  /// Chỉ hiển thị sản phẩm có chênh lệch số lượng.
  difference('Chênh lệch');

  const InventoryCheckSheetFilter(this.label);

  /// Nhãn hiển thị trên tab lọc.
  final String label;
}

/// State của màn danh sách đợt kiểm kê kho.
@CopyWith()
class InventoryCheckState extends BaseBlocState {
  /// Danh sách đợt kiểm kê từ API.
  final List<InventoryCountItem> items;

  /// Danh sách nhân viên được giao kiểm kê (để chọn trong sheet lọc).
  final List<InventoryCheckEmployee> employees;

  /// Từ khoá đang tìm kiếm (rỗng = không tìm).
  final String searchKeyword;

  /// Id nhân viên kiểm kê đang lọc (null = tất cả).
  final int? employeeId;

  /// Id kho đang lọc (null = tất cả).
  final int? warehouseId;

  /// Khoảng ngày đang lọc.
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Mã đợt kiểm kê sinh từ API `generate-code` (dùng ở màn tạo mới).
  final String? generatedCode;

  /// Đang sinh mã đợt kiểm kê.
  final bool isGeneratingCode;

  /// Đang lưu đợt kiểm kê.
  final bool isSaving;

  /// Lưu đợt kiểm kê thành công.
  final bool saveSuccess;

  /// Thông tin đợt kiểm kê vừa tạo.
  final InventoryCountSaveResult? savedResult;

  /// Chi tiết đợt kiểm kê đang được xem / sửa.
  final InventoryCountDetail? detail;

  /// Đang tải chi tiết đợt kiểm kê.
  final bool isLoadingDetail;

  /// Đang xoá đợt kiểm kê.
  final bool isDeleting;

  /// Xoá đợt kiểm kê thành công.
  final bool deleteSuccess;

  /// Thông báo lỗi khi xoá đợt kiểm kê thất bại.
  final String? deleteError;

  /// Phiếu kiểm kê kèm danh sách sản phẩm đã kiểm kê.
  final InventoryCountSheet? sheet;

  /// Toàn bộ sản phẩm của đợt kiểm kê (không lọc theo vị trí).
  ///
  /// Dùng làm nguồn đếm cho 3 ô "Tiến độ theo vị trí" — số hiển thị luôn
  /// khớp với danh sách sản phẩm, không phụ thuộc bộ lọc vị trí đang áp dụng.
  final List<InventoryCountSheetItem> allSheetItems;

  /// Sản phẩm chưa có vị trí kho lẫn vị trí Modula.
  ///
  /// Lấy từ API `get-inventory-sheet-mobile` với bộ lọc
  /// `productLocationId = 0` + `modulaLocationId = 0` để số "Chưa có" khớp
  /// chính xác với danh sách hiện ra khi bấm ô "Chưa có".
  final List<InventoryCountSheetItem> noLocationSheetItems;

  /// Đang tải số liệu của 3 ô "Tiến độ theo vị trí".
  ///
  /// Khi đang tải thì 3 ô hiển thị `--` thay vì `0/0` để không nhầm là
  /// sản phẩm bằng 0.
  final bool isLoadingLocationCounts;

  /// Id đợt kiểm kê đang xem — dùng để tải lại bảng sản phẩm theo vị trí.
  final int? sheetCountId;

  /// Tiến độ kiểm kê theo vị trí kho & vị trí Modula.
  final InventoryLocationProgress? locationProgress;

  /// Đang tải tiến độ kiểm kê theo vị trí.
  final bool isLoadingLocationProgress;

  /// Id vị trí kho đang chọn để lọc sản phẩm.
  ///
  /// `null` → không lọc theo vị trí kho.
  final int? productLocationId;

  /// Id tủ Modula đang chọn để lọc sản phẩm.
  ///
  /// `null` → không lọc theo tủ Modula.
  final int? modulaLocationId;

  /// Id ô Modula chi tiết đang chọn để lọc sản phẩm.
  ///
  /// `null` → không lọc theo ô Modula chi tiết.
  final int? modulaLocationDetailId;

  /// Nhóm vị trí đang chọn trong card "Tiến độ theo vị trí".
  ///
  /// Dùng để lọc danh sách sản phẩm theo nhóm: [InventoryLocationGroup.modula]
  /// lọc ở client (chỉ giữ sản phẩm có vị trí Modula), 2 nhóm còn lại do
  /// API xử lý qua tham số vị trí.
  final InventoryLocationGroup? locationScope;

  /// Đang tải phiếu kiểm kê chi tiết.
  final bool isLoadingSheet;

  /// Từ khoá đang tìm trong danh sách sản phẩm của phiếu.
  final String sheetKeyword;

  /// Bộ lọc sắp xếp đang áp dụng cho danh sách sản phẩm của phiếu.
  ///
  /// `null` = không lọc (hiển thị tất cả).
  final InventoryCheckSheetFilter? sheetFilter;

  /// Danh sách nhóm sản phẩm RTC để bổ sung sản phẩm vào phiếu kiểm kê.
  final List<InventoryProductGroupRtc> productGroupsRtc;

  /// Đang tải danh sách nhóm sản phẩm RTC.
  final bool isLoadingProductGroupsRtc;

  /// Id kho mà danh sách nhóm sản phẩm RTC đã được tải cho.
  ///
  /// Dùng để không tải lại khi phiếu đã có dữ liệu.
  final int? productGroupsRtcWarehouseId;

  /// Id nhóm sản phẩm (hãng) đang lọc trong danh sách sản phẩm của phiếu.
  ///
  /// `null` = không lọc theo nhóm sản phẩm.
  final int? sheetProductGroupId;

  /// Lưu kết quả kiểm kê thực tế thành công.
  final bool saveCountDetailsSuccess;

  /// Các dòng sản phẩm đã nhập kết quả kiểm kê nhưng chưa lưu lên server.
  ///
  /// Key là khoá duy nhất của dòng sản phẩm (xem
  /// [InventoryCountSheetItem.stagedKey]) — không dùng `ID` dòng chi tiết vì
  /// API trả `ID = 0` cho mọi sản phẩm chưa từng được lưu kiểm kê.
  ///
  /// Giá trị ở đây được gửi lên API `save-count-details` khi người dùng bấm
  /// "Xác nhận đã kiểm vị trí".
  final Map<String, InventoryCountStagedEdit> stagedCountEdits;

  /// Khoá của các dòng sản phẩm đã được quét mã trong phiếu (chưa lưu lên
  /// server).
  ///
  /// Dùng để hiển thị chip "Đã quét" và đẩy dòng đã quét xuống cuối danh
  /// sách — những dòng chưa quét và chưa kiểm nằm lên đầu.
  final Set<String> scannedItemKeys;

  /// Đợt kiểm kê cần mở sau khi quét mã đợt (one-shot, UI điều hướng rồi
  /// reset về null để tránh mở lại).
  final InventoryCountItem? openedCountFromScan;

  /// Thông báo khi quét mã đợt không tìm thấy đợt kiểm kê tương ứng.
  final String? scanCountMessage;

  /// Xác nhận hoàn thành / mở lại đợt kiểm kê thành công.
  final bool confirmCompleteSuccess;

  /// Thông báo thành công khi xác nhận hoàn thành / mở lại đợt kiểm kê.
  final String? confirmCompleteMessage;

  /// Thông báo lỗi khi xác nhận hoàn thành / mở lại đợt kiểm kê thất bại.
  final String? confirmCompleteError;

  const InventoryCheckState({
    required super.status,
    super.message,
    this.items = const [],
    this.employees = const [],
    this.searchKeyword = '',
    this.employeeId,
    this.warehouseId,
    this.dateStart,
    this.dateEnd,
    this.generatedCode,
    this.isGeneratingCode = false,
    this.isSaving = false,
    this.saveSuccess = false,
    this.savedResult,
    this.detail,
    this.isLoadingDetail = false,
    this.isDeleting = false,
    this.deleteSuccess = false,
    this.deleteError,
    this.sheet,
    this.allSheetItems = const [],
    this.noLocationSheetItems = const [],
    this.isLoadingLocationCounts = false,
    this.sheetCountId,
    this.locationProgress,
    this.isLoadingLocationProgress = false,
    this.productLocationId,
    this.modulaLocationId,
    this.modulaLocationDetailId,
    this.locationScope,
    this.isLoadingSheet = false,
    this.sheetKeyword = '',
    this.sheetFilter,
    this.productGroupsRtc = const [],
    this.isLoadingProductGroupsRtc = false,
    this.productGroupsRtcWarehouseId,
    this.sheetProductGroupId,
    this.saveCountDetailsSuccess = false,
    this.stagedCountEdits = const {},
    this.scannedItemKeys = const {},
    this.openedCountFromScan,
    this.scanCountMessage,
    this.confirmCompleteSuccess = false,
    this.confirmCompleteMessage,
    this.confirmCompleteError,
  });

  /// Mặc định lọc trong tháng hiện tại.
  factory InventoryCheckState.init() {
    final now = DateTime.now();
    return InventoryCheckState(
      status: BaseStateStatus.init,
      dateStart: DateTime(now.year, now.month, 1),
      dateEnd: now,
    );
  }

  /// Nhân viên đang được chọn để lọc (null nếu không chọn).
  InventoryCheckEmployee? get selectedEmployee {
    if (employeeId == null) return null;
    for (final employee in employees) {
      if (employee.id == employeeId) return employee;
    }
    return null;
  }

  /// Danh sách đợt kiểm kê sau khi áp dụng toàn bộ bộ lọc cục bộ
  /// (từ khoá, nhân viên kiểm kê, kho).
  List<InventoryCountItem> get visibleItems {
    final keyword = searchKeyword.toLowerCase();
    return items.where((item) {
      if (employeeId != null && item.employeeId != employeeId) return false;
      if (warehouseId != null && item.warehouseId != warehouseId) return false;
      if (keyword.isEmpty) return true;
      return (item.code ?? '').toLowerCase().contains(keyword) ||
          (item.name ?? '').toLowerCase().contains(keyword) ||
          (item.employeeName ?? '').toLowerCase().contains(keyword) ||
          (item.employeeCode ?? '').toLowerCase().contains(keyword) ||
          (item.warehouseName ?? '').toLowerCase().contains(keyword) ||
          (item.note ?? '').toLowerCase().contains(keyword);
    }).toList();
  }

  /// Danh sách vị trí kho đang hiển thị.
  List<InventoryProductLocation> get visibleProductLocations =>
      locationProgress?.productLocations ?? const [];

  /// Danh sách tủ Modula đang hiển thị.
  List<InventoryModulaLocationGroup> get visibleModulaLocationGroups =>
      locationProgress?.modulaLocationGroups ?? const [];

  /// Danh sách ô Modula chi tiết đang hiển thị.
  List<InventoryModulaLocationDetail> get visibleModulaLocations =>
      locationProgress?.modulaLocations ?? const [];

  /// Số sản phẩm thuộc từng nhóm vị trí.
  ///
  /// Tính từ danh sách sản phẩm đã tải sẵn nên không cần gọi API mỗi lần
  /// chuyển tab. Số "đã kiểm" gộp cả kết quả đã lưu trên server lẫn các
  /// dòng đang có nháp trong phiếu (xem [stagedCountEdits]) nên số liệu
  /// cập nhật ngay khi người dùng đếm.
  InventoryLocationCounts get locationCounts {
    final all = allSheetItems;
    final modula = all.where(_hasModulaLocation).toList();

    return InventoryLocationCounts(
      noLocation: noLocationSheetItems.length,
      noLocationCounted: noLocationSheetItems.where(isCounted).length,
      warehouse: all.length,
      warehouseCounted: all.where(isCounted).length,
      modula: modula.length,
      modulaCounted: modula.where(isCounted).length,
    );
  }

  /// Sản phẩm trong phiếu sau khi lọc theo từ khoá (mã sản phẩm, mã nội bộ,
  /// tên sản phẩm, vị trí kho, nhóm sản phẩm) và bộ lọc trạng thái đang chọn.
  ///
  /// Được sắp xếp theo 3 nhóm: sản phẩm **chưa quét & chưa kiểm** nằm trên
  /// cùng, sản phẩm **đã quét** nằm giữa, sản phẩm **đã kiểm** nằm dưới cùng
  /// — trong mỗi nhóm giữ nguyên thứ tự API trả về.
  ///
  /// Dòng đã nhập số lượng thực tế trong nháp (chưa gửi lên server) cũng được
  /// coi là đã kiểm nên bị đẩy xuống dưới.
  List<InventoryCountSheetItem> get visibleSheetItems {
    final items = sheet?.items ?? const <InventoryCountSheetItem>[];
    final keyword = sheetKeyword.toLowerCase().trim();

    final filtered = items.where((item) {
      if (!_matchSheetFilter(item)) return false;
      final groupId = sheetProductGroupId;
      if (groupId != null && item.productGroupRtcId != groupId) return false;
      if (locationScope == InventoryLocationGroup.modula &&
          !_hasModulaLocation(item)) {
        return false;
      }
      if (keyword.isEmpty) return true;
      return _matchesSheetKeyword(item, keyword);
    }).toList();

    // Sắp xếp chưa quét lên đầu, đã quét ở giữa, đã kiểm xuống dưới (giữ thứ
    // tự cũ trong mỗi nhóm bằng cách so sánh chỉ số khi nhóm bằng nhau).
    final indexed = filtered.asMap().entries.toList();
    indexed.sort((a, b) {
      final aTier = _sortTier(a.value);
      final bTier = _sortTier(b.value);
      if (aTier != bTier) return aTier.compareTo(bTier);
      return a.key.compareTo(b.key);
    });

    return indexed.map((e) => e.value).toList();
  }

  /// Nhóm hiển thị của một dòng sản phẩm trong danh sách.
  ///
  /// 0 = chưa quét & chưa kiểm (lên đầu), 1 = đã quét, 2 = đã kiểm (cuối).
  int _sortTier(InventoryCountSheetItem item) {
    if (isCounted(item)) return 2;
    if (isScanned(item)) return 1;
    return 0;
  }

  /// Dòng sản phẩm đã được quét mã hay chưa.
  bool isScanned(InventoryCountSheetItem item) {
    return scannedItemKeys.contains(item.stagedKey);
  }

  /// Số sản phẩm đã kiểm kê trong danh sách đang xem.
  ///
  /// Đã kiểm kê khi server đã trả kết quả ([InventoryCountSheetItem.hasCounted])
  /// hoặc khi người dùng đã nhập/quét số lượng thực tế trong nháp.
  int get visibleCountedCount => visibleSheetItems.where(isCounted).length;

  /// Dòng sản phẩm đã được kiểm hay chưa.
  ///
  /// Đã kiểm khi server đã trả kết quả ([InventoryCountSheetItem.hasCounted])
  /// hoặc khi người dùng đã nhập số lượng thực tế trong nháp.
  bool isCounted(InventoryCountSheetItem item) {
    if (item.hasCounted) return true;
    return stagedCountEdits.containsKey(item.stagedKey);
  }

  /// Dòng sản phẩm có đang có vị trí Modula hay không.
  ///
  /// Dùng để lọc ở client cho nhóm "Modula" — API không có tham số tương
  /// đương cho trường hợp "có vị trí Modula" (chỉ có `-1` / `0` / `> 0`).
  static bool _hasModulaLocation(InventoryCountSheetItem item) {
    return (item.modulaLocationName ?? '').trim().isNotEmpty;
  }

  /// So khớp từ khoá với một dòng sản phẩm.
  ///
  /// Dùng đúng bộ trường mà API `get-inventory-sheet-mobile` hỗ trợ lọc:
  /// `ProductCode`, `ProductName`, `ProductCodeRTC`, `Maker`, `AddressBox`,
  /// `Serial`, `SerialNumber`, `PartNumber`, `LocationName`,
  /// `ModulaLocationName`, `ProductGroupName`.
  static bool _matchesSheetKeyword(
    InventoryCountSheetItem item,
    String keyword,
  ) {
    return (item.productCode ?? '').toLowerCase().contains(keyword) ||
        (item.productCodeRtc ?? '').toLowerCase().contains(keyword) ||
        (item.productName ?? '').toLowerCase().contains(keyword) ||
        (item.maker ?? '').toLowerCase().contains(keyword) ||
        (item.addressBox ?? '').toLowerCase().contains(keyword) ||
        (item.serial ?? '').toLowerCase().contains(keyword) ||
        (item.serialNumber ?? '').toLowerCase().contains(keyword) ||
        (item.partNumber ?? '').toLowerCase().contains(keyword) ||
        (item.locationName ?? '').toLowerCase().contains(keyword) ||
        (item.modulaLocationName ?? '').toLowerCase().contains(keyword) ||
        (item.productGroupName ?? '').toLowerCase().contains(keyword);
  }

  /// Kiểm tra một dòng sản phẩm có khớp bộ lọc sắp xếp đang chọn hay không.
  bool _matchSheetFilter(InventoryCountSheetItem item) {
    switch (sheetFilter) {
      case null:
      case InventoryCheckSheetFilter.all:
        return true;
      case InventoryCheckSheetFilter.counted:
        return isCounted(item);
      case InventoryCheckSheetFilter.notCounted:
        return !isCounted(item);
      case InventoryCheckSheetFilter.difference:
        final difference = differenceOf(item);
        return difference != null && difference != 0;
    }
  }

  /// Chênh lệch hiển thị của một dòng sản phẩm.
  ///
  /// Nếu dòng đã nhập số lượng thực tế trong nháp thì tính chênh lệch theo số
  /// lượng vừa nhập, ngược lại lấy chênh lệch do server trả về.
  double? differenceOf(InventoryCountSheetItem item) {
    final staged = stagedCountEdits[item.stagedKey];
    if (staged == null) return item.difference;
    return staged.quantityActual - item.expectedQuantity;
  }

  @override
  List get props => [
    status,
    message,
    items,
    employees,
    searchKeyword,
    employeeId,
    warehouseId,
    dateStart,
    dateEnd,
    generatedCode,
    isGeneratingCode,
    isSaving,
    saveSuccess,
    savedResult,
    detail,
    isLoadingDetail,
    isDeleting,
    deleteSuccess,
    deleteError,
    sheet,
    allSheetItems,
    noLocationSheetItems,
    isLoadingLocationCounts,
    sheetCountId,
    locationProgress,
    isLoadingLocationProgress,
    productLocationId,
    modulaLocationId,
    modulaLocationDetailId,
    locationScope,
    isLoadingSheet,
    sheetKeyword,
    sheetFilter,
    productGroupsRtc,
    isLoadingProductGroupsRtc,
    productGroupsRtcWarehouseId,
    sheetProductGroupId,
    saveCountDetailsSuccess,
    stagedCountEdits,
    scannedItemKeys,
    openedCountFromScan,
    scanCountMessage,
    confirmCompleteSuccess,
    confirmCompleteMessage,
    confirmCompleteError,
  ];
}
