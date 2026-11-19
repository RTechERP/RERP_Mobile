import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/datasource/models/product_return_approval_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/datasource/service/product_return_approval_service.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/repository/product_return_approval_repo.dart';

/// Triển khai [ProductReturnApprovalRepo]: gọi service và map lỗi về
/// [BaseError].
@LazySingleton(as: ProductReturnApprovalRepo)
class ProductReturnApprovalRepoImpl implements ProductReturnApprovalRepo {
  final ProductReturnApprovalService _service;

  ProductReturnApprovalRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<ProductReturnEmployee>>>
  getEmployeeTeamAndDepartment() async {
    try {
      final res = await _service.getEmployeeTeamAndDepartment();
      return right(res.data ?? const <ProductReturnEmployee>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
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
  }) async {
    try {
      final res = await _service.getProductHistory(
        keyWords: keyWords,
        dateStart: dateStart,
        dateEnd: dateEnd,
        warehouseId: warehouseId,
        userId: userId,
        status: status,
        isDeleted: isDeleted,
        warehouseType: warehouseType,
        page: page,
        size: size,
      );
      return right(res.data ?? const <ProductReturnHistoryItem>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
