// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celebration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CelebrationItemImpl _$$CelebrationItemImplFromJson(
        Map<String, dynamic> json) =>
    _$CelebrationItemImpl(
      employeeID: (json['EmployeeID'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      code: json['Code'] as String?,
      departmentName: json['DepartmentName'] as String?,
      positionName: json['PositionName'] as String?,
      gioiTinh: (json['GioiTinh'] as num?)?.toInt(),
      imagePath: json['ImagePath'] as String?,
      birthOfDate: json['BirthOfDate'] == null
          ? null
          : DateTime.parse(json['BirthOfDate'] as String),
      startWorking: json['StartWorking'] == null
          ? null
          : DateTime.parse(json['StartWorking'] as String),
      isBirthday: json['IsBirthday'] as bool?,
      isSeniority: json['IsSeniority'] as bool?,
      isSeniority5Year: json['IsSeniority5Year'] as bool?,
      isSeniority10Year: json['IsSeniority10Year'] as bool?,
      seniorityYears: (json['SeniorityYears'] as num?)?.toInt(),
      totalYearsWorking: (json['TotalYearsWorking'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CelebrationItemImplToJson(
        _$CelebrationItemImpl instance) =>
    <String, dynamic>{
      'EmployeeID': instance.employeeID,
      'FullName': instance.fullName,
      'Code': instance.code,
      'DepartmentName': instance.departmentName,
      'PositionName': instance.positionName,
      'GioiTinh': instance.gioiTinh,
      'ImagePath': instance.imagePath,
      'BirthOfDate': instance.birthOfDate?.toIso8601String(),
      'StartWorking': instance.startWorking?.toIso8601String(),
      'IsBirthday': instance.isBirthday,
      'IsSeniority': instance.isSeniority,
      'IsSeniority5Year': instance.isSeniority5Year,
      'IsSeniority10Year': instance.isSeniority10Year,
      'SeniorityYears': instance.seniorityYears,
      'TotalYearsWorking': instance.totalYearsWorking,
    };
