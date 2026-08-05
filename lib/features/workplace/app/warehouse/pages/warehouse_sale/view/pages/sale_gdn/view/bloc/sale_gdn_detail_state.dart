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

  /// Danh sách chi tiết đầy đủ (từ API detail, chứa childId để map ảnh).
  final List<DetailGDNResponse> detailFull;

  /// Danh sách file đã upload thành công (từ API).
  final List<UploadFileResponse> uploadedImages;

  /// Map lưu đường dẫn ảnh local theo STT dòng chi tiết.
  /// Key = stt, Value = danh sách đường dẫn ảnh local.
  final Map<int, List<String>> localImagePathsByStt;

  /// Map lưu ảnh server theo ChildID (từ DetailGDNResponse.childId).
  /// Key = childId, Value = danh sách ReadFileResponse.
  final Map<int, List<ReadFileResponse>> serverImagesByChildId;

  /// Trạng thái upload ảnh (tách riêng với status để tránh conflict).
  final BaseStateStatus uploadStatus;

  const GdnDetailState({
    required super.status,
    super.message,
    this.billExportId = 0,
    this.bill,
    this.details = const [],
    this.detailFull = const [],
    this.uploadedImages = const [],
    this.localImagePathsByStt = const {},
    this.serverImagesByChildId = const {},
    this.uploadStatus = BaseStateStatus.init,
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
        detailFull,
        uploadedImages,
        localImagePathsByStt,
        serverImagesByChildId,
        uploadStatus,
      ];
}