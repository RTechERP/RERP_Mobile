import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/service/inventory_check_service.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/repository/inventory_check_repo.dart';

/// Triển khai [InventoryCheckRepo]: gọi service và map lỗi về [BaseError].
@LazySingleton(as: InventoryCheckRepo)
class InventoryCheckRepoImpl implements InventoryCheckRepo {
  final InventoryCheckService _service;

  InventoryCheckRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<InventoryCheckEmployee>>> getEmployees() async {
    try {
      final res = await _service.getEmployees();
      return right(res.data ?? const <InventoryCheckEmployee>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<InventoryCountItem>>> getInventoryCounts({
    required String dateStart,
    required String dateEnd,
  }) async {
    try {
      final res = await _service.getInventoryCounts(
        dateStart: dateStart,
        dateEnd: dateEnd,
      );
      return right(res.data ?? const <InventoryCountItem>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, String>> generateCode({required String date}) async {
    try {
      final res = await _service.generateCode(date: date);
      return right(res.data ?? '');
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, InventoryCountSaveResult>> saveInventoryCount({
    required InventoryCountSavePayload payload,
  }) async {
    try {
      final res = await _service.saveInventoryCount(payload: payload);
      return right(res.data ?? const InventoryCountSaveResult());
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
