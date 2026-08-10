part of 'sale_gdn_bloc.dart';

@CopyWith()
class SaleGdnState extends BaseBlocState {
  /// Danh sách phiếu xuất kho từ API BillExport.
  final List<BillExporResponse> gdns;

  /// Từ khoá đang tìm kiếm (số phiếu / khách hàng /...).
  final String searchKeyword;

  /// Khoảng thời gian lọc hiện tại.
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Mã kho đang lọc.
  final String warehouseCode;

  /// Trạng thái loading riêng cho tìm kiếm.
  final bool isSearching;

  /// Danh sách loại kho từ API.
  final List<TypeWarehouseResponse> warehouseTypes;

  /// Danh sách ID loại kho đang chọn (rỗng = chọn tất cả).
  final List<int> selectedWarehouseTypeIds;

  /// Trạng thái đang chọn (-1 = tất cả).
  final int selectedStatus;

  // ---------------------------------------------------------------------------
  // Lookup lists for BillExport form fields (fetched lazily on detail open)
  // ---------------------------------------------------------------------------

  /// Danh sách NCC (Supplier) cho dropdown trên form BillExport.
  final List<SupplierResponse> suppliers;

  /// Danh sách người giao (Sender / Employee) cho dropdown.
  final List<SenderResponse> senders;

  /// Danh sách khách hàng cho dropdown.
  final List<CustomerResponse> customers;

  /// Danh sách dự án cho dropdown.
  final List<ProjectGDNResponse> projects;

  /// Danh sách kho cho dropdown.
  final List<WarehouseResponse> warehouses;

  /// Danh sách loại kho (ProductGroup) cho dropdown.
  final List<ProductGroupNewResponse> productGroups;

  /// Danh sách nhân viên (Employee) cho bottom-sheet người giao / người nhận.
  final List<BillExportUserResponse> users;

  /// Trạng thái màn chi tiết (nested). Khi chưa mở thì null.
  final GdnDetailState? detail;

  /// One-shot: phiếu duy nhất tìm được từ quét QR/Barcode (code dạng chuỗi).
  /// UI dùng để mở thẳng trang Detail, sau đó bloc reset về null để tránh mở lại.
  final BillExporResponse? openedDetailBill;

  /// One-shot: thông báo khi quét QR/Barcode không mở được Detail
  /// (0 hoặc >1 kết quả). UI hiển thị snackbar rồi reset về null.
  final String? scanResultMessage;

  const SaleGdnState({
    required super.status,
    super.message,
    this.gdns = const [],
    this.searchKeyword = '',
    this.isSearching = false,
    this.dateStart,
    this.dateEnd,
    this.warehouseCode = 'HN',
    this.warehouseTypes = const [],
    this.selectedWarehouseTypeIds = const [],
    this.selectedStatus = -1,
    this.suppliers = const [],
    this.senders = const [],
    this.customers = const [],
    this.projects = const [],
    this.warehouses = const [],
    this.productGroups = const [],
    this.users = const [],
    this.detail,
    this.openedDetailBill,
    this.scanResultMessage,
  });

  factory SaleGdnState.init() {
    final today = DateTime.now();
    final dateOnly = DateTime(today.year, today.month, today.day);
    // Mặc định: 1 tháng gần nhất tính đến hôm nay.
    final monthStart = DateTime(
      dateOnly.year,
      dateOnly.month - 1,
      dateOnly.day,
    );
    return SaleGdnState(
      status: BaseStateStatus.init,
      dateStart: monthStart,
      dateEnd: dateOnly,
    );
  }

  @override
  List get props => [
        status,
        message,
        gdns,
        searchKeyword,
        isSearching,
        dateStart,
        dateEnd,
        warehouseCode,
        warehouseTypes,
        selectedWarehouseTypeIds,
        selectedStatus,
        suppliers,
        senders,
        customers,
        projects,
        warehouses,
        productGroups,
        users,
        detail,
        openedDetailBill,
        scanResultMessage,
      ];
}
