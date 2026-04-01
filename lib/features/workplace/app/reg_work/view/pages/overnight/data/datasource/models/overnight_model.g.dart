// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overnight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OvernightItemImpl _$$OvernightItemImplFromJson(Map<String, dynamic> json) =>
    _$OvernightItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      isApprovedTbp: (json['IsApprovedTBP'] as num?)?.toInt(),
      isApprovedHr: (json['IsApprovedHR'] as num?)?.toInt(),
      isApprovedTbpText: json['IsApprovedTBPText'] as String?,
      isApprovedHrText: json['IsApprovedHRText'] as String?,
      approvedTbp: (json['ApprovedTBP'] as num?)?.toInt(),
      approvedHr: (json['ApprovedHR'] as num?)?.toInt(),
      approvedTbpName: json['ApprovedTBPName'] as String?,
      approvedHrName: json['ApprovedHRName'] as String?,
      dateRegister: json['DateRegister'] == null
          ? null
          : DateTime.parse(json['DateRegister'] as String),
      dateStart: json['DateStart'] == null
          ? null
          : DateTime.parse(json['DateStart'] as String),
      dateEnd: json['DateEnd'] == null
          ? null
          : DateTime.parse(json['DateEnd'] as String),
      totalHours: (json['TotalHours'] as num?)?.toDouble(),
      location: json['Location'] as String?,
      note: json['Note'] as String?,
      reasonDeciline: json['ReasonDeciline'] as String?,
      departmentName: json['DepartmentName'] as String?,
      rowNum: (json['RowNum'] as num?)?.toInt(),
      isProblem: json['IsProblem'] as bool?,
      workTime: (json['WorkTime'] as num?)?.toDouble(),
      breaksTime: (json['BreaksTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OvernightItemImplToJson(_$OvernightItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'IsApprovedTBP': instance.isApprovedTbp,
      'IsApprovedHR': instance.isApprovedHr,
      'IsApprovedTBPText': instance.isApprovedTbpText,
      'IsApprovedHRText': instance.isApprovedHrText,
      'ApprovedTBP': instance.approvedTbp,
      'ApprovedHR': instance.approvedHr,
      'ApprovedTBPName': instance.approvedTbpName,
      'ApprovedHRName': instance.approvedHrName,
      'DateRegister': instance.dateRegister?.toIso8601String(),
      'DateStart': instance.dateStart?.toIso8601String(),
      'DateEnd': instance.dateEnd?.toIso8601String(),
      'TotalHours': instance.totalHours,
      'Location': instance.location,
      'Note': instance.note,
      'ReasonDeciline': instance.reasonDeciline,
      'DepartmentName': instance.departmentName,
      'RowNum': instance.rowNum,
      'IsProblem': instance.isProblem,
      'WorkTime': instance.workTime,
      'BreaksTime': instance.breaksTime,
    };

_$ApproverItemImpl _$$ApproverItemImplFromJson(Map<String, dynamic> json) =>
    _$ApproverItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      usersId: (json['UsersID'] as num?)?.toInt(),
      isPassed: json['IsPassed'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$ApproverItemImplToJson(_$ApproverItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'Type': instance.type,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UsersID': instance.usersId,
      'IsPassed': instance.isPassed,
      'IsDeleted': instance.isDeleted,
    };
