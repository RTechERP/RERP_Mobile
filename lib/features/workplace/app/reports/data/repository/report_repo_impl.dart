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
}


