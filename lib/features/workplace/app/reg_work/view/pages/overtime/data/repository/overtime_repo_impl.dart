import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import 'package:rtc_erp/features/workplace/data/repository/project_cache_repository.dart';
import '../datasource/models/overtime_model.dart';
import '../datasource/service/overtime_service.dart';
import 'overtime_repo.dart';

@LazySingleton(as: OvertimeRepo)
class OvertimeRepoImpl implements OvertimeRepo {
  final OvertimeService _service;

  OvertimeRepoImpl(this._service);

  /// Key cache danh sách dự án — riêng cho chức năng Đăng ký làm thêm.
  static const _projectsCacheKey = ProjectCacheKeys.overtime;

  @override
  Future<Either<BaseError, List<OvertimeItem>>> getOvertime({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getOvertime(payload: payload);
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
  Future<Either<BaseError, List<OvertimeType>>> getOvertimeType() async {
    try {
      final res = await _service.getOvertimeType();
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
  Future<Either<BaseError, List<ApproverItem>>> getApprover() async {
    try {
      final res = await _service.getApprover();
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
  Future<Either<BaseError, List<OvertimeProject>>> getOvertimeProject() async {
    BaseError? failure;
    List<OvertimeProject>? projects;

    try {
      final res = await _service.getOvertimeProject();
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
      fromJson: OvertimeProject.fromJson,
    );
    if (cached.isNotEmpty) return right(cached);

    return left(failure ?? BaseError.httpInternalServerError('Có lỗi xảy ra'));
  }

  @override
  Future<Either<BaseError, List<OvertimeProjectItem>>> getProjectItemByUser({
    required int projectId,
    int status = 2,
  }) async {
    try {
      final res = await _service.getProjectItemByUser(
        projectId: projectId,
        status: status,
      );
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
  Future<Either<BaseError, void>> saveOvertime({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveOvertime(payload: payload);
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
  Future<Either<BaseError, OvertimeDetailResponse>> getOvertimeById(
    int id,
  ) async {
    try {
      final res = await _service.getOvertimeById(id);
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
  Future<Either<BaseError, List<int>>> getDepartmentRequireProjectItem() async {
    try {
      final res = await _service.getDepartmentRequireProjectItem();
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
  Future<Either<BaseError, FillApproverItem>> getFillApprover({
    required int employeeID,
    required String tableName,
  }) async {
    try {
      final res =
          await _service.getFillApprover(
            employeeID: employeeID,
            tableName: tableName,
          );
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
