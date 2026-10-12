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

    // Đề nghị tạm ứng (ĐNTU) — dùng khi list hiển thị icon "đã tạo tạm ứng"
    // và để mở form advance ở chế độ view-only khi `advanceDetailStatus == 4`.
    @JsonKey(name: 'AdvancePaymentOrderID') int? advancePaymentOrderId,
    @JsonKey(name: 'AdvancePaymentOrderCode') String? advancePaymentOrderCode,
    @JsonKey(name: 'AdvanceDetailStatus') int? advanceDetailStatus,
    @JsonKey(name: 'AdvanceTotalAmount') num? advanceTotalAmount,
    @JsonKey(name: 'AdvanceApprovedTBPID') int? advanceApprovedTbpId,
    @JsonKey(name: 'AdvanceBankName') String? advanceBankName,
    @JsonKey(name: 'AdvanceBankAccount') String? advanceBankAccount,
    @JsonKey(name: 'AdvanceReason') String? advanceReason,
    @JsonKey(name: 'AdvanceStepCode') String? advanceStepCode,
    @JsonKey(name: 'AdvanceStepName') String? advanceStepName,
    @JsonKey(name: 'AdvanceStepIsApproved') int? advanceStepIsApproved,
    @JsonKey(name: 'AdvanceIsReceived') bool? advanceIsReceived,
    @JsonKey(name: 'AdvanceIsPaid') bool? advanceIsPaid,
    @JsonKey(name: 'AdvanceCompanyID') int? advanceCompanyId,
    @JsonKey(name: 'AdvanceCompanyName') String? advanceCompanyName,
    @JsonKey(name: 'AdvanceDepartmentName') String? advanceDepartmentName,
    @JsonKey(name: 'AdvanceProjectID') int? advanceProjectId,
    @JsonKey(name: 'AdvanceTransferType') int? advanceTransferType,
    @JsonKey(name: 'AdvanceBankListID') int? advanceBankListId,
    @JsonKey(name: 'AdvanceRecipientName') String? advanceRecipientName,
    @JsonKey(name: 'AdvanceNote') String? advanceNote,
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

/// Response từ API `POST /AccommodationBookingPaymentOrder/create-advance`.
///
/// Server trả `{ ID, Code, DetailID, IsRecreated? }` trong `data` — chỉ cần
/// các field tối thiểu cho UI:
/// - [id]       : PaymentOrderID master
/// - [code]     : Mã ĐNTU (vd `ĐNTU261011160909`)
/// - [detailId] : ID của detail (để BE truy vết bước duyệt)
/// - [isRecreated] : true khi user tạo lại trên phiếu cũ (sau khi bị hủy
///   duyệt bước hiện tại). Kèm message "Đã tạo lại đề nghị tạm ứng".
@freezed
class BookingGuestHouseAdvanceResponse
    with _$BookingGuestHouseAdvanceResponse {
  const factory BookingGuestHouseAdvanceResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'DetailID') int? detailId,
    @JsonKey(name: 'IsRecreated') bool? isRecreated,
  }) = _BookingGuestHouseAdvanceResponse;

  factory BookingGuestHouseAdvanceResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BookingGuestHouseAdvanceResponseFromJson(json);
}

/// Response từ API `POST /AccommodationBookingPaymentOrder/save-standalone-detail`.
///
/// Server trả `{ ID, DetailStatus }` trong `data` — dùng cho UI:
/// - [id]           : ID của detail mới lưu
/// - [detailStatus] : trạng thái duyệt (2 = chờ duyệt, 3 = đã duyệt...)
@freezed
class BookingGuestHouseSaveDetailResponse
    with _$BookingGuestHouseSaveDetailResponse {
  const factory BookingGuestHouseSaveDetailResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'DetailStatus') int? detailStatus,
  }) = _BookingGuestHouseSaveDetailResponse;

  factory BookingGuestHouseSaveDetailResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BookingGuestHouseSaveDetailResponseFromJson(json);
}

/// 1 dòng file đính kèm trong response upload (`POST /.../upload-file`).
///
/// Server trả `data` có thể là 1 object đơn hoặc mảng các object, mỗi
/// object đại diện 1 file đã upload lên server:
/// - [id]                              : ID file
/// - [accommodationBookingPaymentOrderDetailId] : FK detail TTQT
/// - [fileType]                        : "INVOICE" | "BILL_CK"
/// - [fileName], [filePath], [url]     : thông tin file
/// - [fileSize]                        : kích thước (bytes)
/// - [isDeleted], [createdBy], [createdDate], [updatedBy], [updatedDate]
@freezed
class BookingGuestHouseFileItem with _$BookingGuestHouseFileItem {
  const factory BookingGuestHouseFileItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'AccommodationBookingPaymentOrderDetailID')
    int? accommodationBookingPaymentOrderDetailId,
    @JsonKey(name: 'FileType') String? fileType,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'FilePath') String? filePath,
    @JsonKey(name: 'Url') String? url,
    @JsonKey(name: 'FileSize') int? fileSize,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
  }) = _BookingGuestHouseFileItem;

  factory BookingGuestHouseFileItem.fromJson(Map<String, dynamic> json) =>
      _$BookingGuestHouseFileItemFromJson(json);
}

/// Chi tiết 1 TT Quyết toán (TTQT) của 1 phiếu đặt phòng nhà nghỉ.
/// Response từ API:
/// `GET /AccommodationBookingPaymentOrder/get-detail-by-booking-id?accommodationBookingId=<id>`
///
/// Dùng để pre-fill form "Cập nhật TTQT" khi mở — thay vì lấy từ
/// field `Payment*` trên `BookingGuestHouseItem` (dữ liệu rút gọn
/// trên list). Field `DetailStatus` là trạng thái duyệt:
/// - 0 / null: chưa có TTQT → giữ form rỗng.
/// - 2: chờ duyệt file, 3: file đã duyệt, 4: đã tạo ĐNTT,
///   5: yêu cầu bổ sung file (và các giá trị khác BE có thể mở rộng).
///
/// BE có thể trả thẳng 1 object `{ ID, AccommodationBookingID, ... }`
/// hoặc bọc trong mảng `[{...}]` (vd khi chưa có detail). Service
/// parse defensive xem `_parsePaymentDetailByBookingId`.
@freezed
class BookingGuestHousePaymentDetailItem
    with _$BookingGuestHousePaymentDetailItem {
  const factory BookingGuestHousePaymentDetailItem({
    /// ID detail TTQT (trong ví dụ = 27). Master = 0 khi chưa được
    /// gắn vào đề nghị tạm ứng; > 0 khi đã liên kết master.
    @JsonKey(name: 'ID') int? id,

    /// ID master PaymentOrder (0 nếu chưa liên kết master).
    @JsonKey(name: 'AccommodationBookingPaymentOrderID')
    int? accommodationBookingPaymentOrderId,

    /// FK phiếu đặt phòng nhà nghỉ.
    @JsonKey(name: 'AccommodationBookingID') int? accommodationBookingId,

    /// Loại: true = tạm ứng, false = quyết toán, null = BE không set.
    @JsonKey(name: 'IsAdvance') bool? isAdvance,

    /// Trạng thái duyệt (0/null = chưa có; 2/3/4/5 xem comment trên).
    @JsonKey(name: 'DetailStatus') int? detailStatus,

    /// Lý do quyết toán.
    @JsonKey(name: 'Reason') String? reason,

    /// ID dự án.
    @JsonKey(name: 'ProjectID') int? projectId,

    /// Người nhận tiền.
    @JsonKey(name: 'RecipientName') String? recipientName,

    /// Tên khách sạn.
    @JsonKey(name: 'HotelName') String? hotelName,

    /// Mã số thuế khách sạn.
    @JsonKey(name: 'HotelTaxCode') String? hotelTaxCode,

    /// Số tài khoản ngân hàng nhận tiền.
    @JsonKey(name: 'BankAccount') String? bankAccount,

    /// Tên ngân hàng (text hiển thị trên UI).
    @JsonKey(name: 'BankName') String? bankName,

    /// ID ngân hàng (lookup `state.banks` để map chuẩn).
    @JsonKey(name: 'BankListID') int? bankListId,

    /// Loại chuyển khoản (1 = chuyển khoản cá nhân).
    @JsonKey(name: 'TransferType') int? transferType,

    /// ID TBP duyệt.
    @JsonKey(name: 'ApprovedTBPID') int? approvedTbpId,

    /// Tổng tiền (VNĐ).
    @JsonKey(name: 'TotalAmount') num? totalAmount,

    /// Tổng tiền có hóa đơn (VNĐ).
    @JsonKey(name: 'TotalAmountWithInvoice') num? totalAmountWithInvoice,

    /// Số hóa đơn.
    @JsonKey(name: 'InvoiceNumber') String? invoiceNumber,

    /// ID công ty phát hành hóa đơn.
    @JsonKey(name: 'CompanyID') int? companyId,

    /// Tên công ty phát hành hóa đơn.
    @JsonKey(name: 'CompanyName') String? companyName,

    /// Tên bộ phận.
    @JsonKey(name: 'DepartmentName') String? departmentName,

    /// Ghi chú.
    @JsonKey(name: 'Note') String? note,

    /// Check-in date (cho đề nghị tạm ứng).
    @JsonKey(name: 'CheckInDate') dynamic checkInDate,

    /// Check-out date.
    @JsonKey(name: 'CheckOutDate') dynamic checkOutDate,

    /// ID master ĐNTT tạm ứng (null nếu không phải advance).
    @JsonKey(name: 'AdvancePaymentOrderID') int? advancePaymentOrderId,

    /// Mã ĐNTT tạm ứng (vd `ĐNTTxxx`).
    @JsonKey(name: 'AdvancePaymentOrderCode') String?
        advancePaymentOrderCode,

    /// Tổng tiền tạm ứng.
    @JsonKey(name: 'AdvanceTotalAmount') num? advanceTotalAmount,

    /// Bước duyệt ĐNTU hiện tại đã duyệt chưa (0/1).
    @JsonKey(name: 'AdvanceStepIsApproved') int? advanceStepIsApproved,

    /// ĐNTU bị từ chối duyệt.
    @JsonKey(name: 'IsAdvanceRejected') bool? isAdvanceRejected,

    /// Đã tạo ĐNTT tạm ứng.
    @JsonKey(name: 'IsAdvanceCreated') bool? isAdvanceCreated,

    /// Audit.
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,

    /// Danh sách file đính kèm (INVOICE / BILL_CK) — chỉ đếm để hiển thị
    /// hint, không tự load lại nội dung file.
    @JsonKey(name: 'Files') List<BookingGuestHouseFileItem>? files,
  }) = _BookingGuestHousePaymentDetailItem;

  factory BookingGuestHousePaymentDetailItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BookingGuestHousePaymentDetailItemFromJson(json);
}