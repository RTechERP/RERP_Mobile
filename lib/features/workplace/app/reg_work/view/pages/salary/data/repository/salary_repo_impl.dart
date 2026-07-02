import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/salary_model.dart';
import '../datasource/service/salary_service.dart';
import 'salary_repo.dart';

@LazySingleton(as: SalaryRepo)
class SalaryRepoImpl implements SalaryRepo {
  SalaryRepoImpl(this._service);

  final SalaryService _service;

  @override
  Future<Either<BaseError, SummarySalaryResponse>> getPersonalSyntheticByMonth({
    required int year,
    required int month,
  }) async {
    try {
      final res = await _service.getPersonalSyntheticByMonth(
        year: year,
        month: month,
      );
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
