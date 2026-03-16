// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportRequestImpl _$$ReportRequestImplFromJson(Map<String, dynamic> json) =>
    _$ReportRequestImpl(
      dateStart: DateTime.parse(json['DateStart'] as String),
      dateEnd: DateTime.parse(json['DateEnd'] as String),
      teamId: json['TeamID'] as String,
      userId: json['UserID'] as String,
      keyword: json['Keyword'] as String,
      departmentId: json['DepartmentID'] as String,
    );

Map<String, dynamic> _$$ReportRequestImplToJson(_$ReportRequestImpl instance) =>
    <String, dynamic>{
      'DateStart': instance.dateStart.toIso8601String(),
      'DateEnd': instance.dateEnd.toIso8601String(),
      'TeamID': instance.teamId,
      'UserID': instance.userId,
      'Keyword': instance.keyword,
      'DepartmentID': instance.departmentId,
    };

_$ReportResponseImpl _$$ReportResponseImplFromJson(Map<String, dynamic> json) =>
    _$ReportResponseImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String,
      fullName: json['FullName'] as String,
      userId: (json['UserID'] as num).toInt(),
      dateReport: json['DateReport'] as String,
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectText: json['ProjectText'] as String?,
      totalHours: (json['TotalHours'] as num).toDouble(),
      results: json['Results'] as String,
      planNextDay: json['PlanNextDay'] as String,
      backlog: json['Backlog'] as String?,
      problem: json['Problem'] as String?,
      problemSolve: json['ProblemSolve'] as String?,
      note: json['Note'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      type: (json['Type'] as num?)?.toInt(),
      typeText: json['TypeText'] as String?,
      positionName: json['PositionName'] as String,
      mission: json['Mission'] as String,
      projectItemCode: json['ProjectItemCode'] as String,
      projectItemName: json['ProjectItemName'] as String?,
      content: json['Content'] as String,
      percentComplete: (json['PercentComplete'] as num).toDouble(),
      totalHourOT: (json['TotalHourOT'] as num?)?.toDouble(),
      holidayDate: json['HolidayDate'] == null
          ? null
          : DateTime.parse(json['HolidayDate'] as String),
      planStartDate: json['PlanStartDate'] as String?,
      planEndDate: json['PlanEndDate'] as String?,
      actualStartDate: json['ActualStartDate'] as String?,
      actualEndDate: json['ActualEndDate'] as String?,
      totalDayPlan: (json['TotalDayPlan'] as num?)?.toInt(),
      totalDayActual: (json['TotalDayActual'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReportResponseImplToJson(
        _$ReportResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
      'UserID': instance.userId,
      'DateReport': instance.dateReport,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectText': instance.projectText,
      'TotalHours': instance.totalHours,
      'Results': instance.results,
      'PlanNextDay': instance.planNextDay,
      'Backlog': instance.backlog,
      'Problem': instance.problem,
      'ProblemSolve': instance.problemSolve,
      'Note': instance.note,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'Type': instance.type,
      'TypeText': instance.typeText,
      'PositionName': instance.positionName,
      'Mission': instance.mission,
      'ProjectItemCode': instance.projectItemCode,
      'ProjectItemName': instance.projectItemName,
      'Content': instance.content,
      'PercentComplete': instance.percentComplete,
      'TotalHourOT': instance.totalHourOT,
      'HolidayDate': instance.holidayDate?.toIso8601String(),
      'PlanStartDate': instance.planStartDate,
      'PlanEndDate': instance.planEndDate,
      'ActualStartDate': instance.actualStartDate,
      'ActualEndDate': instance.actualEndDate,
      'TotalDayPlan': instance.totalDayPlan,
      'TotalDayActual': instance.totalDayActual,
    };

_$DepartResponseImpl _$$DepartResponseImplFromJson(Map<String, dynamic> json) =>
    _$DepartResponseImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String,
      name: json['Name'] as String,
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
      headOfDepartment: (json['HeadofDepartment'] as num?)?.toInt(),
      isShowHotline: json['IsShowHotline'] as bool?,
      pId: json['PId'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$DepartResponseImplToJson(
        _$DepartResponseImpl instance) =>
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
      'HeadofDepartment': instance.headOfDepartment,
      'IsShowHotline': instance.isShowHotline,
      'PId': instance.pId,
      'STT': instance.stt,
      'IsDeleted': instance.isDeleted,
    };

_$StaffResponseImpl _$$StaffResponseImplFromJson(Map<String, dynamic> json) =>
    _$StaffResponseImpl(
      id: (json['ID'] as num).toInt(),
      userId: (json['UserID'] as num).toInt(),
      departmentId: (json['DepartmentID'] as num).toInt(),
      status: (json['Status'] as num?)?.toInt(),
      chucVuHdId: (json['ChucVuHDID'] as num?)?.toInt(),
      chucVuId: (json['ChuVuID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      code: json['Code'] as String?,
      idChamCongMoi: json['IDChamCongMoi'] as String?,
      fullName: json['FullName'] as String,
      avatarUrl: json['AnhCBNV'] as String?,
      chucVuHd: json['ChucVuHD'] as String?,
      chucVu: json['ChucVu'] as String?,
      departmentStt: (json['DepartmentSTT'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      dvBhxh: json['DvBHXH'] as String?,
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
    );

Map<String, dynamic> _$$StaffResponseImplToJson(_$StaffResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'DepartmentID': instance.departmentId,
      'Status': instance.status,
      'ChucVuHDID': instance.chucVuHdId,
      'ChuVuID': instance.chucVuId,
      'STT': instance.stt,
      'Code': instance.code,
      'IDChamCongMoi': instance.idChamCongMoi,
      'FullName': instance.fullName,
      'AnhCBNV': instance.avatarUrl,
      'ChucVuHD': instance.chucVuHd,
      'ChucVu': instance.chucVu,
      'DepartmentSTT': instance.departmentStt,
      'DepartmentName': instance.departmentName,
      'DvBHXH': instance.dvBhxh,
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
    };

_$TeamResponseImpl _$$TeamResponseImplFromJson(Map<String, dynamic> json) =>
    _$TeamResponseImpl(
      id: (json['ID'] as num).toInt(),
      leaderId: (json['LeaderID'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      name: json['Name'] as String,
      projectTypeId: (json['ProjectTypeID'] as num?)?.toInt(),
      leader: json['Leader'] as String?,
      typeName: json['TypeName'] as String?,
      departmentName: json['DepartmentName'] as String?,
    );

Map<String, dynamic> _$$TeamResponseImplToJson(_$TeamResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'LeaderID': instance.leaderId,
      'DepartmentID': instance.departmentId,
      'ParentID': instance.parentId,
      'Name': instance.name,
      'ProjectTypeID': instance.projectTypeId,
      'Leader': instance.leader,
      'TypeName': instance.typeName,
      'DepartmentName': instance.departmentName,
    };

_$ProjectResponseImpl _$$ProjectResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectResponseImpl(
      id: (json['ID'] as num).toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String,
      projectName: json['ProjectName'] as String,
      projectShortName: json['ProjectShortName'] as String?,
      projectStatus: (json['ProjectStatus'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      userTechnicalId: (json['UserTechnicalID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      isApproved: json['IsApproved'] as bool?,
      contactId: (json['ContactID'] as num?)?.toInt(),
      po: json['PO'] as String?,
      projectType: (json['ProjectType'] as num?)?.toInt(),
      listCostId: (json['ListCostID'] as num?)?.toInt(),
      planDateStart: json['PlanDateStart'] == null
          ? null
          : DateTime.parse(json['PlanDateStart'] as String),
      planDateEnd: json['PlanDateEnd'] == null
          ? null
          : DateTime.parse(json['PlanDateEnd'] as String),
      actualDateStart: json['ActualDateStart'] == null
          ? null
          : DateTime.parse(json['ActualDateStart'] as String),
      actualDateEnd: json['ActualDateEnd'] == null
          ? null
          : DateTime.parse(json['ActualDateEnd'] as String),
      eu: json['EU'] as String?,
      projectManager: (json['ProjectManager'] as num?)?.toInt(),
      currentState: json['CurrentState'] as String?,
      priority: (json['Priotity'] as num?)?.toDouble(),
      poDate: json['PODate'] == null
          ? null
          : DateTime.parse(json['PODate'] as String),
      endUser: (json['EndUser'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      businessFieldId: (json['BusinessFieldID'] as num?)?.toInt(),
      typeProject: (json['TypeProject'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$ProjectResponseImplToJson(
        _$ProjectResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectShortName': instance.projectShortName,
      'ProjectStatus': instance.projectStatus,
      'UserID': instance.userId,
      'UserTechnicalID': instance.userTechnicalId,
      'Note': instance.note,
      'IsApproved': instance.isApproved,
      'ContactID': instance.contactId,
      'PO': instance.po,
      'ProjectType': instance.projectType,
      'ListCostID': instance.listCostId,
      'PlanDateStart': instance.planDateStart?.toIso8601String(),
      'PlanDateEnd': instance.planDateEnd?.toIso8601String(),
      'ActualDateStart': instance.actualDateStart?.toIso8601String(),
      'ActualDateEnd': instance.actualDateEnd?.toIso8601String(),
      'EU': instance.eu,
      'ProjectManager': instance.projectManager,
      'CurrentState': instance.currentState,
      'Priotity': instance.priority,
      'PODate': instance.poDate?.toIso8601String(),
      'EndUser': instance.endUser,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'BusinessFieldID': instance.businessFieldId,
      'TypeProject': instance.typeProject,
      'IsDeleted': instance.isDeleted,
    };

_$ProjectItemResponseImpl _$$ProjectItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectItemResponseImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String,
      mission: json['Mission'] as String?,
      percentageActual: (json['PercentageActual'] as num?)?.toDouble(),
      planStartDate: json['PlanStartDate'] == null
          ? null
          : DateTime.parse(json['PlanStartDate'] as String),
      planEndDate: json['PlanEndDate'] == null
          ? null
          : DateTime.parse(json['PlanEndDate'] as String),
      totalDayPlan: (json['TotalDayPlan'] as num?)?.toDouble(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectItemResponseImplToJson(
        _$ProjectItemResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Mission': instance.mission,
      'PercentageActual': instance.percentageActual,
      'PlanStartDate': instance.planStartDate?.toIso8601String(),
      'PlanEndDate': instance.planEndDate?.toIso8601String(),
      'TotalDayPlan': instance.totalDayPlan,
      'EmployeeID': instance.employeeId,
    };

_$SaveReportTechRequestImpl _$$SaveReportTechRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveReportTechRequestImpl(
      id: (json['ID'] as num).toInt(),
      backlog: json['Backlog'] as String?,
      confirm: json['Confirm'] as bool?,
      content: json['Content'] as String?,
      dateReport: json['DateReport'] as String?,
      deleteFlag: (json['DeleteFlag'] as num?)?.toInt(),
      location: json['Location'] as String?,
      masterId: (json['MasterID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      oldProjectId: (json['OldProjectID'] as num?)?.toInt(),
      projectItemId: (json['ProjectItemID'] as num?)?.toInt(),
      percentComplete: (json['PercentComplete'] as num).toDouble(),
      planNextDay: json['PlanNextDay'] as String,
      problem: json['Problem'] as String?,
      problemSolve: json['ProblemSolve'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      reportLate: (json['ReportLate'] as num?)?.toInt(),
      results: json['Results'] as String?,
      statusResult: (json['StatusResult'] as num?)?.toInt(),
      percentageActual: (json['PercentageActual'] as num?)?.toDouble(),
      totalHourOT: (json['TotalHourOT'] as num?)?.toDouble(),
      totalHours: (json['TotalHours'] as num?)?.toDouble(),
      type: (json['Type'] as num?)?.toInt(),
      userReport: (json['UserReport'] as num?)?.toInt(),
      workPlanDetailId: (json['WorkPlanDetailID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SaveReportTechRequestImplToJson(
        _$SaveReportTechRequestImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Backlog': instance.backlog,
      'Confirm': instance.confirm,
      'Content': instance.content,
      'DateReport': instance.dateReport,
      'DeleteFlag': instance.deleteFlag,
      'Location': instance.location,
      'MasterID': instance.masterId,
      'Note': instance.note,
      'OldProjectID': instance.oldProjectId,
      'ProjectItemID': instance.projectItemId,
      'PercentComplete': instance.percentComplete,
      'PlanNextDay': instance.planNextDay,
      'Problem': instance.problem,
      'ProblemSolve': instance.problemSolve,
      'ProjectID': instance.projectId,
      'ReportLate': instance.reportLate,
      'Results': instance.results,
      'StatusResult': instance.statusResult,
      'PercentageActual': instance.percentageActual,
      'TotalHourOT': instance.totalHourOT,
      'TotalHours': instance.totalHours,
      'Type': instance.type,
      'UserReport': instance.userReport,
      'WorkPlanDetailID': instance.workPlanDetailId,
    };

_$SendMailRequestModelImpl _$$SendMailRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SendMailRequestModelImpl(
      body: json['Body'] as String,
      dateReport: json['DateReport'] as String,
    );

Map<String, dynamic> _$$SendMailRequestModelImplToJson(
        _$SendMailRequestModelImpl instance) =>
    <String, dynamic>{
      'Body': instance.body,
      'DateReport': instance.dateReport,
    };

_$DetailReportResponseImpl _$$DetailReportResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailReportResponseImpl(
      id: (json['ID'] as num).toInt(),
      masterId: (json['MasterID'] as num).toInt(),
      userReport: (json['UserReport'] as num).toInt(),
      dateReport: json['DateReport'] as String,
      projectId: (json['ProjectID'] as num).toInt(),
      content: json['Content'] as String,
      results: json['Results'] as String,
      problem: json['Problem'] as String,
      problemSolve: json['ProblemSolve'] as String,
      planNextDay: json['PlanNextDay'] as String,
      note: json['Note'] as String,
      confirm: json['Confirm'] as bool,
      backlog: json['Backlog'] as String,
      deleteFlag: (json['DeleteFlag'] as num).toInt(),
      createdDate: DateTime.parse(json['CreatedDate'] as String),
      type: (json['Type'] as num).toInt(),
      reportLate: (json['ReportLate'] as num).toInt(),
      oldProjectId: (json['OldProjectID'] as num).toInt(),
      totalHours: (json['TotalHours'] as num).toDouble(),
      statusResult: (json['StatusResult'] as num).toInt(),
      workPlanDetailId: (json['WorkPlanDetailID'] as num).toInt(),
      createdBy: json['CreatedBy'] as String,
      updatedDate: DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String,
      projectItemId: (json['ProjectItemID'] as num).toInt(),
      percentComplete: (json['PercentComplete'] as num).toInt(),
      totalHourOT: (json['TotalHourOT'] as num).toDouble(),
      location: json['Location'] as String,
    );

Map<String, dynamic> _$$DetailReportResponseImplToJson(
        _$DetailReportResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'MasterID': instance.masterId,
      'UserReport': instance.userReport,
      'DateReport': instance.dateReport,
      'ProjectID': instance.projectId,
      'Content': instance.content,
      'Results': instance.results,
      'Problem': instance.problem,
      'ProblemSolve': instance.problemSolve,
      'PlanNextDay': instance.planNextDay,
      'Note': instance.note,
      'Confirm': instance.confirm,
      'Backlog': instance.backlog,
      'DeleteFlag': instance.deleteFlag,
      'CreatedDate': instance.createdDate.toIso8601String(),
      'Type': instance.type,
      'ReportLate': instance.reportLate,
      'OldProjectID': instance.oldProjectId,
      'TotalHours': instance.totalHours,
      'StatusResult': instance.statusResult,
      'WorkPlanDetailID': instance.workPlanDetailId,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'ProjectItemID': instance.projectItemId,
      'PercentComplete': instance.percentComplete,
      'TotalHourOT': instance.totalHourOT,
      'Location': instance.location,
    };

_$DetailReportNullResponseImpl _$$DetailReportNullResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailReportNullResponseImpl(
      id: (json['ID'] as num).toInt(),
      masterId: (json['MasterID'] as num).toInt(),
      userReport: (json['UserReport'] as num).toInt(),
      dateReport: json['DateReport'] as String,
      projectId: (json['ProjectID'] as num).toInt(),
      content: json['Content'] as String,
      results: json['Results'] as String,
      problem: json['Problem'] as String,
      problemSolve: json['ProblemSolve'] as String,
      planNextDay: json['PlanNextDay'] as String,
      note: json['Note'] as String,
      confirm: json['Confirm'] as bool,
      backlog: json['Backlog'] as String,
      deleteFlag: (json['DeleteFlag'] as num).toInt(),
      createdDate: DateTime.parse(json['CreatedDate'] as String),
      type: (json['Type'] as num).toInt(),
      reportLate: (json['ReportLate'] as num).toInt(),
      oldProjectId: (json['OldProjectID'] as num).toInt(),
      totalHours: (json['TotalHours'] as num).toDouble(),
      statusResult: (json['StatusResult'] as num).toInt(),
      workPlanDetailId: (json['WorkPlanDetailID'] as num).toInt(),
      createdBy: json['CreatedBy'] as String,
      updatedDate: DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String,
      projectItemId: (json['ProjectItemID'] as num?)?.toInt(),
      percentComplete: (json['PercentComplete'] as num?)?.toInt(),
      totalHourOT: (json['TotalHourOT'] as num).toDouble(),
      location: json['Location'] as String,
    );

Map<String, dynamic> _$$DetailReportNullResponseImplToJson(
        _$DetailReportNullResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'MasterID': instance.masterId,
      'UserReport': instance.userReport,
      'DateReport': instance.dateReport,
      'ProjectID': instance.projectId,
      'Content': instance.content,
      'Results': instance.results,
      'Problem': instance.problem,
      'ProblemSolve': instance.problemSolve,
      'PlanNextDay': instance.planNextDay,
      'Note': instance.note,
      'Confirm': instance.confirm,
      'Backlog': instance.backlog,
      'DeleteFlag': instance.deleteFlag,
      'CreatedDate': instance.createdDate.toIso8601String(),
      'Type': instance.type,
      'ReportLate': instance.reportLate,
      'OldProjectID': instance.oldProjectId,
      'TotalHours': instance.totalHours,
      'StatusResult': instance.statusResult,
      'WorkPlanDetailID': instance.workPlanDetailId,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'ProjectItemID': instance.projectItemId,
      'PercentComplete': instance.percentComplete,
      'TotalHourOT': instance.totalHourOT,
      'Location': instance.location,
    };

_$CopyRequestImpl _$$CopyRequestImplFromJson(Map<String, dynamic> json) =>
    _$CopyRequestImpl(
      dateStart: json['dateStart'] as String,
      dateEnd: json['dateEnd'] as String,
      teamId: (json['team_id'] as num).toInt(),
      keyword: json['keyword'] as String,
      userId: (json['userid'] as num).toInt(),
      departmentId: (json['departmentid'] as num).toInt(),
    );

Map<String, dynamic> _$$CopyRequestImplToJson(_$CopyRequestImpl instance) =>
    <String, dynamic>{
      'dateStart': instance.dateStart,
      'dateEnd': instance.dateEnd,
      'team_id': instance.teamId,
      'keyword': instance.keyword,
      'userid': instance.userId,
      'departmentid': instance.departmentId,
    };

_$CopyResponseImpl _$$CopyResponseImplFromJson(Map<String, dynamic> json) =>
    _$CopyResponseImpl(
      projectCode: json['ProjectCode'] as String,
      projectName: json['ProjectName'] as String,
      projectItemCode: json['ProjectItemCode'] as String,
      dateReport: json['DateReport'] as String,
      mission: json['Mission'] as String,
      results: json['Results'] as String,
      backlog: json['Backlog'] as String,
      problem: json['Problem'] as String,
      problemSolve: json['ProblemSolve'] as String,
      planNextDay: json['PlanNextDay'] as String,
      note: json['Note'] as String,
    );

Map<String, dynamic> _$$CopyResponseImplToJson(_$CopyResponseImpl instance) =>
    <String, dynamic>{
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectItemCode': instance.projectItemCode,
      'DateReport': instance.dateReport,
      'Mission': instance.mission,
      'Results': instance.results,
      'Backlog': instance.backlog,
      'Problem': instance.problem,
      'ProblemSolve': instance.problemSolve,
      'PlanNextDay': instance.planNextDay,
      'Note': instance.note,
    };

_$CopyNullResponseImpl _$$CopyNullResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CopyNullResponseImpl(
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectItemCode: json['ProjectItemCode'] as String?,
      dateReport: json['DateReport'] as String,
      mission: json['Mission'] as String?,
      results: json['Results'] as String?,
      backlog: json['Backlog'] as String,
      problem: json['Problem'] as String?,
      problemSolve: json['ProblemSolve'] as String?,
      planNextDay: json['PlanNextDay'] as String,
      note: json['Note'] as String,
    );

Map<String, dynamic> _$$CopyNullResponseImplToJson(
        _$CopyNullResponseImpl instance) =>
    <String, dynamic>{
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectItemCode': instance.projectItemCode,
      'DateReport': instance.dateReport,
      'Mission': instance.mission,
      'Results': instance.results,
      'Backlog': instance.backlog,
      'Problem': instance.problem,
      'ProblemSolve': instance.problemSolve,
      'PlanNextDay': instance.planNextDay,
      'Note': instance.note,
    };

_$MarketingFileRequestImpl _$$MarketingFileRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$MarketingFileRequestImpl(
      id: (json['ID'] as num).toInt(),
      fileName: json['FileName'] as String,
      fileNameOrigin: json['FileNameOrigin'] as String,
      originPath: json['OriginPath'] as String,
      extension: json['Extension'] as String,
      pathServer: json['PathServer'] as String,
      dailyReportId: (json['DailyReportID'] as num).toInt(),
    );

Map<String, dynamic> _$$MarketingFileRequestImplToJson(
        _$MarketingFileRequestImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FileName': instance.fileName,
      'FileNameOrigin': instance.fileNameOrigin,
      'OriginPath': instance.originPath,
      'Extension': instance.extension,
      'PathServer': instance.pathServer,
      'DailyReportID': instance.dailyReportId,
    };

_$MarketingRequestImpl _$$MarketingRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$MarketingRequestImpl(
      id: (json['ID'] as num).toInt(),
      userReport: (json['UserReport'] as num).toInt(),
      dateReport: json['DateReport'] as String,
      content: json['Content'] as String,
      results: json['Results'] as String,
      planNextDay: json['PlanNextDay'] as String,
      note: json['Note'] as String,
      dailyReportMarketingFiles: (json['dailyReportMarketingFiles']
              as List<dynamic>)
          .map((e) => MarketingFileRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      deletedFileId: (json['deletedFileID'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$MarketingRequestImplToJson(
        _$MarketingRequestImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserReport': instance.userReport,
      'DateReport': instance.dateReport,
      'Content': instance.content,
      'Results': instance.results,
      'PlanNextDay': instance.planNextDay,
      'Note': instance.note,
      'dailyReportMarketingFiles': instance.dailyReportMarketingFiles,
      'deletedFileID': instance.deletedFileId,
    };

_$UploadFileResponseImpl _$$UploadFileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadFileResponseImpl(
      originalFileName: json['OriginalFileName'] as String,
      savedFileName: json['SavedFileName'] as String,
      filePath: json['FilePath'] as String,
      fileSize: (json['FileSize'] as num).toInt(),
      contentType: json['ContentType'] as String,
      uploadTime: DateTime.parse(json['UploadTime'] as String),
    );

Map<String, dynamic> _$$UploadFileResponseImplToJson(
        _$UploadFileResponseImpl instance) =>
    <String, dynamic>{
      'OriginalFileName': instance.originalFileName,
      'SavedFileName': instance.savedFileName,
      'FilePath': instance.filePath,
      'FileSize': instance.fileSize,
      'ContentType': instance.contentType,
      'UploadTime': instance.uploadTime.toIso8601String(),
    };

_$DetailMarketingReportResponseImpl
    _$$DetailMarketingReportResponseImplFromJson(Map<String, dynamic> json) =>
        _$DetailMarketingReportResponseImpl(
          dailyData: DetailMarketingDailyData.fromJson(
              json['dailyData'] as Map<String, dynamic>),
          dailyFileData: (json['dailyFileData'] as List<dynamic>)
              .map(
                  (e) => MarketingDailyFile.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$DetailMarketingReportResponseImplToJson(
        _$DetailMarketingReportResponseImpl instance) =>
    <String, dynamic>{
      'dailyData': instance.dailyData,
      'dailyFileData': instance.dailyFileData,
    };

_$DetailMarketingDailyDataImpl _$$DetailMarketingDailyDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailMarketingDailyDataImpl(
      id: (json['ID'] as num?)?.toInt(),
      dateReport: json['DateReport'] as String?,
      content: json['Content'] as String?,
      results: json['Results'] as String?,
      planNextDay: json['PlanNextDay'] as String?,
      note: json['Note'] as String?,
      employeeID: (json['UserReport'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DetailMarketingDailyDataImplToJson(
        _$DetailMarketingDailyDataImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'DateReport': instance.dateReport,
      'Content': instance.content,
      'Results': instance.results,
      'PlanNextDay': instance.planNextDay,
      'Note': instance.note,
      'UserReport': instance.employeeID,
    };

_$MarketingDailyFileImpl _$$MarketingDailyFileImplFromJson(
        Map<String, dynamic> json) =>
    _$MarketingDailyFileImpl(
      id: (json['ID'] as num).toInt(),
      fileName: json['FileName'] as String,
      dailyReportId: (json['DailyReportID'] as num).toInt(),
      pathServer: json['PathServer'] as String,
      isDeleted: json['IsDeleted'] as bool,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
    );

Map<String, dynamic> _$$MarketingDailyFileImplToJson(
        _$MarketingDailyFileImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FileName': instance.fileName,
      'DailyReportID': instance.dailyReportId,
      'PathServer': instance.pathServer,
      'IsDeleted': instance.isDeleted,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
    };

_$ReportLXCPRequestImpl _$$ReportLXCPRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportLXCPRequestImpl(
      id: (json['ID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num).toInt(),
      dateReport: json['DateReport'] as String,
      filmManagementDetailId: (json['FilmManagementDetailID'] as num?)?.toInt(),
      quantity: (json['Quantity'] as num?)?.toInt(),
      timeActual: (json['TimeActual'] as num?)?.toInt(),
      performanceActual: (json['PerformanceActual'] as num?)?.toDouble(),
      percentage: (json['Percentage'] as num?)?.toDouble(),
      kmNumber: (json['KmNumber'] as num?)?.toInt(),
      totalLate: (json['TotalLate'] as num?)?.toInt(),
      totalTimeLate: (json['TotalTimeLate'] as num?)?.toInt(),
      reasonLate: json['ReasonLate'] as String?,
      statusVehicle: json['StatusVehicle'] as String?,
      propose: json['Propose'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$ReportLXCPRequestImplToJson(
        _$ReportLXCPRequestImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'DateReport': instance.dateReport,
      'FilmManagementDetailID': instance.filmManagementDetailId,
      'Quantity': instance.quantity,
      'TimeActual': instance.timeActual,
      'PerformanceActual': instance.performanceActual,
      'Percentage': instance.percentage,
      'KmNumber': instance.kmNumber,
      'TotalLate': instance.totalLate,
      'TotalTimeLate': instance.totalTimeLate,
      'ReasonLate': instance.reasonLate,
      'StatusVehicle': instance.statusVehicle,
      'Propose': instance.propose,
      'IsDeleted': instance.isDeleted,
    };

_$ReportLXCPResponseImpl _$$ReportLXCPResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportLXCPResponseImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ReportLXCPData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$ReportLXCPResponseImplToJson(
        _$ReportLXCPResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

_$ReportLXCPDataImpl _$$ReportLXCPDataImplFromJson(Map<String, dynamic> json) =>
    _$ReportLXCPDataImpl(
      technical: (json['technical'] as List<dynamic>?)
              ?.map((e) => TechnicalReport.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dataFilm: (json['dataFilm'] as List<dynamic>?)
              ?.map((e) => HrReportItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dataDriver: (json['dataDriver'] as List<dynamic>?)
              ?.map((e) => HrReportItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hrAll: (json['hrAll'] as List<dynamic>?)
              ?.map((e) => HrReportItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReportLXCPDataImplToJson(
        _$ReportLXCPDataImpl instance) =>
    <String, dynamic>{
      'technical': instance.technical,
      'dataFilm': instance.dataFilm,
      'dataDriver': instance.dataDriver,
      'hrAll': instance.hrAll,
    };

_$TechnicalReportImpl _$$TechnicalReportImplFromJson(
        Map<String, dynamic> json) =>
    _$TechnicalReportImpl(
      userId: (json['UserID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      confirm: json['Confirm'] as bool?,
      id: (json['ID'] as num?)?.toInt(),
      dateReport: json['DateReport'] as String?,
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectText: json['ProjectText'] as String?,
      totalHours: (json['TotalHours'] as num?)?.toDouble(),
      results: json['Results'] as String?,
      planNextDay: json['PlanNextDay'] as String?,
      backlog: json['Backlog'] as String?,
      problem: json['Problem'] as String?,
      problemSolve: json['ProblemSolve'] as String?,
      note: json['Note'] as String?,
      createdDate: json['CreatedDate'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      typeText: json['TypeText'] as String?,
      positionName: json['PositionName'] as String?,
      mission: json['Mission'] as String?,
      projectItemCode: json['ProjectItemCode'] as String?,
      content: json['Content'] as String?,
      percentComplete: (json['PercentComplete'] as num?)?.toInt(),
      projectItemName: json['ProjectItemName'] as String?,
      totalHourOT: (json['TotalHourOT'] as num?)?.toDouble(),
      holidayDate: json['HolidayDate'] as String?,
      planStartDate: json['PlanStartDate'] as String?,
      planEndDate: json['PlanEndDate'] as String?,
      totalDayPlan: (json['TotalDayPlan'] as num?)?.toDouble(),
      actualStartDate: json['ActualStartDate'] as String?,
      actualEndDate: json['ActualEndDate'] as String?,
      totalDayActual: (json['TotalDayActual'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TechnicalReportImplToJson(
        _$TechnicalReportImpl instance) =>
    <String, dynamic>{
      'UserID': instance.userId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'Confirm': instance.confirm,
      'ID': instance.id,
      'DateReport': instance.dateReport,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectText': instance.projectText,
      'TotalHours': instance.totalHours,
      'Results': instance.results,
      'PlanNextDay': instance.planNextDay,
      'Backlog': instance.backlog,
      'Problem': instance.problem,
      'ProblemSolve': instance.problemSolve,
      'Note': instance.note,
      'CreatedDate': instance.createdDate,
      'Type': instance.type,
      'TypeText': instance.typeText,
      'PositionName': instance.positionName,
      'Mission': instance.mission,
      'ProjectItemCode': instance.projectItemCode,
      'Content': instance.content,
      'PercentComplete': instance.percentComplete,
      'ProjectItemName': instance.projectItemName,
      'TotalHourOT': instance.totalHourOT,
      'HolidayDate': instance.holidayDate,
      'PlanStartDate': instance.planStartDate,
      'PlanEndDate': instance.planEndDate,
      'TotalDayPlan': instance.totalDayPlan,
      'ActualStartDate': instance.actualStartDate,
      'ActualEndDate': instance.actualEndDate,
      'TotalDayActual': instance.totalDayActual,
    };

_$HrReportItemImpl _$$HrReportItemImplFromJson(Map<String, dynamic> json) =>
    _$HrReportItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      dateReport: json['DateReport'] as String?,
      filmManagementDetailId: (json['FilmManagementDetailID'] as num?)?.toInt(),
      quantity: (json['Quantity'] as num?)?.toInt(),
      timeActual: (json['TimeActual'] as num?)?.toInt(),
      performanceActual: (json['PerformanceActual'] as num?)?.toInt(),
      percentage: (json['Percentage'] as num?)?.toInt(),
      kmNumber: (json['KmNumber'] as num?)?.toInt(),
      totalLate: (json['TotalLate'] as num?)?.toInt(),
      totalTimeLate: (json['TotalTimeLate'] as num?)?.toInt(),
      reasonLate: json['ReasonLate'] as String?,
      statusVehicle: json['StatusVehicle'] as String?,
      propose: json['Propose'] as String?,
      createdDate: json['CreatedDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      performanceAVG: (json['PerformanceAVG'] as num?)?.toDouble(),
      workContent: json['WorkContent'] as String?,
      filmName: json['FilmName'] as String?,
      unitName: json['UnitName'] as String?,
      fullName: json['FullName'] as String?,
      chucVuHdId: (json['ChucVuHDID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$HrReportItemImplToJson(_$HrReportItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'DateReport': instance.dateReport,
      'FilmManagementDetailID': instance.filmManagementDetailId,
      'Quantity': instance.quantity,
      'TimeActual': instance.timeActual,
      'PerformanceActual': instance.performanceActual,
      'Percentage': instance.percentage,
      'KmNumber': instance.kmNumber,
      'TotalLate': instance.totalLate,
      'TotalTimeLate': instance.totalTimeLate,
      'ReasonLate': instance.reasonLate,
      'StatusVehicle': instance.statusVehicle,
      'Propose': instance.propose,
      'CreatedDate': instance.createdDate,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate,
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'PerformanceAVG': instance.performanceAVG,
      'WorkContent': instance.workContent,
      'FilmName': instance.filmName,
      'UnitName': instance.unitName,
      'FullName': instance.fullName,
      'ChucVuHDID': instance.chucVuHdId,
    };

_$FilmDetailResponseImpl _$$FilmDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FilmDetailResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      filmManagementID: (json['FilmManagementID'] as num?)?.toInt(),
      unitID: (json['UnitID'] as num?)?.toInt(),
      performanceAVG: (json['PerformanceAVG'] as num?)?.toDouble(),
      workContent: json['WorkContent'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      createdDate: json['CreatedDate'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      unitName: json['UnitName'] as String?,
      workContent1: json['WorkContent1'] as String?,
      requestResult: json['RequestResult'] as bool?,
    );

Map<String, dynamic> _$$FilmDetailResponseImplToJson(
        _$FilmDetailResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'STT': instance.stt,
      'FilmManagementID': instance.filmManagementID,
      'UnitID': instance.unitID,
      'PerformanceAVG': instance.performanceAVG,
      'WorkContent': instance.workContent,
      'IsDeleted': instance.isDeleted,
      'CreatedDate': instance.createdDate,
      'UpdatedDate': instance.updatedDate,
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'UnitName': instance.unitName,
      'WorkContent1': instance.workContent1,
      'RequestResult': instance.requestResult,
    };

_$DetailLXCPReportResponseImpl _$$DetailLXCPReportResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailLXCPReportResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      employeeID: (json['EmployeeID'] as num?)?.toInt(),
      dateReport: json['DateReport'] as String?,
      filmManagementDetailID: (json['FilmManagementDetailID'] as num?)?.toInt(),
      quantity: (json['Quantity'] as num?)?.toInt(),
      timeActual: (json['TimeActual'] as num?)?.toDouble(),
      performanceActual: (json['PerformanceActual'] as num?)?.toDouble(),
      percentage: (json['Percentage'] as num?)?.toDouble(),
      kmNumber: (json['KmNumber'] as num?)?.toDouble(),
      totalLate: (json['TotalLate'] as num?)?.toInt(),
      totalTimeLate: (json['TotalTimeLate'] as num?)?.toDouble(),
      reasonLate: json['ReasonLate'] as String?,
      statusVehicle: json['StatusVehicle'] as String?,
      propose: json['Propose'] as String?,
      createdDate: json['CreatedDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$DetailLXCPReportResponseImplToJson(
        _$DetailLXCPReportResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeID,
      'DateReport': instance.dateReport,
      'FilmManagementDetailID': instance.filmManagementDetailID,
      'Quantity': instance.quantity,
      'TimeActual': instance.timeActual,
      'PerformanceActual': instance.performanceActual,
      'Percentage': instance.percentage,
      'KmNumber': instance.kmNumber,
      'TotalLate': instance.totalLate,
      'TotalTimeLate': instance.totalTimeLate,
      'ReasonLate': instance.reasonLate,
      'StatusVehicle': instance.statusVehicle,
      'Propose': instance.propose,
      'CreatedDate': instance.createdDate,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate,
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
    };

_$DetailSaleReportResponseImpl _$$DetailSaleReportResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailSaleReportResponseImpl(
      id: (json['ID'] as num).toInt(),
      customerId: (json['CustomerID'] as num).toInt(),
      userId: (json['UserID'] as num).toInt(),
      contacId: (json['ContacID'] as num).toInt(),
      dateStart: DateTime.parse(json['DateStart'] as String),
      dateEnd: DateTime.parse(json['DateEnd'] as String),
      telesale: (json['Telesale'] as num?)?.toInt(),
      visit: (json['Visit'] as num?)?.toInt(),
      demo: (json['Demo'] as num?)?.toInt(),
      result: json['Result'] as String?,
      problemBacklog: json['ProblemBacklog'] as String?,
      planNext: json['PlanNext'] as String?,
      note: json['Note'] as String?,
      bigAccount: json['BigAccount'] as bool,
      groupType: (json['GroupType'] as num).toInt(),
      content: json['Content'] as String,
      userLoginId: (json['UserLoginID'] as num?)?.toInt(),
      createdDate: DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String,
      month: (json['Month'] as num).toInt(),
      year: (json['Year'] as num).toInt(),
      endUser: (json['EndUser'] as num?)?.toInt(),
      deleteFlag: (json['DeleteFlag'] as num).toInt(),
      confirm: json['Confirm'] as bool,
      productOfCustomer: json['ProductOfCustomer'] as String?,
      requestOfCustomer: json['RequestOfCustomer'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      firmBaseId: (json['FirmBaseID'] as num?)?.toInt(),
      projectTypeBaseId: (json['ProjectTypeBaseID'] as num?)?.toInt(),
      saleOpportunity: json['SaleOpportunity'] as bool?,
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DetailSaleReportResponseImplToJson(
        _$DetailSaleReportResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'UserID': instance.userId,
      'ContacID': instance.contacId,
      'DateStart': instance.dateStart.toIso8601String(),
      'DateEnd': instance.dateEnd.toIso8601String(),
      'Telesale': instance.telesale,
      'Visit': instance.visit,
      'Demo': instance.demo,
      'Result': instance.result,
      'ProblemBacklog': instance.problemBacklog,
      'PlanNext': instance.planNext,
      'Note': instance.note,
      'BigAccount': instance.bigAccount,
      'GroupType': instance.groupType,
      'Content': instance.content,
      'UserLoginID': instance.userLoginId,
      'CreatedDate': instance.createdDate.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'Month': instance.month,
      'Year': instance.year,
      'EndUser': instance.endUser,
      'DeleteFlag': instance.deleteFlag,
      'Confirm': instance.confirm,
      'ProductOfCustomer': instance.productOfCustomer,
      'RequestOfCustomer': instance.requestOfCustomer,
      'ProjectID': instance.projectId,
      'FirmBaseID': instance.firmBaseId,
      'ProjectTypeBaseID': instance.projectTypeBaseId,
      'SaleOpportunity': instance.saleOpportunity,
      'WarehouseID': instance.warehouseId,
    };

_$SaleProjectResponseImpl _$$SaleProjectResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleProjectResponseImpl(
      id: (json['ID'] as num).toInt(),
      customerId: (json['CustomerID'] as num).toInt(),
      projectCode: json['ProjectCode'] as String,
      projectName: json['ProjectName'] as String,
      projectShortName: json['ProjectShortName'] as String,
      projectStatus: (json['ProjectStatus'] as num).toInt(),
      userId: (json['UserID'] as num).toInt(),
      userTechnicalId: (json['UserTechnicalID'] as num?)?.toInt(),
      note: json['Note'] as String,
      isApproved: json['IsApproved'] as bool?,
      contactId: (json['ContactID'] as num?)?.toInt(),
      po: json['PO'] as String?,
      projectType: (json['ProjectType'] as num?)?.toInt(),
      listCostId: (json['ListCostID'] as num?)?.toInt(),
      planDateStart: json['PlanDateStart'] == null
          ? null
          : DateTime.parse(json['PlanDateStart'] as String),
      planDateEnd: json['PlanDateEnd'] == null
          ? null
          : DateTime.parse(json['PlanDateEnd'] as String),
      actualDateStart: json['ActualDateStart'] == null
          ? null
          : DateTime.parse(json['ActualDateStart'] as String),
      actualDateEnd: json['ActualDateEnd'] == null
          ? null
          : DateTime.parse(json['ActualDateEnd'] as String),
      eu: json['EU'] as String?,
      projectManager: (json['ProjectManager'] as num?)?.toInt(),
      currentState: json['CurrentState'] as String?,
      priority: (json['Priotity'] as num?)?.toInt(),
      poDate: json['PODate'] == null
          ? null
          : DateTime.parse(json['PODate'] as String),
      endUser: (json['EndUser'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String,
      createdDate: DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String,
      updatedDate: DateTime.parse(json['UpdatedDate'] as String),
      businessFieldId: (json['BusinessFieldID'] as num?)?.toInt(),
      typeProject: (json['TypeProject'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool,
    );

Map<String, dynamic> _$$SaleProjectResponseImplToJson(
        _$SaleProjectResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectShortName': instance.projectShortName,
      'ProjectStatus': instance.projectStatus,
      'UserID': instance.userId,
      'UserTechnicalID': instance.userTechnicalId,
      'Note': instance.note,
      'IsApproved': instance.isApproved,
      'ContactID': instance.contactId,
      'PO': instance.po,
      'ProjectType': instance.projectType,
      'ListCostID': instance.listCostId,
      'PlanDateStart': instance.planDateStart?.toIso8601String(),
      'PlanDateEnd': instance.planDateEnd?.toIso8601String(),
      'ActualDateStart': instance.actualDateStart?.toIso8601String(),
      'ActualDateEnd': instance.actualDateEnd?.toIso8601String(),
      'EU': instance.eu,
      'ProjectManager': instance.projectManager,
      'CurrentState': instance.currentState,
      'Priotity': instance.priority,
      'PODate': instance.poDate?.toIso8601String(),
      'EndUser': instance.endUser,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate.toIso8601String(),
      'BusinessFieldID': instance.businessFieldId,
      'TypeProject': instance.typeProject,
      'IsDeleted': instance.isDeleted,
    };

_$CustomerPartResponseImpl _$$CustomerPartResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerPartResponseImpl(
      id: (json['ID'] as num).toInt(),
      partName: json['PartName'] as String,
      partCode: json['PartCode'] as String,
      customerId: (json['CustomerID'] as num).toInt(),
      stt: (json['STT'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CustomerPartResponseImplToJson(
        _$CustomerPartResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'PartName': instance.partName,
      'PartCode': instance.partCode,
      'CustomerID': instance.customerId,
      'STT': instance.stt,
    };

_$TypeTeamSaleResponseImpl _$$TypeTeamSaleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TypeTeamSaleResponseImpl(
      id: (json['ID'] as num).toInt(),
      mainIndex: json['MainIndex'] as String,
      mainGroup: (json['MainGroup'] as num).toInt(),
      goal0: (json['Goal0'] as num?)?.toDouble(),
      result0: (json['Result0'] as num?)?.toDouble(),
      accp0: (json['ACCP0'] as num?)?.toDouble(),
      goal1: (json['Goal1'] as num?)?.toDouble(),
      result1: (json['Result1'] as num?)?.toDouble(),
      accp1: (json['ACCP1'] as num?)?.toDouble(),
      goal2: (json['Goal2'] as num?)?.toDouble(),
      result2: (json['Result2'] as num?)?.toDouble(),
      accp2: (json['ACCP2'] as num?)?.toDouble(),
      accp: (json['ACCP'] as num?)?.toDouble(),
      goal: (json['Goal'] as num?)?.toDouble(),
      result: (json['Result'] as num?)?.toDouble(),
      convertId: (json['ConvertID'] as num?)?.toInt(),
      mainIndex1: json['MainIndex1'] as String?,
      mainIndex2: json['MainIndex2'] as String?,
    );

Map<String, dynamic> _$$TypeTeamSaleResponseImplToJson(
        _$TypeTeamSaleResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'MainIndex': instance.mainIndex,
      'MainGroup': instance.mainGroup,
      'Goal0': instance.goal0,
      'Result0': instance.result0,
      'ACCP0': instance.accp0,
      'Goal1': instance.goal1,
      'Result1': instance.result1,
      'ACCP1': instance.accp1,
      'Goal2': instance.goal2,
      'Result2': instance.result2,
      'ACCP2': instance.accp2,
      'ACCP': instance.accp,
      'Goal': instance.goal,
      'Result': instance.result,
      'ConvertID': instance.convertId,
      'MainIndex1': instance.mainIndex1,
      'MainIndex2': instance.mainIndex2,
    };

_$CustomerResponseImpl _$$CustomerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerResponseImpl(
      id: (json['ID'] as num).toInt(),
      customerName: json['CustomerName'] as String,
      customerCode: json['CustomerCode'] as String,
    );

Map<String, dynamic> _$$CustomerResponseImplToJson(
        _$CustomerResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerName': instance.customerName,
      'CustomerCode': instance.customerCode,
    };

_$FirmBaseResponseImpl _$$FirmBaseResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FirmBaseResponseImpl(
      id: (json['ID'] as num).toInt(),
      firmCode: json['FirmCode'] as String,
      firmName: json['FirmName'] as String,
    );

Map<String, dynamic> _$$FirmBaseResponseImplToJson(
        _$FirmBaseResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FirmCode': instance.firmCode,
      'FirmName': instance.firmName,
    };

_$TypeProjectResponseImpl _$$TypeProjectResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TypeProjectResponseImpl(
      id: (json['ID'] as num).toInt(),
      projectTypeCode: json['ProjectTypeCode'] as String,
      projectTypeName: json['ProjectTypeName'] as String,
    );

Map<String, dynamic> _$$TypeProjectResponseImplToJson(
        _$TypeProjectResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectTypeCode': instance.projectTypeCode,
      'ProjectTypeName': instance.projectTypeName,
    };

_$StatusProjectResponseImpl _$$StatusProjectResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StatusProjectResponseImpl(
      id: (json['ID'] as num).toInt(),
      statusName: json['StatusName'] as String?,
      createdDate: json['CreatedDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StatusProjectResponseImplToJson(
        _$StatusProjectResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'StatusName': instance.statusName,
      'CreatedDate': instance.createdDate,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate,
      'UpdatedBy': instance.updatedBy,
      'STT': instance.stt,
    };

_$CustomerContactResponseImpl _$$CustomerContactResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerContactResponseImpl(
      id: (json['ID'] as num).toInt(),
      customerId: (json['CustomerID'] as num).toInt(),
      contactName: json['ContactName'] as String,
      contactPhone: json['ContactPhone'] as String?,
      contactEmail: json['ContactEmail'] as String?,
      createdDate: DateTime.parse(json['CreatedDate'] as String),
      customerTeam: json['CustomerTeam'] as String?,
      customerPart: json['CustomerPart'] as String?,
      customerPosition: json['CustomerPosition'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$CustomerContactResponseImplToJson(
        _$CustomerContactResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'ContactName': instance.contactName,
      'ContactPhone': instance.contactPhone,
      'ContactEmail': instance.contactEmail,
      'CreatedDate': instance.createdDate.toIso8601String(),
      'CustomerTeam': instance.customerTeam,
      'CustomerPart': instance.customerPart,
      'CustomerPosition': instance.customerPosition,
      'IsDeleted': instance.isDeleted,
    };

_$SaleRequestImpl _$$SaleRequestImplFromJson(Map<String, dynamic> json) =>
    _$SaleRequestImpl(
      id: (json['ID'] as num).toInt(),
      projectId: (json['projectId'] as num).toInt(),
      customerId: (json['customerId'] as num).toInt(),
      warehouseId: json['warehouseId'] as String,
      projectStatusBaseId: (json['projectStatusBaseId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      dateStart: DateTime.parse(json['dateStart'] as String),
      dateEnd: DateTime.parse(json['dateEnd'] as String),
      firmId: (json['firmId'] as num).toInt(),
      projectTypeId: (json['projectTypeId'] as num).toInt(),
      contactId: (json['contactId'] as num).toInt(),
      groupTypeId: (json['groupTypeId'] as num).toInt(),
      partId: (json['partId'] as num?)?.toInt(),
      bigAccount: json['bigAccount'] as bool,
      saleOpportunity: json['saleOpportunity'] as bool,
      content: json['content'] as String,
      result: json['result'] as String,
      problemBacklog: json['problemBacklog'] as String,
      planNext: json['planNext'] as String,
      productOfCustomer: json['productOfCustomer'] as String,
      projectStatusOld: (json['projectStatusOld'] as num).toInt(),
      employeeId: (json['employeeId'] as num).toInt(),
      dateStatusLog: DateTime.parse(json['dateStatusLog'] as String),
    );

Map<String, dynamic> _$$SaleRequestImplToJson(_$SaleRequestImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'projectId': instance.projectId,
      'customerId': instance.customerId,
      'warehouseId': instance.warehouseId,
      'projectStatusBaseId': instance.projectStatusBaseId,
      'userId': instance.userId,
      'dateStart': instance.dateStart.toIso8601String(),
      'dateEnd': instance.dateEnd.toIso8601String(),
      'firmId': instance.firmId,
      'projectTypeId': instance.projectTypeId,
      'contactId': instance.contactId,
      'groupTypeId': instance.groupTypeId,
      'partId': instance.partId,
      'bigAccount': instance.bigAccount,
      'saleOpportunity': instance.saleOpportunity,
      'content': instance.content,
      'result': instance.result,
      'problemBacklog': instance.problemBacklog,
      'planNext': instance.planNext,
      'productOfCustomer': instance.productOfCustomer,
      'projectStatusOld': instance.projectStatusOld,
      'employeeId': instance.employeeId,
      'dateStatusLog': instance.dateStatusLog.toIso8601String(),
    };

_$TeamSaleResponseImpl _$$TeamSaleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TeamSaleResponseImpl(
      id: (json['ID'] as num).toInt(),
      name: json['Name'] as String,
      stt: (json['STT'] as num).toInt(),
      code: json['Code'] as String,
      isDeleted: (json['IsDeleted'] as num).toInt(),
      parentId: (json['ParentID'] as num).toInt(),
      createdBy: json['CreatedBy'] as String,
      createdDate: DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String,
      updatedDate: DateTime.parse(json['UpdatedDate'] as String),
    );

Map<String, dynamic> _$$TeamSaleResponseImplToJson(
        _$TeamSaleResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
      'STT': instance.stt,
      'Code': instance.code,
      'IsDeleted': instance.isDeleted,
      'ParentID': instance.parentId,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate.toIso8601String(),
    };

_$SaleReportResponseImpl _$$SaleReportResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleReportResponseImpl(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      data: SaleReportData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String,
    );

Map<String, dynamic> _$$SaleReportResponseImplToJson(
        _$SaleReportResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

_$SaleReportDataImpl _$$SaleReportDataImplFromJson(Map<String, dynamic> json) =>
    _$SaleReportDataImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => SaleReportItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPage: (json['totalPage'] as List<dynamic>)
          .map((e) => SaleReportTotalPage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SaleReportDataImplToJson(
        _$SaleReportDataImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalPage': instance.totalPage,
    };

_$SaleReportItemImpl _$$SaleReportItemImplFromJson(Map<String, dynamic> json) =>
    _$SaleReportItemImpl(
      id: (json['ID'] as num).toInt(),
      customerId: (json['CustomerID'] as num).toInt(),
      userId: (json['UserID'] as num).toInt(),
      contacId: (json['ContacID'] as num).toInt(),
      dateStart: DateTime.parse(json['DateStart'] as String),
      dateEnd: DateTime.parse(json['DateEnd'] as String),
      telesale: (json['Telesale'] as num?)?.toInt(),
      visit: (json['Visit'] as num?)?.toInt(),
      demo: (json['Demo'] as num?)?.toInt(),
      result: json['Result'] as String?,
      problemBacklog: json['ProblemBacklog'] as String?,
      planNext: json['PlanNext'] as String?,
      note: json['Note'] as String?,
      bigAccount: json['BigAccount'] as bool?,
      groupType: (json['GroupType'] as num?)?.toInt(),
      content: json['Content'] as String?,
      userLoginId: (json['UserLoginID'] as num?)?.toInt(),
      createdDate: DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String,
      month: (json['Month'] as num).toInt(),
      year: (json['Year'] as num).toInt(),
      endUser: (json['EndUser'] as num?)?.toInt(),
      deleteFlag: (json['DeleteFlag'] as num).toInt(),
      confirm: json['Confirm'] as bool,
      productOfCustomer: json['ProductOfCustomer'] as String?,
      requestOfCustomer: json['RequestOfCustomer'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      firmBaseId: (json['FirmBaseID'] as num?)?.toInt(),
      projectTypeBaseId: (json['ProjectTypeBaseID'] as num?)?.toInt(),
      saleOpportunity: json['SaleOpportunity'] as bool?,
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      customerName: json['CustomerName'] as String?,
      contactName: json['ContactName'] as String?,
      partCode: json['PartCode'] as String?,
      rowNum: (json['RowNum'] as num?)?.toInt(),
      mainIndex: json['MainIndex'] as String?,
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      firmCode: json['FirmCode'] as String?,
      firmName: json['FirmName'] as String?,
      projectTypeCode: json['ProjectTypeCode'] as String?,
      projectTypeName: json['ProjectTypeName'] as String?,
    );

Map<String, dynamic> _$$SaleReportItemImplToJson(
        _$SaleReportItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'UserID': instance.userId,
      'ContacID': instance.contacId,
      'DateStart': instance.dateStart.toIso8601String(),
      'DateEnd': instance.dateEnd.toIso8601String(),
      'Telesale': instance.telesale,
      'Visit': instance.visit,
      'Demo': instance.demo,
      'Result': instance.result,
      'ProblemBacklog': instance.problemBacklog,
      'PlanNext': instance.planNext,
      'Note': instance.note,
      'BigAccount': instance.bigAccount,
      'GroupType': instance.groupType,
      'Content': instance.content,
      'UserLoginID': instance.userLoginId,
      'CreatedDate': instance.createdDate.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'Month': instance.month,
      'Year': instance.year,
      'EndUser': instance.endUser,
      'DeleteFlag': instance.deleteFlag,
      'Confirm': instance.confirm,
      'ProductOfCustomer': instance.productOfCustomer,
      'RequestOfCustomer': instance.requestOfCustomer,
      'ProjectID': instance.projectId,
      'FirmBaseID': instance.firmBaseId,
      'ProjectTypeBaseID': instance.projectTypeBaseId,
      'SaleOpportunity': instance.saleOpportunity,
      'WarehouseID': instance.warehouseId,
      'FullName': instance.fullName,
      'CustomerName': instance.customerName,
      'ContactName': instance.contactName,
      'PartCode': instance.partCode,
      'RowNum': instance.rowNum,
      'MainIndex': instance.mainIndex,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'FirmCode': instance.firmCode,
      'FirmName': instance.firmName,
      'ProjectTypeCode': instance.projectTypeCode,
      'ProjectTypeName': instance.projectTypeName,
    };

_$SaleReportTotalPageImpl _$$SaleReportTotalPageImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleReportTotalPageImpl(
      totalPage: (json['TotalPage'] as num).toInt(),
    );

Map<String, dynamic> _$$SaleReportTotalPageImplToJson(
        _$SaleReportTotalPageImpl instance) =>
    <String, dynamic>{
      'TotalPage': instance.totalPage,
    };

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      id: (json['ID'] as num).toInt(),
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

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
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

_$SaleAdminRequestImpl _$$SaleAdminRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleAdminRequestImpl(
      id: (json['ID'] as num).toInt(),
      planNextDay: json['PlanNextDay'] as String,
      problem: json['Problem'] as String,
      problemSolve: json['ProblemSolve'] as String,
      reportContent: json['ReportContent'] as String,
      result: json['Result'] as String,
      employeeId: (json['EmployeeID'] as num).toInt(),
      employeeRequestId: (json['EmployeeRequestID'] as num).toInt(),
      customerId: (json['CustomerID'] as num).toInt(),
      reportTypeId: (json['ReportTypeID'] as num).toInt(),
      dateReport: DateTime.parse(json['DateReport'] as String),
      projectId: (json['ProjectID'] as num).toInt(),
    );

Map<String, dynamic> _$$SaleAdminRequestImplToJson(
        _$SaleAdminRequestImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'PlanNextDay': instance.planNextDay,
      'Problem': instance.problem,
      'ProblemSolve': instance.problemSolve,
      'ReportContent': instance.reportContent,
      'Result': instance.result,
      'EmployeeID': instance.employeeId,
      'EmployeeRequestID': instance.employeeRequestId,
      'CustomerID': instance.customerId,
      'ReportTypeID': instance.reportTypeId,
      'DateReport': instance.dateReport.toIso8601String(),
      'ProjectID': instance.projectId,
    };

_$SaleAdminResponseImpl _$$SaleAdminResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleAdminResponseImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num).toInt(),
      reportTypeId: (json['ReportTypeID'] as num).toInt(),
      customerId: (json['CustomerID'] as num).toInt(),
      employeeRequestId: (json['EmployeeRequestID'] as num).toInt(),
      dateReport: DateTime.parse(json['DateReport'] as String),
      reportTypeName: json['ReportTypeName'] as String?,
      employeeFullName: json['EmployeeFullName'] as String?,
      reportContent: json['ReportContent'] as String?,
      customerName: json['CustomerName'] as String?,
      employeeRequestFullName: json['EmployeeRequestFullName'] as String?,
      result: json['Result'] as String?,
      problem: json['Problem'] as String?,
      problemSolve: json['ProblemSolve'] as String?,
      planNextDay: json['PlanNextDay'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
    );

Map<String, dynamic> _$$SaleAdminResponseImplToJson(
        _$SaleAdminResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'ReportTypeID': instance.reportTypeId,
      'CustomerID': instance.customerId,
      'EmployeeRequestID': instance.employeeRequestId,
      'DateReport': instance.dateReport.toIso8601String(),
      'ReportTypeName': instance.reportTypeName,
      'EmployeeFullName': instance.employeeFullName,
      'ReportContent': instance.reportContent,
      'CustomerName': instance.customerName,
      'EmployeeRequestFullName': instance.employeeRequestFullName,
      'Result': instance.result,
      'Problem': instance.problem,
      'ProblemSolve': instance.problemSolve,
      'PlanNextDay': instance.planNextDay,
      'STT': instance.stt,
      'ProjectCode': instance.projectCode,
    };

_$SaleAdminDetailReportResponseImpl
    _$$SaleAdminDetailReportResponseImplFromJson(Map<String, dynamic> json) =>
        _$SaleAdminDetailReportResponseImpl(
          id: (json['ID'] as num).toInt(),
          employeeId: (json['EmployeeID'] as num).toInt(),
          reportTypeId: (json['ReportTypeID'] as num).toInt(),
          customerId: (json['CustomerID'] as num).toInt(),
          employeeRequestId: (json['EmployeeRequestID'] as num).toInt(),
          projectId: (json['ProjectID'] as num).toInt(),
          dateReport: DateTime.parse(json['DateReport'] as String),
          reportTypeName: json['ReportTypeName'] as String?,
          employeeFullName: json['EmployeeFullName'] as String?,
          reportContent: json['ReportContent'] as String?,
          customerName: json['CustomerName'] as String?,
          employeeRequestFullName: json['EmployeeRequestFullName'] as String?,
          result: json['Result'] as String?,
          problem: json['Problem'] as String?,
          problemSolve: json['ProblemSolve'] as String?,
          planNextDay: json['PlanNextDay'] as String?,
          stt: (json['STT'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$SaleAdminDetailReportResponseImplToJson(
        _$SaleAdminDetailReportResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'ReportTypeID': instance.reportTypeId,
      'CustomerID': instance.customerId,
      'EmployeeRequestID': instance.employeeRequestId,
      'ProjectID': instance.projectId,
      'DateReport': instance.dateReport.toIso8601String(),
      'ReportTypeName': instance.reportTypeName,
      'EmployeeFullName': instance.employeeFullName,
      'ReportContent': instance.reportContent,
      'CustomerName': instance.customerName,
      'EmployeeRequestFullName': instance.employeeRequestFullName,
      'Result': instance.result,
      'Problem': instance.problem,
      'ProblemSolve': instance.problemSolve,
      'PlanNextDay': instance.planNextDay,
      'STT': instance.stt,
    };

_$SaleAdminTypeReportResponseImpl _$$SaleAdminTypeReportResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleAdminTypeReportResponseImpl(
      id: (json['ID'] as num).toInt(),
      reportTypeName: json['ReportTypeName'] as String,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
    );

Map<String, dynamic> _$$SaleAdminTypeReportResponseImplToJson(
        _$SaleAdminTypeReportResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ReportTypeName': instance.reportTypeName,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
    };

_$SaleAdminProjectResponseImpl _$$SaleAdminProjectResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleAdminProjectResponseImpl(
      id: (json['ID'] as num).toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectShortName: json['ProjectShortName'] as String?,
      projectStatus: (json['ProjectStatus'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      userTechnicalId: (json['UserTechnicalID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      isApproved: json['IsApproved'] as bool?,
      contactId: (json['ContactID'] as num?)?.toInt(),
      po: json['PO'] as String?,
      projectType: (json['ProjectType'] as num?)?.toInt(),
      listCostId: (json['ListCostID'] as num?)?.toInt(),
      planDateStart: json['PlanDateStart'] == null
          ? null
          : DateTime.parse(json['PlanDateStart'] as String),
      planDateEnd: json['PlanDateEnd'] == null
          ? null
          : DateTime.parse(json['PlanDateEnd'] as String),
      actualDateStart: json['ActualDateStart'] == null
          ? null
          : DateTime.parse(json['ActualDateStart'] as String),
      actualDateEnd: json['ActualDateEnd'] == null
          ? null
          : DateTime.parse(json['ActualDateEnd'] as String),
      eu: json['EU'] as String?,
      projectManager: (json['ProjectManager'] as num?)?.toInt(),
      currentState: json['CurrentState'] as String?,
      priotity: (json['Priotity'] as num?)?.toDouble(),
      poDate: json['PODate'] == null
          ? null
          : DateTime.parse(json['PODate'] as String),
      endUser: (json['EndUser'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      businessFieldId: (json['BusinessFieldID'] as num?)?.toInt(),
      typeProject: (json['TypeProject'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$SaleAdminProjectResponseImplToJson(
        _$SaleAdminProjectResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectShortName': instance.projectShortName,
      'ProjectStatus': instance.projectStatus,
      'UserID': instance.userId,
      'UserTechnicalID': instance.userTechnicalId,
      'Note': instance.note,
      'IsApproved': instance.isApproved,
      'ContactID': instance.contactId,
      'PO': instance.po,
      'ProjectType': instance.projectType,
      'ListCostID': instance.listCostId,
      'PlanDateStart': instance.planDateStart?.toIso8601String(),
      'PlanDateEnd': instance.planDateEnd?.toIso8601String(),
      'ActualDateStart': instance.actualDateStart?.toIso8601String(),
      'ActualDateEnd': instance.actualDateEnd?.toIso8601String(),
      'EU': instance.eu,
      'ProjectManager': instance.projectManager,
      'CurrentState': instance.currentState,
      'Priotity': instance.priotity,
      'PODate': instance.poDate?.toIso8601String(),
      'EndUser': instance.endUser,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'BusinessFieldID': instance.businessFieldId,
      'TypeProject': instance.typeProject,
      'IsDeleted': instance.isDeleted,
    };

_$SaleAdminCustomerResponseImpl _$$SaleAdminCustomerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleAdminCustomerResponseImpl(
      id: (json['ID'] as num).toInt(),
      customerName: json['CustomerName'] as String?,
      customerCode: json['CustomerCode'] as String?,
      customerShortName: json['CustomerShortName'] as String?,
      address: json['Address'] as String?,
      phone: json['Phone'] as String?,
      email: json['Email'] as String?,
      note: json['Note'] as String?,
      customerType: (json['CustomerType'] as num?)?.toInt(),
      statusDisable: (json['StatusDisable'] as num?)?.toInt(),
      website: json['Website'] as String?,
      contactName: json['ContactName'] as String?,
      contactPhone: json['ContactPhone'] as String?,
      contactEmail: json['ContactEmail'] as String?,
      contactNote: json['ContactNote'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      noteDelivery: json['NoteDelivery'] as String?,
      noteVoucher: json['NoteVoucher'] as String?,
      checkVoucher: json['CheckVoucher'] as String?,
      hardCopyVoucher: json['HardCopyVoucher'] as String?,
      closingDateDebt: json['ClosingDateDebt'] == null
          ? null
          : DateTime.parse(json['ClosingDateDebt'] as String),
      debt: json['Debt'] as String?,
      adressStock: json['AdressStock'] as String?,
      taxCode: json['TaxCode'] as String?,
      customerDetails: json['CustomerDetails'] as String?,
      customerSpecializationId:
          (json['CustomerSpecializationID'] as num?)?.toInt(),
      productDetails: json['ProductDetails'] as String?,
      bigAccount: json['BigAccount'] as bool?,
      province: json['Province'] as String?,
      registerOTs: json['RegisterOTs'] as List<dynamic>?,
    );

Map<String, dynamic> _$$SaleAdminCustomerResponseImplToJson(
        _$SaleAdminCustomerResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerName': instance.customerName,
      'CustomerCode': instance.customerCode,
      'CustomerShortName': instance.customerShortName,
      'Address': instance.address,
      'Phone': instance.phone,
      'Email': instance.email,
      'Note': instance.note,
      'CustomerType': instance.customerType,
      'StatusDisable': instance.statusDisable,
      'Website': instance.website,
      'ContactName': instance.contactName,
      'ContactPhone': instance.contactPhone,
      'ContactEmail': instance.contactEmail,
      'ContactNote': instance.contactNote,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'NoteDelivery': instance.noteDelivery,
      'NoteVoucher': instance.noteVoucher,
      'CheckVoucher': instance.checkVoucher,
      'HardCopyVoucher': instance.hardCopyVoucher,
      'ClosingDateDebt': instance.closingDateDebt?.toIso8601String(),
      'Debt': instance.debt,
      'AdressStock': instance.adressStock,
      'TaxCode': instance.taxCode,
      'CustomerDetails': instance.customerDetails,
      'CustomerSpecializationID': instance.customerSpecializationId,
      'ProductDetails': instance.productDetails,
      'BigAccount': instance.bigAccount,
      'Province': instance.province,
      'RegisterOTs': instance.registerOTs,
    };
