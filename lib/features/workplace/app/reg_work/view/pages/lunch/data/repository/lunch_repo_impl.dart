import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/lunch/data/datasource/models/lunch_model.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/service/lunch_service.dart';
import 'lunch_repo.dart';

@LazySingleton(as: LunchRepo)
class LunchRepoImpl implements LunchRepo {
  final LunchService _service;

  LunchRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<LunchItem>>> getLunch({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getLunch(payload: payload);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        return left(
          BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, SaveLunchItem>> saveLunch({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveLunch(payload: payload);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        return left(
          BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
