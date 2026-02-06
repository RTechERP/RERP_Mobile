import 'package:dartz/dartz.dart';

import '../../../../../../base/network/errors/error.dart';
import '../datasource/models/report_model.dart';

abstract class ReportRepo {
  Future<Either<BaseError, List<ReportResponse>>> getDailyReportTech({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int teamId,
    required int userId,
    String? keyword,
    required int departmentId,
  });
}
