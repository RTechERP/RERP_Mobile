import 'package:dartz/dartz.dart';

import '../../../../../../base/network/errors/error.dart';
import '../datasource/models/report_model.dart';

abstract class ReportRepo {
  /// Danh sách báo cáo hàng ngày
  Future<Either<BaseError, List<ReportResponse>>> getDailyReportTech({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String teamId,
    required String userId,
    required String keyword,
    required String departmentId,
  });

  /// Danh sách phòng ban
  Future<Either<BaseError, List<DepartResponse>>> getDepart();

  /// Danh sách dự án
  Future<Either<BaseError, List<ProjectResponse>>> getProject();

  /// Danh sách hạng mục công việc theo dự án
  Future<Either<BaseError, List<ProjectItemResponse>>> getProjectItemByUser({
    required int projectId,
    int status,
  });

  /// Lưu báo cáo công việc "Phòng Kỹ thuật"
  Future<Either<BaseError, String>> saveReportTech({
    required Map<String, dynamic> payload,
  });

  /// Gửi mail báo cáo phòng kỹ thuật
  Future<Either<BaseError, String>> sendMailReport({
    required SendMailRequestModel request,
  });

  /// Lấy chi tiết báo cáo theo ID
  Future<Either<BaseError, DetailReportResponse>> getById({
    required int dailyID,
  });

  /// Xoá báo cáo theo ID
  Future<Either<BaseError, String>> deleteReportById({required int dailyID});
}
