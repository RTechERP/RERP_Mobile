import 'package:dartz/dartz.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';

/// Contract truy xuất dữ liệu kiểm kê kho.
abstract class InventoryCheckRepo {
  /// Lấy danh sách nhân viên được giao kiểm kê.
  /// Trả về [BaseError] khi API lỗi.
  Future<Either<BaseError, List<InventoryCheckEmployee>>> getEmployees();

  /// Lấy danh sách đợt kiểm kê trong khoảng ngày [dateStart] → [dateEnd]
  /// (định dạng `yyyy-MM-dd`).
  Future<Either<BaseError, List<InventoryCountItem>>> getInventoryCounts({
    required String dateStart,
    required String dateEnd,
  });

  /// Sinh mã đợt kiểm kê theo ngày [date] (định dạng `yyyy-MM-dd`).
  Future<Either<BaseError, String>> generateCode({required String date});

  /// Tạo mới đợt kiểm kê.
  Future<Either<BaseError, InventoryCountSaveResult>> saveInventoryCount({
    required InventoryCountSavePayload payload,
  });

  /// Lấy chi tiết một đợt kiểm kê theo [id] (dùng để fill màn chỉnh sửa).
  Future<Either<BaseError, InventoryCountDetail>> getInventoryCountById({
    required int id,
  });

  /// Xoá một đợt kiểm kê theo [id] (kèm toàn bộ chi tiết liên quan).
  Future<Either<BaseError, bool>> deleteInventoryCount({required int id});

  /// Lấy phiếu kiểm kê theo [countId] kèm danh sách sản phẩm đã kiểm kê.
  Future<Either<BaseError, InventoryCountSheet>> getInventoryCountSheet({
    required int countId,
  });

  /// Lấy nhóm sản phẩm RTC trong kho để bổ sung sản phẩm vào phiếu kiểm kê.
  Future<Either<BaseError, List<InventoryProductGroupRtc>>>
  getProductGroupRtcNew({
    required int warehouseId,
    required int warehouseType,
  });
}
