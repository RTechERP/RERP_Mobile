import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/newsfeed_model.dart';
import '../datasource/service/newsfeed_service.dart';
import 'newsfeed_repo.dart';

@LazySingleton(as: NewsfeedRepo)
class NewsfeedRepoImpl implements NewsfeedRepo {
  final NewsfeedService _service;
  NewsfeedRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<NewsletterItem>>> getNewsfeed() async {
    try {
      final res = await _service.getNewsfeed();

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
  Future<Either<BaseError, CalendarItem>> getCalendar({
    required int month,
    required int year,
  }) async {
    try {
      final res = await _service.getCalendar(month: month, year: year);
      final data = res.data ?? res.result;
      if (res.status == 1 && data != null) {
        return right(data);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
