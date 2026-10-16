// Date: 16/10/2026
// Nội dung/Chức năng: Model cho danh sách yêu cầu thuê xe tải
// (trả về từ API POST /VehicleRentalRequest/search).

import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental_vehicle_model.freezed.dart';
part 'rental_vehicle_model.g.dart';

/// Một dòng yêu cầu thuê xe tải.
@freezed
class RentalVehicleItem with _$RentalVehicleItem {
  const factory RentalVehicleItem({
    @JsonKey(name: 'EmployeeRequestName') String? employeeRequestName,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ApprovedFullName') String? approvedFullName,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'DateRequest') DateTime? dateRequest,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'PackageName') String? packageName,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'PackageQuantity') int? packageQuantity,
    @JsonKey(name: 'PackageLengthCm') num? packageLengthCm,
    @JsonKey(name: 'PackageWidthCm') num? packageWidthCm,
    @JsonKey(name: 'PackageHeightCm') num? packageHeightCm,
    @JsonKey(name: 'PackageWeightKg') num? packageWeightKg,
    @JsonKey(name: 'DepartureLocation') String? departureLocation,
    @JsonKey(name: 'AddressLocation') String? addressLocation,
    @JsonKey(name: 'DistanceKm') num? distanceKm,
    @JsonKey(name: 'NameNCC') String? nameNcc,
    @JsonKey(name: 'Cost') num? cost,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'EmployeeRequestID') int? employeeRequestId,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'VehicleType') int? vehicleType,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'ApprovedID') int? approvedId,
  }) = _RentalVehicleItem;

  factory RentalVehicleItem.fromJson(Map<String, dynamic> json) =>
      _$RentalVehicleItemFromJson(json);
}

/// Nhân viên dùng cho dropdown "Người yêu cầu" ở add/detail screen.
// API: GET /Employee?status=&departmentid=&keyword=
@freezed
class RentalVehicleEmployee with _$RentalVehicleEmployee {
  const factory RentalVehicleEmployee({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'AnhCBNV') String? avatar,
    @JsonKey(name: 'ChucVuHD') String? chucVuHd,
    @JsonKey(name: 'ChucVu') String? chucVu,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'DiaDiemLamViec') String? diaDiemLamViec,
    @JsonKey(name: 'EmailCongTy') String? emailCongTy,
    @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
  }) = _RentalVehicleEmployee;

  factory RentalVehicleEmployee.fromJson(Map<String, dynamic> json) =>
      _$RentalVehicleEmployeeFromJson(json);
}

/// Phòng ban dùng cho dropdown "Bộ phận" ở add/detail screen.
// API: GET /Department/get-all
@freezed
class RentalVehicleDepartment with _$RentalVehicleDepartment {
  const factory RentalVehicleDepartment({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'ParentID') dynamic parentId,
    @JsonKey(name: 'PId') String? pId,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'IsShowHotline') bool? isShowHotline,
  }) = _RentalVehicleDepartment;

  factory RentalVehicleDepartment.fromJson(Map<String, dynamic> json) =>
      _$RentalVehicleDepartmentFromJson(json);
}
