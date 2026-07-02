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

_$IdeaDetailMemberImpl _$$IdeaDetailMemberImplFromJson(
        Map<String, dynamic> json) =>
    _$IdeaDetailMemberImpl(
      id: (json['ID'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$IdeaDetailMemberImplToJson(
        _$IdeaDetailMemberImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
    };

_$IdeaDetailDepartmentImpl _$$IdeaDetailDepartmentImplFromJson(
        Map<String, dynamic> json) =>
    _$IdeaDetailDepartmentImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      description: json['Description'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      status: (json['Status'] as num?)?.toInt(),
      email: json['Email'] as String?,
      headofDepartment: (json['HeadofDepartment'] as num?)?.toInt(),
      isShowHotline: json['IsShowHotline'] as bool?,
      pid: json['PId'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      parentId: (json['ParentID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$IdeaDetailDepartmentImplToJson(
        _$IdeaDetailDepartmentImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'Description': instance.description,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'Status': instance.status,
      'Email': instance.email,
      'HeadofDepartment': instance.headofDepartment,
      'IsShowHotline': instance.isShowHotline,
      'PId': instance.pid,
      'STT': instance.stt,
      'IsDeleted': instance.isDeleted,
      'ParentID': instance.parentId,
    };

_$IdeaDetailMainImpl _$$IdeaDetailMainImplFromJson(Map<String, dynamic> json) =>
    _$IdeaDetailMainImpl(
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
    );

Map<String, dynamic> _$$IdeaDetailMainImplToJson(
        _$IdeaDetailMainImpl instance) =>
    <String, dynamic>{
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
    };

_$IdeaDetailItemImpl _$$IdeaDetailItemImplFromJson(Map<String, dynamic> json) =>
    _$IdeaDetailItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      registerIdeaId: (json['RegisterIdeaID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      category: json['Category'] as String?,
      description: json['Description'] as String?,
      note: json['Note'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      dateStart: json['DateStart'] == null
          ? null
          : DateTime.parse(json['DateStart'] as String),
      dateEnd: json['DateEnd'] == null
          ? null
          : DateTime.parse(json['DateEnd'] as String),
    );

Map<String, dynamic> _$$IdeaDetailItemImplToJson(
        _$IdeaDetailItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RegisterIdeaID': instance.registerIdeaId,
      'STT': instance.stt,
      'Category': instance.category,
      'Description': instance.description,
      'Note': instance.note,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'DateStart': instance.dateStart?.toIso8601String(),
      'DateEnd': instance.dateEnd?.toIso8601String(),
    };

_$IdeaDetailImpl _$$IdeaDetailImplFromJson(Map<String, dynamic> json) =>
    _$IdeaDetailImpl(
      members: (json['em'] as List<dynamic>?)
          ?.map((e) => IdeaDetailMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      departments: (json['de'] as List<dynamic>?)
          ?.map((e) => IdeaDetailDepartment.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: json['rgt'] == null
          ? null
          : IdeaDetailMain.fromJson(json['rgt'] as Map<String, dynamic>),
      details: (json['rgtd'] as List<dynamic>?)
          ?.map((e) => IdeaDetailItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: (json['rgtf'] as List<dynamic>?)
          ?.map((e) => IdeaDetailFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      scores: (json['rgts'] as List<dynamic>?)
          ?.map((e) => IdeaDetailScore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IdeaDetailImplToJson(_$IdeaDetailImpl instance) =>
    <String, dynamic>{
      'em': instance.members,
      'de': instance.departments,
      'rgt': instance.main,
      'rgtd': instance.details,
      'rgtf': instance.files,
      'rgts': instance.scores,
    };

_$IdeaDetailFileImpl _$$IdeaDetailFileImplFromJson(Map<String, dynamic> json) =>
    _$IdeaDetailFileImpl(
      id: (json['ID'] as num?)?.toInt(),
      registerIdeaId: (json['RegisterIdeaID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      filePath: json['FilePath'] as String?,
      fileType: json['FileType'] as String?,
      fileSize: (json['FileSize'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
    );

Map<String, dynamic> _$$IdeaDetailFileImplToJson(
        _$IdeaDetailFileImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RegisterIdeaID': instance.registerIdeaId,
      'FileName': instance.fileName,
      'FilePath': instance.filePath,
      'FileType': instance.fileType,
      'FileSize': instance.fileSize,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
    };

_$IdeaDetailScoreImpl _$$IdeaDetailScoreImplFromJson(
        Map<String, dynamic> json) =>
    _$IdeaDetailScoreImpl(
      id: (json['ID'] as num?)?.toInt(),
      registerIdeaId: (json['RegisterIdeaID'] as num?)?.toInt(),
      score: (json['Score'] as num?)?.toDouble(),
      scoredBy: json['ScoredBy'] as String?,
      scoredDate: json['ScoredDate'] == null
          ? null
          : DateTime.parse(json['ScoredDate'] as String),
      note: json['Note'] as String?,
    );

Map<String, dynamic> _$$IdeaDetailScoreImplToJson(
        _$IdeaDetailScoreImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RegisterIdeaID': instance.registerIdeaId,
      'Score': instance.score,
      'ScoredBy': instance.scoredBy,
      'ScoredDate': instance.scoredDate?.toIso8601String(),
      'Note': instance.note,
    };
