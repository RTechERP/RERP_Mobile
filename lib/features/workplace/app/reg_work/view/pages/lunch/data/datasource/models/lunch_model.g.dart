// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LunchItemImpl _$$LunchItemImplFromJson(Map<String, dynamic> json) =>
    _$LunchItemImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      quantity: (json['Quantity'] as num?)?.toInt(),
      dateOrder: json['DateOrder'] == null
          ? null
          : DateTime.parse(json['DateOrder'] as String),
      note: json['Note'] as String?,
      isApproved: json['IsApproved'] as bool?,
      rowNumber: (json['RowNumber'] as num?)?.toInt(),
      location: (json['Location'] as num?)?.toInt(),
      locationText: json['LocationText'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LunchItemImplToJson(_$LunchItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
      'Quantity': instance.quantity,
      'DateOrder': instance.dateOrder?.toIso8601String(),
      'Note': instance.note,
      'IsApproved': instance.isApproved,
      'RowNumber': instance.rowNumber,
      'Location': instance.location,
      'LocationText': instance.locationText,
      'EmployeeID': instance.employeeId,
    };

_$SaveLunchItemImpl _$$SaveLunchItemImplFromJson(Map<String, dynamic> json) =>
    _$SaveLunchItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      quantity: (json['Quantity'] as num?)?.toInt(),
      dateOrder: json['DateOrder'] == null
          ? null
          : DateTime.parse(json['DateOrder'] as String),
      note: json['Note'] as String?,
      isApproved: json['IsApproved'] as bool?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      reasonDeciline: json['ReasonDeciline'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      location: (json['Location'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SaveLunchItemImplToJson(_$SaveLunchItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'Quantity': instance.quantity,
      'DateOrder': instance.dateOrder?.toIso8601String(),
      'Note': instance.note,
      'IsApproved': instance.isApproved,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'DecilineApprove': instance.decilineApprove,
      'ReasonDeciline': instance.reasonDeciline,
      'IsDeleted': instance.isDeleted,
      'Location': instance.location,
    };
