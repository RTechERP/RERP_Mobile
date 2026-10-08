import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/summary_leave_model.dart';
import '../datasource/service/summary_leave_service.dart';
import 'summary_leave_repo.dart';

@LazySingleton(as: SummaryLeaveRepo)
class SummaryLeaveRepoImpl implements SummaryLeaveRepo {
  final SummaryLeaveService _service;

  SummaryLeaveRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<SummaryLeaveItem>>> getLeave({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getLeave(payload: payload);
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
  Future<Either<BaseError, List<SummaryDepartment>>> getDepartments() async {
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
