import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../datasource/model/version_model.dart';
import '../datasource/service/material_category_service.dart';
import 'version_repo.dart';

/// Triển khai VersionRepo, gọi service lấy dữ liệu Version.
@LazySingleton(as: VersionRepo)
class VersionRepoImpl implements VersionRepo {
  final MaterialCategoryService _service;

  VersionRepoImpl(this._service);

  @override
  Future<Either<BaseError, ({List<VersionModel> solutionVersions, List<VersionModel> poVersions})>>
      getVersions(int projectSolutionId) async {
    try {
      final data = await _service.getVersions(projectSolutionId);
      return right(data);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
