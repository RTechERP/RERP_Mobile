import 'package:equatable/equatable.dart';
import '../../../../../data/datasource/models/report_model.dart';

class TechWork extends Equatable {
  final int id;

  final String code;
  final String fullName;
  final int userId;
  final String dateReport;

  final String? projectCode;
  final String? projectName;
  final String? projectText;

  final double totalHours;
  final double? totalHourOT;
  final double percentComplete;

  final String content;
  final String results;
  final String planNextDay;

  final String? backlog;
  final String? problem;

  final String? problemSolve;
  final String? note;

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

  const TechWork({
    required this.id,
    required this.code,
    required this.fullName,
    required this.userId,
    required this.dateReport,
    this.projectCode,
     this.projectName,
     this.projectText,
    required this.totalHours,
    this.totalHourOT,
    required this.percentComplete,
    required this.content,
    required this.results,
    required this.planNextDay,
    this.backlog,
    this.problem,
    this.note,
    this.createdDate,
    required this.type,
    required this.positionName,
    required this.mission,
    required this.projectItemCode,
    required this.holidayDate,
    this.planStartDate,
    this.planEndDate,
    this.actualStartDate,
    this.actualEndDate,
    this.totalDayPlan,
    this.problemSolve,
    this.projectItemId,
  });

  factory TechWork.empty({
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
    return TechWork(
      id: DateTime.now().microsecondsSinceEpoch,
      code: code,
      fullName: fullName,
      userId: userId,
      dateReport: dateReport,

      projectCode: projectCode,
      projectName: projectName,
      projectText: projectText,

      totalHours: 0,
      totalHourOT: 0,
      percentComplete: 0,

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
    );
  }


  factory TechWork.fromReportResponse(ReportResponse r) => TechWork(
    id: r.id,
    code: r.code,
    fullName: r.fullName,
    userId: r.userId,
    dateReport: r.dateReport,
    projectCode: r.projectCode,
    projectName: r.projectName,
    projectText: r.projectText,
    totalHours: r.totalHours,
    totalHourOT: r.totalHourOT,
    percentComplete: r.percentComplete,
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

  factory TechWork.fromDetailReportResponse(
      DetailReportResponse r, {
        required String code,
        required String fullName,
        required String positionName,
        required String mission,
        required String projectItemCode,
      }) {
    return TechWork(
      id: r.id,
      code: code,
      fullName: fullName,
      userId: r.userReport,
      dateReport: r.dateReport,

      projectCode: null,
      projectName: null,
      projectText: null,

      totalHours: r.totalHours,
      totalHourOT: r.totalHourOT,
      percentComplete: r.percentComplete.toDouble(),

      content: r.content,
      results: r.results,
      planNextDay: r.planNextDay,

      backlog: r.backlog,
      problem: r.problem,
      problemSolve: r.problemSolve,
      note: r.note,

      createdDate: r.createdDate,
      type: r.type,
      positionName: positionName,
      mission: mission,

      projectItemCode: projectItemCode,
      projectItemId: r.projectItemId,
      holidayDate: null,

      planStartDate: null,
      planEndDate: null,
      actualStartDate: null,
      actualEndDate: null,
      totalDayPlan: null,
    );
  }
  TechWork copyWith({
    String? code,
    String? projectCode,
    String? projectName,
    String? projectText,
    double? totalHours,
    double? totalHourOT,
    double? percentComplete,
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
    String? dateReport,
  }) {
    return TechWork(
      id: id,
      code: code ?? this.code,
      fullName: fullName,
      userId: userId,
      dateReport: dateReport ?? this.dateReport,

      projectCode: projectCode ?? this.projectCode,
      projectName: projectName ?? this.projectName,
      projectText: projectText ?? this.projectText,

      totalHours: totalHours ?? this.totalHours,
      totalHourOT: totalHourOT ?? this.totalHourOT,
      percentComplete: percentComplete ?? this.percentComplete,

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
    );
  }

  @override
  List<Object?> get props => [
    id,
    code,
    projectCode,
    projectName,
    projectText,
    totalHours,
    totalHourOT,
    percentComplete,
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
    dateReport,
    holidayDate,
    projectItemId,
  ];
}


class TechProject extends Equatable {
  final String tempId;        // local id (UUID)
  final int? projectId;      // backend id
  final String? projectCode;
  final String? name;

  final String? code;

  /// 👇 FE quản lý work
  final List<TechWork> works;

  const TechProject({
    required this.tempId,
    this.projectId,
    this.projectCode,
    this.name,
    this.works = const [],
    this.code
  });

  TechProject copyWith({
    String? tempId,
    int? projectId,
    String? projectCode,
    String? name,
    List<TechWork>? works,
    String? code
  }) {
    return TechProject(
      tempId: tempId ?? this.tempId,
      projectId: projectId ?? this.projectId,
      projectCode: projectCode ?? this.projectCode,
      name: name ?? this.name,
      works: works ?? this.works,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [
    tempId,
    projectId,
    projectCode,
    name,
    works,
    code,
  ];
}



