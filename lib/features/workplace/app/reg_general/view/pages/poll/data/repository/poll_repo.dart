import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/poll_model.dart';

abstract class PollRepo {
  Future<Either<BaseError, List<PollItem>>> getPolls();

  Future<Either<BaseError, PollDetailItem>> getPollDetail({
    required int pollFormId,
  });

  Future<Either<BaseError, ResponseItem>> getMyResponse({
    required int pollFormId,
  });
}
