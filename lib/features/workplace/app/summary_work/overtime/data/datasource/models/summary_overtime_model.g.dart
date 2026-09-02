// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_overtime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryOvertimeItemImpl _$$SummaryOvertimeItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryOvertimeItemImpl(
      totalPage: (json['TotalPage'] as num?)?.toInt(),
      id: (json['ID'] as num).toInt(),
      isApproved: json['IsApproved'] as bool?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      dateRegister: json['DateRegister'] == null
          ? null
          : DateTime.parse(json['DateRegister'] as String),
      location: (json['Location'] as num?)?.toInt(),
      typeId: (json['TypeID'] as num?)?.toInt(),
      timeStart: json['TimeStart'] == null
          ? null
          : DateTime.parse(json['TimeStart'] as String),
      endTime: json['EndTime'] == null
          ? null
          : DateTime.parse(json['EndTime'] as String),
      timeReality: (json['TimeReality'] as num?)?.toDouble(),
      totalTime: (json['TotalTime'] as num?)?.toDouble(),
      costOvertime: (json['CostOvertime'] as num?)?.toDouble(),
      note: json['Note'] as String?,
      overnight: json['Overnight'] as bool?,
      costOvernight: (json['CostOvernight'] as num?)?.toDouble(),
      reason: json['Reason'] as String?,
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      approvedHr: (json['ApprovedHR'] as num?)?.toInt(),
      isApprovedHr: json['IsApprovedHR'] as bool?,
      reasonDeciline: json['ReasonDeciline'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      reasonHREdit: json['ReasonHREdit'] as String?,
      isProblem: json['IsProblem'] as bool?,
      isApprovedBgd: json['IsApprovedBGD'] as bool?,
      approvedBgdId: (json['ApprovedBGDID'] as num?)?.toInt(),
      dateApprovedBgd: json['DateApprovedBGD'] == null
          ? null
          : DateTime.parse(json['DateApprovedBGD'] as String),
      isSeniorApproved: json['IsSeniorApproved'] as bool?,
      approvedSeniorId: (json['ApprovedSeniorID'] as num?)?.toInt(),
      dateApprovedSenitor: json['DateApprovedSenitor'] == null
          ? null
          : DateTime.parse(json['DateApprovedSenitor'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      reasonDecilineSenior: json['ReasonDecilineSenior'] as String?,
      decilineApproveSenior: (json['DecilineApproveSenior'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      rowNum: (json['RowNum'] as num?)?.toInt(),
      type: json['Type'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      locationText: json['LocationText'] as String?,
      nguoiDuyet: json['NguoiDuyet'] as String?,
      statusNumber: (json['StatusNumber'] as num?)?.toInt(),
      statusHrNumber: (json['StatusHRNumber'] as num?)?.toInt(),
      isSeniorApprovedText: json['IsSeniorApprovedText'] as String?,
      checkIn: json['CheckIn'] as String?,
      checkOut: json['CheckOut'] as String?,
      isNotValid: (json['IsNotValid'] as num?)?.toInt(),
      statusText: json['StatusText'] as String?,
      statusHrText: json['StatusHRText'] as String?,
      costDinner: (json['CostDinner'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SummaryOvertimeItemImplToJson(
        _$SummaryOvertimeItemImpl instance) =>
    <String, dynamic>{
      'TotalPage': instance.totalPage,
      'ID': instance.id,
      'IsApproved': instance.isApproved,
      'EmployeeID': instance.employeeId,
      'ApprovedID': instance.approvedId,
      'DateRegister': instance.dateRegister?.toIso8601String(),
      'Location': instance.location,
      'TypeID': instance.typeId,
      'TimeStart': instance.timeStart?.toIso8601String(),
      'EndTime': instance.endTime?.toIso8601String(),
      'TimeReality': instance.timeReality,
      'TotalTime': instance.totalTime,
      'CostOvertime': instance.costOvertime,
      'Note': instance.note,
      'Overnight': instance.overnight,
      'CostOvernight': instance.costOvernight,
      'Reason': instance.reason,
      'DecilineApprove': instance.decilineApprove,
      'ApprovedHR': instance.approvedHr,
      'IsApprovedHR': instance.isApprovedHr,
      'ReasonDeciline': instance.reasonDeciline,
      'ProjectID': instance.projectId,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'ReasonHREdit': instance.reasonHREdit,
      'IsProblem': instance.isProblem,
      'IsApprovedBGD': instance.isApprovedBgd,
      'ApprovedBGDID': instance.approvedBgdId,
      'DateApprovedBGD': instance.dateApprovedBgd?.toIso8601String(),
      'IsSeniorApproved': instance.isSeniorApproved,
      'ApprovedSeniorID': instance.approvedSeniorId,
      'DateApprovedSenitor': instance.dateApprovedSenitor?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'ReasonDecilineSenior': instance.reasonDecilineSenior,
      'DecilineApproveSenior': instance.decilineApproveSenior,
      'FullName': instance.fullName,
      'RowNum': instance.rowNum,
      'Type': instance.type,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'LocationText': instance.locationText,
      'NguoiDuyet': instance.nguoiDuyet,
      'StatusNumber': instance.statusNumber,
      'StatusHRNumber': instance.statusHrNumber,
      'IsSeniorApprovedText': instance.isSeniorApprovedText,
      'CheckIn': instance.checkIn,
      'CheckOut': instance.checkOut,
      'IsNotValid': instance.isNotValid,
      'StatusText': instance.statusText,
      'StatusHRText': instance.statusHrText,
      'CostDinner': instance.costDinner,
    };

_$SummaryOvertimePersonImpl _$$SummaryOvertimePersonImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryOvertimePersonImpl(
      fullName: json['FullName'] as String?,
      hourSummary: (json['HourSummary'] as num?)?.toDouble(),
      totalBenefitPeriod: (json['TotalBenefitPeriod'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SummaryOvertimePersonImplToJson(
        _$SummaryOvertimePersonImpl instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'HourSummary': instance.hourSummary,
      'TotalBenefitPeriod': instance.totalBenefitPeriod,
    };

_$SummaryOvertimePayloadImpl _$$SummaryOvertimePayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryOvertimePayloadImpl(
      items: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  SummaryOvertimeItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SummaryOvertimeItem>[],
      persons: (json['summaryPerson'] as List<dynamic>?)
              ?.map((e) =>
                  SummaryOvertimePerson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SummaryOvertimePerson>[],
    );

Map<String, dynamic> _$$SummaryOvertimePayloadImplToJson(
        _$SummaryOvertimePayloadImpl instance) =>
    <String, dynamic>{
      'data': instance.items,
      'summaryPerson': instance.persons,
    };

_$SummaryOvertimeDepartmentImpl _$$SummaryOvertimeDepartmentImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryOvertimeDepartmentImpl(
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

Map<String, dynamic> _$$SummaryOvertimeDepartmentImplToJson(
        _$SummaryOvertimeDepartmentImpl instance) =>
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

_$SummaryOvertimeEmployeeImpl _$$SummaryOvertimeEmployeeImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryOvertimeEmployeeImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      chucVuHD: json['ChucVuHD'] as String?,
    );

Map<String, dynamic> _$$SummaryOvertimeEmployeeImplToJson(
        _$SummaryOvertimeEmployeeImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'ChucVuHD': instance.chucVuHD,
    };
