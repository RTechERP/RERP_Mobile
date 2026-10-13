// Repository cho màn Duyệt phiếu Đặt phòng nhà nghỉ — hợp đồng dữ liệu.

import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/approve_booking_guest_house_model.dart';

/// Hợp đồng truy xuất dữ liệu cho màn duyệt phiếu đặt phòng nhà nghỉ.
///
/// Tại thời điểm này màn duyệt chỉ cần 3 API: list phiếu + dự án + nhân viên
/// (filter). Các thao tác duyệt (approve / reject từng phiếu hoặc hàng loạt)
/// sẽ được bổ sung ở bước tiếp theo — hiện chỉ dừng ở phần hiển thị danh sách.
abstract class ApproveBookingGuestHouseRepo {
  /// Lấy danh sách phiếu đặt phòng nhà nghỉ trong khoảng thời gian.
  ///
  /// - [dateStart], [dateEnd]: ISO string (`yyyy-MM-ddTHH:mm:ss.000Z`).
  /// - [projectId], [employeeId]: bộ lọc (mặc định `0` = tất cả).
  /// - [filterText]: từ khoá tìm kiếm.
  Future<Either<BaseError, List<ApproveBookingGuestHouseItem>>>
      getApproveBookingGuestHouse({
    required String dateStart,
    required String dateEnd,
    int projectId,
    int employeeId,
    String filterText,
  });

  /// Lấy danh sách dự án cho bộ lọc.
  Future<Either<BaseError, List<ApproveProjectFilterItem>>>
      getApproveBookingGuestHouseProjects();

  /// Lấy danh sách nhân viên cho bộ lọc người đăng ký.
  /// [keyword] - từ khoá tìm kiếm theo tên/SDT/mã nhân viên.
  Future<Either<BaseError, List<ApproveEmployeeFilterItem>>>
      getApproveBookingGuestHouseEmployees({
    String keyword,
  });
}
