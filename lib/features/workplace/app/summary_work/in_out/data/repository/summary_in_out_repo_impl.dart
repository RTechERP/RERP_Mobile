import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/summary_in_out_model.dart';
import '../datasource/service/summary_in_out_service.dart';
import 'summary_in_out_repo.dart';

@LazySingleton(as: SummaryInOutRepo)
class SummaryInOutRepoImpl implements SummaryInOutRepo {
  final SummaryInOutService _service;

  SummaryInOutRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<SummaryInOutItem>>> getInOut({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getInOut(payload: payload);
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
  Future<Either<BaseError, List<SummaryInOutDepartment>>> getDepartments() async {
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
