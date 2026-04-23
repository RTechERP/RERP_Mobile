// ignore_for_file: unused_field

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/week_plan_model.dart';
import '../datasource/service/week_plan_service.dart';
import 'week_plan_repo.dart';

@LazySingleton(as: WeekPlanRepo)
class WeekPlanRepoImpl implements WeekPlanRepo {
  WeekPlanRepoImpl(this._service);

  final WeekPlanService _service;

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
  Future<Either<BaseError, List<WeekPlanTaskItem>>> getTasks({required Map<String, dynamic> payload}) {
    throw UnimplementedError();
  }

}
