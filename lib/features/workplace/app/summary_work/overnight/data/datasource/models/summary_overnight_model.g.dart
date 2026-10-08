// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_overnight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryOvernightItemImpl _$$SummaryOvernightItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryOvernightItemImpl(
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
      dateRegister: json['DateRegister'] as String?,
      dateStart: json['DateStart'] as String?,
      dateEnd: json['DateEnd'] as String?,
      totalHours: (json['TotalHours'] as num?)?.toDouble(),
      location: json['Location'] as String?,
      note: json['Note'] as String?,
      reasonDeciline: json['ReasonDeciline'] as String?,
      departmentName: json['DepartmentName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      rowNum: (json['RowNum'] as num?)?.toInt(),
      isProblem: json['IsProblem'] as bool?,
      workTime: (json['WorkTime'] as num?)?.toDouble(),
      breaksTime: (json['BreaksTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SummaryOvernightItemImplToJson(
        _$SummaryOvernightItemImpl instance) =>
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
      'DateRegister': instance.dateRegister,
      'DateStart': instance.dateStart,
      'DateEnd': instance.dateEnd,
      'TotalHours': instance.totalHours,
      'Location': instance.location,
      'Note': instance.note,
      'ReasonDeciline': instance.reasonDeciline,
      'DepartmentName': instance.departmentName,
      'DepartmentID': instance.departmentId,
      'RowNum': instance.rowNum,
      'IsProblem': instance.isProblem,
      'WorkTime': instance.workTime,
      'BreaksTime': instance.breaksTime,
    };

_$SummaryOvernightDepartmentImpl _$$SummaryOvernightDepartmentImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryOvernightDepartmentImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      description: json['Description'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      email: json['Email'] as String?,
      headOfDepartment: (json['HeadofDepartment'] as num?)?.toInt(),
      isShowHotline: json['IsShowHotline'] as bool?,
      pId: json['PId'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      parentID: (json['ParentID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SummaryOvernightDepartmentImplToJson(
        _$SummaryOvernightDepartmentImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'Description': instance.description,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate,
      'Status': instance.status,
      'Email': instance.email,
      'HeadofDepartment': instance.headOfDepartment,
      'IsShowHotline': instance.isShowHotline,
      'PId': instance.pId,
      'STT': instance.stt,
      'IsDeleted': instance.isDeleted,
      'ParentID': instance.parentID,
    };
