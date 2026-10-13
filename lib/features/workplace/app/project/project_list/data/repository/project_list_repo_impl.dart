import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/model/project_list_model.dart';
import '../datasource/service/project_list_service.dart';
import 'project_list_repo.dart';

@LazySingleton(as: ProjectListRepo)
class ProjectListRepoImpl implements ProjectListRepo {
  final ProjectListService _service;

  ProjectListRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<ProjectItem>>> getProjects({
    required ProjectListParams params,
  }) async {
    try {
      final res = await _service.getProjects(params: params);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        return left(
          BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
