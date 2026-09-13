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

  /// Tên người giao đang lọc (lấy từ fullNameSender API, null = tất cả).
  final String? selectedSenderName;

  /// Tên người nhận đang lọc (null = tất cả).
  final String? selectedReceiverName;

  /// Tập ID các phiếu đang được tick chọn (checkbox ở mỗi card).
  /// Dùng cho thao tác hàng loạt (in, xuất file, ...).
  final Set<int> selectedBillIds;

  /// `employeeId` của user đang đăng nhập. Để so sánh với `senderId` của
  /// phiếu nhằm quyết định nhóm action "Chuẩn bị hàng" có hiển thị hay không.
  /// User đặc biệt có `employeeId` = 30 sẽ thấy cả 4 action.
  final int currentEmployeeId;

  /// `fullName` của user đang đăng nhập. Để so sánh với `receiverFullName`
  /// của phiếu nhằm quyết định nhóm action "Nhận hàng" có hiển thị hay không.
  final String currentFullName;

  /// `true` khi đang gọi API check / huỷ trạng thái chuẩn bị / nhận hàng.
  /// UI dùng để disable các action tile hoặc hiển thị spinner.
  final bool isUpdatingStatus;

  /// One-shot: thông báo kết quả của API updateStatusPreparing/Receive.
  /// UI hiển thị snackbar rồi reset về null để tránh hiển thị lại.
  /// Format: `'success:<message>'` hoặc `'error:<message>'`.
  final String? billStatusMessage;

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

  /// Danh sách địa chỉ giao hàng theo customerId (fetch khi chọn khách hàng).
  final List<AddressStockResponse> addressStocks;

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
    this.addressStocks = const [],
    this.detail,
    this.openedDetailBill,
    this.scanResultMessage,
    this.selectedSenderName,
    this.selectedReceiverName,
    this.selectedBillIds = const <int>{},
    this.currentEmployeeId = 0,
    this.currentFullName = '',
    this.isUpdatingStatus = false,
    this.billStatusMessage,
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
        selectedSenderName,
        selectedReceiverName,
        selectedBillIds,
        currentEmployeeId,
        currentFullName,
        isUpdatingStatus,
        billStatusMessage,
      ];
}
