// ignore_for_file: unused_field

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
  Future<Either<BaseError, WeekPlanTaskItem>> createTask({
    required Map<String, dynamic> payload,
  }) async {
    throw UnimplementedError();
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
}
