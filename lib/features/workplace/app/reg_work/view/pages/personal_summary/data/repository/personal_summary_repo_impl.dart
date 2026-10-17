// Repository impl: gọi service và chuyển lỗi mạng về BaseError.
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/personal_summary_model.dart';
import '../datasource/service/personal_summary_service.dart';
import 'personal_summary_repo.dart';

@LazySingleton(as: PersonalSummaryRepo)
class PersonalSummaryRepoImpl implements PersonalSummaryRepo {
  final PersonalSummaryService _service;

  PersonalSummaryRepoImpl(this._service);

  @override
  Future<Either<BaseError, PersonalSummaryData>> getPersonalSummary({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getPersonalSummary(payload: payload);
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Không tải được tổng hợp phiếu',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
