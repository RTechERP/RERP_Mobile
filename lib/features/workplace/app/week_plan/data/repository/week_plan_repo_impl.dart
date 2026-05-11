// ignore_for_file: unused_field

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/week_plan_model.dart';
import '../datasource/service/week_plan_service.dart';
import 'week_plan_repo.dart';

@LazySingleton(as: WeekPlanRepo)
class WeekPlanRepoImpl implements WeekPlanRepo {
  WeekPlanRepoImpl(this._service);

  final WeekPlanService _service;

  @override
  Future<Either<BaseError, List<WeekPlanTaskItem>>> getTasks({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int status,
    required int viewNumber,
  }) async {
    try {
      final res = await _service.getProjectTask(
        dateStart: dateStart,
        dateEnd: dateEnd,
        status: status,
        viewNumber: viewNumber,
      );

      if (res.status == 1) {
        return right(res.data ?? []);
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> checkIn({required Map<String, dynamic> payload}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, SaveResponseWeekPlan>> saveTask({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveProjectTask(payload: payload);

      if (res.status == 1) {
        return right(res.data ?? const SaveResponseWeekPlan());
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<TaskTypeItem>>> getTaskTypes() async {
    try {
      final res = await _service.getProjectTaskType();

      if (res.status == 1) {
        return right(res.data ?? []);
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<ProjectTaskItem>>> getProjects() async {
    try {
      final res = await _service.getAllProject();

      if (res.status == 1) {
        return right(res.data ?? []);
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<ProjectTypeItem>>> getProjectTypes() async {
    try {
      final res = await _service.getProjectTypeItem();

      if (res.status == 1) {
        return right(res.data ?? []);
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<EmployeeTaskItem>>> getEmployees() async {
    try {
      final res = await _service.getEmployees();

      if (res.status == 1) {
        return right(res.data ?? []);
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<ParentProjectTaskItem>>> getParentProjectTasks({
    required int projectId,
    required bool isPersonalProject,
  }) async {
    try {
      final res = await _service.getListProjectTask(
        projectId: projectId,
        isPersonalProject: isPersonalProject,
      );

      if (res.status == 1) {
        return right(res.data ?? []);
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, AttendanceTaskResponse>> projectTaskAttendance({
    required int projectTaskId,
    required bool isCheck,
  }) async {
    try {
      final res = await _service.projectTaskAttendance(
        projectTaskId: projectTaskId,
        isCheck: isCheck,
      );

      if (res.status == 1) {
        return right(res.data ?? const AttendanceTaskResponse());
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<UploadAttachmentResponse>>> uploadAttachmentFile({
    required List<File> files,
    required String key,
    required String subPath,
  }) async {
    try {
      final res = await _service.uploadAttachmentFile(
        files: files,
        key: key,
        subPath: subPath,
      );
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, FileWeekPlanResponse>> saveProjectTaskFiles({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveProjectTaskFiles(payload: payload);

      if (res.status == 1) {
        return right(res.data ?? const FileWeekPlanResponse());
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, ChecklistWeekPlanResponse>> saveProjectTaskChecklists({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveProjectTaskChecklists(payload: payload);

      if (res.status == 1) {
        return right(res.data ?? const ChecklistWeekPlanResponse());
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, LinkWeekPlanResponse>> saveProjectTaskLinks({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveProjectTaskLinks(payload: payload);

      if (res.status == 1) {
        return right(res.data ?? const LinkWeekPlanResponse());
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, SubTaskWeekPlan>> saveSubTask({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveProjectTaskChild(payload: payload);

      if (res.status == 1) {
        return right(res.data ?? const SubTaskWeekPlan());
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, AdditionalWeekPlanResponse>> saveProjectTaskAdditional({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveProjectTaskAdditional(payload: payload);

      if (res.status == 1) {
        return right(res.data ?? const AdditionalWeekPlanResponse());
      }

      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
