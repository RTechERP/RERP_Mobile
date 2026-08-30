import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/summary_wfh_model.dart';

abstract class SummaryWfhRepo {
  Future<Either<BaseError, List<SummaryWfhItem>>> getWfh({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<SummaryWfhDepartment>>> getDepartments();
}
