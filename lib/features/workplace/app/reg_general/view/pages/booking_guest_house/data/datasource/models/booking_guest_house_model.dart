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

/// Model nhân viên (người đăng ký) cho bộ lọc + dùng để fill thông tin người ở.
// Tương ứng API: GET /Employee?status=0&departmentID=0&keyword=
@freezed
class EmployeeFilterItem with _$EmployeeFilterItem {
  const factory EmployeeFilterItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
  }) = _EmployeeFilterItem;

  factory EmployeeFilterItem.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFilterItemFromJson(json);
}

/// Model tỉnh/thành phụl vụ lọc lưu trú.
// Tương ứng API: GET /vehiclebookingmanagement/get-province-departure?employeeId=0
@freezed
class ProvinceFilterItem with _$ProvinceFilterItem {
  const factory ProvinceFilterItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProvinceName') String? provinceName,
  }) = _ProvinceFilterItem;

  factory ProvinceFilterItem.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFilterItemFromJson(json);
}

/// Model công ty phát hành hóa đơn — dùng cho picker "Công ty" trong
/// form Cập nhật TTQT + Đề nghị tạm ứng.
/// Tương ứng API: GET /TaxCompany/get-tax-companies
@freezed
class TaxCompanyItem with _$TaxCompanyItem {
  const factory TaxCompanyItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'TaxCode') String? taxCode,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'Director') String? director,
    @JsonKey(name: 'Position') String? position,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'BuyerEnglish') String? buyerEnglish,
    @JsonKey(name: 'AddressBuyerEnglish') String? addressBuyerEnglish,
    @JsonKey(name: 'LegalRepresentativeEnglish') String?
        legalRepresentativeEnglish,
    @JsonKey(name: 'BuyerVietnamese') String? buyerVietnamese,
    @JsonKey(name: 'AddressBuyerVienamese') String? addressBuyerVienamese,
    @JsonKey(name: 'TaxVietnamese') String? taxVietnamese,
  }) = _TaxCompanyItem;

  factory TaxCompanyItem.fromJson(Map<String, dynamic> json) =>
      _$TaxCompanyItemFromJson(json);
}

/// Model ngân hàng — dùng cho picker "Ngân hàng" trong
/// form Cập nhật TTQT + Đề nghị tạm ứng.
/// Tương ứng API: GET /banklist
@freezed
class BankItem with _$BankItem {
  const factory BankItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'BankName') String? bankName,
  }) = _BankItem;

  factory BankItem.fromJson(Map<String, dynamic> json) =>
      _$BankItemFromJson(json);
}

/// Model chi tiết phiếu đặt phòng — một dòng trong `accommodationBookingDetails`.
/// Tương ứng payload: `{ ID, AccommodationBookingID, EmployeeID, PhoneNumber,
/// FullName, DepartmentName, Note, EmployeeCode }`.
@freezed
class BookingGuestHouseDetailItem with _$BookingGuestHouseDetailItem {
  const factory BookingGuestHouseDetailItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'AccommodationBookingID') int? accommodationBookingId,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'EmployeeCode') String? employeeCode,
  }) = _BookingGuestHouseDetailItem;

  factory BookingGuestHouseDetailItem.fromJson(Map<String, dynamic> json) =>
      _$BookingGuestHouseDetailItemFromJson(json);
}

/// Model đại diện object `accommodationBooking` trong payload save-data.
@freezed
class AccommodationBookingPayload with _$AccommodationBookingPayload {
  const factory AccommodationBookingPayload({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'RegisterID') int? registerId,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'ProvinceID') int? provinceId,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'ApprovedTBP') int? approvedTBP,
    @JsonKey(name: 'SpecificDestinationAddress') String?
        specificDestinationAddress,
    @JsonKey(name: 'Address') String? address,
  }) = _AccommodationBookingPayload;

  factory AccommodationBookingPayload.fromJson(Map<String, dynamic> json) =>
      _$AccommodationBookingPayloadFromJson(json);
}

/// Chi tiết 1 phiếu đặt phòng nhà nghỉ — response từ API
/// `GET /AccommodationBooking/accommodation-booking-by-id?id=<id>`.
///
/// Server trả thẳng object `{ accommodationBooking, accommodationBookingDetail }`
/// (không bọc `BaseData`), nên model này parse trực tiếp từ JSON.
@freezed
class BookingGuestHouseDetailData with _$BookingGuestHouseDetailData {
  const factory BookingGuestHouseDetailData({
    @JsonKey(name: 'accommodationBooking') required BookingDetail info,
    @JsonKey(name: 'accommodationBookingDetail')
    required List<BookingDetailPerson> persons,
  }) = _BookingGuestHouseDetailData;

  factory BookingGuestHouseDetailData.fromJson(Map<String, dynamic> json) =>
      _$BookingGuestHouseDetailDataFromJson(json);
}

/// Object `accommodationBooking` — thông tin đăng ký của phiếu.
@freezed
class BookingDetail with _$BookingDetail {
  const factory BookingDetail({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'RegisterID') int? registerId,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'ProvinceID') int? provinceId,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
    @JsonKey(name: 'ApprovedTBP') int? approvedTBP,
    @JsonKey(name: 'ApprovedTBPDate') DateTime? approvedTBPDate,
  }) = _BookingDetail;

  factory BookingDetail.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailFromJson(json);
}

/// Object trong mảng `accommodationBookingDetail` — 1 dòng người ở cùng.
@freezed
class BookingDetailPerson with _$BookingDetailPerson {
  const factory BookingDetailPerson({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'AccommodationBookingID') int? accommodationBookingId,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'PhoneNumber') dynamic phoneNumber,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'EmployeeCode') String? employeeCode,
  }) = _BookingDetailPerson;

  factory BookingDetailPerson.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailPersonFromJson(json);
}

/// Response tối thiểu từ API `/AccommodationBooking/save-data`.
/// Thường server trả `{ status, message, data: <id> }` — chỉ cần `id`.
@freezed
class BookingGuestHouseSaveResponse with _$BookingGuestHouseSaveResponse {
  const factory BookingGuestHouseSaveResponse({
    @JsonKey(name: 'ID') int? id,
  }) = _BookingGuestHouseSaveResponse;

  factory BookingGuestHouseSaveResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingGuestHouseSaveResponseFromJson(json);
}