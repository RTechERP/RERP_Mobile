import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../datasource/model/solution_model.dart';
import '../datasource/service/material_category_service.dart';
import 'solution_repo.dart';

@LazySingleton(as: SolutionRepo)
class SolutionRepoImpl implements SolutionRepo {
  final MaterialCategoryService _service;

  SolutionRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<SolutionModel>>> getSolutions(int projectRequestId) async {
    try {
      final data = await _service.getSolutions(projectRequestId);
      return right(data);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
