import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';

abstract class SaleGdnRepo {
  Future<Either<BaseError, List<BillExporResponse>>> getBillExports({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<TypeWarehouseResponse>>> getProductGroups({
    required bool isAdmin,
    required int departmentId,
  });

  /// Lấy chi tiết phiếu xuất kho theo ID (API chính cho trang detail).
  Future<Either<BaseError, List<DetailGDNResponse>>> getBillExportDetail({
    required int id,
  });

  /// Lấy chi tiết phiếu xuất kho theo ID.
  Future<Either<BaseError, List<ViewGDNDetailResponse>>> getViewExportDetail({
    required int id,
  });

  /// Upload files for BillExport confirmation images.
  Future<Either<BaseError, List<UploadFileResponse>>> uploadBillExportFiles({
    required List<File> files,
  });

  /// Lấy danh sách file đính kèm theo billExportDetailId.
  Future<Either<BaseError, List<ReadFileResponse>>> getBillExportFiles({
    required int billExportDetailId,
  });

  /// Xoá file đính kèm theo fileId.
  Future<Either<BaseError, bool>> deleteBillExportFile({
    required int fileId,
  });

  /// Lưu dữ liệu phiếu xuất kho sau khi upload ảnh.
  /// Gán fileID vào detail tương ứng qua childId, rồi submit toàn bộ payload.
  Future<Either<BaseError, SaveBillExportDataResponse>> saveBillExportData({
    required Map<String, dynamic> payload,
  });
}