import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/summary_missed_model.dart';

/// Repository trừu tượng cho màn tổng hợp phiếu quên chấm công.
abstract class SummaryMissedRepo {
  /// Lấy danh sách phiếu quên chấm công theo payload điều kiện.
  Future<Either<BaseError, List<SummaryMissedItem>>> getMissed({
    required Map<String, dynamic> payload,
  });

  /// Lấy danh sách phòng ban cho bộ lọc.
  Future<Either<BaseError, List<SummaryMissedDepartment>>> getDepartments();
}