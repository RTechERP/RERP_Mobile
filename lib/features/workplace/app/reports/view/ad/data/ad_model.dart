import 'package:equatable/equatable.dart';

import '../../../data/datasource/models/report_model.dart';

class AdWork extends Equatable {
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

  const AdWork({
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
  });

  /// tạo item rỗng để Add trên UI
  factory AdWork.empty({
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
    return AdWork(
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
    );
  }

  /// convert từ API
  factory AdWork.fromHrReportItem(ReportResponse r) {
    return AdWork(
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

  AdWork copyWith({
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
  }) {
    return AdWork(
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
  ];
}