import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/summary_overnight_model.dart';
import '../datasource/service/summary_overnight_service.dart';
import 'summary_overnight_repo.dart';

/// Triển khai repo: ánh xạ dữ liệu và xử lý lỗi.
@LazySingleton(as: SummaryOvernightRepo)
class SummaryOvernightRepoImpl implements SummaryOvernightRepo {
  final SummaryOvernightService _service;

  SummaryOvernightRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<SummaryOvernightItem>>> getOvernight({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getOvernight(payload: payload);
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
  Future<Either<BaseError, List<SummaryOvernightDepartment>>> getDepartments() async {
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
}