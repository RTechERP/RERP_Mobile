import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/stationery_model.dart';

abstract class StationeryRepo {
  Future<Either<BaseError, List<StationeryItem>>> getStationeryItem({
    String keyword,
    String monthInput,
    int departmentId,
  });

  Future<Either<BaseError, List<StationerySupplyItem>>> getSupplyItem();

  Future<Either<BaseError, List<StationeryDetailItem>>> getStationeryDetailItem({
    required int officeSupplyRequestsId,
  });

  Future<Either<BaseError, void>> saveStationery({
    required Map<String, dynamic> payload,
  });
}
