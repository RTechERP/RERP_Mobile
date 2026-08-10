part of 'sale_gdn_bloc.dart';

@freezed
class SaleGdnEvent with _$SaleGdnEvent {
  const factory SaleGdnEvent.init() = _Init;
  const factory SaleGdnEvent.fetchGdns() = _FetchGdns;
  const factory SaleGdnEvent.searchByKeyword(String keyword) = _SearchByKeyword;
  const factory SaleGdnEvent.searchByVoucherNumber(String voucherNumber) = _SearchByVoucherNumber;
  const factory SaleGdnEvent.clearSearch() = _ClearSearch;

  /// Quét QR/Barcode với code là chuỗi (mã phiếu/voucher…) → search theo
  /// FilterText. Nếu đúng 1 kết quả thì emit `openedDetailBill` để UI mở
  /// thẳng trang Detail; 0 hoặc >1 kết quả thì emit `scanResultMessage` để
  /// UI hiển thị snackbar.
  const factory SaleGdnEvent.scanQrToDetail(String code) = _ScanQrToDetail;

  /// Reset cờ one-shot `openedDetailBill` sau khi UI đã mở trang Detail.
  const factory SaleGdnEvent.clearOpenedDetail() = _ClearOpenedDetail;

  /// Reset cờ one-shot `scanResultMessage` sau khi UI đã hiển thị snackbar.
  const factory SaleGdnEvent.clearScanResultMessage() =
      _ClearScanResultMessage;
  const factory SaleGdnEvent.fetchWarehouseTypes() = _FetchWarehouseTypes;
  const factory SaleGdnEvent.filterByWarehouseType(List<int> warehouseTypeIds) = _FilterByWarehouseType;
  const factory SaleGdnEvent.filterByStatus(int status) = _FilterByStatus;
  const factory SaleGdnEvent.clearFilters() = _ClearFilters;

  /// Thay đổi khoảng thời gian lọc và fetch lại danh sách phiếu xuất kho.
  const factory SaleGdnEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Khởi tạo state chi tiết và fetch chi tiết phiếu xuất theo ID.
  /// Có thể gọi lại để tải lại.
  const factory SaleGdnEvent.initDetail({
    @Default(0) int id,
    BillExporResponse? bill,
  }) = _InitDetail;

  /// Thêm 1 hoặc nhiều ảnh đã chọn (local path) vào dòng chi tiết theo `stt`.
  const factory SaleGdnEvent.addImages({
    required int stt,
    required List<String> imagePaths,
  }) = _AddImages;

  /// Đánh dấu 1 ảnh cần xoá (chưa submit).
  /// Với ảnh server: truyền `fileId` (server).
  /// Với ảnh local: truyền `localPath`.
  /// Ảnh sẽ được đánh dấu visuals (overlay X) trên preview và áp dụng
  /// khi user submit (gửi `DeletedFileIds` + lọc local paths).
  const factory SaleGdnEvent.markImageToDelete({
    int? fileId,
    String? localPath,
  }) = _MarkImageToDelete;

  /// Bỏ đánh dấu xoá (khi user tap lại vào ảnh đã mark).
  const factory SaleGdnEvent.unmarkImageToDelete({
    int? fileId,
    String? localPath,
  }) = _UnmarkImageToDelete;

  /// Upload tất cả ảnh local đã chọn lên server.
  const factory SaleGdnEvent.submitImages() = _SubmitImages;

  /// Clear upload status sau khi đã show message.
  const factory SaleGdnEvent.clearUploadStatus() = _ClearUploadStatus;

  // ---------------------------------------------------------------------------
  // Lookup form events for BillExport detail
  // ---------------------------------------------------------------------------

  /// Fetch toàn bộ danh sách lookup (NCC, người giao, khách hàng, dự án,
  /// kho, loại kho) để dùng cho các dropdown trên form BillExport.
  const factory SaleGdnEvent.fetchLookupData() = _FetchLookupData;

  /// Pre-fetch lookup data from API and save to SharedPreferences + in-memory cache.
  /// Called from sale_gdn_screen.dart so detail screen has data ready immediately.
  const factory SaleGdnEvent.prefetchLookupData() = _PrefetchLookupData;

  /// Fetch danh sách nhân viên (Employee) cho bottom-sheet người giao / người nhận.
  const factory SaleGdnEvent.fetchUsers() = _FetchUsers;

  /// User chọn NCC trên form.
  const factory SaleGdnEvent.selectSupplier(int? supplierId) = _SelectSupplier;

  /// User chọn người giao trên form.
  const factory SaleGdnEvent.selectSender(int? senderId) = _SelectSender;

  /// User chọn người nhận trên form.
  const factory SaleGdnEvent.selectReceiver(int? receiverId) = _SelectReceiver;

  /// User chọn khách hàng trên form.
  const factory SaleGdnEvent.selectCustomer(int? customerId) = _SelectCustomer;

  /// User chọn kho trên form.
  const factory SaleGdnEvent.selectWarehouse(int? warehouseId) =
      _SelectWarehouse;

  /// User chọn loại kho trên form.
  const factory SaleGdnEvent.selectKhoType(int? khoTypeId) = _SelectKhoType;

  /// User chọn trạng thái phiếu từ bottom-sheet.
  const factory SaleGdnEvent.selectStatus(int? status) = _SelectStatus;

  /// User chọn dự án (project) từ bottom-sheet.
  const factory SaleGdnEvent.selectProject(int? projectId) = _SelectProject;

  /// User thay đổi ngày xuất (delivery date).
  const factory SaleGdnEvent.changeDeliveryDate(DateTime? date) =
      _ChangeDeliveryDate;

  /// User thay đổi ngày yêu cầu (request date).
  const factory SaleGdnEvent.changeRequestDate(DateTime? date) =
      _ChangeRequestDate;

  /// User thay đổi thời gian nhận hàng (ngày + giờ).
  const factory SaleGdnEvent.changeReceiveTime(DateTime? time) =
      _ChangeReceiveTime;

  /// User chọn loại kho (text label - ProductGroup) từ bottom-sheet.
  const factory SaleGdnEvent.selectLoaiKho(String? text) = _SelectLoaiKho;

  /// User chọn loại hàng (product type) từ bottom-sheet.
  const factory SaleGdnEvent.selectProductType(int? productType) =
      _SelectProductType;

  /// User chọn khách hàng - đồng thời fill địa chỉ KH vào address field.
  const factory SaleGdnEvent.selectCustomerWithAddress({
    required int? customerId,
    String? address,
  }) = _SelectCustomerWithAddress;

  /// User chọn khách hàng - fetch địa chỉ giao hàng từ API.
  const factory SaleGdnEvent.fetchAddressStockByCustomer({
    required int customerId,
  }) = _FetchAddressStockByCustomer;

  /// User tick/bỏ tick "Chuyển kho nội bộ" - enable field "Kho chuyển".
  const factory SaleGdnEvent.toggleTransferInternal({required bool value}) =
      _ToggleTransferInternal;

  /// User tick/bỏ tick "Chuyển kho nội bộ" - enable field "Loại kho chuyển".
  const factory SaleGdnEvent.toggleInternal({required bool value}) =
      _ToggleInternal;

  /// User chọn kho chuyển nội bộ (khi checkbox đã tick).
  const factory SaleGdnEvent.selectInternalWarehouse(int? warehouseId) =
      _SelectInternalWarehouse;

  /// User chọn loại kho chuyển nội bộ.
  const factory SaleGdnEvent.selectInternalKhoType(int? khoTypeId) =
      _SelectInternalKhoType;

  /// User thay đổi địa chỉ giao hàng (từ bottom-sheet chọn địa chỉ).
  const factory SaleGdnEvent.changeDeliveryAddress(String? address) =
      _ChangeDeliveryAddress;

  /// User chọn nhà cung cấp (text) từ bottom-sheet.
  const factory SaleGdnEvent.selectNcc(int? nccId) = _SelectNcc;
}
