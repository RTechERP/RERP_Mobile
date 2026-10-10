import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/model/solution_model.dart';

/// Repository interface cho Giải pháp.
abstract class SolutionRepo {
  /// Lấy danh sách giải pháp theo projectRequestId.
  Future<Either<BaseError, List<SolutionModel>>> getSolutions(int projectRequestId);
}
