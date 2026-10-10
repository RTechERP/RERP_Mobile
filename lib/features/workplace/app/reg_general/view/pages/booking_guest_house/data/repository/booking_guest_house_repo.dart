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

  /// Lấy danh sách công ty phát hành hóa đơn — picker "Công ty" trong
  /// form Cập nhật TTQT + Đề nghị tạm ứng.
  /// API: GET /TaxCompany/get-tax-companies
  Future<Either<BaseError, List<TaxCompanyItem>>> getTaxCompanies();

  /// Lấy danh sách ngân hàng — picker "Ngân hàng" trong
  /// form Cập nhật TTQT + Đề nghị tạm ứng.
  /// API: GET /banklist
  Future<Either<BaseError, List<BankItem>>> getBankList();

  /// Lưu phiếu đặt phòng nhà nghỉ.
  /// Body: `{ "accommodationBooking": {...}, "accommodationBookingDetails": [...], "idDeleteds": [] }`.
  Future<Either<BaseError, BookingGuestHouseSaveResponse>>
      saveBookingGuestHouse({
    required Map<String, dynamic> payload,
  });

  /// Xoá phiếu đặt phòng nhà nghỉ.
  /// [ids] - danh sách ID phiếu cần xoá (API nhận mảng, ví dụ `[19]`).
  Future<Either<BaseError, void>> deleteBookingGuestHouse({
    required List<int> ids,
  });

  /// Lấy chi tiết 1 phiếu đặt phòng nhà nghỉ (kèm danh sách người ở).
  /// [id] - ID phiếu cần lấy.
  /// API: GET `/AccommodationBooking/accommodation-booking-by-id?id=<id>`
  Future<Either<BaseError, BookingGuestHouseDetailData>>
      getBookingGuestHouseById({
    required int id,
  });
}