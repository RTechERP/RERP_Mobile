import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/timekeeping_model.dart';
import '../datasource/service/timekeeping_service.dart';
import 'timekeeping_repo.dart';

@LazySingleton(as: TimekeepingRepo)
class TimekeepingRepoImpl implements TimekeepingRepo {
  TimekeepingRepoImpl(this._service);

  final TimekeepingService _service;

  @override
  Future<Either<BaseError, List<TimekeepingItem>>> getTimekeeping({
    required int month,
    required int year,
    int? employeeId,
  }) async {
    try {
      final res = await _service.getTimekeeping(
        month: month,
        year: year,
        employeeId: employeeId,
      );
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<TimekeepingDayItem>>> getTimekeepingDays({
    required int month,
    required int year,
    int? employeeId,
  }) async {
    try {
      final res = await _service.getTimekeepingDays(
        month: month,
        year: year,
        employeeId: employeeId,
      );
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
