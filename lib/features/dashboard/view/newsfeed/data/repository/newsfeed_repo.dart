import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';

import '../datasource/models/newsfeed_model.dart';

abstract class NewsfeedRepo {
  Future<Either<BaseError, List<NewsletterItem>>> getNewsfeed();

  Future<Either<BaseError, NewsletterDetailItem>> getNewsfeedDetail({
    required int id,
  });

  Future<Either<BaseError, List<NewsletterFileItem>>> getNewsfeedFiles({
    required int newsletterId,
  });

  Future<Either<BaseError, CalendarItem>> getCalendar({
    required int month,
    required int year,
  });
}
