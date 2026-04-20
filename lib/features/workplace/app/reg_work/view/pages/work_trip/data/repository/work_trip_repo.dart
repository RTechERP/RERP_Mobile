import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/work_trip_model.dart';

abstract class WorkTripRepo {
  Future<Either<BaseError, List<WorkTripItem>>> getWorkTrip({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<WorkTripTypeItem>>> getWorkTripType();

  Future<Either<BaseError, List<WorkTripTypeVehicle>>> getWorkTripVehicleType();

  Future<Either<BaseError, List<ApproverItem>>> getApprover();

  Future<Either<BaseError, List<WorkTripProject>>> getWorkTripProject();

  Future<Either<BaseError, void>> saveWorkTrip({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, WorkTripDetailItem>> getWorkTripById(int id);

  Future<Either<BaseError, FillApproverItem>> getFillApprover({
    required int employeeID,
    required String tableName,
  });
}
