import 'package:dartz/dartz.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/datasource/models/product_return_approval_model.dart';

/// Contract truy xuất dữ liệu duyệt trả sản phẩm.
abstract class ProductReturnApprovalRepo {
  /// Lấy danh sách nhân viên (kèm phòng ban & nhóm) được giao duyệt trả sản
  /// phẩm.
  Future<Either<BaseError, List<ProductReturnEmployee>>>
  getEmployeeTeamAndDepartment();

  /// Lấy danh sách phiếu trả sản phẩm theo bộ lọc.
  ///
  /// - [keyWords] từ khoá tìm kiếm (null = không lọc).
  /// - [userId] lọc theo người dùng (0 = tất cả).
  /// - [status] danh sách trạng thái phiếu, phân cách bằng dấu phẩy.
  Future<Either<BaseError, List<ProductReturnHistoryItem>>> getProductHistory({
    String? keyWords,
    required String dateStart,
    required String dateEnd,
    required int warehouseId,
    int userId = 0,
    String status = '5,4',
    int isDeleted = 0,
    int warehouseType = 0,
    int page = 1,
    int size = 9999999,
  });

  /// Lấy chi tiết 1 phiếu trả sản phẩm.
  ///
  /// [productHistoryId] id phiếu cần xem chi tiết.
  Future<Either<BaseError, ProductReturnHistoryDetail>> getHistoryDetail({
    required int productHistoryId,
  });

  /// Duyệt phiếu trả sản phẩm.
  ///
  /// - [historyId] id phiếu cần duyệt.
  /// - [isAdmin] duyệt với quyền quản lý.
  /// - [modulaLocationDetailId] id ô Modula đã kiểm (0 = không xác định).
  Future<Either<BaseError, int>> approveReturnProduct({
    required int historyId,
    bool isAdmin = true,
    int modulaLocationDetailId = 0,
  });
}
