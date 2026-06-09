import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/poll_model.dart';
import '../datasource/service/poll_service.dart';
import 'poll_repo.dart';

@LazySingleton(as: PollRepo)
class PollRepoImpl implements PollRepo {
  final PollService _service;

  PollRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<PollItem>>> getPolls() async {
    try {
      final res = await _service.getPolls();

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
  Future<Either<BaseError, PollDetailItem>> getPollDetail({
    required int pollFormId,
  }) async {
    try {
      final res = await _service.getPollDetail(pollFormId: pollFormId);

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
  Future<Either<BaseError, ResponseItem>> getMyResponse({
    required int pollFormId,
  }) async {
    try {
      final res = await _service.getMyResponse(pollFormId: pollFormId);

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
