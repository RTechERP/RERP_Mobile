// Repository cho màn Duyệt ĐNTT Đặt xe / Nhà nghỉ — hợp đồng dữ liệu.

import 'package:dartz/dartz.dart';

import '../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/approve_booking_payment_model.dart';

/// Hợp đồng truy xuất dữ liệu cho màn duyệt ĐNTT đặt xe / nhà nghỉ.
abstract class ApproveBookingPaymentRepo {
  /// Lấy danh sách bước duyệt ĐNTT.
  Future<Either<BaseError, List<ApproveBookingPaymentStep>>> getApproveSteps();

  /// Lấy một trang ĐNTT theo [payload] (ngày, người tạo,
  /// từ khoá, PageIndex, PageSize...).
  Future<Either<BaseError, List<ApproveBookingPaymentItem>>> getUnifiedList({
    required Map<String, dynamic> payload,
  });

  /// Lấy danh sách phòng ban cho bộ lọc.
  Future<Either<BaseError, List<ApproveBookingPaymentDepartment>>>
      getDepartments();

  /// Lấy danh sách nhân viên cho bộ lọc người tạo.
  Future<Either<BaseError, List<ApproveBookingPaymentEmployee>>> getEmployees({
    String keyword,
  });
}
