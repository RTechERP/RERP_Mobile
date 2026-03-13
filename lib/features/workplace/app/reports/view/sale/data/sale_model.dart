import 'package:equatable/equatable.dart';

import '../../../data/datasource/models/report_model.dart';

class SaleStaffWork extends Equatable {
  final int? id;

  final String code;

  final String fullName;

  final int userId;
  final String? projectCode;
  final String? projectName;
  final String? projectText;

  final double totalHours;

  final double? totalHourOT;
  final String content;
  final String results;
  final String planNextDay;

  final String? backlog;
  final String? problem;
  final String? note;
  final String? problemSolve;
  final DateTime? createdDate;
  final int? type;
  final String positionName;
  final String mission;
  final String projectItemCode;
  final int? projectItemId;
  final DateTime? holidayDate;
  final String? planStartDate;
  final String? planEndDate;
  final String? actualStartDate;
  final String? actualEndDate;

  final int? totalDayPlan;
  final String? location;
  final int? employeeId;
  final String? dateReport;

  final bool? isDeleted;
  final int? projectId;
  final int? firmId;
  final String? firmName;
  final int? typeProjectId;
  final String? typeProjectName;
  final int? customerId;
  final String? customerName;
  final String? customerCode;

  final int? typeTeamSaleId;
  final String? typeTeamSaleMainIndex;

  final int? statusProjectId;
  final String? statusProjectName;
  final int? indexStatusProject;

  final int? customerContactId;
  final String? customerContactName;
  final String? customerContactPhone;

  final String? customerContactTeam;
  final String? customerContactPart;
  final String? customerContactPosition;

  final int? customerPartId;
  final String? customerPartName;
  final String? customerPartCode;
  final int? indexCustomerPart;

  final bool saleOpportunity;
  final bool bigAccount;

  final String? customerProduct;

  final DateTime? dateStart;
  final DateTime? dateEnd;

  final int? projectStatusBaseId;
  final int? projectStatusOld;
  const SaleStaffWork({
    this.id,
    this.employeeId,
    this.dateReport,
    required this.code,
    required this.fullName,
    required this.userId,
    this.projectCode,
    this.projectName,
    this.projectText,
    required this.totalHours,
    this.totalHourOT,
    required this.content,
    required this.results,
    required this.planNextDay,
    this.backlog,
    this.problem,
    this.note,
    this.createdDate,
    this.type,
    required this.positionName,
    required this.mission,
    required this.projectItemCode,
    this.holidayDate,
    this.planStartDate,
    this.planEndDate,
    this.actualStartDate,
    this.actualEndDate,
    this.totalDayPlan,
    this.problemSolve,
    this.projectItemId,
    this.location,
    this.isDeleted,
    this.projectId,
    this.firmId,
    this.firmName,
    this.typeProjectId,
    this.typeProjectName,
    this.customerId,
    this.customerName,
    this.customerCode,
    this.typeTeamSaleId,
    this.typeTeamSaleMainIndex,
    this.statusProjectId,
    this.statusProjectName,
    this.indexStatusProject,
    this.customerContactId,
    this.customerContactName,
    this.customerContactPhone,
    this.customerContactTeam,
    this.customerContactPart,
    this.customerContactPosition,
    this.customerPartId,
    this.customerPartName,
    this.customerPartCode,
    this.indexCustomerPart,
    this.saleOpportunity = false,
    this.bigAccount = false,
    this.customerProduct,
    this.dateStart,
    this.dateEnd,
    this.projectStatusBaseId,
    this.projectStatusOld,
  });

  /// tạo item rỗng để Add trên UI
  factory SaleStaffWork.empty({
    required int projectId,
    required int userId,
    required String fullName,
    required String dateReport,
    DateTime? createdDate,
    String? projectCode,
    String? projectText,
    String? projectName,
    required String code,
    required int projectItemId,
  }) {
    return SaleStaffWork(
      id: DateTime.now().microsecondsSinceEpoch,
      employeeId: 0,
      dateReport: dateReport,

      code: code,
      fullName: fullName,
      userId: userId,
      projectCode: projectCode,
      projectName: projectName,
      projectText: projectText,
      totalHours: 0,
      totalHourOT: 0,

      content: '',
      results: '',
      planNextDay: '',

      backlog: null,
      problem: null,
      note: null,

      createdDate: createdDate,
      type: 0,
      positionName: '',
      mission: '',

      projectItemCode: '',
      projectItemId: projectItemId,
      holidayDate: null,

      planStartDate: null,
      planEndDate: null,
      actualStartDate: null,
      actualEndDate: null,
      totalDayPlan: null,
      problemSolve: null,
      location: null,
      isDeleted: false,
      firmId: null,
      firmName: null,
      typeProjectId: null,
      typeProjectName: null,
      customerId: null,
      customerName: null,
      customerCode: null,
      typeTeamSaleId: null,
      typeTeamSaleMainIndex: null,
      statusProjectId: null,
      statusProjectName: null,
      indexStatusProject: null,
      customerContactId: null,
      customerContactName: null,
      customerContactPhone: null,
      customerContactTeam: null,
      customerContactPart: null,
      customerContactPosition: null,
      customerPartId: null,
      customerPartName: null,
      customerPartCode: null,
      indexCustomerPart: null,
      saleOpportunity: false,
      bigAccount: false,
      customerProduct: null,
      dateStart: null,
      dateEnd: null,
      projectStatusBaseId: null,
      projectStatusOld: null,
    );
  }

  /// convert từ API
  factory SaleStaffWork.fromHrReportItem(ReportResponse r) {
    return SaleStaffWork(
      id: r.id,
      employeeId: 0,
      dateReport: r.dateReport,
      code: r.code,
      fullName: r.fullName,
      userId: r.userId,
      projectCode: r.projectCode,
      projectName: r.projectName,
      projectText: r.projectText,
      totalHours: r.totalHours,
      totalHourOT: r.totalHourOT,
      content: r.content,
      results: r.results,
      planNextDay: r.planNextDay,
      backlog: r.backlog,
      problem: r.problem,
      note: r.note,
      createdDate: r.createdDate,
      type: r.type,
      positionName: r.positionName,
      mission: r.mission,
      projectItemCode: r.projectItemCode,
      holidayDate: r.holidayDate,
      planStartDate: r.planStartDate,
      planEndDate: r.planEndDate,
      actualStartDate: r.actualStartDate,
      actualEndDate: r.actualEndDate,
      totalDayPlan: r.totalDayPlan,
      problemSolve: r.problemSolve,
    );
  }

  SaleStaffWork copyWith({
    int? id,
    int? employeeId,
    String? dateReport,
    int? filmManagementDetailId,
    int? quantity,
    int? timeActual,
    int? performanceActual,
    int? percentage,
    int? kmNumber,
    int? totalLate,
    int? totalTimeLate,
    String? reasonLate,
    String? statusVehicle,
    String? propose,
    String? filmName,
    String? unitName,
    String? workContent,
    bool? isDeleted,
    double? performanceAvg,
    String? code,
    String? projectCode,
    String? projectName,
    String? projectText,
    double? totalHours,
    double? totalHourOT,
    String? content,
    String? results,
    String? planNextDay,
    String? backlog,
    String? problem,
    String? note,
    String? projectItemCode,
    String? planStartDate,
    String? planEndDate,
    String? actualStartDate,
    String? actualEndDate,
    int? totalDayPlan,
    String? mission,
    DateTime? createdDate,
    int? type,
    String? positionName,
    String? problemSolve,
    int? projectItemId,
    DateTime? holidayDate,
    String? location,
    int? projectId,
    int? firmId,
    String? firmName,
    int? typeProjectId,
    String? typeProjectName,
    int? customerId,
    String? customerName,
    String? customerCode,
    int? typeTeamSaleId,
    String? typeTeamSaleMainIndex,
    int? statusProjectId,
    String? statusProjectName,
    int? indexStatusProject,
    int? customerContactId,
    String? customerContactName,
    String? customerContactPhone,
    String? customerContactTeam,
    String? customerContactPart,
    String? customerContactPosition,
    int? customerPartId,
    String? customerPartName,
    String? customerPartCode,
    int? indexCustomerPart,
    /// Khi đổi khách hàng, set true để xóa contact/part cũ (copyWith mặc định không gán null).
    bool clearContactAndPart = false,
    bool? saleOpportunity,
    bool? bigAccount,
    String? customerProduct,
    DateTime? dateStart,
    DateTime? dateEnd,
    int? projectStatusBaseId,
    int? projectStatusOld,
  }) {
    return SaleStaffWork(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      dateReport: dateReport ?? this.dateReport,

      code: code ?? this.code,
      fullName: fullName,
      userId: userId,

      projectCode: projectCode ?? this.projectCode,
      projectName: projectName ?? this.projectName,
      projectText: projectText ?? this.projectText,

      totalHours: totalHours ?? this.totalHours,
      totalHourOT: totalHourOT ?? this.totalHourOT,

      content: content ?? this.content,
      results: results ?? this.results,
      planNextDay: planNextDay ?? this.planNextDay,

      backlog: backlog ?? this.backlog,
      problem: problem ?? this.problem,
      note: note ?? this.note,

      createdDate: createdDate ?? this.createdDate,
      type: type ?? this.type,
      positionName: positionName ?? this.positionName,
      mission: mission ?? this.mission,

      projectItemCode: projectItemCode ?? this.projectItemCode,
      holidayDate: holidayDate,

      planStartDate: planStartDate ?? this.planStartDate,
      planEndDate: planEndDate ?? this.planEndDate,
      actualStartDate: actualStartDate ?? this.actualStartDate,
      actualEndDate: actualEndDate ?? this.actualEndDate,
      totalDayPlan: totalDayPlan ?? this.totalDayPlan,
      problemSolve: problemSolve ?? this.problemSolve,
      projectItemId: projectItemId ?? this.projectItemId,
      location: location ?? this.location,
      isDeleted: isDeleted ?? this.isDeleted,
      projectId: projectId ?? this.projectId,
      firmId: firmId ?? this.firmId,
      firmName: firmName ?? this.firmName,
      typeProjectId: typeProjectId ?? this.typeProjectId,
      typeProjectName: typeProjectName ?? this.typeProjectName,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      customerCode: customerCode ?? this.customerCode,
      typeTeamSaleId: typeTeamSaleId ?? this.typeTeamSaleId,
      typeTeamSaleMainIndex:
          typeTeamSaleMainIndex ?? this.typeTeamSaleMainIndex,
      statusProjectId: statusProjectId ?? this.statusProjectId,
      statusProjectName: statusProjectName ?? this.statusProjectName,
      indexStatusProject: indexStatusProject ?? this.indexStatusProject,
      customerContactId: clearContactAndPart
          ? null
          : (customerContactId ?? this.customerContactId),
      customerContactName: clearContactAndPart
          ? null
          : (customerContactName ?? this.customerContactName),
      customerContactPhone: clearContactAndPart
          ? null
          : (customerContactPhone ?? this.customerContactPhone),
      customerContactTeam: clearContactAndPart
          ? null
          : (customerContactTeam ?? this.customerContactTeam),
      customerContactPart: clearContactAndPart
          ? null
          : (customerContactPart ?? this.customerContactPart),
      customerContactPosition: clearContactAndPart
          ? null
          : (customerContactPosition ?? this.customerContactPosition),
      customerPartId:
          clearContactAndPart ? null : (customerPartId ?? this.customerPartId),
      customerPartName: clearContactAndPart
          ? null
          : (customerPartName ?? this.customerPartName),
      customerPartCode: clearContactAndPart
          ? null
          : (customerPartCode ?? this.customerPartCode),
      indexCustomerPart: clearContactAndPart
          ? null
          : (indexCustomerPart ?? this.indexCustomerPart),
      saleOpportunity: saleOpportunity ?? this.saleOpportunity,
      bigAccount: bigAccount ?? this.bigAccount,
      customerProduct: customerProduct ?? this.customerProduct,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      projectStatusBaseId: projectStatusBaseId ?? this.projectStatusBaseId,
      projectStatusOld: projectStatusOld ?? this.projectStatusOld,
    );
  }

  @override
  List<Object?> get props => [
    id,
    employeeId,
    dateReport,
    code,
    projectCode,
    projectName,
    projectText,
    totalHours,
    totalHourOT,
    content,
    results,
    planNextDay,
    backlog,
    problem,
    note,
    projectItemCode,
    planStartDate,
    planEndDate,
    actualStartDate,
    actualEndDate,
    totalDayPlan,
    mission,
    createdDate,
    type,
    positionName,
    problemSolve,
    userId,
    fullName,
    holidayDate,
    projectItemId,
    location,
    isDeleted,
    projectId,
    firmId,
    firmName,
    typeProjectId,
    typeProjectName,
    customerId,
    customerName,
    customerCode,
    typeTeamSaleId,
    typeTeamSaleMainIndex,
    statusProjectId,
    statusProjectName,
    indexStatusProject,
    customerContactId,
    customerContactName,
    customerContactPhone,
    customerContactTeam,
    customerContactPart,
    customerContactPosition,
    customerPartId,
    customerPartName,
    customerPartCode,
    indexCustomerPart,
    saleOpportunity,
    bigAccount,
    customerProduct,
    dateStart,
    dateEnd,
  ];
}
