import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/summary_overtime_model.dart';
import '../datasource/service/summary_overtime_service.dart';
import 'summary_overtime_repo.dart';

/// Triển khai repo: ánh xạ dữ liệu và xử lý lỗi.
@LazySingleton(as: SummaryOvertimeRepo)
class SummaryOvertimeRepoImpl implements SummaryOvertimeRepo {
  final SummaryOvertimeService _service;

  SummaryOvertimeRepoImpl(this._service);

  @override
  Future<Either<BaseError, SummaryOvertimePayload>> getOvertimeSummary({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getOvertimeSummary(payload: payload);
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<SummaryOvertimeDepartment>>> getDepartments() async {
    try {
      final res = await _service.getDepartments();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<SummaryOvertimeEmployee>>> getEmployees({
    int status = 0,
    int departmentId = 0,
    String keyword = '',
  }) async {
    try {
      final res = await _service.getEmployees(
        status: status,
        departmentId: departmentId,
        keyword: keyword,
      );
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}