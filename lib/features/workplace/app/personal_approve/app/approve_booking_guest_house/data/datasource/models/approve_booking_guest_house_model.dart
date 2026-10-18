// Model cho màn Duyệt phiếu thanh toán Đặt phòng nhà nghỉ.
// Tương ứng API: GET /AccommodationBookingPaymentOrder/get-pending-for-tbp

import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_booking_guest_house_model.freezed.dart';
part 'approve_booking_guest_house_model.g.dart';

/// Một bản ghi thanh toán đặt phòng nhà nghỉ trả về từ API (màn duyệt TBP).
@freezed
class ApproveBookingGuestHouseItem with _$ApproveBookingGuestHouseItem {
  const factory ApproveBookingGuestHouseItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'AccommodationBookingPaymentOrderID') int?
        accommodationBookingPaymentOrderId,
    @JsonKey(name: 'AccommodationBookingID') int? accommodationBookingId,
    @JsonKey(name: 'DetailStatus') int? detailStatus,
    @JsonKey(name: 'Reason') String? reason,

    // Người đăng ký
    @JsonKey(name: 'RecipientName') String? recipientName,
    @JsonKey(name: 'RegisterFullName') String? registerFullName,

    // Ngân hàng
    @JsonKey(name: 'BankAccount') String? bankAccount,
    @JsonKey(name: 'BankName') String? bankName,

    // Khách sạn / công ty / phòng ban
    @JsonKey(name: 'HotelName') String? hotelName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'CompanyName') String? companyName,

    // Tiền
    @JsonKey(name: 'TotalAmount') double? totalAmount,
    @JsonKey(name: 'TotalAmountWithInvoice') double? totalAmountWithInvoice,
    @JsonKey(name: 'InvoiceNumber') String? invoiceNumber,

    // Audit
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'SubmitDate') DateTime? submitDate,

    // Thời gian ở
    @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
    @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate,

    // Loại
    @JsonKey(name: 'Type') String? type,

    // Files đính kèm
    @JsonKey(name: 'Files') List<ApproveBookingFile>? files,
  }) = _ApproveBookingGuestHouseItem;

  factory ApproveBookingGuestHouseItem.fromJson(Map<String, dynamic> json) =>
      _$ApproveBookingGuestHouseItemFromJson(json);
}

/// File đính kèm của phiếu thanh toán.
@freezed
class ApproveBookingFile with _$ApproveBookingFile {
  const factory ApproveBookingFile({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'FileType') String? fileType,
    @JsonKey(name: 'Url') String? url,
  }) = _ApproveBookingFile;

  factory ApproveBookingFile.fromJson(Map<String, dynamic> json) =>
      _$ApproveBookingFileFromJson(json);
}

/// Model dự án cho bộ lọc (màn duyệt) — dùng chung contract với màn đăng ký.
/// Tương ứng API: GET /ProjectTask/get-all-project
@freezed
class ApproveProjectFilterItem with _$ApproveProjectFilterItem {
  const factory ApproveProjectFilterItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
  }) = _ApproveProjectFilterItem;

  factory ApproveProjectFilterItem.fromJson(Map<String, dynamic> json) =>
      _$ApproveProjectFilterItemFromJson(json);
}

/// Model nhân viên (người đăng ký) cho bộ lọc (màn duyệt).
/// Tương ứng API: GET /Employee?status=0&departmentID=0&keyword=
@freezed
class ApproveEmployeeFilterItem with _$ApproveEmployeeFilterItem {
  const factory ApproveEmployeeFilterItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
  }) = _ApproveEmployeeFilterItem;

  factory ApproveEmployeeFilterItem.fromJson(Map<String, dynamic> json) =>
      _$ApproveEmployeeFilterItemFromJson(json);
}
