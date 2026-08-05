part of 'sale_gdn_bloc.dart';

/// Trạng thái của màn chi tiết phiếu xuất kho, lồng vào state chính.
@CopyWith()
class GdnDetailState extends BaseBlocState {
  /// ID phiếu xuất đang xem chi tiết.
  final int billExportId;

  /// Thông tin cơ bản của phiếu xuất (truyền từ màn danh sách).
  final BillExporResponse? bill;

  /// Danh sách dòng chi tiết sản phẩm (từ API view).
  final List<ViewGDNDetailResponse> details;

  /// Danh sách file đã upload thành công (từ API).
  final List<UploadFileResponse> uploadedImages;

  /// Map lưu đường dẫn ảnh local theo STT dòng chi tiết.
  /// Key = stt, Value = danh sách đường dẫn ảnh local.
  final Map<int, List<String>> localImagePathsByStt;

  const GdnDetailState({
    required super.status,
    super.message,
    this.billExportId = 0,
    this.bill,
    this.details = const [],
    this.uploadedImages = const [],
    this.localImagePathsByStt = const {},
  });

  factory GdnDetailState.init({required int id, BillExporResponse? bill}) {
    return GdnDetailState(
      status: BaseStateStatus.init,
      billExportId: id,
      bill: bill,
    );
  }

  @override
  List get props => [
        status,
        message,
        billExportId,
        bill,
        details,
        uploadedImages,
        localImagePathsByStt,
      ];
}