// Model cho màn Duyệt ĐNTT (đề nghị thanh toán) Đặt xe / Nhà nghỉ.
// Tương ứng API:
//   - GET  /VehicleBookingPaymentOrder/get-approve-steps
//   - POST /VehicleBookingPaymentOrder/get-unified-list
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
