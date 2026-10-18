import 'package:dartz/dartz.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/rental_vehicle/data/datasource/models/rental_vehicle_model.dart';

/// Repository trừu tượng hoá data source cho danh sách yêu cầu thuê xe tải.
abstract class RentalVehicleRepo {
  /// Tìm kiếm yêu cầu thuê xe tải theo khoảng ngày và bộ lọc.
  /// [payload] tối thiểu gồm: Keyword, StartDate, EndDate,
  /// EmployeeRequestID, EmployeeID, DepartmentID.
  Future<Either<BaseError, List<RentalVehicleItem>>> searchRentalVehicle({
    required Map<String, dynamic> payload,
  });

  /// Lấy danh sách nhân viên (dùng dropdown ở add/detail screen).
  /// - [status]: 0 = tất cả, 1 = đang làm việc...
  /// - [departmentId]: 0 = tất cả phòng ban
  /// - [keyword]: từ khoá tìm kiếm (mã / tên)
  Future<Either<BaseError, List<RentalVehicleEmployee>>> getEmployees({
    required int status,
    required int departmentId,
    required String keyword,
  });

  /// Lấy toàn bộ danh sách phòng ban (dùng dropdown ở add/detail screen).
  Future<Either<BaseError, List<RentalVehicleDepartment>>> getDepartments();

  /// Lấy danh sách dự án (dùng dropdown ở add screen).
  Future<Either<BaseError, List<RentalVehicleProject>>> getProjects();

  /// Lưu yêu cầu thuê xe tải (tạo mới / cập nhật).
  Future<Either<BaseError, bool>> saveData({
    required List<Map<String, dynamic>> payload,
  });

  /// Xoá yêu cầu thuê xe tải theo danh sách id.
  Future<Either<BaseError, bool>> deleteData({
    required List<int> ids,
  });
}
