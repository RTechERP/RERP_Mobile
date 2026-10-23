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

  /// Duyệt (status=true) hoặc huỷ duyệt (status=false) hàng loạt.
  /// [items] là danh sách các `ApprovePurchasingItem` đã chọn — BE nhận
  /// kèm toàn bộ field, không chỉ id, để cập nhật đúng bản ghi.
  ///
  /// Trả về [ApprovePurchasingResult] gồm các bản ghi BE đã cập nhật
  /// và `message` gốc từ API (ví dụ "Đã cập nhật trạng thái 1 yêu cầu
  /// duyệt thành công.") để UI hiển thị đúng, không tự đếm.
  Future<Either<BaseError, ApprovePurchasingResult>> approvePurchasing({
    required bool status,
    required List<ApprovePurchasingItem> items,
  });

  /// Lấy lịch sử giá của 1 sản phẩm theo từ khoá (thường là mã SP).
  /// Trả về danh sách lịch sử giá, mới nhất trước.
  Future<Either<BaseError, List<ProductPriceHistoryItem>>>
      getProductPriceHistory({
    required String keyword,
  });
}

/// Kết quả gọi API duyệt / huỷ duyệt — gồm dữ liệu BE trả về và
/// message gốc để hiển thị.
class ApprovePurchasingResult {
  /// Các bản ghi BE đã cập nhật (dùng để đối chiếu / refresh nếu cần).
  final List<ApprovePurchasingItem> updatedItems;

  /// Message trả về từ API, ví dụ
  /// "Đã cập nhật trạng thái 1 yêu cầu duyệt thành công.".
  final String message;

  const ApprovePurchasingResult({
    required this.updatedItems,
    required this.message,
  });
}
