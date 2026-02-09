import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';

import '../../../../../../base/network/errors/error.dart';
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
    required int teamId,
    required int userId,
    String? keyword,
    required int departmentId,
  }) async {
    try {
      final res = await _service.getDailyReportTech(
        dateStart,
        dateEnd,
        teamId,
        userId,
        keyword,
        departmentId,
      );

      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<DepartResponse>>> getDepart() async{
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
    required SaveReportTechRequest request,
  }) async {
    try {
      final res = await _service.saveReportTech(request: request);

      // API trả status = 1 là success
      if (res.status == 1) {
        return right(res.message ?? 'Lưu dữ liệu thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(res.message ?? 'Lưu dữ liệu thất bại'),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, String>> saveReportTechRaw({
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
}


