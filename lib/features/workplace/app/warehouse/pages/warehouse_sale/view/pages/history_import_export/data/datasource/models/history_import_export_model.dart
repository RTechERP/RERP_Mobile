import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_import_export_model.freezed.dart';
part 'history_import_export_model.g.dart';

/// Một dòng lịch sử nhập/xuất kho trả về từ API `/HistoryImportExport`.
///
/// Mỗi phần tử tương ứng với 1 dòng chi tiết (sản phẩm) của phiếu, nên cùng
/// một `billImportCode` có thể xuất hiện nhiều lần với `idDetail` khác nhau.
@freezed
class HistoryImportExportResponse with _$HistoryImportExportResponse {
  const factory HistoryImportExportResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'IDDetail') int? idDetail,
    @JsonKey(name: 'RowNum') int? rowNum,

    /// Mã phiếu nhập/xuất (vd. `PTNB261022001`).
    @JsonKey(name: 'BillImportCode') String? billImportCode,
    @JsonKey(name: 'BillCode') String? billCode,
    @JsonKey(name: 'SomeBill') String? someBill,
    @JsonKey(name: 'CreatDate') String? creatDate,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'DateRequestImport') String? dateRequestImport,

    /// Người giao / người nhận / nhà cung cấp.
    @JsonKey(name: 'Deliver') String? deliver,
    @JsonKey(name: 'Reciver') String? reciver,
    @JsonKey(name: 'Suplier') String? suplier,

    /// Kho & loại kho.
    @JsonKey(name: 'WarehouseID') int? warehouseId,
    @JsonKey(name: 'WarehouseName') String? warehouseName,
    @JsonKey(name: 'KhoType') String? khoType,
    @JsonKey(name: 'Stock') String? stock,
    @JsonKey(name: 'MaterialType') String? materialType,

    /// Thông tin sản phẩm của dòng chi tiết.
    @JsonKey(name: 'ProductCode') String? productCode,
    @JsonKey(name: 'ProductNewCode') String? productNewCode,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'Qty') double? qty,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'AddressBox') String? addressBox,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'Note') String? note,

    /// Trạng thái hiển thị: `statusText` (vd. "Phiếu Nhập"),
    /// `approveText` (vd. "Huỷ/Chưa nhận chứng từ").
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'ApproveText') String? approveText,

    /// Thời điểm huỷ/nhận chứng từ (`yyyy-MM-ddTHH:mm:ss`), null nếu chưa có.
    @JsonKey(name: 'DateStatus') String? dateStatus,
    @JsonKey(name: 'Status') bool? status,
    @JsonKey(name: 'BillType') bool? billType,
    @JsonKey(name: 'BillTypeNew') int? billTypeNew,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsReturnedInventory') bool? isReturnedInventory,
  }) = _HistoryImportExportResponse;

  factory HistoryImportExportResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryImportExportResponseFromJson(json);
}
