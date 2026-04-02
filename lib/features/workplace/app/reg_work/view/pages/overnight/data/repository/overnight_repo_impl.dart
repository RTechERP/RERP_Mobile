import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/overnight_model.dart';
import '../datasource/service/overnight_service.dart';
import 'overnight_repo.dart';

@LazySingleton(as: OvernightRepo)
class OvernightRepoImpl implements OvernightRepo {
  final OverNightService _service;

  OvernightRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<ApproverItem>>> getApprover() async {
    try {
      final res = await _service.getApprover();
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
  Future<Either<BaseError, List<OvernightItem>>> getOverNight({required Map<String, dynamic> payload}) async {
    try {
      final res = await _service.getOverNight(payload: payload);
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
  Future<Either<BaseError, void>> saveOverNight({required dynamic payload}) async {
    try {
      final res = await _service.saveOverNight(payload: payload);
      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Lưu dữ liệu thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }


}
