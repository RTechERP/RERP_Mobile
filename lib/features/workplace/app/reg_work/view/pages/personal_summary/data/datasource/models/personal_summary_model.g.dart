// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalSummaryRequestImpl _$$PersonalSummaryRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalSummaryRequestImpl(
      dateStart: DateTime.parse(json['DateStart'] as String),
      dateEnd: DateTime.parse(json['DateEnd'] as String),
      departmentId: (json['DepartmentID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num).toInt(),
      isApproved: (json['IsApproved'] as num).toInt(),
      keyword: json['Keyword'] as String,
    );

Map<String, dynamic> _$$PersonalSummaryRequestImplToJson(
        _$PersonalSummaryRequestImpl instance) =>
    <String, dynamic>{
      'DateStart': instance.dateStart.toIso8601String(),
      'DateEnd': instance.dateEnd.toIso8601String(),
      'DepartmentID': instance.departmentId,
      'EmployeeID': instance.employeeId,
      'IsApproved': instance.isApproved,
      'Keyword': instance.keyword,
    };

_$PersonalLeaveItemImpl _$$PersonalLeaveItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalLeaveItemImpl(
      id: (json['ID'] as num).toInt(),
      isApprovedTp: json['IsApprovedTP'] as bool?,
      isApprovedHr: json['IsApprovedHR'] as bool?,
      isApprovedTpText: json['IsApprovedTPText'] as String?,
      isApprovedHrText: json['IsApprovedHRText'] as String?,
      employeeLeave: json['EmployeeLeave'] as String?,
      employeeTp: json['EmployeeTP'] as String?,
      employeeHr: json['EmployeeHR'] as String?,
      timeOnLeave: (json['TimeOnLeave'] as num?)?.toInt(),
      timeOnLeaveText: json['TimeOnLeaveText'] as String?,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      totalTime: (json['TotalTime'] as num?)?.toDouble(),
      type: (json['Type'] as num?)?.toInt(),
      typeText: json['TypeText'] as String?,
      typeIsReal: (json['TypeIsReal'] as num?)?.toInt(),
      typeIsRealText: json['TypeIsRealText'] as String?,
      reason: json['Reason'] as String?,
      note: json['Note'] as String?,
      isCancelRegister: json['IsCancelRegister'] as bool?,
      isCancelRegisterText: json['IsCancelRegisterText'] as String?,
      isCancelTp: json['IsCancelTP'] as bool?,
      isCancelHr: json['IsCancelHR'] as bool?,
      isCancelTpText: json['IsCancelTPText'] as String?,
      isCancelHrText: json['IsCancelHRText'] as String?,
      reasonCancel: json['ReasonCancel'] as String?,
      dateCancel: json['DateCancel'] == null
          ? null
          : DateTime.parse(json['DateCancel'] as String),
      statusTbp: (json['StatusTBP'] as num?)?.toInt(),
      statusHr: (json['StatusHR'] as num?)?.toInt(),
      reasonDeciline: json['ReasonDeciline'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      departmentStt: (json['DepartmentSTT'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      statusTbpText: json['StatusTBPText'] as String?,
      statusHrText: json['StatusHRText'] as String?,
    );

Map<String, dynamic> _$$PersonalLeaveItemImplToJson(
        _$PersonalLeaveItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IsApprovedTP': instance.isApprovedTp,
      'IsApprovedHR': instance.isApprovedHr,
      'IsApprovedTPText': instance.isApprovedTpText,
      'IsApprovedHRText': instance.isApprovedHrText,
      'EmployeeLeave': instance.employeeLeave,
      'EmployeeTP': instance.employeeTp,
      'EmployeeHR': instance.employeeHr,
      'TimeOnLeave': instance.timeOnLeave,
      'TimeOnLeaveText': instance.timeOnLeaveText,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'TotalTime': instance.totalTime,
      'Type': instance.type,
      'TypeText': instance.typeText,
      'TypeIsReal': instance.typeIsReal,
      'TypeIsRealText': instance.typeIsRealText,
      'Reason': instance.reason,
      'Note': instance.note,
      'IsCancelRegister': instance.isCancelRegister,
      'IsCancelRegisterText': instance.isCancelRegisterText,
      'IsCancelTP': instance.isCancelTp,
      'IsCancelHR': instance.isCancelHr,
      'IsCancelTPText': instance.isCancelTpText,
      'IsCancelHRText': instance.isCancelHrText,
      'ReasonCancel': instance.reasonCancel,
      'DateCancel': instance.dateCancel?.toIso8601String(),
      'StatusTBP': instance.statusTbp,
      'StatusHR': instance.statusHr,
      'ReasonDeciline': instance.reasonDeciline,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'DepartmentSTT': instance.departmentStt,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'StatusTBPText': instance.statusTbpText,
      'StatusHRText': instance.statusHrText,
    };

_$PersonalEarlyLateItemImpl _$$PersonalEarlyLateItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalEarlyLateItemImpl(
      id: (json['ID'] as num).toInt(),
      isApproved: json['IsApproved'] as bool?,
      isApprovedText: json['IsApprovedText'] as String?,
      employeeEarlyLate: json['EmployeeEarlyLate'] as String?,
      employeeApprovedHr: json['EmployeeApprovedHR'] as String?,
      dateRegister: json['DateRegister'] == null
          ? null
          : DateTime.parse(json['DateRegister'] as String),
      unit: (json['Unit'] as num?)?.toInt(),
      unitText: json['UnitText'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      typeText: json['TypeText'] as String?,
      reason: json['Reason'] as String?,
      employeeApprovedTp: json['EmployeeApprovedTP'] as String?,
      isApprovedTpText: json['IsApprovedTPText'] as String?,
      isApprovedTp: json['IsApprovedTP'] as bool?,
      dateStart: json['DateStart'] == null
          ? null
          : DateTime.parse(json['DateStart'] as String),
      dateEnd: json['DateEnd'] == null
          ? null
          : DateTime.parse(json['DateEnd'] as String),
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      statusTbp: (json['StatusTBP'] as num?)?.toInt(),
      statusHr: (json['StatusHR'] as num?)?.toInt(),
      reasonDeciline: json['ReasonDeciline'] as String?,
      isProblem: json['IsProblem'] as bool?,
      timeRegister: (json['TimeRegister'] as num?)?.toDouble(),
      statusTbpText: json['StatusTBPText'] as String?,
      statusHrText: json['StatusHRText'] as String?,
    );

Map<String, dynamic> _$$PersonalEarlyLateItemImplToJson(
        _$PersonalEarlyLateItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IsApproved': instance.isApproved,
      'IsApprovedText': instance.isApprovedText,
      'EmployeeEarlyLate': instance.employeeEarlyLate,
      'EmployeeApprovedHR': instance.employeeApprovedHr,
      'DateRegister': instance.dateRegister?.toIso8601String(),
      'Unit': instance.unit,
      'UnitText': instance.unitText,
      'Type': instance.type,
      'TypeText': instance.typeText,
      'Reason': instance.reason,
      'EmployeeApprovedTP': instance.employeeApprovedTp,
      'IsApprovedTPText': instance.isApprovedTpText,
      'IsApprovedTP': instance.isApprovedTp,
      'DateStart': instance.dateStart?.toIso8601String(),
      'DateEnd': instance.dateEnd?.toIso8601String(),
      'DecilineApprove': instance.decilineApprove,
      'StatusTBP': instance.statusTbp,
      'StatusHR': instance.statusHr,
      'ReasonDeciline': instance.reasonDeciline,
      'IsProblem': instance.isProblem,
      'TimeRegister': instance.timeRegister,
      'StatusTBPText': instance.statusTbpText,
      'StatusHRText': instance.statusHrText,
    };

_$PersonalOverTimeItemImpl _$$PersonalOverTimeItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalOverTimeItemImpl(
      id: (json['ID'] as num).toInt(),
      isApprovedTbp: json['IsApprovedTBP'] as bool?,
      isApprovedHr: json['IsApprovedHR'] as bool?,
      employeeFullName: json['EmployeeFullName'] as String?,
      approvedTbp: json['ApprovedTBP'] as String?,
      approvedHr: json['ApprovedHR'] as String?,
      dateRegister: json['DateRegister'] == null
          ? null
          : DateTime.parse(json['DateRegister'] as String),
      typeId: (json['TypeID'] as num?)?.toInt(),
      timeStart: json['TimeStart'] == null
          ? null
          : DateTime.parse(json['TimeStart'] as String),
      endTime: json['EndTime'] == null
          ? null
          : DateTime.parse(json['EndTime'] as String),
      timeReality: (json['TimeReality'] as num?)?.toDouble(),
      totalTime: (json['TotalTime'] as num?)?.toDouble(),
      location: (json['Location'] as num?)?.toInt(),
      locationText: json['LocationText'] as String?,
      typeName: json['TypeName'] as String?,
      note: json['Note'] as String?,
      isApprovedText: json['IsApprovedText'] as String?,
      reason: json['Reason'] as String?,
      statusHr: (json['StatusHR'] as num?)?.toInt(),
      statusTbp: (json['StatusTBP'] as num?)?.toInt(),
      costOvernight: (json['CostOvernight'] as num?)?.toDouble(),
      projectName: json['ProjectName'] as String?,
      reasonDeciline: json['ReasonDeciline'] as String?,
      overnight: json['Overnight'] as bool?,
      isProblem: json['IsProblem'] as bool?,
      fileName: json['FileName'] as String?,
      statusTbpText: json['StatusTBPText'] as String?,
      statusHrText: json['StatusHRText'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PersonalOverTimeItemImplToJson(
        _$PersonalOverTimeItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IsApprovedTBP': instance.isApprovedTbp,
      'IsApprovedHR': instance.isApprovedHr,
      'EmployeeFullName': instance.employeeFullName,
      'ApprovedTBP': instance.approvedTbp,
      'ApprovedHR': instance.approvedHr,
      'DateRegister': instance.dateRegister?.toIso8601String(),
      'TypeID': instance.typeId,
      'TimeStart': instance.timeStart?.toIso8601String(),
      'EndTime': instance.endTime?.toIso8601String(),
      'TimeReality': instance.timeReality,
      'TotalTime': instance.totalTime,
      'Location': instance.location,
      'LocationText': instance.locationText,
      'TypeName': instance.typeName,
      'Note': instance.note,
      'IsApprovedText': instance.isApprovedText,
      'Reason': instance.reason,
      'StatusHR': instance.statusHr,
      'StatusTBP': instance.statusTbp,
      'CostOvernight': instance.costOvernight,
      'ProjectName': instance.projectName,
      'ReasonDeciline': instance.reasonDeciline,
      'Overnight': instance.overnight,
      'IsProblem': instance.isProblem,
      'FileName': instance.fileName,
      'StatusTBPText': instance.statusTbpText,
      'StatusHRText': instance.statusHrText,
      'ProjectID': instance.projectId,
      'ApprovedID': instance.approvedId,
    };

_$PersonalBussinessItemImpl _$$PersonalBussinessItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalBussinessItemImpl(
      id: (json['ID'] as num).toInt(),
      isApprovedTbp: json['IsApprovedTBP'] as bool?,
      isApprovedHr: json['IsApprovedHR'] as bool?,
      isApprovedText: json['IsApprovedText'] as String?,
      employeeName: json['EmployeeName'] as String?,
      approvedName: json['ApprovedName'] as String?,
      approvedHr: json['ApprovedHR'] as String?,
      dayBussiness: json['DayBussiness'] == null
          ? null
          : DateTime.parse(json['DayBussiness'] as String),
      location: json['Location'] as String?,
      typeBusiness: (json['TypeBusiness'] as num?)?.toInt(),
      typeName: json['TypeName'] as String?,
      costType: (json['CostType'] as num?)?.toDouble(),
      vehicleId: (json['VehicleID'] as num?)?.toInt(),
      vehicleName: json['VehicleName'] as String?,
      notChekIn: json['NotChekIn'] as bool?,
      notChekInText: json['NotChekInText'] as String?,
      note: json['Note'] as String?,
      workEarlyText: json['WorkEarlyText'] as String?,
      costWorkEarly: (json['CostWorkEarly'] as num?)?.toDouble(),
      costOvernight: (json['CostOvernight'] as num?)?.toDouble(),
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      decilineApproveText: json['DecilineApproveText'] as String?,
      statusHr: (json['StatusHR'] as num?)?.toInt(),
      statusTbp: (json['StatusTBP'] as num?)?.toInt(),
      costVehicle: (json['CostVehicle'] as num?)?.toDouble(),
      totalMoney: (json['TotalMoney'] as num?)?.toDouble(),
      reasonDeciline: json['ReasonDeciline'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      overnight: json['Overnight'] as bool?,
      isProblem: json['IsProblem'] as bool?,
      reason: json['Reason'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      projectText: json['ProjectText'] as String?,
      statusTbpText: json['StatusTBPText'] as String?,
      statusHrText: json['StatusHRText'] as String?,
    );

Map<String, dynamic> _$$PersonalBussinessItemImplToJson(
        _$PersonalBussinessItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IsApprovedTBP': instance.isApprovedTbp,
      'IsApprovedHR': instance.isApprovedHr,
      'IsApprovedText': instance.isApprovedText,
      'EmployeeName': instance.employeeName,
      'ApprovedName': instance.approvedName,
      'ApprovedHR': instance.approvedHr,
      'DayBussiness': instance.dayBussiness?.toIso8601String(),
      'Location': instance.location,
      'TypeBusiness': instance.typeBusiness,
      'TypeName': instance.typeName,
      'CostType': instance.costType,
      'VehicleID': instance.vehicleId,
      'VehicleName': instance.vehicleName,
      'NotChekIn': instance.notChekIn,
      'NotChekInText': instance.notChekInText,
      'Note': instance.note,
      'WorkEarlyText': instance.workEarlyText,
      'CostWorkEarly': instance.costWorkEarly,
      'CostOvernight': instance.costOvernight,
      'DecilineApprove': instance.decilineApprove,
      'DecilineApproveText': instance.decilineApproveText,
      'StatusHR': instance.statusHr,
      'StatusTBP': instance.statusTbp,
      'CostVehicle': instance.costVehicle,
      'TotalMoney': instance.totalMoney,
      'ReasonDeciline': instance.reasonDeciline,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'Overnight': instance.overnight,
      'IsProblem': instance.isProblem,
      'Reason': instance.reason,
      'EmployeeID': instance.employeeId,
      'ApprovedID': instance.approvedId,
      'ProjectID': instance.projectId,
      'ProjectText': instance.projectText,
      'StatusTBPText': instance.statusTbpText,
      'StatusHRText': instance.statusHrText,
    };

_$PersonalWfhItemImpl _$$PersonalWfhItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalWfhItemImpl(
      id: (json['ID'] as num).toInt(),
      isApproved: json['IsApproved'] as bool?,
      employeeName: json['EmployeeName'] as String?,
      approvedName: json['ApprovedName'] as String?,
      approvedHr: json['ApprovedHR'] as String?,
      dateWfh: json['DateWFH'] == null
          ? null
          : DateTime.parse(json['DateWFH'] as String),
      timeWfh: (json['TimeWFH'] as num?)?.toInt(),
      reason: json['Reason'] as String?,
      note: json['Note'] as String?,
      isApprovedText: json['IsApprovedText'] as String?,
      timeWfhText: json['TimeWFHText'] as String?,
      statusHr: (json['StatusHR'] as num?)?.toInt(),
      statusTbp: (json['StatusTBP'] as num?)?.toInt(),
      reasonDeciline: json['ReasonDeciline'] as String?,
      contentWork: json['ContentWork'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      statusTbpText: json['StatusTBPText'] as String?,
      statusHrText: json['StatusHRText'] as String?,
    );

Map<String, dynamic> _$$PersonalWfhItemImplToJson(
        _$PersonalWfhItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IsApproved': instance.isApproved,
      'EmployeeName': instance.employeeName,
      'ApprovedName': instance.approvedName,
      'ApprovedHR': instance.approvedHr,
      'DateWFH': instance.dateWfh?.toIso8601String(),
      'TimeWFH': instance.timeWfh,
      'Reason': instance.reason,
      'Note': instance.note,
      'IsApprovedText': instance.isApprovedText,
      'TimeWFHText': instance.timeWfhText,
      'StatusHR': instance.statusHr,
      'StatusTBP': instance.statusTbp,
      'ReasonDeciline': instance.reasonDeciline,
      'ContentWork': instance.contentWork,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'StatusTBPText': instance.statusTbpText,
      'StatusHRText': instance.statusHrText,
    };

_$PersonalEnfItemImpl _$$PersonalEnfItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalEnfItemImpl(
      id: (json['ID'] as num).toInt(),
      isApprovedTp: json['IsApprovedTP'] as bool?,
      approvedHr: (json['ApprovedHR'] as num?)?.toInt(),
      employeeName: json['EmployeeName'] as String?,
      approvedTpName: json['ApprovedTPName'] as String?,
      approvedHrName: json['ApprovedHRName'] as String?,
      dayWork: json['DayWork'] == null
          ? null
          : DateTime.parse(json['DayWork'] as String),
      note: json['Note'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      isApprovedTpText: json['IsApprovedTPText'] as String?,
      isApprovedHrText: json['IsApprovedHRText'] as String?,
      typeText: json['TypeText'] as String?,
      statusHr: (json['StatusHR'] as num?)?.toInt(),
      statusTbp: (json['StatusTBP'] as num?)?.toInt(),
      reasonDeciline: json['ReasonDeciline'] as String?,
      statusTbpText: json['StatusTBPText'] as String?,
      statusHrText: json['StatusHRText'] as String?,
    );

Map<String, dynamic> _$$PersonalEnfItemImplToJson(
        _$PersonalEnfItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IsApprovedTP': instance.isApprovedTp,
      'ApprovedHR': instance.approvedHr,
      'EmployeeName': instance.employeeName,
      'ApprovedTPName': instance.approvedTpName,
      'ApprovedHRName': instance.approvedHrName,
      'DayWork': instance.dayWork?.toIso8601String(),
      'Note': instance.note,
      'Type': instance.type,
      'IsApprovedTPText': instance.isApprovedTpText,
      'IsApprovedHRText': instance.isApprovedHrText,
      'TypeText': instance.typeText,
      'StatusHR': instance.statusHr,
      'StatusTBP': instance.statusTbp,
      'ReasonDeciline': instance.reasonDeciline,
      'StatusTBPText': instance.statusTbpText,
      'StatusHRText': instance.statusHrText,
    };

_$PersonalNightShiftItemImpl _$$PersonalNightShiftItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalNightShiftItemImpl(
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
      workTime: (json['WorkTime'] as num?)?.toDouble(),
      breaksTime: (json['BreaksTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PersonalNightShiftItemImplToJson(
        _$PersonalNightShiftItemImpl instance) =>
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
      'WorkTime': instance.workTime,
      'BreaksTime': instance.breaksTime,
    };

_$PersonalSummaryDataImpl _$$PersonalSummaryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalSummaryDataImpl(
      dataOnLeave: (json['dataOnLeave'] as List<dynamic>?)
              ?.map(
                  (e) => PersonalLeaveItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PersonalLeaveItem>[],
      dataEarlyLate: (json['dataEarlyLate'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) =>
                      PersonalEarlyLateItem.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          const <List<PersonalEarlyLateItem>>[],
      dataOverTime: (json['dataOverTime'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) =>
                      PersonalOverTimeItem.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          const <List<PersonalOverTimeItem>>[],
      dataBussiness: (json['dataBussiness'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) =>
                      PersonalBussinessItem.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          const <List<PersonalBussinessItem>>[],
      dataWfh: (json['dataWFH'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) =>
                      PersonalWfhItem.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          const <List<PersonalWfhItem>>[],
      dataEnf: (json['dataENF'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) =>
                      PersonalEnfItem.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          const <List<PersonalEnfItem>>[],
      dataNightShift: (json['dataNightShift'] as List<dynamic>?)
              ?.map((e) =>
                  PersonalNightShiftItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PersonalNightShiftItem>[],
    );

Map<String, dynamic> _$$PersonalSummaryDataImplToJson(
        _$PersonalSummaryDataImpl instance) =>
    <String, dynamic>{
      'dataOnLeave': instance.dataOnLeave,
      'dataEarlyLate': instance.dataEarlyLate,
      'dataOverTime': instance.dataOverTime,
      'dataBussiness': instance.dataBussiness,
      'dataWFH': instance.dataWfh,
      'dataENF': instance.dataEnf,
      'dataNightShift': instance.dataNightShift,
    };
