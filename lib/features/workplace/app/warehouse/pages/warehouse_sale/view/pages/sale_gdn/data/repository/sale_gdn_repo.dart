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
}
