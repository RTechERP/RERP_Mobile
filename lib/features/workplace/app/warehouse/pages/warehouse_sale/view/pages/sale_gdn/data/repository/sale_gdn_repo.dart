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

  /// Lấy thông tin header của phiếu xuất kho theo ID (single object).
  /// Dùng để fill các trường form (mã phiếu, ngày tạo, kho, khách hàng, địa chỉ...)
  /// ở đầu trang Detail.
  Future<Either<BaseError, DetailGDNItemResponse>> getBillExportById({
    required int id,
  });

  /// Danh sách NCC dùng cho dropdown trên trang Detail.
  Future<Either<BaseError, List<SupplierResponse>>> getSuppliers();

  /// Danh sách người giao (nhân viên) cho dropdown trên trang Detail.
  Future<Either<BaseError, List<SenderResponse>>> getSenders();

  /// Danh sách khách hàng cho dropdown trên trang Detail.
  Future<Either<BaseError, List<CustomerResponse>>> getCustomers();

  /// Danh sách dự án cho dropdown trên trang Detail.
  Future<Either<BaseError, List<ProjectGDNResponse>>> getAllProjects();

  /// Danh sách kho cho dropdown trên trang Detail.
  Future<Either<BaseError, List<WarehouseResponse>>> getWarehouses();

  /// Danh sách loại kho (ProductGroup) theo warehouseId.
  Future<Either<BaseError, List<ProductGroupNewResponse>>> getProductGroupNew({
    int? warehouseId,
    bool? isDeleted,
    bool? isVisible,
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

  /// Danh sách nhân viên cho bottom-sheet người giao / người nhận.
  Future<Either<BaseError, List<BillExportUserResponse>>> getBillExportUsers();
}