// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_booking_guest_house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApproveBookingGuestHouseItemImpl _$$ApproveBookingGuestHouseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveBookingGuestHouseItemImpl(
      id: (json['ID'] as num).toInt(),
      registerId: (json['RegisterID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      provinceId: (json['ProvinceID'] as num?)?.toInt(),
      provinceName: json['ProvinceName'] as String?,
      address: json['Address'] as String?,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      note: json['Note'] as String?,
      roommates: json['Roommates'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      isApprovedTBP: json['IsApprovedTBP'] as bool?,
      approvedTBP: json['ApprovedTBP'],
      approvedTBPDate: json['ApprovedTBPDate'] == null
          ? null
          : DateTime.parse(json['ApprovedTBPDate'] as String),
      fullNameTBP: json['FullNameTBP'] as String?,
    );

Map<String, dynamic> _$$ApproveBookingGuestHouseItemImplToJson(
        _$ApproveBookingGuestHouseItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RegisterID': instance.registerId,
      'ProjectID': instance.projectId,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'SDTCaNhan': instance.sdtCaNhan,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProvinceID': instance.provinceId,
      'ProvinceName': instance.provinceName,
      'Address': instance.address,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'Note': instance.note,
      'Roommates': instance.roommates,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'IsApprovedTBP': instance.isApprovedTBP,
      'ApprovedTBP': instance.approvedTBP,
      'ApprovedTBPDate': instance.approvedTBPDate?.toIso8601String(),
      'FullNameTBP': instance.fullNameTBP,
    };

_$ApproveProjectFilterItemImpl _$$ApproveProjectFilterItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveProjectFilterItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
    );

Map<String, dynamic> _$$ApproveProjectFilterItemImplToJson(
        _$ApproveProjectFilterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
    };

_$ApproveEmployeeFilterItemImpl _$$ApproveEmployeeFilterItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveEmployeeFilterItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
    );

Map<String, dynamic> _$$ApproveEmployeeFilterItemImplToJson(
        _$ApproveEmployeeFilterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'SDTCaNhan': instance.sdtCaNhan,
    };
