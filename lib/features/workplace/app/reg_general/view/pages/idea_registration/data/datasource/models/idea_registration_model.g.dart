// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idea_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdeaCatalogItemImpl _$$IdeaCatalogItemImplFromJson(
        Map<String, dynamic> json) =>
    _$IdeaCatalogItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$$IdeaCatalogItemImplToJson(
        _$IdeaCatalogItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
    };

_$IdeaItemImpl _$$IdeaItemImplFromJson(Map<String, dynamic> json) =>
    _$IdeaItemImpl(
      totalPage: (json['TotalPage'] as num?)?.toInt(),
      id: (json['ID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      dateRegister: json['DateRegister'] == null
          ? null
          : DateTime.parse(json['DateRegister'] as String),
      isApprovedTBP: json['IsApprovedTBP'] as bool?,
      dateApprovedTBP: json['DateApprovedTBP'] == null
          ? null
          : DateTime.parse(json['DateApprovedTBP'] as String),
      approvedTBPID: (json['ApprovedTBPID'] as num?)?.toInt(),
      isApproved: json['IsApproved'] as bool?,
      dateApproved: json['DateApproved'] == null
          ? null
          : DateTime.parse(json['DateApproved'] as String),
      approvedID: (json['ApprovedID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      registerIdeaTypeID: (json['RegisterIdeaTypeID'] as num?)?.toInt(),
      departmentOrganizationID:
          (json['DepartmentOrganizationID'] as num?)?.toInt(),
      courseID: (json['CourseID'] as num?)?.toInt(),
      employeeName: json['EmployeeName'] as String?,
      tbpName: json['TBPName'] as String?,
      bgdName: json['BGDName'] as String?,
      departmentScore: (json['DepartmentScore'] as num?)?.toDouble(),
      tbpScore: (json['TBPScore'] as num?)?.toDouble(),
      bgdScore: (json['BGDScore'] as num?)?.toDouble(),
      avgScore: (json['AvgScore'] as num?)?.toDouble(),
      rowNum: (json['RowNum'] as num?)?.toInt(),
      bgdScoreNew: json['BGDScoreNew'] as String?,
      departmentOrganization: json['DepartmentOrganization'] as String?,
      dateStart: json['DateStart'] == null
          ? null
          : DateTime.parse(json['DateStart'] as String),
      dateEnd: json['DateEnd'] == null
          ? null
          : DateTime.parse(json['DateEnd'] as String),
      description: json['Description'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      registerTypeName: json['RegisterTypeName'] as String?,
      registerTypeCode: json['RegisterTypeCode'] as String?,
      registerTypeDepartmentName: json['RegisterTypeDepartmentName'] as String?,
      departmentName: json['DepartmentName'] as String?,
    );

Map<String, dynamic> _$$IdeaItemImplToJson(_$IdeaItemImpl instance) =>
    <String, dynamic>{
      'TotalPage': instance.totalPage,
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'DateRegister': instance.dateRegister?.toIso8601String(),
      'IsApprovedTBP': instance.isApprovedTBP,
      'DateApprovedTBP': instance.dateApprovedTBP?.toIso8601String(),
      'ApprovedTBPID': instance.approvedTBPID,
      'IsApproved': instance.isApproved,
      'DateApproved': instance.dateApproved?.toIso8601String(),
      'ApprovedID': instance.approvedID,
      'Note': instance.note,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'RegisterIdeaTypeID': instance.registerIdeaTypeID,
      'DepartmentOrganizationID': instance.departmentOrganizationID,
      'CourseID': instance.courseID,
      'EmployeeName': instance.employeeName,
      'TBPName': instance.tbpName,
      'BGDName': instance.bgdName,
      'DepartmentScore': instance.departmentScore,
      'TBPScore': instance.tbpScore,
      'BGDScore': instance.bgdScore,
      'AvgScore': instance.avgScore,
      'RowNum': instance.rowNum,
      'BGDScoreNew': instance.bgdScoreNew,
      'DepartmentOrganization': instance.departmentOrganization,
      'DateStart': instance.dateStart?.toIso8601String(),
      'DateEnd': instance.dateEnd?.toIso8601String(),
      'Description': instance.description,
      'STT': instance.stt,
      'RegisterTypeName': instance.registerTypeName,
      'RegisterTypeCode': instance.registerTypeCode,
      'RegisterTypeDepartmentName': instance.registerTypeDepartmentName,
      'DepartmentName': instance.departmentName,
    };
