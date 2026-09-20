import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/summary_leave_model.dart';

abstract class SummaryLeaveRepo {
  Future<Either<BaseError, List<SummaryLeaveItem>>> getLeave({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<SummaryDepartment>>> getDepartments();
}
