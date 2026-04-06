import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/work_category_model.dart';

abstract class WorkCategoryRepo {
  Future<Either<BaseError, List<WorkCategoryItem>>> getWorkCategory({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, WorkAssignResponse>> getAssigner();

  Future<Either<BaseError, List<WorkProjectItem>>> getWorkProject();

  Future<Either<BaseError, List<WorkProjectTypeItem>>> getWorkProjectType();

  Future<Either<BaseError, List<WorkParentItem>>> getWorkParent({
    int? projectID,
  });

  Future<Either<BaseError, void>> saveWorkCategory({
    required dynamic payload,
  });
}