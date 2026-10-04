// Repository cho module Đặt phòng nhà nghỉ — hợp đồng dữ liệu.

import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/booking_guest_house_model.dart';

/// Hợp đồng truy xuất dữ liệu Đặt phòng nhà nghỉ.
abstract class BookingGuestHouseRepo {
  /// Lấy danh sách phiếu đặt phòng nhà nghỉ trong khoảng thời gian.
  ///
  /// - [dateStart], [dateEnd]: ISO string (`yyyy-MM-ddTHH:mm:ss.000Z`).
  /// - [projectId], [employeeId]: bộ lọc (mặc định `0` = tất cả).
  /// - [filterText]: từ khoá tìm kiếm.
  Future<Either<BaseError, List<BookingGuestHouseItem>>> getBookingGuestHouse({
    required String dateStart,
    required String dateEnd,
    int projectId,
    int employeeId,
    String filterText,
  });

  /// Lấy danh sách dự án cho bộ lọc.
  Future<Either<BaseError, List<ProjectFilterItem>>> getProjects();

  /// Lấy danh sách nhân viên cho bộ lọc người đăng ký.
  /// [keyword] - từ khoá tìm kiếm theo tên/SDT/mã nhân viên.
  Future<Either<BaseError, List<EmployeeFilterItem>>> getEmployees({
    String keyword,
  });

  /// Lấy danh sách tỉnh/thành phục vụ lọc lưu trú.
  /// [employeeId] - ID nhân viên (mặc định `0` = tất cả).
  Future<Either<BaseError, List<ProvinceFilterItem>>> getProvinces({
    int employeeId,
  });

  /// Lưu phiếu đặt phòng nhà nghỉ.
  /// Body: `{ "accommodationBooking": {...}, "accommodationBookingDetails": [...], "idDeleteds": [] }`.
  Future<Either<BaseError, BookingGuestHouseSaveResponse>>
      saveBookingGuestHouse({
    required Map<String, dynamic> payload,
  });
}