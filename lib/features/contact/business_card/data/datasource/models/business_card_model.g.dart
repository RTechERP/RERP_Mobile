// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessCardModelImpl _$$BusinessCardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessCardModelImpl(
      stt: (json['STT'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      employeeTeamName: json['EmployeeTeamName'] as String?,
      chucVu: json['ChucVu'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
      emailCongTy: json['EmailCongTy'] as String?,
      emailCaNhan: json['EmailCaNhan'] as String?,
      startWorking: json['StartWorking'] == null
          ? null
          : DateTime.parse(json['StartWorking'] as String),
      birthOfDate: json['BirthOfDate'] == null
          ? null
          : DateTime.parse(json['BirthOfDate'] as String),
      code: json['Code'] as String?,
      address: json['Address'] as String?,
      companyName: json['CompanyName'] as String?,
      companyAddress: json['CompanyAddress'] as String?,
      companyPhone: json['CompanyPhone'] as String?,
      imagePath: json['ImagePath'] as String?,
      isFavorite: json['IsFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$BusinessCardModelImplToJson(
        _$BusinessCardModelImpl instance) =>
    <String, dynamic>{
      'STT': instance.stt,
      'FullName': instance.fullName,
      'DepartmentName': instance.departmentName,
      'EmployeeTeamName': instance.employeeTeamName,
      'ChucVu': instance.chucVu,
      'SDTCaNhan': instance.sdtCaNhan,
      'EmailCongTy': instance.emailCongTy,
      'EmailCaNhan': instance.emailCaNhan,
      'StartWorking': instance.startWorking?.toIso8601String(),
      'BirthOfDate': instance.birthOfDate?.toIso8601String(),
      'Code': instance.code,
      'Address': instance.address,
      'CompanyName': instance.companyName,
      'CompanyAddress': instance.companyAddress,
      'CompanyPhone': instance.companyPhone,
      'ImagePath': instance.imagePath,
      'IsFavorite': instance.isFavorite,
    };

_$ScanBusinessCardResponseImpl _$$ScanBusinessCardResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ScanBusinessCardResponseImpl(
      name: json['Name'] as String?,
      phone: json['Phone'] as String?,
      email: json['Email'] as String?,
      company: json['Company'] as String?,
      address: json['Address'] as String?,
      position: json['Position'] as String?,
      website: json['Website'] as String?,
    );

Map<String, dynamic> _$$ScanBusinessCardResponseImplToJson(
        _$ScanBusinessCardResponseImpl instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Phone': instance.phone,
      'Email': instance.email,
      'Company': instance.company,
      'Address': instance.address,
      'Position': instance.position,
      'Website': instance.website,
    };
