import 'package:dartz/dartz.dart';
import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/salary_model.dart';
import '../datasource/models/salary_calendar.dart';

abstract class SalaryRepo {
  Future<Either<BaseError, SummarySalaryResponse>> getPersonalSyntheticByMonth({
    required int year,
    required int month,
  });

  Future<Either<BaseError, SalaryCalendarItem>> getCalendar({
    required int month,
    required int year,
  });
}
