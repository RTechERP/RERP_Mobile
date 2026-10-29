import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/summary_customer_model.dart';
import '../datasource/service/summary_customer_service.dart';
import 'summary_customer_repo.dart';

/// Triển khai repo: ánh xạ dữ liệu và xử lý lỗi.
@LazySingleton(as: SummaryCustomerRepo)
class SummaryCustomerRepoImpl implements SummaryCustomerRepo {
  final SummaryCustomerService _service;

  SummaryCustomerRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<SummaryCustomerItem>>> getCustomerSynthetic() async {
    try {
      final res = await _service.getCustomerSynthetic();
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
