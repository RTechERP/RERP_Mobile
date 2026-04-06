import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/work_category_model.dart';
import '../datasource/service/work_category_service.dart';
import 'work_category_repo.dart';

@LazySingleton(as: WorkCategoryRepo)
class WorkCategoryRepoImpl implements WorkCategoryRepo {
  final WorkCategoryService _service;

  WorkCategoryRepoImpl(this._service);

  @override
  Future<Either<BaseError, WorkAssignResponse>> getAssigner() async {
    try {
      final res = await _service.getAssigner();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<WorkCategoryItem>>> getWorkCategory({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getWorkCategory(payload: payload);
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> saveWorkCategory({
    required dynamic payload,
  }) async {
    try {
      final res = await _service.saveWorkCategory(payload: payload);
      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Lưu dữ liệu thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<WorkParentItem>>> getWorkParent({
    int? projectID,
  }) async {
    try {
      final res = await _service.getWorkParent(projectID: projectID);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }

      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<WorkProjectItem>>> getWorkProject() async {
    try {
      final res = await _service.getWorkProject();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<WorkProjectTypeItem>>>
  getWorkProjectType() async {
    try {
      final res = await _service.getWorkProjectType();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
