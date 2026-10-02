// Model đặt phòng nhà nghỉ (Accommodation Booking).
// Tương ứng API: GET /AccommodationBooking/data-accommodation-booking

import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_guest_house_model.freezed.dart';
part 'booking_guest_house_model.g.dart';

/// Một bản ghi đặt phòng nhà nghỉ trả về từ API.
@freezed
class BookingGuestHouseItem with _$BookingGuestHouseItem {
  const factory BookingGuestHouseItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'RegisterID') int? registerId,
    @JsonKey(name: 'ProjectID') int? projectId,

    // Thông tin nhân viên đặt
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,

    // Thông tin dự án
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,

    // Địa điểm
    @JsonKey(name: 'ProvinceID') int? provinceId,
    @JsonKey(name: 'ProvinceName') String? provinceName,
    @JsonKey(name: 'Address') String? address,

    // Thời gian
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,

    // Ghi chú
    @JsonKey(name: 'Note') String? note,

    // Người cùng phòng
    @JsonKey(name: 'Roommates') String? roommates,

    // Audit
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,

    // Duyệt TBP
    @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
    @JsonKey(name: 'ApprovedTBP') dynamic approvedTBP,
    @JsonKey(name: 'ApprovedTBPDate') DateTime? approvedTBPDate,
    @JsonKey(name: 'FullNameTBP') String? fullNameTBP,

    // Thanh toán
    @JsonKey(name: 'PaymentApprovedTBPID') int? paymentApprovedTBPId,
    @JsonKey(name: 'PaymentFullNameTBP') String? paymentFullNameTBP,
    @JsonKey(name: 'PaymentDetailStatus') int? paymentDetailStatus,
    @JsonKey(name: 'PaymentRecipientName') String? paymentRecipientName,
    @JsonKey(name: 'PaymentBankName') String? paymentBankName,
    @JsonKey(name: 'PaymentBankAccount') String? paymentBankAccount,
    @JsonKey(name: 'PaymentHotelName') String? paymentHotelName,
    @JsonKey(name: 'PaymentCompanyID') int? paymentCompanyId,
    @JsonKey(name: 'PaymentCompanyName') String? paymentCompanyName,
    @JsonKey(name: 'PaymentTotalAmount') num? paymentTotalAmount,
    @JsonKey(name: 'PaymentTotalAmountWithInvoice') num? paymentTotalAmountWithInvoice,
    @JsonKey(name: 'PaymentInvoiceNumber') String? paymentInvoiceNumber,
    @JsonKey(name: 'PaymentReason') String? paymentReason,
    @JsonKey(name: 'PaymentNote') String? paymentNote,
    @JsonKey(name: 'PaymentInvoiceFileCount') int? paymentInvoiceFileCount,
    @JsonKey(name: 'PaymentBillCKFileCount') int? paymentBillCkFileCount,
  }) = _BookingGuestHouseItem;

  factory BookingGuestHouseItem.fromJson(Map<String, dynamic> json) =>
      _$BookingGuestHouseItemFromJson(json);
}

/// Model dự án cho bộ lọc.
// Tương ứng API: GET /ProjectTask/get-all-project
@freezed
class ProjectFilterItem with _$ProjectFilterItem {
  const factory ProjectFilterItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
  }) = _ProjectFilterItem;

  factory ProjectFilterItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectFilterItemFromJson(json);
}

/// Model nhân viên (người đăng ký) cho bộ lọc.
// Tương ứng API: GET /Employee?status=0&departmentID=0&keyword=
@freezed
class EmployeeFilterItem with _$EmployeeFilterItem {
  const factory EmployeeFilterItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'FullName') String? fullName,
  }) = _EmployeeFilterItem;

  factory EmployeeFilterItem.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFilterItemFromJson(json);
}