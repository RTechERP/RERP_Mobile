import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/work_requirement_model.dart';


abstract class WorkRequirementRepo {
  Future<Either<BaseError, List<WorkRequirementItem>>> getWorkRequirement({
    required Map<String, dynamic> payload,
  });
}
