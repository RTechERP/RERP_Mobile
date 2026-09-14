import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/model/project_list_model.dart';

abstract class ProjectListRepo {
  Future<Either<BaseError, List<ProjectItem>>> getProjects({
    required ProjectListParams params,
  });
}
