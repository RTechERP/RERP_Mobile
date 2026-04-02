import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/overnight_model.dart';

abstract class OvernightRepo {
  Future<Either<BaseError, List<OvernightItem>>> getOverNight({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<ApproverItem>>> getApprover();

  Future<Either<BaseError, void>> saveOverNight({
    required dynamic payload,
  });
}
