// Repository cho module Đặt phòng nhà nghỉ — hợp đồng dữ liệu.

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

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

  /// Lấy chi tiết TT Quyết toán (TTQT) theo `accommodationBookingId`.
  /// Dùng để pre-fill form Cập nhật TTQT. Trả về `null` trong
  /// `Either.right(null)` khi chưa có TTQT (DetailStatus = 0 / null /
  /// response rỗng).
  /// API: `GET /AccommodationBookingPaymentOrder/get-detail-by-booking-id?accommodationBookingId=<id>`
  Future<Either<BaseError, BookingGuestHousePaymentDetailItem?>>
      getPaymentOrderDetailByBookingId({
    required int id,
  });

  /// Tạo / tạo lại đề nghị tạm ứng (ĐNTU) cho 1 phiếu đặt phòng nhà nghỉ.
  /// [payload] - body gửi lên BE theo `AccommodationBookingAdvanceRequest`
  /// (xem mục 4.6 spec — gồm AccommodationBookingID, ApprovedTBPID,
  /// Reason, ProjectID, TransferType, BankAccount, BankListID, BankName,
  /// TotalAmount, Note, CompanyID, CompanyName, DepartmentName,
  /// RecipientName).
  /// API: POST `/AccommodationBookingPaymentOrder/create-advance`.
  /// Response có `data.IsRecreated = true` khi BE tạo lại trên master cũ
  /// (sau khi phiếu bị hủy duyệt ở bước hiện tại).
  Future<Either<BaseError, BookingGuestHouseAdvanceResponse>>
      createBookingGuestHouseAdvance({
    required Map<String, dynamic> payload,
  });

  /// Lưu cập nhật TT Quyết toán (TTQT) standalone cho 1 phiếu đặt phòng
  /// nhà nghỉ. [payload] - body gửi lên BE theo
  /// `AccommodationBookingPaymentOrderRequest` (mục 4.7 spec) — 19 field:
  /// ID, TotalAmount, TotalAmountWithInvoice, InvoiceNumber, BankAccount,
  /// BankListID, BankName, TransferType, ApprovedTBPID, Reason, ProjectID,
  /// CompanyID, CompanyName, DepartmentName, Note, AccommodationBookingID,
  /// DetailStatus (= 2: chờ duyệt), HotelName, HotelTaxCode.
  /// API: POST `/AccommodationBookingPaymentOrder/save-standalone-detail`.
  /// Response: `{ status, message, data: { ID, DetailStatus } }`.
  Future<Either<BaseError, BookingGuestHouseSaveDetailResponse>>
      saveBookingGuestHouseStandaloneDetail({
    required Map<String, dynamic> payload,
  });

  /// Upload 1 file đính kèm (hóa đơn / bill CK) cho 1 detail TTQT.
  /// [detailId] - ID detail (lấy từ `save-standalone-detail` response).
  /// [fileType] - "INVOICE" hoặc "BILL_CK".
  /// [file] - 1 file duy nhất (multipart form-data). Để upload nhiều
  /// file cùng loại → gọi nhiều lần.
  /// API: POST `/AccommodationBookingPaymentOrder/upload-file`.
  Future<Either<BaseError, BookingGuestHouseFileItem>>
      uploadBookingGuestHouseFile({
    required int detailId,
    required String fileType,
    required PlatformFile file,
  });

  /// Xoá 1 file đính kèm của 1 detail TTQT.
  /// [fileId] - ID của `BookingGuestHouseFileItem` cần xoá.
  /// API: POST `/AccommodationBookingPaymentOrder/remove-file`.
  /// Quyền: chỉ user khớp `CreatedBy` của file mới được xoá — UI
  /// ẩn nút 🗑️, BE cũng validate server-side.
  Future<Either<BaseError, void>> removeBookingGuestHouseFile({
    required int fileId,
  });
}