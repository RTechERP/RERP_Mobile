import 'package:dartz/dartz.dart';

import '../../../../../../base/network/errors/error.dart';
import '../datasource/models/report_model.dart';

abstract class ReportRepo {
  Future<Either<BaseError, List<ReportResponse>>> getDailyReportTech({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String teamId,
    required String userId,
    required String keyword,
    required String departmentId,
  });

  Future<Either<BaseError, List<DepartResponse>>> getDepart();

  Future<Either<BaseError, List<ProjectResponse>>> getProject();

  Future<Either<BaseError, List<ProjectItemResponse>>> getProjectItemByUser({
    required int projectId,
    int status,
  });

  Future<Either<BaseError, String>> saveReportTech({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, String>> sendMailReport({
    required SendMailRequestModel request,
  });
}
