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
}
