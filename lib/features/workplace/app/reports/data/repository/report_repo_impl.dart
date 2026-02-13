import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';

import '../../../../../../base/network/errors/error.dart';
import '../../../../../../common/logger/index.dart';
import '../datasource/models/report_model.dart';
import '../datasource/service/report_service.dart';
import 'report_repo.dart';

@LazySingleton(as: ReportRepo)
class ReportRepoImpl implements ReportRepo {
  final ReportService _service;

  ReportRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<ReportResponse>>> getDailyReportTech({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String teamId,
    required String userId,
    required String keyword,
    required String departmentId,
  }) async {
    try {
      final res = await _service.getDailyReportTech(
        dateStart: dateStart,
        dateEnd: dateEnd,
        teamId: teamId,
        userId: userId,
        keyword: keyword,
        departmentId: departmentId,
      );

      return right(res.data ?? []);
    } on DioException catch (e) {
      final log = LogUtils();

      log.logE('Dio status: ${e.response?.statusCode}');
      log.logE('Dio data: ${e.response?.data}');

      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<DepartResponse>>> getDepart() async {
    try {
      final res = await _service.getDepart();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<ProjectResponse>>> getProject() async {
    try {
      final res = await _service.getProject();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<ProjectItemResponse>>> getProjectItemByUser({
    required int projectId,
    int status = 2,
  }) async {
    try {
      final res = await _service.getProjectItemByUser(
        projectId: projectId,
        status: status,
      );

      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, String>> saveReportTech({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveReportTechRaw(payload: payload);

      if (res.status == 1) {
        return right(res.message ?? 'Lưu dữ liệu thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Lưu dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, String>> sendMailReport({
    required SendMailRequestModel request,
  }) async {
    try {
      final res = await _service.sendMailReport(request: request);
      if (res.status == 1) {
        return right(res.message ?? 'Gửi email thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Gửi email thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
