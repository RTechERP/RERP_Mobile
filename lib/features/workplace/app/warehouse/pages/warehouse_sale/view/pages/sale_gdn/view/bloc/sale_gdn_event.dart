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

  /// Xoá 1 ảnh khỏi dòng chi tiết theo `stt` và `imageIndex`.
  /// Nếu `isLocal=true` thì xoá local image, ngược lại xoá server image.
  const factory SaleGdnEvent.removeImage({
    required int stt,
    required int imageIndex,
    @Default(true) bool isLocal,
  }) = _RemoveImage;

  /// Upload tất cả ảnh local đã chọn lên server.
  const factory SaleGdnEvent.submitImages() = _SubmitImages;
}
