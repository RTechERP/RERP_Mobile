// Repository contract cho Personal Summary — phơi ra getPersonalSummary,
// getEmployeeAttendance (tab Vân tay) và getDepartments (phục vụ lọc phòng
// ban trong bottom sheet).
import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../summary_work/leave/data/datasource/models/summary_leave_model.dart';
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

  /// Lấy danh sách phòng ban (phục vụ bottom sheet lọc).
  Future<Either<BaseError, List<SummaryDepartment>>> getDepartments();
}
