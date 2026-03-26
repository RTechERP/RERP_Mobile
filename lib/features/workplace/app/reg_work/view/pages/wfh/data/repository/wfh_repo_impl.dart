import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/wfh_model.dart';
import '../datasource/service/wfh_service.dart';
import 'wfh_repo.dart';

@LazySingleton(as: WfhRepo)
class WfhRepoImpl implements WfhRepo {
  final WfhService _service;

  WfhRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<WfhItem>>> getWfh({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getWfh(payload: payload);

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
  Future<Either<BaseError, void>> saveWfh({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveWfh(payload: payload);

      if (res.status == 1) {
        return right(res.message ?? "Lưu dữ liệu thành công");
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
}
