import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import 'package:rtc_erp/features/workplace/data/repository/project_cache_repository.dart';
import '../datasource/models/work_category_model.dart';
import '../datasource/service/work_category_service.dart';
import 'work_category_repo.dart';

@LazySingleton(as: WorkCategoryRepo)
class WorkCategoryRepoImpl implements WorkCategoryRepo {
  final WorkCategoryService _service;

  WorkCategoryRepoImpl(this._service);

  /// Key cache danh sách dự án — riêng cho chức năng Hạng mục công việc.
  static const _projectsCacheKey = ProjectCacheKeys.workCategory;

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
    BaseError? failure;
    List<WorkProjectItem>? projects;

    try {
      final res = await _service.getWorkProject();
      if (res.status == 1 && res.data != null) {
        projects = res.data!;
      } else {
        failure =
            BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra');
      }
    } on DioException catch (e) {
      failure = e.baseError;
    } catch (e) {
      // Response lỗi shape (thiếu field bắt buộc) → throw TypeError khi parse.
      failure = BaseError.httpInternalServerError(e.toString());
    }

    if (projects != null && projects.isNotEmpty) {
      await ProjectCacheRepository.saveProjects(
        cacheKey: _projectsCacheKey,
        projects: projects,
        toJson: (e) => e.toJson(),
      );
      return right(projects);
    }

    // API lỗi hoặc trả về rỗng → fallback về cache để người dùng vẫn chọn
    // được dự án.
    final cached = await ProjectCacheRepository.getProjects(
      cacheKey: _projectsCacheKey,
      fromJson: WorkProjectItem.fromJson,
    );
    if (cached.isNotEmpty) return right(cached);

    return left(failure ?? BaseError.httpInternalServerError('Có lỗi xảy ra'));
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

  @override
  Future<Either<BaseError, WorkCategoryDetailItem>> getDetailById({
    required int id,
  }) async {
    try {
      final res = await _service.getDetailById(projectItemId: id);
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
  Future<Either<BaseError, List<WorkProblemItem>>> getProblemById({
    required int id,
  }) async {
    try {
      final res = await _service.getProblemById(projectItemId: id);
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
  Future<Either<BaseError, void>> saveProblem({
    required dynamic payload,
  }) async {
    try {
      final res = await _service.saveProblem(payload: payload);
      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Lưu vấn đề thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
