// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationeryItemImpl _$$StationeryItemImplFromJson(Map<String, dynamic> json) =>
    _$StationeryItemImpl(
      employeeIdRequest: (json['EmployeeIDRequest'] as num?)?.toInt(),
      userName: json['UserName'] as String?,
      dateRequest: json['DateRequest'] == null
          ? null
          : DateTime.parse(json['DateRequest'] as String),
      isApproved: json['IsApproved'] as bool?,
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      dateApproved: json['DateApproved'] == null
          ? null
          : DateTime.parse(json['DateApproved'] as String),
      fullNameApproved: json['FullNameApproved'] as String?,
      departmentName: json['DepartmentName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      isAdminApproved: json['IsAdminApproved'] as bool?,
      dateAdminApproved: json['DateAdminApproved'] == null
          ? null
          : DateTime.parse(json['DateAdminApproved'] as String),
      adminApprovedId: (json['AdminApprovedID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StationeryItemImplToJson(
        _$StationeryItemImpl instance) =>
    <String, dynamic>{
      'EmployeeIDRequest': instance.employeeIdRequest,
      'UserName': instance.userName,
      'DateRequest': instance.dateRequest?.toIso8601String(),
      'IsApproved': instance.isApproved,
      'ApprovedID': instance.approvedId,
      'DateApproved': instance.dateApproved?.toIso8601String(),
      'FullNameApproved': instance.fullNameApproved,
      'DepartmentName': instance.departmentName,
      'DepartmentID': instance.departmentId,
      'IsAdminApproved': instance.isAdminApproved,
      'DateAdminApproved': instance.dateAdminApproved?.toIso8601String(),
      'AdminApprovedID': instance.adminApprovedId,
    };

_$StationerySupplyItemImpl _$$StationerySupplyItemImplFromJson(
        Map<String, dynamic> json) =>
    _$StationerySupplyItemImpl(
      codeNCC: json['CodeNCC'] as String?,
      codeRTC: json['CodeRTC'] as String?,
      nameNCC: json['NameNCC'] as String?,
      unit: json['Unit'] as String?,
      requestLimit: (json['RequestLimit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StationerySupplyItemImplToJson(
        _$StationerySupplyItemImpl instance) =>
    <String, dynamic>{
      'CodeNCC': instance.codeNCC,
      'CodeRTC': instance.codeRTC,
      'NameNCC': instance.nameNCC,
      'Unit': instance.unit,
      'RequestLimit': instance.requestLimit,
    };

_$StationeryDetailItemImpl _$$StationeryDetailItemImplFromJson(
        Map<String, dynamic> json) =>
    _$StationeryDetailItemImpl(
      officeSupplyId: (json['OfficeSupplyID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      officeSupplyName: json['OfficeSupplyName'] as String?,
      officeSupplyRequestsId: (json['OfficeSupplyRequestsID'] as num?)?.toInt(),
      officeSupplyUnitId: (json['OfficeSupplyUnitID'] as num?)?.toInt(),
      quantity: (json['Quantity'] as num?)?.toInt(),
      reason: json['Reason'] as String?,
      exceedsLimit: json['ExceedsLimit'] as bool?,
      code: json['Code'] as String?,
      codeName: json['CodeName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      id: (json['ID'] as num?)?.toInt(),
      unit: json['Unit'] as String?,
    );

Map<String, dynamic> _$$StationeryDetailItemImplToJson(
        _$StationeryDetailItemImpl instance) =>
    <String, dynamic>{
      'OfficeSupplyID': instance.officeSupplyId,
      'Note': instance.note,
      'OfficeSupplyName': instance.officeSupplyName,
      'OfficeSupplyRequestsID': instance.officeSupplyRequestsId,
      'OfficeSupplyUnitID': instance.officeSupplyUnitId,
      'Quantity': instance.quantity,
      'Reason': instance.reason,
      'ExceedsLimit': instance.exceedsLimit,
      'Code': instance.code,
      'CodeName': instance.codeName,
      'DepartmentName': instance.departmentName,
      'EmployeeID': instance.employeeId,
      'FullName': instance.fullName,
      'ID': instance.id,
      'Unit': instance.unit,
    };
