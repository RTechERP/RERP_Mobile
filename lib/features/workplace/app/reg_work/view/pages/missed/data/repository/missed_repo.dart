
import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/missed_model.dart';

abstract class MissedRepo{
  Future<Either<BaseError, List<MissedItem>>> getMissed({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<ApproverItem>>> getApprover();

  Future<Either<BaseError, void>> saveMissed({
    required Map<String, dynamic> payload,
  });

  /// Trả về `true` nếu **đã trùng** (cần chặn), `false` nếu được phép gửi save.
  Future<Either<BaseError, bool>> checkMissedDuplicate({
    required int contextId,
    required int employeeId,
    required DateTime dateMissed,
    required int type,
  });
}