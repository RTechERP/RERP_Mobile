
import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/lunch_model.dart';

abstract class LunchRepo{
  Future<Either<BaseError, List<LunchItem>>> getLunch({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, SaveLunchItem>> saveLunch({
    required Map<String, dynamic> payload,
  });
}