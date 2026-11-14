part of 'inventory_check_bloc.dart';

/// Chế độ quét mã trong phiếu kiểm kê bằng PDA.
///
/// - [product]: quét mã sản phẩm → chỉ hiển thị đúng sản phẩm vừa quét.
/// - [location]: quét mã vị trí → hiển thị tất cả sản phẩm có cùng mã vị trí.
enum InventoryScanMode {
  /// Quét mã của sản phẩm (mã sản phẩm / mã nội bộ / serial).
  product,

  /// Quét mã của vị trí lưu kho.
  location,
}

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

  /// Đang tải số liệu của 3 ô "Tiến độ theo vị trí".
  ///
  /// Khi đang tải thì 3 ô hiển thị `--` thay vì `0/0` để không nhầm là
  /// sản phẩm bằng 0.
  final bool isLoadingLocationCounts;

  /// Số sản phẩm thuộc từng nhóm vị trí.
  ///
  /// Lấy từ chính API `get-inventory-sheet-mobile` nên số hiển thị luôn khớp
  /// với danh sách sản phẩm hiện ra khi bấm vào nhóm tương ứng.
  ///
  /// Không lấy từ API `get-location-progress-mobile` vì các dòng `ID = 0` của 3
  /// mảng đếm trùng nhau (ví dụ `ModulaLocationGroups` và `ModulaLocations`
  /// cùng trả về một tập sản phẩm chưa có vị trí Modula).
  final InventoryLocationCounts locationCounts;

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

  /// Đợt kiểm kê cần mở sau khi quét mã đợt (one-shot, UI điều hướng rồi
  /// reset về null để tránh mở lại).
  final InventoryCountItem? openedCountFromScan;

  /// Thông báo khi quét mã đợt không tìm thấy đợt kiểm kê tương ứng.
  final String? scanCountMessage;

  /// Chế độ quét PDA đang bật trong phiếu kiểm kê (null = đang tắt).
  final InventoryScanMode? sheetScanMode;

  /// Mã vừa quét gần nhất trong phiếu kiểm kê (null = chưa quét mã nào).
  final String? sheetScanCode;

  /// Số lần quét trong phiếu kiểm kê.
  final int sheetScanCount;

  /// Thông báo kết quả quét gần nhất (khớp / không khớp).
  final String? sheetScanMessage;

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
    this.isLoadingLocationCounts = false,
    this.locationCounts = const InventoryLocationCounts(),
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
    this.openedCountFromScan,
    this.scanCountMessage,
    this.sheetScanMode,
    this.sheetScanCode,
    this.sheetScanCount = 0,
    this.sheetScanMessage,
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

  /// Sản phẩm trong phiếu sau khi lọc theo từ khoá
  /// (mã sản phẩm, mã nội bộ, tên sản phẩm, vị trí kho, nhóm sản phẩm),
  /// bộ lọc sắp xếp đang chọn và mã vừa quét bằng PDA.
  ///
  /// Khi quét vị trí, sản phẩm nằm ở **vị trí Modula** được xếp lên đầu,
  /// sau đó mới tới các sản phẩm khác cùng vị trí.
  List<InventoryCountSheetItem> get visibleSheetItems {
    final items = sheet?.items ?? const <InventoryCountSheetItem>[];
    final keyword = sheetKeyword.toLowerCase().trim();

    final filtered = items.where((item) {
      if (!_matchSheetFilter(item)) return false;
      final groupId = sheetProductGroupId;
      if (groupId != null && item.productGroupRtcId != groupId) return false;
      if (!matchesScanCode(item)) return false;
      if (locationScope == InventoryLocationGroup.modula &&
          !_hasModulaLocation(item)) {
        return false;
      }
      if (keyword.isEmpty) return true;
      return _matchesSheetKeyword(item, keyword);
    }).toList();

    if (sheetScanMode == InventoryScanMode.location) {
      final code = (sheetScanCode ?? '').trim().toLowerCase();
      if (code.isNotEmpty) {
        filtered.sort((a, b) {
          final aModula = _isModulaMatch(a, code) ? 0 : 1;
          final bModula = _isModulaMatch(b, code) ? 0 : 1;
          return aModula.compareTo(bModula);
        });
      }
    }

    return filtered;
  }

  /// Dòng sản phẩm có nằm ở vị trí Modula khớp mã vừa quét hay không.
  static bool _isModulaMatch(InventoryCountSheetItem item, String code) {
    return _equalsCode(item.modulaLocationName, code);
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

  /// Kiểm tra dòng sản phẩm có khớp mã vừa quét hay không.
  ///
  /// - Chế độ [InventoryScanMode.product] → khớp mã sản phẩm (mã sản phẩm,
  ///   mã nội bộ, serial, part number) → chỉ hiển thị đúng sản phẩm đó.
  /// - Chế độ [InventoryScanMode.location] → khớp mã vị trí (vị trí lưu kho,
  ///   địa chỉ ô, vị trí Modula) → hiển thị tất cả sản phẩm cùng vị trí.
  bool matchesScanCode(InventoryCountSheetItem item) {
    final mode = sheetScanMode;
    final code = (sheetScanCode ?? '').trim().toLowerCase();
    if (mode == null || code.isEmpty) return true;

    switch (mode) {
      case InventoryScanMode.product:
        return _equalsCode(item.productCode, code) ||
            _equalsCode(item.productCodeRtc, code) ||
            _equalsCode(item.serialNumber, code) ||
            _equalsCode(item.serial, code) ||
            _equalsCode(item.partNumber, code);
      case InventoryScanMode.location:
        return _equalsCode(item.locationName, code) ||
            _equalsCode(item.addressBox, code) ||
            _equalsCode(item.modulaLocationName, code);
    }
  }

  /// So khớp chính xác một mã trong sản phẩm với mã vừa quét.
  static bool _equalsCode(String? value, String code) {
    return (value ?? '').trim().toLowerCase() == code;
  }

  /// Kiểm tra một dòng sản phẩm có khớp bộ lọc sắp xếp đang chọn hay không.
  bool _matchSheetFilter(InventoryCountSheetItem item) {
    switch (sheetFilter) {
      case null:
      case InventoryCheckSheetFilter.all:
        return true;
      case InventoryCheckSheetFilter.counted:
        return item.hasCounted;
      case InventoryCheckSheetFilter.notCounted:
        return !item.hasCounted;
      case InventoryCheckSheetFilter.difference:
        final difference = item.difference;
        return difference != null && difference != 0;
    }
  }

  /// Số liệu báo cáo của phiếu kiểm kê.
  ///
  /// - [total]: tổng số sản phẩm trong phiếu.
  /// - [counted]: số sản phẩm đã kiểm kê.
  /// - [notCounted]: số sản phẩm chưa kiểm kê.
  /// - [matched]: số sản phẩm đã kiểm kê và khớp với tồn kho.
  /// - [difference]: số sản phẩm có chênh lệch số lượng.
  InventoryCheckSheetReport get sheetReport {
    final items = sheet?.items ?? const <InventoryCountSheetItem>[];
    var counted = 0;
    var matched = 0;
    var difference = 0;
    for (final item in items) {
      if (!item.hasCounted) continue;
      counted++;
      final diff = item.difference;
      if (diff == null || diff == 0) {
        matched++;
      } else {
        difference++;
      }
    }

    return InventoryCheckSheetReport(
      total: items.length,
      counted: counted,
      notCounted: items.length - counted,
      matched: matched,
      difference: difference,
    );
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
    isLoadingLocationCounts,
    locationCounts,
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
    openedCountFromScan,
    scanCountMessage,
    sheetScanMode,
    sheetScanCode,
    sheetScanCount,
    sheetScanMessage,
    confirmCompleteSuccess,
    confirmCompleteMessage,
    confirmCompleteError,
  ];
}

/// Số liệu báo cáo của phiếu kiểm kê.
class InventoryCheckSheetReport {
  const InventoryCheckSheetReport({
    required this.total,
    required this.counted,
    required this.notCounted,
    required this.matched,
    required this.difference,
  });

  /// Tổng số sản phẩm trong phiếu.
  final int total;

  /// Số sản phẩm đã kiểm kê.
  final int counted;

  /// Số sản phẩm chưa kiểm kê.
  final int notCounted;

  /// Số sản phẩm đã kiểm kê và khớp với tồn kho.
  final int matched;

  /// Số sản phẩm có chênh lệch số lượng.
  final int difference;
}
