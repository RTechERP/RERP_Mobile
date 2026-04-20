// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationeryItemImpl _$$StationeryItemImplFromJson(Map<String, dynamic> json) =>
    _$StationeryItemImpl(
      id: (json['ID'] as num?)?.toInt(),
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
      'ID': instance.id,
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
      id: (json['ID'] as num?)?.toInt(),
      codeNCC: json['CodeNCC'] as String?,
      codeRTC: json['CodeRTC'] as String?,
      nameNCC: json['NameNCC'] as String?,
      unit: json['Unit'] as String?,
      requestLimit: (json['RequestLimit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StationerySupplyItemImplToJson(
        _$StationerySupplyItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CodeNCC': instance.codeNCC,
      'CodeRTC': instance.codeRTC,
      'NameNCC': instance.nameNCC,
      'Unit': instance.unit,
      'RequestLimit': instance.requestLimit,
    };

_$StationeryDetailItemImpl _$$StationeryDetailItemImplFromJson(
        Map<String, dynamic> json) =>
    _$StationeryDetailItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      officeSupplyRequestsId: (json['OfficeSupplyRequestsID'] as num?)?.toInt(),
      officeSupplyId: (json['OfficeSupplyID'] as num?)?.toInt(),
      officeSupplyName: json['OfficeSupplyName'] as String?,
      officeSupplyUnitId: (json['OfficeSupplyUnitID'] as num?)?.toInt(),
      quantity: (json['Quantity'] as num?)?.toInt(),
      quantityReceived: (json['QuantityReceived'] as num?)?.toInt(),
      reason: json['Reason'] as String?,
      exceedsLimit: json['ExceedsLimit'] as bool?,
      note: json['Note'] as String?,
      code: json['Code'] as String?,
      codeName: json['CodeName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      unit: json['Unit'] as String?,
    );

Map<String, dynamic> _$$StationeryDetailItemImplToJson(
        _$StationeryDetailItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'OfficeSupplyRequestsID': instance.officeSupplyRequestsId,
      'OfficeSupplyID': instance.officeSupplyId,
      'OfficeSupplyName': instance.officeSupplyName,
      'OfficeSupplyUnitID': instance.officeSupplyUnitId,
      'Quantity': instance.quantity,
      'QuantityReceived': instance.quantityReceived,
      'Reason': instance.reason,
      'ExceedsLimit': instance.exceedsLimit,
      'Note': instance.note,
      'Code': instance.code,
      'CodeName': instance.codeName,
      'DepartmentName': instance.departmentName,
      'EmployeeID': instance.employeeId,
      'FullName': instance.fullName,
      'Unit': instance.unit,
    };
