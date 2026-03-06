import 'package:equatable/equatable.dart';

import '../../../data/datasource/models/report_model.dart';

class CpWork extends Equatable {
  final int? id;
  final int? employeeId;
  final String? dateReport;

  final int? filmManagementDetailId;

  final int? quantity;
  final int? timeActual;
  final int? performanceActual;
  final int? percentage;

  final int? kmNumber;
  final int? totalLate;
  final int? totalTimeLate;

  final String? reasonLate;
  final String? statusVehicle;
  final String? propose;

  final String? filmName;
  final String? unitName;
  final String? workContent;


  final bool? isDeleted;

  final double? performanceAvg;

  const CpWork({
    this.id,
    this.employeeId,
    this.dateReport,
    this.filmManagementDetailId,
    this.quantity,
    this.timeActual,
    this.performanceActual,
    this.percentage,
    this.kmNumber,
    this.totalLate,
    this.totalTimeLate,
    this.reasonLate,
    this.statusVehicle,
    this.propose,
    this.filmName,
    this.unitName,
    this.workContent,
    this.isDeleted,
    this.performanceAvg,
  });

  /// tạo item rỗng để add trên UI
  factory CpWork.empty({
    required int employeeId,
    required String dateReport,
  }) {
    return CpWork(
      id: DateTime.now().microsecondsSinceEpoch,
      employeeId: employeeId,
      dateReport: dateReport,

      filmManagementDetailId: null,

      quantity: null,
      timeActual: 0,
      performanceActual: 0,
      percentage: 0,

      kmNumber: 0,
      totalLate: 0,
      totalTimeLate: 0,

      reasonLate: '',
      statusVehicle: '',
      propose: '',

      filmName: '',
      unitName: '',
      workContent: '',

      performanceAvg: 0,
      isDeleted: false,
    );
  }

  /// convert từ API
  factory CpWork.fromHrReportItem(HrReportItem r) {
    return CpWork(
      id: r.id,
      employeeId: r.employeeId,
      dateReport: r.dateReport,
      filmManagementDetailId: r.filmManagementDetailId,
      quantity: r.quantity,
      timeActual: r.timeActual,
      performanceActual: r.performanceActual,
      percentage: r.percentage,
      kmNumber: r.kmNumber,
      totalLate: r.totalLate,
      totalTimeLate: r.totalTimeLate,
      reasonLate: r.reasonLate,
      statusVehicle: r.statusVehicle,
      propose: r.propose,
      filmName: r.filmName,
      unitName: r.unitName,
      workContent: r.workContent,
      isDeleted: r.isDeleted,
      performanceAvg: r.performanceAVG,

    );
  }

  CpWork copyWith({
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
  }) {
    return CpWork(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      dateReport: dateReport ?? this.dateReport,
      filmManagementDetailId:
      filmManagementDetailId ?? this.filmManagementDetailId,
      quantity: quantity ?? this.quantity,
      timeActual: timeActual ?? this.timeActual,
      performanceActual: performanceActual ?? this.performanceActual,
      percentage: percentage ?? this.percentage,
      kmNumber: kmNumber ?? this.kmNumber,
      totalLate: totalLate ?? this.totalLate,
      totalTimeLate: totalTimeLate ?? this.totalTimeLate,
      reasonLate: reasonLate ?? this.reasonLate,
      statusVehicle: statusVehicle ?? this.statusVehicle,
      propose: propose ?? this.propose,
      filmName: filmName ?? this.filmName,
      unitName: unitName ?? this.unitName,
      workContent: workContent ?? this.workContent,
      isDeleted: isDeleted ?? this.isDeleted,
      performanceAvg: performanceAvg ?? this.performanceAvg,
    );
  }

  @override
  List<Object?> get props => [
    id,
    employeeId,
    dateReport,
    filmManagementDetailId,
    quantity,
    timeActual,
    performanceActual,
    percentage,
    kmNumber,
    totalLate,
    totalTimeLate,
    reasonLate,
    statusVehicle,
    propose,
    filmName,
    unitName,
    workContent,
    isDeleted,
    performanceAvg,
  ];
}