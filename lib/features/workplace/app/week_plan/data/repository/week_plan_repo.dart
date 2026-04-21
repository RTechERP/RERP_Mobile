import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/week_plan_model.dart';

abstract class WeekPlanRepo {
  Future<Either<BaseError, List<WeekPlanTaskItem>>> getTasks({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, void>> checkIn({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, WeekPlanTaskItem>> createTask({
    required Map<String, dynamic> payload,
  });
}
