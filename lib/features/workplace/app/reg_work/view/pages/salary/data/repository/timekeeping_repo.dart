import 'package:dartz/dartz.dart';
import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/timekeeping_model.dart';

abstract class TimekeepingRepo {
  Future<Either<BaseError, List<TimekeepingItem>>> getTimekeeping({
    required int month,
    required int year,
    int? employeeId,
  });

  Future<Either<BaseError, List<TimekeepingDayItem>>> getTimekeepingDays({
    required int month,
    required int year,
    int? employeeId,
  });
}
