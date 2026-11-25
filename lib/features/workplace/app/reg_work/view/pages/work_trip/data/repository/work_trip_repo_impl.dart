import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import 'package:rtc_erp/features/workplace/data/repository/project_cache_repository.dart';
import '../datasource/models/work_trip_model.dart';
import '../datasource/service/work_trip_service.dart';
import 'work_trip_repo.dart';

@LazySingleton(as: WorkTripRepo)
class WorkTripRepoImpl implements WorkTripRepo {
  final WorkTripService _service;

  WorkTripRepoImpl(this._service);

  /// Key cache danh sách dự án — riêng cho chức năng Đăng ký công tác.
  static const _projectsCacheKey = ProjectCacheKeys.workTrip;

  @override
  Future<Either<BaseError, List<WorkTripItem>>> getWorkTrip({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getWorkTrip(payload: payload);
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
  Future<Either<BaseError, List<WorkTripTypeItem>>> getWorkTripType() async {
    try {
      final res = await _service.getWorkTripType();
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
  Future<Either<BaseError, List<WorkTripProject>>> getWorkTripProject() async {
    BaseError? failure;
    List<WorkTripProject>? projects;

    try {
      final res = await _service.getWorkTripProject();
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
      fromJson: WorkTripProject.fromJson,
    );
    if (cached.isNotEmpty) return right(cached);

    return left(failure ?? BaseError.httpInternalServerError('Có lỗi xảy ra'));
  }

  @override
  Future<Either<BaseError, void>> saveWorkTrip({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveWorkTrip(payload: payload);
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
  Future<Either<BaseError, WorkTripDetailItem>> getWorkTripById(int id) async {
    try {
      final res = await _service.getWorkTripById(id);
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
  Future<Either<BaseError,
      List<WorkTripTypeVehicle>>> getWorkTripVehicleType() async {
    try {
      final res = await _service.getWorkTripVehicleType();
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

  @override
  Future<Either<BaseError, List<WorkTripSelfVehicle>>>
      getVehicleBookingsForBussiness({
    required int employeeId,
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    try {
      final res = await _service.getVehicleBookingsForBussiness(
        employeeId: employeeId,
        dateStart: dateStart,
        dateEnd: dateEnd,
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
  Future<Either<BaseError, List<int>>> getDepartmentIds({
    required int configType,
  }) async {
    try {
      final res = await _service.getDepartmentIds(configType: configType);
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