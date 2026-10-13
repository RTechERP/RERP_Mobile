// Repository cho màn Duyệt phiếu thanh toán Đặt phòng nhà nghỉ — hợp đồng dữ liệu.

import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/approve_booking_guest_house_model.dart';

/// Hợp đồng truy xuất dữ liệu cho màn duyệt phiếu thanh toán đặt phòng nhà nghỉ.
abstract class ApproveBookingGuestHouseRepo {
  /// Lấy danh sách phiếu thanh toán chờ duyệt TBP.
  Future<Either<BaseError, List<ApproveBookingGuestHouseItem>>>
      getPendingForTbp();

  /// Lấy danh sách dự án cho bộ lọc.
  Future<Either<BaseError, List<ApproveProjectFilterItem>>>
      getApproveBookingGuestHouseProjects();

  /// Lấy danh sách nhân viên cho bộ lọc người đăng ký.
  Future<Either<BaseError, List<ApproveEmployeeFilterItem>>>
      getApproveBookingGuestHouseEmployees({String keyword});
}
