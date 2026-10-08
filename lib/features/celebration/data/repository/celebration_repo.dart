import 'package:dartz/dartz.dart';

import '../../../../../base/network/errors/error.dart';
import '../datasource/model/celebration_model.dart';

/// Repository interface for celebration (birthday/seniority) operations.
abstract class CelebrationRepo {
  /// Check birthday and seniority for the current user.
  Future<Either<BaseError, CelebrationItem>> checkBirthdaySeniority();
}