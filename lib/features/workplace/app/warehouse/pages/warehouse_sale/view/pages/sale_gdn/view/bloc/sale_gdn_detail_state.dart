part of 'sale_gdn_bloc.dart';

/// Trạng thái của màn chi tiết phiếu xuất kho, lồng vào state chính.
@CopyWith()
class GdnDetailState extends BaseBlocState {
  /// ID phiếu xuất đang xem chi tiết.
  final int billExportId;

  /// Thông tin cơ bản của phiếu xuất (truyền từ màn danh sách).
  final BillExporResponse? bill;

  /// Danh sách dòng chi tiết sản phẩm.
  final List<DetailGDNResponse> details;

  const GdnDetailState({
    required super.status,
    super.message,
    this.billExportId = 0,
    this.bill,
    this.details = const [],
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
      ];
}