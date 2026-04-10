import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/overtime_model.dart';

abstract class OvertimeRepo {
  Future<Either<BaseError, List<OvertimeItem>>> getOvertime({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<OvertimeType>>> getOvertimeType();

  Future<Either<BaseError, List<ApproverItem>>> getApprover();

  Future<Either<BaseError, List<OvertimeProject>>> getOvertimeProject();

  Future<Either<BaseError, void>> saveOvertime({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, OvertimeDetailItem>> getOvertimeById(int id);
  Future<Either<BaseError, FillApproverItem>> getFillApprover({
    required int employeeID,
    required String tableName,
  });
}
