// Repository contract cho Personal Summary — chỉ phơi ra hàm getPersonalSummary,
// các nhóm phiếu sẽ được bloc xử lý (flatten + tab/filter).
import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/personal_summary_model.dart';

abstract class PersonalSummaryRepo {
  /// Tải tổng hợp 7 nhóm phiếu cá nhân trong khoảng ngày [payload].
  Future<Either<BaseError, PersonalSummaryData>> getPersonalSummary({
    required Map<String, dynamic> payload,
  });

  /// Lấy dữ liệu vân tay (chấm công) theo khoảng ngày + từ khoá.
  /// `query` chứa departmentID, employeeID, keyword, dateStart (yyyy-MM-dd),
  /// dateEnd (yyyy-MM-dd).
  Future<Either<BaseError, List<PersonalAttendanceItem>>>
      getEmployeeAttendance({
    required Map<String, dynamic> query,
  });
}
