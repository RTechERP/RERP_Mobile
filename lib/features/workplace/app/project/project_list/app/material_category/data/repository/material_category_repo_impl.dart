import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../datasource/model/part_list_model.dart';
import '../datasource/service/material_category_service.dart';
import 'material_category_repo.dart';

@LazySingleton(as: MaterialCategoryRepo)
class MaterialCategoryRepoImpl implements MaterialCategoryRepo {
  final MaterialCategoryService _service;

  MaterialCategoryRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<PartListModel>>> getPartList({
    required int projectId,
    required int projectPartListVersionId,
    String keyword = '',
    int partlistTypeId = 8,
  }) async {
    try {
      final data = await _service.getPartList(
        projectId: projectId,
        projectPartListVersionId: projectPartListVersionId,
        keyword: keyword,
        partlistTypeId: partlistTypeId,
      );
      return right(data);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
