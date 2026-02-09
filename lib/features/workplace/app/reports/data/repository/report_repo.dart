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

  Future<Either<BaseError, List<DepartResponse>>> getDepart();

  Future<Either<BaseError, List<ProjectResponse>>> getProject();

  Future<Either<BaseError, List<ProjectItemResponse>>> getProjectItemByUser({
    required int projectId,
    int status,
  });

  Future<Either<BaseError, String>> saveReportTech({
    required SaveReportTechRequest request,
  });

  Future<Either<BaseError, String>> saveReportTechRaw({
    required Map<String, dynamic> payload,
  });

}
