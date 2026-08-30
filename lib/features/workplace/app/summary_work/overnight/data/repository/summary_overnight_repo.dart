import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/summary_overnight_model.dart';

/// Repository trừu tượng cho màn tổng hợp phiếu làm đêm.
abstract class SummaryOvernightRepo {
  /// Lấy danh sách phiếu làm đêm theo payload điều kiện.
  Future<Either<BaseError, List<SummaryOvernightItem>>> getOvernight({
    required Map<String, dynamic> payload,
  });

  /// Lấy danh sách phòng ban cho bộ lọc.
  Future<Either<BaseError, List<SummaryOvernightDepartment>>> getDepartments();
}