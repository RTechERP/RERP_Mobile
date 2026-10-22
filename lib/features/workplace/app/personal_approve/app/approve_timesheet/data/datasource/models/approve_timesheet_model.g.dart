// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_timesheet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApproveTimesheetItemImpl _$$ApproveTimesheetItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveTimesheetItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      isApprovedTP: (json['IsApprovedTP'] as num?)?.toInt(),
      approvedTP: (json['ApprovedTP'] as num?)?.toInt(),
      ngayDangKy: json['NgayDangKy'] == null
          ? null
          : DateTime.parse(json['NgayDangKy'] as String),
      noiDung: json['NoiDung'] as String?,
      reason: json['Reason'] as String?,
      typeText: json['TypeText'] as String?,
      tableName: json['TableName'] as String?,
      columnNameUpdate: json['ColumnNameUpdate'] as String?,
      nguoiDuyet: json['NguoiDuyet'] as String?,
      isCancelTP: (json['IsCancelTP'] as num?)?.toInt(),
      isCancelRegister: (json['IsCancelRegister'] as num?)?.toInt(),
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      tType: (json['TType'] as num?)?.toInt(),
      isApprovedHR: (json['IsApprovedHR'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      isCancelHR: (json['IsCancelHR'] as num?)?.toInt(),
      statusNumber: (json['StatusNumber'] as num?)?.toInt(),
      statusHRNumber: (json['StatusHRNumber'] as num?)?.toInt(),
      deleteFlag: (json['DeleteFlag'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      reasonDeciline: json['ReasonDeciline'] as String?,
      reasonHREdit: json['ReasonHREdit'] as String?,
      evaluateResults: json['EvaluateResults'] as String?,
      isApprovedBGD: (json['IsApprovedBGD'] as num?)?.toInt(),
      isSeniorApproved: (json['IsSeniorApproved'] as num?)?.toInt(),
      approvedSeniorId: (json['ApprovedSeniorID'] as num?)?.toInt(),
      dateApprovedSenitor: json['DateApprovedSenitor'] == null
          ? null
          : DateTime.parse(json['DateApprovedSenitor'] as String),
      isSeniorApprovedText: json['IsSeniorApprovedText'] as String?,
      approvedSeniorName: json['ApprovedSeniorName'] as String?,
      fileName: json['FileName'] as String?,
      filePath: json['FilePath'] as String?,
      checkIn: json['CheckIn'] as String?,
      checkOut: json['CheckOut'] as String?,
      isNotValid: (json['IsNotValid'] as num?)?.toInt(),
      statusText: json['StatusText'] as String?,
      statusHRText: json['StatusHRText'] as String?,
      statusBGDText: json['StatusBGDText'] as String?,
      seniorId: (json['SeniorID'] as num?)?.toInt(),
      decilineApproveSenior: (json['DecilineApproveSenior'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ApproveTimesheetItemImplToJson(
        _$ApproveTimesheetItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
      'IsApprovedTP': instance.isApprovedTP,
      'ApprovedTP': instance.approvedTP,
      'NgayDangKy': instance.ngayDangKy?.toIso8601String(),
      'NoiDung': instance.noiDung,
      'Reason': instance.reason,
      'TypeText': instance.typeText,
      'TableName': instance.tableName,
      'ColumnNameUpdate': instance.columnNameUpdate,
      'NguoiDuyet': instance.nguoiDuyet,
      'IsCancelTP': instance.isCancelTP,
      'IsCancelRegister': instance.isCancelRegister,
      'DecilineApprove': instance.decilineApprove,
      'TType': instance.tType,
      'IsApprovedHR': instance.isApprovedHR,
      'EmployeeID': instance.employeeId,
      'IsCancelHR': instance.isCancelHR,
      'StatusNumber': instance.statusNumber,
      'StatusHRNumber': instance.statusHRNumber,
      'DeleteFlag': instance.deleteFlag,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'ReasonDeciline': instance.reasonDeciline,
      'ReasonHREdit': instance.reasonHREdit,
      'EvaluateResults': instance.evaluateResults,
      'IsApprovedBGD': instance.isApprovedBGD,
      'IsSeniorApproved': instance.isSeniorApproved,
      'ApprovedSeniorID': instance.approvedSeniorId,
      'DateApprovedSenitor': instance.dateApprovedSenitor?.toIso8601String(),
      'IsSeniorApprovedText': instance.isSeniorApprovedText,
      'ApprovedSeniorName': instance.approvedSeniorName,
      'FileName': instance.fileName,
      'FilePath': instance.filePath,
      'CheckIn': instance.checkIn,
      'CheckOut': instance.checkOut,
      'IsNotValid': instance.isNotValid,
      'StatusText': instance.statusText,
      'StatusHRText': instance.statusHRText,
      'StatusBGDText': instance.statusBGDText,
      'SeniorID': instance.seniorId,
      'DecilineApproveSenior': instance.decilineApproveSenior,
    };

_$UserTeamItemImpl _$$UserTeamItemImplFromJson(Map<String, dynamic> json) =>
    _$UserTeamItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      name: json['Name'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      leaderId: (json['LeaderID'] as num?)?.toInt(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      projectTypeId: (json['ProjectTypeID'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      leader: json['Leader'] as String?,
      department: json['Department'] as String?,
      departmentName: json['DepartmentName'] as String?,
    );

Map<String, dynamic> _$$UserTeamItemImplToJson(_$UserTeamItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
      'DepartmentID': instance.departmentId,
      'LeaderID': instance.leaderId,
      'ParentID': instance.parentId,
      'ProjectTypeID': instance.projectTypeId,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'EmployeeID': instance.employeeId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'Leader': instance.leader,
      'Department': instance.department,
      'DepartmentName': instance.departmentName,
    };

_$SeniorInfoItemImpl _$$SeniorInfoItemImplFromJson(Map<String, dynamic> json) =>
    _$SeniorInfoItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      name: json['Name'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      leaderId: (json['LeaderID'] as num?)?.toInt(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      projectTypeId: (json['ProjectTypeID'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      positionCode: json['PositionCode'] as String?,
      positionName: json['PositionName'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
    );

Map<String, dynamic> _$$SeniorInfoItemImplToJson(
        _$SeniorInfoItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
      'DepartmentID': instance.departmentId,
      'LeaderID': instance.leaderId,
      'ParentID': instance.parentId,
      'ProjectTypeID': instance.projectTypeId,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'PositionCode': instance.positionCode,
      'PositionName': instance.positionName,
      'EmployeeID': instance.employeeId,
      'FullName': instance.fullName,
    };
