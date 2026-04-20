import 'package:freezed_annotation/freezed_annotation.dart';

part 'stationery_model.freezed.dart';
part 'stationery_model.g.dart';


@freezed
class StationeryItem with _$StationeryItem {
  const factory StationeryItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeIDRequest') int? employeeIdRequest,
    @JsonKey(name: 'UserName') String? userName,
    @JsonKey(name: 'DateRequest') DateTime? dateRequest,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'ApprovedID') int? approvedId,
    @JsonKey(name: 'DateApproved') DateTime? dateApproved,
    @JsonKey(name: 'FullNameApproved') String? fullNameApproved,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'IsAdminApproved') bool? isAdminApproved,
    @JsonKey(name: 'DateAdminApproved') DateTime? dateAdminApproved,
    @JsonKey(name: 'AdminApprovedID') int? adminApprovedId,
  }) = _StationeryItem;

  factory StationeryItem.fromJson(Map<String, dynamic> json) =>
      _$StationeryItemFromJson(json);
}

@freezed
class StationerySupplyItem with _$StationerySupplyItem {
  const factory StationerySupplyItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CodeNCC') String? codeNCC,
    @JsonKey(name: 'CodeRTC') String? codeRTC,
    @JsonKey(name: 'NameNCC') String? nameNCC,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'RequestLimit') int? requestLimit,
  }) = _StationerySupplyItem;

  factory StationerySupplyItem.fromJson(Map<String, dynamic> json) =>
      _$StationerySupplyItemFromJson(json);
}

@freezed
class StationeryDetailItem with _$StationeryDetailItem {
  const factory StationeryDetailItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'OfficeSupplyRequestsID') int? officeSupplyRequestsId,
    @JsonKey(name: 'OfficeSupplyID') int? officeSupplyId,
    @JsonKey(name: 'OfficeSupplyName') String? officeSupplyName,
    @JsonKey(name: 'OfficeSupplyUnitID') int? officeSupplyUnitId,
    @JsonKey(name: 'Quantity') int? quantity,
    @JsonKey(name: 'QuantityReceived') int? quantityReceived,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'ExceedsLimit') bool? exceedsLimit,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'CodeName') String? codeName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Unit') String? unit,
  }) = _StationeryDetailItem;

  factory StationeryDetailItem.fromJson(Map<String, dynamic> json) =>
      _$StationeryDetailItemFromJson(json);
}