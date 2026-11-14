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

  @override
  Future<Either<BaseError, InventoryCountDetail>> getInventoryCountById({
    required int id,
  }) async {
    try {
      final res = await _service.getInventoryCountById(id: id);
      return right(res.data ?? const InventoryCountDetail());
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, bool>> deleteInventoryCount({
    required int id,
  }) async {
    try {
      final res = await _service.deleteInventoryCount(id: id);
      return right(res.data ?? false);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, InventoryCountSheet>> getInventoryCountSheet({
    required int countId,
  }) async {
    try {
      final res = await _service.getInventoryCountSheet(countId: countId);
      return right(res.data ?? const InventoryCountSheet());
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, InventoryLocationProgress>> getLocationProgressMobile({
    required int countId,
    int warehouseId = 0,
    int modulaLocationId = -1,
    String? keyword,
  }) async {
    try {
      final res = await _service.getLocationProgressMobile(
        countId: countId,
        warehouseId: warehouseId,
        modulaLocationId: modulaLocationId,
        keyword: keyword,
      );
      return right(res.data ?? const InventoryLocationProgress());
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, InventoryCountSheet>> getInventorySheetMobile({
    required int countId,
    String? keyword,
    int? productGroupId,
    int productLocationId = -1,
    int modulaLocationId = -1,
    int modulaLocationDetailId = -1,
  }) async {
    try {
      final res = await _service.getInventorySheetMobile(
        countId: countId,
        keyword: keyword,
        productGroupId: productGroupId,
        productLocationId: productLocationId,
        modulaLocationId: modulaLocationId,
        modulaLocationDetailId: modulaLocationDetailId,
      );
      return right(res.data ?? const InventoryCountSheet());
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<InventoryProductGroupRtc>>>
  getProductGroupRtcNew({
    required int warehouseId,
    required int warehouseType,
  }) async {
    try {
      final res = await _service.getProductGroupRtcNew(
        warehouseId: warehouseId,
        warehouseType: warehouseType,
      );
      return right(res.data ?? const <InventoryProductGroupRtc>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, bool>> saveCountDetails({
    required int countId,
    required List<Map<String, dynamic>> changedItems,
  }) async {
    try {
      final res = await _service.saveCountDetails(
        countId: countId,
        changedItems: changedItems,
      );
      return right(res.data ?? false);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, InventoryCountDetail>> confirmComplete({
    required int id,
    required bool isComplete,
  }) async {
    try {
      final res = await _service.confirmComplete(
        id: id,
        isComplete: isComplete,
      );
      return right(res.data ?? const InventoryCountDetail());
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
