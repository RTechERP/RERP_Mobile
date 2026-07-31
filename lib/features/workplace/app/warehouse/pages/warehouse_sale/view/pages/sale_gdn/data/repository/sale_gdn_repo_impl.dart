import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/service/sale_gdn_service.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/repository/sale_gdn_repo.dart';

@LazySingleton(as: SaleGdnRepo)
class SaleGdnRepoImpl implements SaleGdnRepo {
  final SaleGdnService _service;

  SaleGdnRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<BillExporResponse>>> getBillExports({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getBillExports(payload: payload);
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
