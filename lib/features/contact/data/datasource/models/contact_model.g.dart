// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactPersonalItemImpl _$$ContactPersonalItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactPersonalItemImpl(
      stt: (json['STT'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      employeeTeamName: json['EmployeeTeamName'] as String?,
      chucVu: json['ChucVu'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
      emailCongTy: json['EmailCongTy'] as String?,
      startWorking: json['StartWorking'] == null
          ? null
          : DateTime.parse(json['StartWorking'] as String),
      birthOfDate: json['BirthOfDate'] == null
          ? null
          : DateTime.parse(json['BirthOfDate'] as String),
      code: json['Code'] as String?,
    );

Map<String, dynamic> _$$ContactPersonalItemImplToJson(
        _$ContactPersonalItemImpl instance) =>
    <String, dynamic>{
      'STT': instance.stt,
      'FullName': instance.fullName,
      'DepartmentName': instance.departmentName,
      'EmployeeTeamName': instance.employeeTeamName,
      'ChucVu': instance.chucVu,
      'SDTCaNhan': instance.sdtCaNhan,
      'EmailCongTy': instance.emailCongTy,
      'StartWorking': instance.startWorking?.toIso8601String(),
      'BirthOfDate': instance.birthOfDate?.toIso8601String(),
      'Code': instance.code,
    };
