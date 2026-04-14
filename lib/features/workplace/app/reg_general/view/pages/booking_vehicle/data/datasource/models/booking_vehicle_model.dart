
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_vehicle_model.freezed.dart';
part 'booking_vehicle_model.g.dart';
@freezed
class BookingVehicleItem with _$BookingVehicleItem {
  const factory BookingVehicleItem({
    @JsonKey(name: 'TimeNeedPresent') DateTime? timeNeedPresent,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'VehicleManagementID') int? vehicleManagementId,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'BookerVehicles') String? bookerVehicles,
    @JsonKey(name: 'DepartureAddress') String? departureAddress,
    @JsonKey(name: 'DepartureDate') DateTime? departureDate,
    @JsonKey(name: 'Category') int? category,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'CompanyNameArrives') String? companyNameArrives,
    @JsonKey(name: 'Province') String? province,
    @JsonKey(name: 'SpecificDestinationAddress') String? specificDestinationAddress,
    @JsonKey(name: 'TimeNeedPresent1') DateTime? timeNeedPresent1,
    @JsonKey(name: 'TimeReturn') DateTime? timeReturn,
    @JsonKey(name: 'NameVehicleCharge') String? nameVehicleCharge,
    @JsonKey(name: 'LicensePlate') String? licensePlate,
    @JsonKey(name: 'DriverName') String? driverName,
    @JsonKey(name: 'DriverPhoneNumber') String? driverPhoneNumber,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'PassengerEmployeeID') int? passengerEmployeeId,
    @JsonKey(name: 'PassengerCode') String? passengerCode,
    @JsonKey(name: 'PassengerName') String? passengerName,
    @JsonKey(name: 'PassengerDepartment') String? passengerDepartment,
    @JsonKey(name: 'PassengerPhoneNumber') String? passengerPhoneNumber,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'ReceiverEmployeeID') int? receiverEmployeeId,
    @JsonKey(name: 'ReceiverCode') String? receiverCode,
    @JsonKey(name: 'ReceiverName') String? receiverName,
    @JsonKey(name: 'ReceiverPhoneNumber') String? receiverPhoneNumber,
    @JsonKey(name: 'PackageName') String? packageName,
    @JsonKey(name: 'DeliverName') String? deliverName,
    @JsonKey(name: 'DeliverPhoneNumber') String? deliverPhoneNumber,
    @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
    @JsonKey(name: 'DecilineApprove') String? decilineApprove,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ProblemArises') String? problemArises,
    @JsonKey(name: 'IsProblemArises') bool? isProblemArises,
    @JsonKey(name: 'IsCancel') bool? isCancel,
    @JsonKey(name: 'IsSend') bool? isSend,
    @JsonKey(name: 'ApprovedTBP') int? approvedTBP,
    @JsonKey(name: 'IsNotifiled') bool? isNotifiled,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'DepartureAddressStatus') int? departureAddressStatus,
    @JsonKey(name: 'DepartureAddressStatusActual') int? departureAddressStatusActual,
    @JsonKey(name: 'DepartureAddressActual') String? departureAddressActual,
    @JsonKey(name: 'DepartureDateActual') DateTime? departureDateActual,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'VehicleMoney') num? vehicleMoney,
    @JsonKey(name: 'PackageSize') String? packageSize,
    @JsonKey(name: 'PackageWeight') String? packageWeight,
    @JsonKey(name: 'PackageQuantity') int? packageQuantity,
    @JsonKey(name: 'VehicleType') int? vehicleType,
    @JsonKey(name: 'StartTimeActual') DateTime? startTimeActual,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
    @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
    @JsonKey(name: 'VehicleInformation') String? vehicleInformation,
    @JsonKey(name: 'CategoryText') String? categoryText,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'ApprovedTBPText') String? approvedTBPText,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartureAddressText') String? departureAddressText,
    @JsonKey(name: 'DepartureDateText') String? departureDateText,
    @JsonKey(name: 'ProjectFullName') String? projectFullName,
    @JsonKey(name: 'TimeNeedPresentText') String? timeNeedPresentText,
    @JsonKey(name: 'FullNameTBP') String? fullNameTBP,
    @JsonKey(name: 'ProvinceName') String? provinceName,
    @JsonKey(name: 'VehicleTypeText') String? vehicleTypeText,
    @JsonKey(name: 'DepartureDateActualText') String? departureDateActualText,
  }) = _BookingVehicleItem;

  factory BookingVehicleItem.fromJson(Map<String, dynamic> json) =>
      _$BookingVehicleItemFromJson(json);
}

@freezed
class BookingVehicleTotalPage with _$BookingVehicleTotalPage {
  const factory BookingVehicleTotalPage({
    @JsonKey(name: 'TotalPage') required int totalPage,
  }) = _BookingVehicleTotalPage;

  factory BookingVehicleTotalPage.fromJson(Map<String, dynamic> json) =>
      _$BookingVehicleTotalPageFromJson(json);
}

@freezed
class ProvinceDepartureItem with _$ProvinceDepartureItem {
  const factory ProvinceDepartureItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'ProvinceName') required String provinceName,
  }) = _ProvinceDepartureItem;

  factory ProvinceDepartureItem.fromJson(Map<String, dynamic> json) =>
      _$ProvinceDepartureItemFromJson(json);
}

@freezed
class ProvinceArrivesItem with _$ProvinceArrivesItem {
  const factory ProvinceArrivesItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'ProvinceCode') String? provinceCode,
    @JsonKey(name: 'ProvinceName') String? provinceName,

    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
  }) = _ProvinceArrivesItem;

  factory ProvinceArrivesItem.fromJson(Map<String, dynamic> json) =>
      _$ProvinceArrivesItemFromJson(json);
}

@freezed
class ApproverItem with _$ApproverItem {
  const factory ApproverItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Type') int? type,

    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,

    @JsonKey(name: 'UsersID') int? usersId,
    @JsonKey(name: 'IsPassed') bool? isPassed,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _ApproverItem;

  factory ApproverItem.fromJson(Map<String, dynamic> json) =>
      _$ApproverItemFromJson(json);
}

@freezed
class BookingVehicleProjectItem with _$BookingVehicleProjectItem {
  const factory BookingVehicleProjectItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'CustomerID') int? customerId,

    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ProjectShortName') String? projectShortName,

    @JsonKey(name: 'ProjectStatus') int? projectStatus,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,

    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsApproved') bool? isApproved,

    @JsonKey(name: 'ContactID') int? contactId,
    @JsonKey(name: 'PO') String? po,

    @JsonKey(name: 'ProjectType') int? projectType,
    @JsonKey(name: 'ListCostID') int? listCostId,

    @JsonKey(name: 'PlanDateStart') DateTime? planDateStart,
    @JsonKey(name: 'PlanDateEnd') DateTime? planDateEnd,
    @JsonKey(name: 'ActualDateStart') DateTime? actualDateStart,
    @JsonKey(name: 'ActualDateEnd') DateTime? actualDateEnd,

    @JsonKey(name: 'EU') String? eu,
    @JsonKey(name: 'ProjectManager') int? projectManager,
    @JsonKey(name: 'CurrentState') String? currentState,
    @JsonKey(name: 'Priotity') int? priotity,

    @JsonKey(name: 'PODate') DateTime? poDate,
    @JsonKey(name: 'EndUser') int? endUser,

    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,

    @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
    @JsonKey(name: 'TypeProject') int? typeProject,

    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _BookingVehicleProjectItem;

  factory BookingVehicleProjectItem.fromJson(Map<String, dynamic> json) =>
      _$BookingVehicleProjectItemFromJson(json);
}

@freezed
class BookingVehiclePersonalItem with _$BookingVehiclePersonalItem {
  const factory BookingVehiclePersonalItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'DepartmentID') int? departmentId,

    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'ChucVuHDID') int? chucVuHdId,
    @JsonKey(name: 'ChuVuID') int? chuVuId,
    @JsonKey(name: 'STT') int? stt,

    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,

    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'AnhCBNV') String? anhCbnv,

    @JsonKey(name: 'ChucVuHD') String? chucVuHd,
    @JsonKey(name: 'ChucVu') String? chucVu,

    @JsonKey(name: 'DepartmentSTT') int? departmentStt,
    @JsonKey(name: 'DepartmentName') String? departmentName,

    @JsonKey(name: 'DvBHXH') String? dvBhxh,
    @JsonKey(name: 'DiaDiemLamViec') String? diaDiemLamViec,

    @JsonKey(name: 'BirthOfDate') DateTime? birthOfDate,
    @JsonKey(name: 'NoiSinh') String? noiSinh,

    @JsonKey(name: 'GioiTinh') int? gioiTinh,
    @JsonKey(name: 'GioiTinhText') String? gioiTinhText,

    @JsonKey(name: 'DanToc') String? danToc,
    @JsonKey(name: 'TonGiao') String? tonGiao,
    @JsonKey(name: 'QuocTich') String? quocTich,
    @JsonKey(name: 'TinhTrangHonNhan') String? tinhTrangHonNhan,

    @JsonKey(name: 'DcThuongTru') String? dcThuongTru,
    @JsonKey(name: 'DcTamTru') String? dcTamTru,

    @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
    @JsonKey(name: 'EmailCaNhan') String? emailCaNhan,
    @JsonKey(name: 'SDTCongTy') String? sdtCongTy,
    @JsonKey(name: 'EmailCongTy') String? emailCongTy,

    @JsonKey(name: 'NguoiLienHeKhiCan') String? nguoiLienHeKhiCan,
    @JsonKey(name: 'MoiQuanHe') String? moiQuanHe,
    @JsonKey(name: 'SDTNguoiThan') String? sdtNguoiThan,

    @JsonKey(name: 'NguoiLienHeKhiCan2') String? nguoiLienHeKhiCan2,
    @JsonKey(name: 'MoiQuanHe2') String? moiQuanHe2,
    @JsonKey(name: 'SDTNguoiThan2') String? sdtNguoiThan2,
  }) = _BookingVehiclePersonalItem;

  factory BookingVehiclePersonalItem.fromJson(Map<String, dynamic> json) =>
      _$BookingVehiclePersonalItemFromJson(json);
}