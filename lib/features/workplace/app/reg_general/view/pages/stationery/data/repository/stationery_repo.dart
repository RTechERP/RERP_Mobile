import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/stationery_model.dart';

abstract class StationeryRepo{
  Future<Either<BaseError, List<StationeryItem>>> getStationeryItem();

  Future<Either<BaseError, List<StationerySupplyItem>>> getSupplyItem();

  Future<Either<BaseError, List<StationeryDetailItem>>> getStationeryDetailItem();

}