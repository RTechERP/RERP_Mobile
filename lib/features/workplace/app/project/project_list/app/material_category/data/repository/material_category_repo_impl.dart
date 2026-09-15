import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../datasource/model/material_category_model.dart';
import '../datasource/service/material_category_service.dart';
import 'material_category_repo.dart';

@LazySingleton(as: MaterialCategoryRepo)
class MaterialCategoryRepoImpl implements MaterialCategoryRepo {
  final MaterialCategoryService _service;

  MaterialCategoryRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<MaterialCategoryItem>>> getMaterialCategories({
    String keyword = '',
  }) async {
    try {
      final data = await _service.getMaterialCategories(keyword: keyword);
      return right(data);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
