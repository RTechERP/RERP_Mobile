// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekPlanTaskItemImpl _$$WeekPlanTaskItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanTaskItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      statusText: json['StatusText'] as String?,
      stt: json['STT'] as String?,
      userId: (json['UserID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      mission: json['Mission'] as String?,
      taskName: json['TaskName'] as String?,
      taskContent: json['TaskContent'] as String?,
      planStartDate: json['PlanStartDate'] == null
          ? null
          : DateTime.parse(json['PlanStartDate'] as String),
      planEndDate: json['PlanEndDate'] == null
          ? null
          : DateTime.parse(json['PlanEndDate'] as String),
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      actualStartDate: json['ActualStartDate'] == null
          ? null
          : DateTime.parse(json['ActualStartDate'] as String),
      actualEndDate: json['ActualEndDate'] == null
          ? null
          : DateTime.parse(json['ActualEndDate'] as String),
      totalDayPlan: (json['TotalDayPlan'] as num?)?.toDouble(),
      percentItem: (json['PercentItem'] as num?)?.toDouble(),
      percentageActual: (json['PercentageActual'] as num?)?.toDouble(),
      progress: (json['Progress'] as num?)?.toDouble(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      typeProjectItem: (json['TypeProjectItem'] as num?)?.toInt(),
      employeeIdRequest: (json['EmployeeIDRequest'] as num?)?.toInt(),
      updatedDateActual: json['UpdatedDateActual'] == null
          ? null
          : DateTime.parse(json['UpdatedDateActual'] as String),
      code: json['Code'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      creatorId: (json['CreatorID'] as num?)?.toInt(),
      creatorName: json['CreatorName'] as String?,
      assigneeId: (json['AssigneeID'] as num?)?.toInt(),
      assigneeName: json['AssigneeName'] as String?,
      asigneeEmployeeId: (json['AsigneeEmployeeID'] as num?)?.toInt(),
      asigneeEmployeeFullName: json['AsigneeEmployeeFullName'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isUpdateLate: json['IsUpdateLate'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
      isPersonalProject: json['IsPersonalProject'] as bool?,
      isAdditional: json['IsAdditional'] as bool?,
      isCheckedIn: json['IsCheckIn'] as bool?,
      checkInTime: json['CheckInTime'] == null
          ? null
          : DateTime.parse(json['CheckInTime'] as String),
      taskComplexity: (json['TaskComplexity'] as num?)?.toInt(),
      taskComplexityText: json['TaskComplexityText'] as String?,
      percentOverTime: (json['PercentOverTime'] as num?)?.toDouble(),
      fullName: json['FullName'] as String?,
      parentCode: json['ParentCode'] as String?,
      parentTitle: json['ParentTitle'] as String?,
      secondEmployeeId: (json['SecondEmployeeID'] as num?)?.toInt(),
      secondEmployeeFullName: json['SecondEmployeeFullName'] as String?,
      secondEmployeeType: (json['SecondEmployeeType'] as num?)?.toInt(),
      reviewDiscription: json['ReviewDiscription'] as String?,
      projectTaskTypeName: json['ProjectTaskTypeName'] as String?,
      departmentAssignerId: (json['DepartmentAssignerID'] as num?)?.toInt(),
      departmentAssigneeId: (json['DepartmentAssigneeID'] as num?)?.toInt(),
      departmentAssignerName: json['DepartmentAssignerName'] as String?,
      departmentAssigneeName: json['DepartmentAssigneeName'] as String?,
      projectTaskColor: json['ProjectTaskColor'] as String?,
      totalActualHours: (json['TotalActualHours'] as num?)?.toDouble(),
      reviewCompletionRating:
          (json['ReviewCompletionRating'] as num?)?.toDouble(),
      isCheck: json['IsCheck'] as bool?,
      deadline: json['Deadline'] == null
          ? null
          : DateTime.parse(json['Deadline'] as String),
      projectTaskTypeId: (json['ProjectTaskTypeID'] as num?)?.toInt(),
      approvalStatus: json['ApprovalStatus'] as bool?,
      priority: (json['Priority'] as num?)?.toInt(),
      priorityText: json['PriorityText'] as String?,
      estimatedTime: (json['EstimatedTime'] as num?)?.toDouble(),
      description: json['Description'] as String?,
      isApprove: json['IsApprove'] as bool?,
      projectStatusName: json['ProjectStatusName'] as String?,
    );

Map<String, dynamic> _$$WeekPlanTaskItemImplToJson(
        _$WeekPlanTaskItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': instance.status,
      'StatusText': instance.statusText,
      'STT': instance.stt,
      'UserID': instance.userId,
      'ProjectID': instance.projectId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'Mission': instance.mission,
      'TaskName': instance.taskName,
      'TaskContent': instance.taskContent,
      'PlanStartDate': instance.planStartDate?.toIso8601String(),
      'PlanEndDate': instance.planEndDate?.toIso8601String(),
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'ActualStartDate': instance.actualStartDate?.toIso8601String(),
      'ActualEndDate': instance.actualEndDate?.toIso8601String(),
      'TotalDayPlan': instance.totalDayPlan,
      'PercentItem': instance.percentItem,
      'PercentageActual': instance.percentageActual,
      'Progress': instance.progress,
      'ParentID': instance.parentId,
      'TypeProjectItem': instance.typeProjectItem,
      'EmployeeIDRequest': instance.employeeIdRequest,
      'UpdatedDateActual': instance.updatedDateActual?.toIso8601String(),
      'Code': instance.code,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'CreatorID': instance.creatorId,
      'CreatorName': instance.creatorName,
      'AssigneeID': instance.assigneeId,
      'AssigneeName': instance.assigneeName,
      'AsigneeEmployeeID': instance.asigneeEmployeeId,
      'AsigneeEmployeeFullName': instance.asigneeEmployeeFullName,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsUpdateLate': instance.isUpdateLate,
      'IsDeleted': instance.isDeleted,
      'IsPersonalProject': instance.isPersonalProject,
      'IsAdditional': instance.isAdditional,
      'IsCheckIn': instance.isCheckedIn,
      'CheckInTime': instance.checkInTime?.toIso8601String(),
      'TaskComplexity': instance.taskComplexity,
      'TaskComplexityText': instance.taskComplexityText,
      'PercentOverTime': instance.percentOverTime,
      'FullName': instance.fullName,
      'ParentCode': instance.parentCode,
      'ParentTitle': instance.parentTitle,
      'SecondEmployeeID': instance.secondEmployeeId,
      'SecondEmployeeFullName': instance.secondEmployeeFullName,
      'SecondEmployeeType': instance.secondEmployeeType,
      'ReviewDiscription': instance.reviewDiscription,
      'ProjectTaskTypeName': instance.projectTaskTypeName,
      'DepartmentAssignerID': instance.departmentAssignerId,
      'DepartmentAssigneeID': instance.departmentAssigneeId,
      'DepartmentAssignerName': instance.departmentAssignerName,
      'DepartmentAssigneeName': instance.departmentAssigneeName,
      'ProjectTaskColor': instance.projectTaskColor,
      'TotalActualHours': instance.totalActualHours,
      'ReviewCompletionRating': instance.reviewCompletionRating,
      'IsCheck': instance.isCheck,
      'Deadline': instance.deadline?.toIso8601String(),
      'ProjectTaskTypeID': instance.projectTaskTypeId,
      'ApprovalStatus': instance.approvalStatus,
      'Priority': instance.priority,
      'PriorityText': instance.priorityText,
      'EstimatedTime': instance.estimatedTime,
      'Description': instance.description,
      'IsApprove': instance.isApprove,
      'ProjectStatusName': instance.projectStatusName,
    };

_$TaskTypeItemImpl _$$TaskTypeItemImplFromJson(Map<String, dynamic> json) =>
    _$TaskTypeItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      typeName: json['TypeName'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      code: json['Code'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      color: json['Color'] as String?,
    );

Map<String, dynamic> _$$TaskTypeItemImplToJson(_$TaskTypeItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TypeName': instance.typeName,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'Code': instance.code,
      'DepartmentID': instance.departmentId,
      'Color': instance.color,
    };

_$ProjectTaskItemImpl _$$ProjectTaskItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectTaskItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
    );

Map<String, dynamic> _$$ProjectTaskItemImplToJson(
        _$ProjectTaskItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
    };

_$ParentProjectTaskItemImpl _$$ParentProjectTaskItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ParentProjectTaskItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      mission: json['Mission'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      employeeCreateID: (json['EmployeeCreateID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ParentProjectTaskItemImplToJson(
        _$ParentProjectTaskItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Mission': instance.mission,
      'ProjectID': instance.projectId,
      'EmployeeCreateID': instance.employeeCreateID,
    };

_$ProjectTypeItemImpl _$$ProjectTypeItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectTypeItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectTypeCode: json['ProjectTypeCode'] as String?,
      projectTypeName: json['ProjectTypeName'] as String?,
      parentId: (json['ParentID'] as num?)?.toInt(),
      rootFolder: json['RootFolder'] as String?,
      approvedTBPID: (json['ApprovedTBPID'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      isHide: json['IsHide'] as bool?,
    );

Map<String, dynamic> _$$ProjectTypeItemImplToJson(
        _$ProjectTypeItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectTypeCode': instance.projectTypeCode,
      'ProjectTypeName': instance.projectTypeName,
      'ParentID': instance.parentId,
      'RootFolder': instance.rootFolder,
      'ApprovedTBPID': instance.approvedTBPID,
      'IsDeleted': instance.isDeleted,
      'IsHide': instance.isHide,
    };

_$WeekPlanSubTaskItemImpl _$$WeekPlanSubTaskItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanSubTaskItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      content: json['Content'] as String?,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      assigneeId: (json['AssigneeID'] as num?)?.toInt(),
      assigneeName: json['AssigneeName'] as String?,
      assignerId: (json['AssignerID'] as num?)?.toInt(),
      assignerName: json['AssignerName'] as String?,
      complexity: (json['Complexity'] as num?)?.toInt(),
      workType: (json['WorkType'] as num?)?.toInt(),
      workTypeName: json['WorkTypeName'] as String?,
      taskCategory: (json['TaskCategory'] as num?)?.toInt(),
      taskCategoryName: json['TaskCategoryName'] as String?,
    );

Map<String, dynamic> _$$WeekPlanSubTaskItemImplToJson(
        _$WeekPlanSubTaskItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Content': instance.content,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'AssigneeID': instance.assigneeId,
      'AssigneeName': instance.assigneeName,
      'AssignerID': instance.assignerId,
      'AssignerName': instance.assignerName,
      'Complexity': instance.complexity,
      'WorkType': instance.workType,
      'WorkTypeName': instance.workTypeName,
      'TaskCategory': instance.taskCategory,
      'TaskCategoryName': instance.taskCategoryName,
    };

_$WeekPlanAttachmentItemImpl _$$WeekPlanAttachmentItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanAttachmentItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      filePath: json['FilePath'] as String?,
      fileSize: (json['FileSize'] as num?)?.toInt(),
      fileType: json['FileType'] as String?,
      uploadedAt: json['UploadedAt'] == null
          ? null
          : DateTime.parse(json['UploadedAt'] as String),
    );

Map<String, dynamic> _$$WeekPlanAttachmentItemImplToJson(
        _$WeekPlanAttachmentItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FileName': instance.fileName,
      'FilePath': instance.filePath,
      'FileSize': instance.fileSize,
      'FileType': instance.fileType,
      'UploadedAt': instance.uploadedAt?.toIso8601String(),
    };

_$WeekPlanIncidentItemImpl _$$WeekPlanIncidentItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanIncidentItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      typeName: json['TypeName'] as String?,
      severity: (json['Severity'] as num?)?.toInt(),
      severityName: json['SeverityName'] as String?,
      reportedAt: json['ReportedAt'] == null
          ? null
          : DateTime.parse(json['ReportedAt'] as String),
    );

Map<String, dynamic> _$$WeekPlanIncidentItemImplToJson(
        _$WeekPlanIncidentItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Description': instance.description,
      'Type': instance.type,
      'TypeName': instance.typeName,
      'Severity': instance.severity,
      'SeverityName': instance.severityName,
      'ReportedAt': instance.reportedAt?.toIso8601String(),
    };

_$EmployeeTaskItemImpl _$$EmployeeTaskItemImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeTaskItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      chucVuHDID: (json['ChucVuHDID'] as num?)?.toInt(),
      chuVuID: (json['ChuVuID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      code: json['Code'] as String?,
      idChamCongMoi: json['IDChamCongMoi'] as String?,
      fullName: json['FullName'] as String?,
      anhCBNV: json['AnhCBNV'] as String?,
      chucVuHD: json['ChucVuHD'] as String?,
      chucVu: json['ChucVu'] as String?,
      departmentSTT: (json['DepartmentSTT'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      dvBHXH: json['DvBHXH'] as String?,
      diaDiemLamViec: json['DiaDiemLamViec'] as String?,
      birthOfDate: json['BirthOfDate'] == null
          ? null
          : DateTime.parse(json['BirthOfDate'] as String),
      noiSinh: json['NoiSinh'] as String?,
      gioiTinh: (json['GioiTinh'] as num?)?.toInt(),
      gioiTinhText: json['GioiTinhText'] as String?,
      danToc: json['DanToc'] as String?,
      tonGiao: json['TonGiao'] as String?,
      quocTich: json['QuocTich'] as String?,
      tinhTrangHonNhan: json['TinhTrangHonNhan'] as String?,
      dcThuongTru: json['DcThuongTru'] as String?,
      dcTamTru: json['DcTamTru'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
      emailCaNhan: json['EmailCaNhan'] as String?,
      sdtCongTy: json['SDTCongTy'] as String?,
      emailCongTy: json['EmailCongTy'] as String?,
      nguoiLienHeKhiCan: json['NguoiLienHeKhiCan'] as String?,
      moiQuanHe: json['MoiQuanHe'] as String?,
      sdtNguoiThan: json['SDTNguoiThan'] as String?,
      nguoiLienHeKhiCan2: json['NguoiLienHeKhiCan2'] as String?,
      moiQuanHe2: json['MoiQuanHe2'] as String?,
      sdtNguoiThan2: json['SDTNguoiThan2'] as String?,
    );

Map<String, dynamic> _$$EmployeeTaskItemImplToJson(
        _$EmployeeTaskItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'DepartmentID': instance.departmentId,
      'Status': instance.status,
      'ChucVuHDID': instance.chucVuHDID,
      'ChuVuID': instance.chuVuID,
      'STT': instance.stt,
      'Code': instance.code,
      'IDChamCongMoi': instance.idChamCongMoi,
      'FullName': instance.fullName,
      'AnhCBNV': instance.anhCBNV,
      'ChucVuHD': instance.chucVuHD,
      'ChucVu': instance.chucVu,
      'DepartmentSTT': instance.departmentSTT,
      'DepartmentName': instance.departmentName,
      'DvBHXH': instance.dvBHXH,
      'DiaDiemLamViec': instance.diaDiemLamViec,
      'BirthOfDate': instance.birthOfDate?.toIso8601String(),
      'NoiSinh': instance.noiSinh,
      'GioiTinh': instance.gioiTinh,
      'GioiTinhText': instance.gioiTinhText,
      'DanToc': instance.danToc,
      'TonGiao': instance.tonGiao,
      'QuocTich': instance.quocTich,
      'TinhTrangHonNhan': instance.tinhTrangHonNhan,
      'DcThuongTru': instance.dcThuongTru,
      'DcTamTru': instance.dcTamTru,
      'SDTCaNhan': instance.sdtCaNhan,
      'EmailCaNhan': instance.emailCaNhan,
      'SDTCongTy': instance.sdtCongTy,
      'EmailCongTy': instance.emailCongTy,
      'NguoiLienHeKhiCan': instance.nguoiLienHeKhiCan,
      'MoiQuanHe': instance.moiQuanHe,
      'SDTNguoiThan': instance.sdtNguoiThan,
      'NguoiLienHeKhiCan2': instance.nguoiLienHeKhiCan2,
      'MoiQuanHe2': instance.moiQuanHe2,
      'SDTNguoiThan2': instance.sdtNguoiThan2,
    };

_$AttendanceTaskResponseImpl _$$AttendanceTaskResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceTaskResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectTaskId: (json['ProjectTaskID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      isCheck: json['IsCheck'] as bool?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      date:
          json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
    );

Map<String, dynamic> _$$AttendanceTaskResponseImplToJson(
        _$AttendanceTaskResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectTaskID': instance.projectTaskId,
      'EmployeeID': instance.employeeId,
      'IsCheck': instance.isCheck,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'Date': instance.date?.toIso8601String(),
    };

_$SaveResponseWeekPlanImpl _$$SaveResponseWeekPlanImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveResponseWeekPlanImpl(
      id: (json['ID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      mission: json['Mission'] as String?,
      planStartDate: json['PlanStartDate'] == null
          ? null
          : DateTime.parse(json['PlanStartDate'] as String),
      planEndDate: json['PlanEndDate'] == null
          ? null
          : DateTime.parse(json['PlanEndDate'] as String),
      actualStartDate: json['ActualStartDate'] == null
          ? null
          : DateTime.parse(json['ActualStartDate'] as String),
      actualEndDate: json['ActualEndDate'] == null
          ? null
          : DateTime.parse(json['ActualEndDate'] as String),
      note: json['Note'] as String?,
      totalDayPlan: (json['TotalDayPlan'] as num?)?.toDouble(),
      percentItem: (json['PercentItem'] as num?)?.toDouble(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      totalDayActual: (json['TotalDayActual'] as num?)?.toDouble(),
      itemLate: (json['ItemLate'] as num?)?.toInt(),
      timeSpan: (json['TimeSpan'] as num?)?.toDouble(),
      typeProjectItem: (json['TypeProjectItem'] as num?)?.toInt(),
      percentageActual: (json['PercentageActual'] as num?)?.toDouble(),
      employeeIdRequest: (json['EmployeeIDRequest'] as num?)?.toInt(),
      updatedDateActual: json['UpdatedDateActual'] == null
          ? null
          : DateTime.parse(json['UpdatedDateActual'] as String),
      isApproved: (json['IsApproved'] as num?)?.toInt(),
      code: json['Code'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isUpdateLate: json['IsUpdateLate'] as bool?,
      reasonLate: json['ReasonLate'] as String?,
      updatedDateReasonLate: json['UpdatedDateReasonLate'] == null
          ? null
          : DateTime.parse(json['UpdatedDateReasonLate'] as String),
      isApprovedLate: json['IsApprovedLate'] as bool?,
      employeeRequestID: (json['EmployeeRequestID'] as num?)?.toInt(),
      employeeRequestName: json['EmployeeRequestName'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      location: json['Location'] as String?,
      employeeCreateID: (json['EmployeeCreateID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      isPersonalProject: json['IsPersonalProject'] as bool?,
      isAdditional: json['IsAdditional'] as bool?,
      taskComplexity: (json['TaskComplexity'] as num?)?.toInt(),
      percentOverTime: (json['PercentOverTime'] as num?)?.toDouble(),
      descriptionSolution: json['DescriptionSolution'] as String?,
      deadline: json['Deadline'] == null
          ? null
          : DateTime.parse(json['Deadline'] as String),
      projectTaskTypeID: (json['ProjectTaskTypeID'] as num?)?.toInt(),
      projectTaskResult: json['ProjectTaskResult'] as String?,
      priority: (json['Priority'] as num?)?.toInt(),
      estimatedTime: (json['EstimatedTime'] as num?)?.toDouble(),
      needApprove: json['NeedApprove'] as bool?,
    );

Map<String, dynamic> _$$SaveResponseWeekPlanImplToJson(
        _$SaveResponseWeekPlanImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': instance.status,
      'STT': instance.stt,
      'UserID': instance.userId,
      'ProjectID': instance.projectId,
      'Mission': instance.mission,
      'PlanStartDate': instance.planStartDate?.toIso8601String(),
      'PlanEndDate': instance.planEndDate?.toIso8601String(),
      'ActualStartDate': instance.actualStartDate?.toIso8601String(),
      'ActualEndDate': instance.actualEndDate?.toIso8601String(),
      'Note': instance.note,
      'TotalDayPlan': instance.totalDayPlan,
      'PercentItem': instance.percentItem,
      'ParentID': instance.parentId,
      'TotalDayActual': instance.totalDayActual,
      'ItemLate': instance.itemLate,
      'TimeSpan': instance.timeSpan,
      'TypeProjectItem': instance.typeProjectItem,
      'PercentageActual': instance.percentageActual,
      'EmployeeIDRequest': instance.employeeIdRequest,
      'UpdatedDateActual': instance.updatedDateActual?.toIso8601String(),
      'IsApproved': instance.isApproved,
      'Code': instance.code,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsUpdateLate': instance.isUpdateLate,
      'ReasonLate': instance.reasonLate,
      'UpdatedDateReasonLate':
          instance.updatedDateReasonLate?.toIso8601String(),
      'IsApprovedLate': instance.isApprovedLate,
      'EmployeeRequestID': instance.employeeRequestID,
      'EmployeeRequestName': instance.employeeRequestName,
      'IsDeleted': instance.isDeleted,
      'Location': instance.location,
      'EmployeeCreateID': instance.employeeCreateID,
      'Description': instance.description,
      'IsPersonalProject': instance.isPersonalProject,
      'IsAdditional': instance.isAdditional,
      'TaskComplexity': instance.taskComplexity,
      'PercentOverTime': instance.percentOverTime,
      'DescriptionSolution': instance.descriptionSolution,
      'Deadline': instance.deadline?.toIso8601String(),
      'ProjectTaskTypeID': instance.projectTaskTypeID,
      'ProjectTaskResult': instance.projectTaskResult,
      'Priority': instance.priority,
      'EstimatedTime': instance.estimatedTime,
      'NeedApprove': instance.needApprove,
    };

_$UploadAttachmentResponseImpl _$$UploadAttachmentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadAttachmentResponseImpl(
      originalFileName: json['OriginalFileName'] as String,
      savedFileName: json['SavedFileName'] as String,
      filePath: json['FilePath'] as String,
      fileSize: (json['FileSize'] as num).toInt(),
      contentType: json['ContentType'] as String,
      uploadTime: DateTime.parse(json['UploadTime'] as String),
    );

Map<String, dynamic> _$$UploadAttachmentResponseImplToJson(
        _$UploadAttachmentResponseImpl instance) =>
    <String, dynamic>{
      'OriginalFileName': instance.originalFileName,
      'SavedFileName': instance.savedFileName,
      'FilePath': instance.filePath,
      'FileSize': instance.fileSize,
      'ContentType': instance.contentType,
      'UploadTime': instance.uploadTime.toIso8601String(),
    };

_$FileWeekPlanResponseImpl _$$FileWeekPlanResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FileWeekPlanResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectTaskId: (json['ProjectTaskID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      filePath: json['FilePath'] as String?,
      employeeUploadID: (json['EmployeeUploadID'] as num?)?.toInt(),
      uploadedDate: json['UploadedDate'] == null
          ? null
          : DateTime.parse(json['UploadedDate'] as String),
      type: (json['Type'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$FileWeekPlanResponseImplToJson(
        _$FileWeekPlanResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectTaskID': instance.projectTaskId,
      'FileName': instance.fileName,
      'FilePath': instance.filePath,
      'EmployeeUploadID': instance.employeeUploadID,
      'UploadedDate': instance.uploadedDate?.toIso8601String(),
      'Type': instance.type,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
    };

_$WeekPlanLinkItemImpl _$$WeekPlanLinkItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanLinkItemImpl(
      id: (json['id'] as num?)?.toInt(),
      fileName: json['fileName'] as String?,
      filePath: json['filePath'] as String?,
      fileSize: (json['fileSize'] as num?)?.toInt(),
      fileType: json['fileType'] as String?,
    );

Map<String, dynamic> _$$WeekPlanLinkItemImplToJson(
        _$WeekPlanLinkItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'fileSize': instance.fileSize,
      'fileType': instance.fileType,
    };

_$LinkWeekPlanResponseImpl _$$LinkWeekPlanResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LinkWeekPlanResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectTaskId: (json['ProjectTaskID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      filePath: json['FilePath'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$LinkWeekPlanResponseImplToJson(
        _$LinkWeekPlanResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectTaskID': instance.projectTaskId,
      'FileName': instance.fileName,
      'FilePath': instance.filePath,
      'Type': instance.type,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
    };

_$ChecklistWeekPlanResponseImpl _$$ChecklistWeekPlanResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistWeekPlanResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectTaskId: (json['ProjectTaskID'] as num?)?.toInt(),
      checklistTitle: json['ChecklistTitle'] as String?,
      orderIndex: (json['OrderIndex'] as num?)?.toInt(),
      isDone: json['IsDone'] as bool?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$ChecklistWeekPlanResponseImplToJson(
        _$ChecklistWeekPlanResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectTaskID': instance.projectTaskId,
      'ChecklistTitle': instance.checklistTitle,
      'OrderIndex': instance.orderIndex,
      'IsDone': instance.isDone,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
    };

_$SubTaskWeekPlanImpl _$$SubTaskWeekPlanImplFromJson(
        Map<String, dynamic> json) =>
    _$SubTaskWeekPlanImpl(
      id: (json['ID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      mission: json['Mission'] as String?,
      planStartDate: json['PlanStartDate'] == null
          ? null
          : DateTime.parse(json['PlanStartDate'] as String),
      planEndDate: json['PlanEndDate'] == null
          ? null
          : DateTime.parse(json['PlanEndDate'] as String),
      actualStartDate: json['ActualStartDate'] == null
          ? null
          : DateTime.parse(json['ActualStartDate'] as String),
      actualEndDate: json['ActualEndDate'] == null
          ? null
          : DateTime.parse(json['ActualEndDate'] as String),
      note: json['Note'] as String?,
      totalDayPlan: (json['TotalDayPlan'] as num?)?.toDouble(),
      percentItem: (json['PercentItem'] as num?)?.toDouble(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      totalDayActual: (json['TotalDayActual'] as num?)?.toDouble(),
      itemLate: (json['ItemLate'] as num?)?.toInt(),
      timeSpan: (json['TimeSpan'] as num?)?.toDouble(),
      typeProjectItem: (json['TypeProjectItem'] as num?)?.toInt(),
      percentageActual: (json['PercentageActual'] as num?)?.toDouble(),
      employeeIdRequest: (json['EmployeeIDRequest'] as num?)?.toInt(),
      updatedDateActual: json['UpdatedDateActual'] == null
          ? null
          : DateTime.parse(json['UpdatedDateActual'] as String),
      isApproved: json['IsApproved'] as bool?,
      code: json['Code'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isUpdateLate: json['IsUpdateLate'] as bool?,
      reasonLate: json['ReasonLate'] as String?,
      updatedDateReasonLate: json['UpdatedDateReasonLate'] == null
          ? null
          : DateTime.parse(json['UpdatedDateReasonLate'] as String),
      isApprovedLate: json['IsApprovedLate'] as bool?,
      employeeRequestID: (json['EmployeeRequestID'] as num?)?.toInt(),
      employeeRequestName: json['EmployeeRequestName'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      location: json['Location'] as String?,
      employeeCreateID: (json['EmployeeCreateID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      isPersonalProject: json['IsPersonalProject'] as bool?,
      isAdditional: json['IsAdditional'] as bool?,
      taskComplexity: (json['TaskComplexity'] as num?)?.toInt(),
      percentOverTime: (json['PercentOverTime'] as num?)?.toDouble(),
      descriptionSolution: json['DescriptionSolution'] as String?,
      deadline: json['Deadline'] == null
          ? null
          : DateTime.parse(json['Deadline'] as String),
      projectTaskTypeID: (json['ProjectTaskTypeID'] as num?)?.toInt(),
      projectTaskResult: json['ProjectTaskResult'] as String?,
      priority: (json['Priority'] as num?)?.toInt(),
      estimatedTime: (json['EstimatedTime'] as num?)?.toDouble(),
      needApprove: json['NeedApprove'] as bool?,
    );

Map<String, dynamic> _$$SubTaskWeekPlanImplToJson(
        _$SubTaskWeekPlanImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': instance.status,
      'STT': instance.stt,
      'UserID': instance.userId,
      'ProjectID': instance.projectId,
      'Mission': instance.mission,
      'PlanStartDate': instance.planStartDate?.toIso8601String(),
      'PlanEndDate': instance.planEndDate?.toIso8601String(),
      'ActualStartDate': instance.actualStartDate?.toIso8601String(),
      'ActualEndDate': instance.actualEndDate?.toIso8601String(),
      'Note': instance.note,
      'TotalDayPlan': instance.totalDayPlan,
      'PercentItem': instance.percentItem,
      'ParentID': instance.parentId,
      'TotalDayActual': instance.totalDayActual,
      'ItemLate': instance.itemLate,
      'TimeSpan': instance.timeSpan,
      'TypeProjectItem': instance.typeProjectItem,
      'PercentageActual': instance.percentageActual,
      'EmployeeIDRequest': instance.employeeIdRequest,
      'UpdatedDateActual': instance.updatedDateActual?.toIso8601String(),
      'IsApproved': instance.isApproved,
      'Code': instance.code,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsUpdateLate': instance.isUpdateLate,
      'ReasonLate': instance.reasonLate,
      'UpdatedDateReasonLate':
          instance.updatedDateReasonLate?.toIso8601String(),
      'IsApprovedLate': instance.isApprovedLate,
      'EmployeeRequestID': instance.employeeRequestID,
      'EmployeeRequestName': instance.employeeRequestName,
      'IsDeleted': instance.isDeleted,
      'Location': instance.location,
      'EmployeeCreateID': instance.employeeCreateID,
      'Description': instance.description,
      'IsPersonalProject': instance.isPersonalProject,
      'IsAdditional': instance.isAdditional,
      'TaskComplexity': instance.taskComplexity,
      'PercentOverTime': instance.percentOverTime,
      'DescriptionSolution': instance.descriptionSolution,
      'Deadline': instance.deadline?.toIso8601String(),
      'ProjectTaskTypeID': instance.projectTaskTypeID,
      'ProjectTaskResult': instance.projectTaskResult,
      'Priority': instance.priority,
      'EstimatedTime': instance.estimatedTime,
      'NeedApprove': instance.needApprove,
    };

_$AdditionalWeekPlanResponseImpl _$$AdditionalWeekPlanResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AdditionalWeekPlanResponseImpl(
      projectTaskId: (json['ProjectTaskID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      id: (json['ID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AdditionalWeekPlanResponseImplToJson(
        _$AdditionalWeekPlanResponseImpl instance) =>
    <String, dynamic>{
      'ProjectTaskID': instance.projectTaskId,
      'Description': instance.description,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'ID': instance.id,
    };

_$WeekPlanDetailResponseImpl _$$WeekPlanDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanDetailResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      mission: json['Mission'] as String?,
      planStartDate: json['PlanStartDate'] == null
          ? null
          : DateTime.parse(json['PlanStartDate'] as String),
      planEndDate: json['PlanEndDate'] == null
          ? null
          : DateTime.parse(json['PlanEndDate'] as String),
      actualStartDate: json['ActualStartDate'] == null
          ? null
          : DateTime.parse(json['ActualStartDate'] as String),
      actualEndDate: json['ActualEndDate'] == null
          ? null
          : DateTime.parse(json['ActualEndDate'] as String),
      note: json['Note'] as String?,
      totalDayPlan: (json['TotalDayPlan'] as num?)?.toDouble(),
      percentItem: (json['PercentItem'] as num?)?.toDouble(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      totalDayActual: (json['TotalDayActual'] as num?)?.toDouble(),
      itemLate: (json['ItemLate'] as num?)?.toInt(),
      timeSpan: (json['TimeSpan'] as num?)?.toDouble(),
      typeProjectItem: (json['TypeProjectItem'] as num?)?.toInt(),
      percentageActual: (json['PercentageActual'] as num?)?.toDouble(),
      employeeIdRequest: (json['EmployeeIDRequest'] as num?)?.toInt(),
      updatedDateActual: json['UpdatedDateActual'] == null
          ? null
          : DateTime.parse(json['UpdatedDateActual'] as String),
      isApproved: (json['IsApproved'] as num?)?.toInt(),
      code: json['Code'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isUpdateLate: json['IsUpdateLate'] as bool?,
      reasonLate: json['ReasonLate'] as String?,
      updatedDateReasonLate: json['UpdatedDateReasonLate'] == null
          ? null
          : DateTime.parse(json['UpdatedDateReasonLate'] as String),
      isApprovedLate: json['IsApprovedLate'] as bool?,
      employeeRequestID: (json['EmployeeRequestID'] as num?)?.toInt(),
      employeeRequestName: json['EmployeeRequestName'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      location: json['Location'] as String?,
      employeeCreateID: (json['EmployeeCreateID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      isPersonalProject: json['IsPersonalProject'] as bool?,
      isAdditional: json['IsAdditional'] as bool?,
      taskComplexity: (json['TaskComplexity'] as num?)?.toInt(),
      percentOverTime: (json['PercentOverTime'] as num?)?.toDouble(),
      descriptionSolution: json['DescriptionSolution'] as String?,
      deadline: json['Deadline'] == null
          ? null
          : DateTime.parse(json['Deadline'] as String),
      projectTaskTypeID: (json['ProjectTaskTypeID'] as num?)?.toInt(),
      projectTaskResult: json['ProjectTaskResult'] as String?,
      priority: (json['Priority'] as num?)?.toInt(),
      estimatedTime: (json['EstimatedTime'] as num?)?.toDouble(),
      needApprove: json['NeedApprove'] as bool?,
    );

Map<String, dynamic> _$$WeekPlanDetailResponseImplToJson(
        _$WeekPlanDetailResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': instance.status,
      'STT': instance.stt,
      'UserID': instance.userId,
      'ProjectID': instance.projectId,
      'Mission': instance.mission,
      'PlanStartDate': instance.planStartDate?.toIso8601String(),
      'PlanEndDate': instance.planEndDate?.toIso8601String(),
      'ActualStartDate': instance.actualStartDate?.toIso8601String(),
      'ActualEndDate': instance.actualEndDate?.toIso8601String(),
      'Note': instance.note,
      'TotalDayPlan': instance.totalDayPlan,
      'PercentItem': instance.percentItem,
      'ParentID': instance.parentId,
      'TotalDayActual': instance.totalDayActual,
      'ItemLate': instance.itemLate,
      'TimeSpan': instance.timeSpan,
      'TypeProjectItem': instance.typeProjectItem,
      'PercentageActual': instance.percentageActual,
      'EmployeeIDRequest': instance.employeeIdRequest,
      'UpdatedDateActual': instance.updatedDateActual?.toIso8601String(),
      'IsApproved': instance.isApproved,
      'Code': instance.code,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsUpdateLate': instance.isUpdateLate,
      'ReasonLate': instance.reasonLate,
      'UpdatedDateReasonLate':
          instance.updatedDateReasonLate?.toIso8601String(),
      'IsApprovedLate': instance.isApprovedLate,
      'EmployeeRequestID': instance.employeeRequestID,
      'EmployeeRequestName': instance.employeeRequestName,
      'IsDeleted': instance.isDeleted,
      'Location': instance.location,
      'EmployeeCreateID': instance.employeeCreateID,
      'Description': instance.description,
      'IsPersonalProject': instance.isPersonalProject,
      'IsAdditional': instance.isAdditional,
      'TaskComplexity': instance.taskComplexity,
      'PercentOverTime': instance.percentOverTime,
      'DescriptionSolution': instance.descriptionSolution,
      'Deadline': instance.deadline?.toIso8601String(),
      'ProjectTaskTypeID': instance.projectTaskTypeID,
      'ProjectTaskResult': instance.projectTaskResult,
      'Priority': instance.priority,
      'EstimatedTime': instance.estimatedTime,
      'NeedApprove': instance.needApprove,
    };

_$WeekPlanTypeEmployeeDetailResponseImpl
    _$$WeekPlanTypeEmployeeDetailResponseImplFromJson(
            Map<String, dynamic> json) =>
        _$WeekPlanTypeEmployeeDetailResponseImpl(
          id: (json['ID'] as num?)?.toInt(),
          projectTaskId: (json['ProjectTaskID'] as num?)?.toInt(),
          employeeId: (json['EmployeeID'] as num?)?.toInt(),
          type: (json['Type'] as num?)?.toInt(),
          createdDate: json['CreatedDate'] == null
              ? null
              : DateTime.parse(json['CreatedDate'] as String),
          createdBy: json['CreatedBy'] as String?,
          updatedDate: json['UpdatedDate'] == null
              ? null
              : DateTime.parse(json['UpdatedDate'] as String),
          updatedBy: json['UpdatedBy'] as String?,
          isDeleted: json['IsDeleted'] as bool?,
        );

Map<String, dynamic> _$$WeekPlanTypeEmployeeDetailResponseImplToJson(
        _$WeekPlanTypeEmployeeDetailResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectTaskID': instance.projectTaskId,
      'EmployeeID': instance.employeeId,
      'Type': instance.type,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
    };

_$ProjectTaskTimelineItemImpl _$$ProjectTaskTimelineItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectTaskTimelineItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectStatusName: json['ProjectStatusName'] as String?,
      planEndDate: json['PlanEndDate'] == null
          ? null
          : DateTime.parse(json['PlanEndDate'] as String),
      planStartDate: json['PlanStartDate'] == null
          ? null
          : DateTime.parse(json['PlanStartDate'] as String),
      projectTaskId: (json['ProjectTaskID'] as num?)?.toInt(),
      projectTaskCode: json['ProjectTaskCode'] as String?,
      typeProjectItem: (json['TypeProjectItem'] as num?)?.toInt(),
      projectTypeName: json['ProjectTypeName'] as String?,
      projectTaskTitle: json['ProjectTaskTitle'] as String?,
      projectTaskParentId: (json['ProjectTaskParentID'] as num?)?.toInt(),
      projectTaskParentCode: json['ProjectTaskParentCode'] as String?,
      projectTaskParentTitle: json['ProjectTaskParentTitle'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      isApprove: json['IsApprove'] as bool?,
      sumTotalHour: (json['SumTotalHour'] as num?)?.toDouble(),
      durationDays: (json['DurationDays'] as num?)?.toInt(),
      typeDate: (json['TypeDate'] as num?)?.toInt(),
      dateOff: json['DateOff'] as String?,
    );

Map<String, dynamic> _$$ProjectTaskTimelineItemImplToJson(
        _$ProjectTaskTimelineItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
      'Code': instance.code,
      'ProjectID': instance.projectId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectStatusName': instance.projectStatusName,
      'PlanEndDate': instance.planEndDate?.toIso8601String(),
      'PlanStartDate': instance.planStartDate?.toIso8601String(),
      'ProjectTaskID': instance.projectTaskId,
      'ProjectTaskCode': instance.projectTaskCode,
      'TypeProjectItem': instance.typeProjectItem,
      'ProjectTypeName': instance.projectTypeName,
      'ProjectTaskTitle': instance.projectTaskTitle,
      'ProjectTaskParentID': instance.projectTaskParentId,
      'ProjectTaskParentCode': instance.projectTaskParentCode,
      'ProjectTaskParentTitle': instance.projectTaskParentTitle,
      'Status': instance.status,
      'IsApprove': instance.isApprove,
      'SumTotalHour': instance.sumTotalHour,
      'DurationDays': instance.durationDays,
      'TypeDate': instance.typeDate,
      'DateOff': instance.dateOff,
    };

_$DayOffItemImpl _$$DayOffItemImplFromJson(Map<String, dynamic> json) =>
    _$DayOffItemImpl(
      dateOff: json['DateOff'] == null
          ? null
          : DateTime.parse(json['DateOff'] as String),
    );

Map<String, dynamic> _$$DayOffItemImplToJson(_$DayOffItemImpl instance) =>
    <String, dynamic>{
      'DateOff': instance.dateOff?.toIso8601String(),
    };

_$WeekPlanFilterItemImpl _$$WeekPlanFilterItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanFilterItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      no: (json['No'] as num?)?.toInt(),
      title: json['Title'] as String?,
      description: json['Description'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      colorBackground: json['ColorBackground'] as String?,
      colorFont: json['ColorFont'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$WeekPlanFilterItemImplToJson(
        _$WeekPlanFilterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'No': instance.no,
      'Title': instance.title,
      'Description': instance.description,
      'Type': instance.type,
      'ColorBackground': instance.colorBackground,
      'ColorFont': instance.colorFont,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
    };
