// Model cho màn Duyệt ĐNTT (đề nghị thanh toán) Đặt xe / Nhà nghỉ.
// Tương ứng API:
//   - GET  /VehicleBookingPaymentOrder/get-approve-steps
//   - POST /VehicleBookingPaymentOrder/get-unified-list
//   - GET  /VehicleBookingPaymentOrder/get-by-id
//   - GET  /VehicleBookingPaymentOrder/get-logs
//   - GET  /Department/get-all
//   - GET  /Employee

import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_booking_payment_model.freezed.dart';
part 'approve_booking_payment_model.g.dart';

/// Một bước trong quy trình duyệt ĐNTT.
/// [code] là `ApproverCode` dùng khi lọc danh sách; bước đầu tiên
/// (Đề nghị thanh toán) có `code == null`.
@freezed
class ApproveBookingPaymentStep with _$ApproveBookingPaymentStep {
  const factory ApproveBookingPaymentStep({
    @JsonKey(name: 'Step') int? step,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'StepName') String? stepName,
    @JsonKey(name: 'ApproverID') int? approverId,
  }) = _ApproveBookingPaymentStep;

  factory ApproveBookingPaymentStep.fromJson(Map<String, dynamic> json) =>
      _$ApproveBookingPaymentStepFromJson(json);
}

/// Một phiếu ĐNTT trả về từ `get-unified-list`.
@freezed
class ApproveBookingPaymentItem with _$ApproveBookingPaymentItem {
  const factory ApproveBookingPaymentItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'PaymentType') String? paymentType,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'TypeOrder') int? typeOrder,

    // Người tạo
    @JsonKey(name: 'CreatedByEmployeeID') int? createdByEmployeeId,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,

    // Tiền
    @JsonKey(name: 'TotalMoney') double? totalMoney,
    @JsonKey(name: 'TotalMoneyWithInvoice') double? totalMoneyWithInvoice,
    @JsonKey(name: 'TotalAmountBeforeVAT') double? totalAmountBeforeVat,
    @JsonKey(name: 'TotalPayment') double? totalPayment,
    @JsonKey(name: 'DeadlinePayment') DateTime? deadlinePayment,

    // Bước duyệt hiện tại
    @JsonKey(name: 'CurrentStep') int? currentStep,
    @JsonKey(name: 'CurrentStepName') String? currentStepName,
    @JsonKey(name: 'CurrentStepCode') String? currentStepCode,
    @JsonKey(name: 'CurrentStepIsApproved') int? currentStepIsApproved,
    @JsonKey(name: 'IsApprovedText') String? isApprovedText,
    @JsonKey(name: 'LastApproverName') String? lastApproverName,
    @JsonKey(name: 'LastApprovedDate') DateTime? lastApprovedDate,

    // Ghi chú của kế toán thanh toán (KTTT) và kế toán trưởng (KTT)
    @JsonKey(name: 'NoteKTTT') String? noteKttt,
    @JsonKey(name: 'NoteKTT') String? noteKtt,

    // Phân trang (BE lặp lại trên từng dòng)
    @JsonKey(name: 'TotalRows') int? totalRows,
    @JsonKey(name: 'TotalPage') int? totalPage,
  }) = _ApproveBookingPaymentItem;

  factory ApproveBookingPaymentItem.fromJson(Map<String, dynamic> json) =>
      _$ApproveBookingPaymentItemFromJson(json);
}

/// Phân loại phiếu để chọn đúng API chi tiết.
extension ApproveBookingPaymentItemX on ApproveBookingPaymentItem {
  /// `true` với phiếu "Công tác phí" (nhà nghỉ), dùng API
  /// `AccommodationBookingPaymentOrder`. Ngược lại là "Chi phí phương tiện"
  /// (API `VehicleBookingPaymentOrder`).
  bool get isAccommodation =>
      (typeName ?? '').trim() == 'Công tác phí' ||
      (paymentType ?? '').trim().toUpperCase() == 'ACCOMMODATION';
}

/// Phòng ban cho bộ lọc. Tương ứng API: GET /Department/get-all
@freezed
class ApproveBookingPaymentDepartment
    with _$ApproveBookingPaymentDepartment {
  const factory ApproveBookingPaymentDepartment({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
  }) = _ApproveBookingPaymentDepartment;

  factory ApproveBookingPaymentDepartment.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApproveBookingPaymentDepartmentFromJson(json);
}

/// Nhân viên (người tạo phiếu) cho bộ lọc. Tương ứng API: GET /Employee
@freezed
class ApproveBookingPaymentEmployee with _$ApproveBookingPaymentEmployee {
  const factory ApproveBookingPaymentEmployee({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
  }) = _ApproveBookingPaymentEmployee;

  factory ApproveBookingPaymentEmployee.fromJson(Map<String, dynamic> json) =>
      _$ApproveBookingPaymentEmployeeFromJson(json);
}

/// File đính kèm của một dòng chi tiết (ảnh hoá đơn, bill chuyển khoản...).
/// [fileType] phân loại file, vd `INVOICE`; [url] là link tải/xem trực tiếp.
@freezed
class ApproveBookingPaymentFile with _$ApproveBookingPaymentFile {
  const factory ApproveBookingPaymentFile({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'FileType') String? fileType,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'Url') String? url,
    @JsonKey(name: 'FileSize') int? fileSize,
  }) = _ApproveBookingPaymentFile;

  factory ApproveBookingPaymentFile.fromJson(Map<String, dynamic> json) =>
      _$ApproveBookingPaymentFileFromJson(json);
}

/// Một dòng chi tiết của phiếu ĐNTT (`Details[]` trong get-by-id).
@freezed
class ApproveBookingPaymentDetailLine
    with _$ApproveBookingPaymentDetailLine {
  const factory ApproveBookingPaymentDetailLine({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Files')
    @Default(<ApproveBookingPaymentFile>[])
    List<ApproveBookingPaymentFile> files,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'RecipientName') String? recipientName,
    @JsonKey(name: 'StartLocation') String? startLocation,
    @JsonKey(name: 'EndLocation') String? endLocation,
    @JsonKey(name: 'BankAccount') String? bankAccount,
    @JsonKey(name: 'BankName') String? bankName,
    @JsonKey(name: 'TransferType') int? transferType,
    @JsonKey(name: 'TotalAmount') double? totalAmount,
    @JsonKey(name: 'TotalAmountWithInvoice') double? totalAmountWithInvoice,
    @JsonKey(name: 'AmountBeforeVAT') double? amountBeforeVat,
    @JsonKey(name: 'InvoiceNumber') String? invoiceNumber,
    @JsonKey(name: 'TransportCompanyName') String? transportCompanyName,
    @JsonKey(name: 'TransportCompanyTaxCode') String? transportCompanyTaxCode,
    @JsonKey(name: 'CompanyName') String? companyName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsChunDongPhuongTien') bool? isChunDongPhuongTien,
    @JsonKey(name: 'IsBill') bool? isBill,
    // Riêng phiếu Công tác phí (nhà nghỉ)
    @JsonKey(name: 'HotelName') String? hotelName,
    @JsonKey(name: 'HotelTaxCode') String? hotelTaxCode,
    @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
    @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate,
  }) = _ApproveBookingPaymentDetailLine;

  factory ApproveBookingPaymentDetailLine.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApproveBookingPaymentDetailLineFromJson(json);
}

/// Chi tiết một phiếu ĐNTT. Tương ứng API: GET /VehicleBookingPaymentOrder/get-by-id
/// (Chi phí phương tiện) hoặc GET /AccommodationBookingPaymentOrder/get-by-id
/// (Công tác phí).
@freezed
class ApproveBookingPaymentDetail with _$ApproveBookingPaymentDetail {
  const factory ApproveBookingPaymentDetail({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'Deadline') DateTime? deadline,
    // Trạng thái xử lý sau duyệt: đã tiếp nhận chứng từ / đã thanh toán.
    @JsonKey(name: 'IsReceived') bool? isReceived,
    @JsonKey(name: 'ReceivedDate') DateTime? receivedDate,
    @JsonKey(name: 'IsPaid') bool? isPaid,
    @JsonKey(name: 'PaidDate') DateTime? paidDate,
    @JsonKey(name: 'Details')
    @Default(<ApproveBookingPaymentDetailLine>[])
    List<ApproveBookingPaymentDetailLine> details,
  }) = _ApproveBookingPaymentDetail;

  factory ApproveBookingPaymentDetail.fromJson(Map<String, dynamic> json) =>
      _$ApproveBookingPaymentDetailFromJson(json);
}

/// Một bản ghi lịch sử duyệt. Tương ứng API: GET /VehicleBookingPaymentOrder/get-logs
/// [isApproved] = 1 là đã duyệt; [contentLog] là nội dung ghi nhận của bước.
@freezed
class ApproveBookingPaymentLog with _$ApproveBookingPaymentLog {
  const factory ApproveBookingPaymentLog({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Step') int? step,
    @JsonKey(name: 'StepName') String? stepName,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'IsApproved') int? isApproved,
    @JsonKey(name: 'DateApproved') DateTime? dateApproved,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'ContentLog') String? contentLog,
  }) = _ApproveBookingPaymentLog;

  factory ApproveBookingPaymentLog.fromJson(Map<String, dynamic> json) =>
      _$ApproveBookingPaymentLogFromJson(json);
}
