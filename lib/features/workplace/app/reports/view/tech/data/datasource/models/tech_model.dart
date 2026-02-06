import 'package:equatable/equatable.dart';
import '../../../../../data/datasource/models/report_model.dart';

class TechWork extends Equatable {
  final int id;

  final String code;
  final String fullName;
  final int userId;
  final DateTime dateReport;

  final String projectCode;
  final String projectName;
  final String projectText;

  final double totalHours;
  final double? totalHourOT;
  final int percentComplete;

  final String content;
  final String results;
  final String planNextDay;

  final String? backlog;
  final String? problem;
  final String? note;

  final DateTime createdDate;
  final int type;
  final String positionName;
  final String mission;

  final String projectItemCode;

  final DateTime holidayDate;

  final DateTime? planStartDate;
  final DateTime? planEndDate;
  final DateTime? actualStartDate;
  final DateTime? actualEndDate;

  final int? totalDayPlan;

  const TechWork({
    required this.id,
    required this.code,
    required this.fullName,
    required this.userId,
    required this.dateReport,
    required this.projectCode,
    required this.projectName,
    required this.projectText,
    required this.totalHours,
    this.totalHourOT,
    required this.percentComplete,
    required this.content,
    required this.results,
    required this.planNextDay,
    this.backlog,
    this.problem,
    this.note,
    required this.createdDate,
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
  });

  factory TechWork.empty({
    required int userId,
    required String fullName,
    required DateTime dateReport,
    required DateTime createdDate,
  }) {
    return TechWork(
      id: 0,
      code: '',
      fullName: fullName,
      userId: userId,
      dateReport: dateReport,
      projectCode: '',
      projectName: '',
      projectText: '',
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
      holidayDate: dateReport,
      planStartDate: null,
      planEndDate: null,
      actualStartDate: null,
      actualEndDate: null,
      totalDayPlan: null,
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
  );

  TechWork copyWith({
    String? projectCode,
    String? projectName,
    String? projectText,
    double? totalHours,
    double? totalHourOT,
    int? percentComplete,
    String? content,
    String? results,
    String? planNextDay,
    String? backlog,
    String? problem,
    String? note,
    String? projectItemCode,
    DateTime? planStartDate,
    DateTime? planEndDate,
    DateTime? actualStartDate,
    DateTime? actualEndDate,
    int? totalDayPlan,
    String? mission,
  }) {
    return TechWork(
      id: id,
      code: code,
      fullName: fullName,
      userId: userId,
      dateReport: dateReport,
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
      createdDate: createdDate,
      type: type,
      positionName: positionName,
      mission: mission ?? this.mission,
      projectItemCode: projectItemCode ?? this.projectItemCode,
      holidayDate: holidayDate,
      planStartDate: planStartDate ?? this.planStartDate,
      planEndDate: planEndDate ?? this.planEndDate,
      actualStartDate: actualStartDate ?? this.actualStartDate,
      actualEndDate: actualEndDate ?? this.actualEndDate,
      totalDayPlan: totalDayPlan ?? this.totalDayPlan,
    );
  }

  @override
  List<Object?> get props => [
    id,
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
  ];
}

class TechProject extends Equatable {
  final String id;     // id BE hoặc '' nếu FE tự tạo
  final String? name;

  /// 👇 FE quản lý work
  final List<TechWork> works;

  const TechProject({
    required this.id,
    this.name,
    this.works = const [],
  });

  TechProject copyWith({
    String? id,
    String? name,
    List<TechWork>? works,
  }) {
    return TechProject(
      id: id ?? this.id,
      name: name ?? this.name,
      works: works ?? this.works,
    );
  }

  @override
  List<Object?> get props => [id, name, works];
}


