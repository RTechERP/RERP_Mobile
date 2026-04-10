import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/in_out_model.dart';
import '../datasource/service/in_out_service.dart';
import 'in_out_repo.dart';

@LazySingleton(as: InOutRepo)
class InOutRepoImpl implements InOutRepo {
  final InOutService _service;

  InOutRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<InOutItem>>> getInOut({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getInOut(payload: payload);

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
  Future<Either<BaseError, void>> saveInOut({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveInOut(payload: payload);

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

  @override
  Future<Either<BaseError, FillApproverItem>> getFillApprover({
    required int employeeID,
    required String tableName,
  }) async {
    try{
      final res = await _service.getFillApprover(employeeID: employeeID, tableName: tableName);
      if(res.status == 1 && res.data != null){
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e){
      return left(e.baseError);
    }
  }
}
