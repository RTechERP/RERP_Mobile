// Repository cho màn Duyệt phiếu yêu cầu mua hàng — hợp đồng dữ liệu.

import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/approve_purchasing_model.dart';

/// Hợp đồng truy xuất dữ liệu cho màn duyệt phiếu yêu cầu mua hàng.
abstract class ApprovePurchasingRepo {
  /// Lấy danh sách phiếu yêu cầu mua hàng theo bộ lọc.
  Future<Either<BaseError, List<ApprovePurchasingItem>>> getAllPurchasing({
    required Map<String, dynamic> payload,
  });

  /// Lấy danh sách loại phiếu mua (dùng để tạo tab UI).
  Future<Either<BaseError, List<ApprovePurchasingRequestTypeItem>>>
      getRequestTypes();

  /// Lấy danh sách loại tiền tệ (cho dropdown đơn vị tiền).
  Future<Either<BaseError, List<CurrencyItem>>> getCurrencies();

  /// Lấy danh sách nhóm sản phẩm (cho dropdown nhóm SP).
  Future<Either<BaseError, List<ProductGroupItem>>> getProductGroups();

  /// Lấy danh sách nhà cung cấp (cho dropdown NCC).
  Future<Either<BaseError, List<SupplierItem>>> getSuppliers();

  /// Lấy danh sách dự án (cho dropdown dự án).
  Future<Either<BaseError, List<ProjectFilterItem>>> getProjects();
}
