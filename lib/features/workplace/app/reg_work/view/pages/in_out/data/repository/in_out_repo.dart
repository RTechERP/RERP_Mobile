
import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/in_out_model.dart';

abstract class InOutRepo{
  Future<Either<BaseError, List<InOutItem>>> getInOut({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<ApproverItem>>> getApprover();

  Future<Either<BaseError, void>> saveInOut({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, FillApproverItem>> getFillApprover({required int employeeID, required String tableName});

}