
import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/wfh_model.dart';

abstract class WfhRepo{
  Future<Either<BaseError, List<WfhItem>>> getWfh({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<ApproverItem>>> getApprover();

  Future<Either<BaseError, void>> saveWfh({
    required Map<String, dynamic> payload,
  });
}