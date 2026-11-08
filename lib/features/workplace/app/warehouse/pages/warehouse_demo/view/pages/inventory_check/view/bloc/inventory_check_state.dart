part of 'inventory_check_bloc.dart';

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
    this.isLoadingSheet = false,
    this.sheetKeyword = '',
    this.sheetFilter,
    this.productGroupsRtc = const [],
    this.isLoadingProductGroupsRtc = false,
    this.productGroupsRtcWarehouseId,
    this.sheetProductGroupId,
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

  /// Danh sách sản phẩm trong phiếu sau khi lọc theo từ khoá
  /// (mã sản phẩm, mã nội bộ, tên sản phẩm, vị trí kho, nhóm sản phẩm)
  /// và bộ lọc sắp xếp đang chọn.
  List<InventoryCountSheetItem> get visibleSheetItems {
    final items = sheet?.items ?? const <InventoryCountSheetItem>[];
    final keyword = sheetKeyword.toLowerCase().trim();

    return items.where((item) {
      if (!_matchSheetFilter(item)) return false;
      final groupId = sheetProductGroupId;
      if (groupId != null && item.productGroupRtcId != groupId) return false;
      if (keyword.isEmpty) return true;
      return (item.productCode ?? '').toLowerCase().contains(keyword) ||
          (item.productCodeRtc ?? '').toLowerCase().contains(keyword) ||
          (item.productName ?? '').toLowerCase().contains(keyword) ||
          (item.locationName ?? '').toLowerCase().contains(keyword) ||
          (item.productGroupName ?? '').toLowerCase().contains(keyword) ||
          (item.maker ?? '').toLowerCase().contains(keyword) ||
          (item.serialNumber ?? '').toLowerCase().contains(keyword);
    }).toList();
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
    isLoadingSheet,
    sheetKeyword,
    sheetFilter,
    productGroupsRtc,
    isLoadingProductGroupsRtc,
    productGroupsRtcWarehouseId,
    sheetProductGroupId,
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
