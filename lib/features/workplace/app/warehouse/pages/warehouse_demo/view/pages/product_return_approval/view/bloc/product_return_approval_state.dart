part of 'product_return_approval_bloc.dart';

/// State của màn duyệt trả sản phẩm.
@CopyWith()
class ProductReturnApprovalState extends BaseBlocState {
  /// Danh sách phiếu trả sản phẩm từ API.
  final List<ProductReturnHistoryItem> items;

  /// Danh sách nhân viên được giao duyệt trả sản phẩm.
  final List<ProductReturnEmployee> employees;

  /// Từ khoá đang tìm kiếm (rỗng = không tìm).
  final String searchKeyword;

  /// Id nhân viên đang lọc (null = tất cả).
  final int? employeeId;

  /// Id kho đang lọc (null = dùng kho mặc định).
  final int? warehouseId;

  /// Kho mặc định khi không chọn kho cụ thể.
  static const int defaultWarehouseId = 1;

  /// Khoảng ngày đang lọc.
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Id các phiếu đang được chọn để duyệt.
  final Set<int> selectedIds;

  /// Đang trong quá trình duyệt các phiếu đã chọn.
  final bool isApproving;

  /// Tổng số phiếu đang duyệt trong lượt hiện tại (dùng để hiển thị tiến trình).
  final int approveTotal;

  /// Số phiếu đã duyệt thành công trong lượt hiện tại.
  final int approvedCount;

  /// Số phiếu duyệt thất bại trong lượt hiện tại.
  final int failedCount;

  /// Đang tải lại danh sách mà không thay thế list bằng màn loading.
  final bool isRefreshing;

  /// Số lần duyệt đã hoàn tất — dùng để UI biết khi nào vòng duyệt kết thúc.
  final int approveRound;

  const ProductReturnApprovalState({
    required super.status,
    super.message,
    this.items = const [],
    this.employees = const [],
    this.searchKeyword = '',
    this.employeeId,
    this.warehouseId,
    this.dateStart,
    this.dateEnd,
    this.selectedIds = const {},
    this.isApproving = false,
    this.approveTotal = 0,
    this.approvedCount = 0,
    this.failedCount = 0,
    this.isRefreshing = false,
    this.approveRound = 0,
  });

  /// Mặc định lọc trong tháng hiện tại.
  factory ProductReturnApprovalState.init() {
    final now = DateTime.now();
    return ProductReturnApprovalState(
      status: BaseStateStatus.init,
      dateStart: DateTime(now.year, now.month, 1),
      dateEnd: now,
    );
  }

  /// Nhân viên đang được chọn để lọc (null nếu không chọn).
  ProductReturnEmployee? get selectedEmployee {
    if (employeeId == null) return null;
    for (final employee in employees) {
      if (employee.employeeId == employeeId) return employee;
    }
    return null;
  }

  /// Danh sách phiếu trả sản phẩm sau khi lọc cục bộ theo từ khoá.
  ///
  /// Lọc theo: mã sản phẩm, mã nội bộ, tên sản phẩm, nhà sản xuất, tên người
  /// mượn, dự án và ghi chú.
  List<ProductReturnHistoryItem> get visibleItems {
    final keyword = searchKeyword.toLowerCase().trim();
    if (keyword.isEmpty) return items;

    return items.where((item) {
      return (item.productCode ?? '').toLowerCase().contains(keyword) ||
          (item.productCodeRtc ?? '').toLowerCase().contains(keyword) ||
          (item.productName ?? '').toLowerCase().contains(keyword) ||
          (item.maker ?? '').toLowerCase().contains(keyword) ||
          (item.fullName ?? '').toLowerCase().contains(keyword) ||
          (item.oldBorrower ?? '').toLowerCase().contains(keyword) ||
          (item.project ?? '').toLowerCase().contains(keyword) ||
          (item.note ?? '').toLowerCase().contains(keyword) ||
          (item.serial ?? '').toLowerCase().contains(keyword) ||
          (item.serialNumber ?? '').toLowerCase().contains(keyword) ||
          (item.partNumber ?? '').toLowerCase().contains(keyword);
    }).toList();
  }

  /// Đang có ít nhất một bộ lọc đang áp dụng hay không.
  bool get hasFilter =>
      searchKeyword.isNotEmpty || employeeId != null || warehouseId != null;

  /// Đã chọn đủ tất cả phiếu đang hiển thị hay chưa.
  bool get isAllSelected {
    final visible = visibleItems;
    if (visible.isEmpty) return false;
    return visible.every((item) => selectedIds.contains(item.id ?? 0));
  }

  /// Đang ở chế độ chọn nhiều phiếu hay chưa (có ít nhất 1 phiếu được chọn).
  bool get isSelectionMode => selectedIds.isNotEmpty;

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
    selectedIds,
    isApproving,
    approveTotal,
    approvedCount,
    failedCount,
    isRefreshing,
    approveRound,
  ];
}
