import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/summary_overtime_model.dart';

/// Repository trừu tượng cho màn tổng hợp phiếu làm thêm.
abstract class SummaryOvertimeRepo {
  /// Lấy dữ liệu tổng hợp phiếu OT + xếp hạng theo payload điều kiện.
  Future<Either<BaseError, SummaryOvertimePayload>> getOvertimeSummary({
    required Map<String, dynamic> payload,
  });

  /// Lấy danh sách phòng ban cho bộ lọc.
  Future<Either<BaseError, List<SummaryOvertimeDepartment>>> getDepartments();

  /// Lấy danh sách nhân viên phục vụ picker.
  Future<Either<BaseError, List<SummaryOvertimeEmployee>>> getEmployees({
    int status = 0,
    int departmentId = 0,
    String keyword = '',
  });
}