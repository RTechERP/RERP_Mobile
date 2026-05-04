import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/week_plan_model.dart';

abstract class WeekPlanRepo {
  /// Lấy danh sách task theo chế độ xem.
  ///
  /// [viewNumber] — 1: Công việc của tôi, 2: Công việc liên quan,
  ///                 3: Công việc tôi giao, -1: Tổng công việc.
  Future<Either<BaseError, List<WeekPlanTaskItem>>> getTasks({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int status,
    required int viewNumber,
  });

  Future<Either<BaseError, void>> checkIn({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, WeekPlanTaskItem>> createTask({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<TaskTypeItem>>> getTaskTypes();

  Future<Either<BaseError, List<ProjectTaskItem>>> getProjects();

  Future<Either<BaseError, List<ProjectTypeItem>>> getProjectTypes();
}
