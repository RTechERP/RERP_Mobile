// Model cho màn Duyệt phiếu Đặt phòng nhà nghỉ.
// Tương ứng API: GET /AccommodationBooking/data-accommodation-booking

import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_booking_guest_house_model.freezed.dart';
part 'approve_booking_guest_house_model.g.dart';

/// Một bản ghi đặt phòng nhà nghỉ trả về từ API (màn duyệt).
/// Hiện dùng chung model `BookingGuestHouseItem` của màn đăng ký — model
/// này được giữ riêng để mở rộng các field đặc thù cho luồng duyệt
/// (vd: trạng thái duyệt TBP, người duyệt, ngày duyệt...) mà không
/// ảnh hưởng tới màn đăng ký.
@freezed
class ApproveBookingGuestHouseItem with _$ApproveBookingGuestHouseItem {
  const factory ApproveBookingGuestHouseItem({
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
  }) = _ApproveBookingGuestHouseItem;

  factory ApproveBookingGuestHouseItem.fromJson(Map<String, dynamic> json) =>
      _$ApproveBookingGuestHouseItemFromJson(json);
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
