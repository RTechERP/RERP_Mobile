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

  /// Lấy chi tiết một phiếu ĐNTT theo `id`. [isAccommodation] = true gọi API
  /// Công tác phí (nhà nghỉ), ngược lại gọi API Chi phí phương tiện.
  Future<Either<BaseError, ApproveBookingPaymentDetail>> getById({
    required int id,
    bool includeDeleted = false,
    bool isAccommodation = false,
  });

  /// Lấy lịch sử duyệt của một phiếu ĐNTT, chọn API theo [isAccommodation].
  Future<Either<BaseError, List<ApproveBookingPaymentLog>>> getLogs({
    required int paymentOrderId,
    bool isAccommodation = false,
  });

  /// TBP duyệt ([isApproved] = true, kèm [note] tuỳ chọn) hoặc từ chối
  /// ([isApproved] = false, kèm [reasonCancel]) một ĐNTT Công tác phí.
  /// Trả `right(true)` khi BE xác nhận thành công.
  Future<Either<BaseError, bool>> approveTbp({
    required int paymentOrderId,
    required bool isApproved,
    String? note,
    String? reasonCancel,
  });
}
