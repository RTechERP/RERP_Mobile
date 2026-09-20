import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/summary_in_out_model.dart';

abstract class SummaryInOutRepo {
  Future<Either<BaseError, List<SummaryInOutItem>>> getInOut({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<SummaryInOutDepartment>>> getDepartments();
}
