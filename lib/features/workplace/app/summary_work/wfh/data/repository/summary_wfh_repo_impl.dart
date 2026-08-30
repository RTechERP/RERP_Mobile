import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/summary_wfh_model.dart';
import '../datasource/service/summary_wfh_service.dart';
import 'summary_wfh_repo.dart';

@LazySingleton(as: SummaryWfhRepo)
class SummaryWfhRepoImpl implements SummaryWfhRepo {
  final SummaryWfhService _service;

  SummaryWfhRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<SummaryWfhItem>>> getWfh({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getWfh(payload: payload);
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
  Future<Either<BaseError, List<SummaryWfhDepartment>>> getDepartments() async {
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
