import 'package:equatable/equatable.dart';
import '../../../data/datasource/models/report_model.dart';

class SaleAdminWork extends Equatable {
  final int? id;

  final int? employeeId;
  final int? reportTypeId;
  final int? customerId;

  final String? reportTypeName;
  final String? employeeFullName;
  final String? reportContent;
  final String? customerName;
  final String? employeeRequestFullName;

  final String? result;
  final String? problem;
  final String? problemSolve;
  final String? planNextDay;

  final int? projectId;
  final int? employeeRequestId;
  final DateTime? dateReport;

  final int? stt;
  final String? projectCode;

  const SaleAdminWork({
    this.id,
    this.employeeId,
    this.reportTypeId,
    this.customerId,
    this.reportTypeName,
    this.employeeFullName,
    this.reportContent,
    this.customerName,
    this.employeeRequestFullName,
    this.result,
    this.problem,
    this.problemSolve,
    this.planNextDay,
    this.stt,
    this.projectCode,
    this.projectId,
    this.employeeRequestId,
    this.dateReport,
  });

  /// item rỗng để add UI
  factory SaleAdminWork.empty({
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
    return SaleAdminWork(
      id: DateTime.now().microsecondsSinceEpoch,
      employeeId: 0,
      reportTypeId: 0,
      customerId: 0,
      reportContent: '',
      result: '',
      problem: '',
      problemSolve: '',
      planNextDay: '',
      stt: 0,
      projectCode: '',
      projectId: 0,
      employeeRequestId: 0,
      dateReport: DateTime.now(),
    );
  }

  /// từ API list
  factory SaleAdminWork.fromSaleAdminReportResponse(
      SaleAdminResponse r,
      ) {
    return SaleAdminWork(
      id: r.id,
      employeeId: r.employeeId,
      reportTypeId: r.reportTypeId,
      customerId: r.customerId,
      reportTypeName: r.reportTypeName,
      employeeFullName: r.employeeFullName,
      reportContent: r.reportContent,
      customerName: r.customerName,
      employeeRequestFullName: r.employeeRequestFullName,
      result: r.result,
      problem: r.problem,
      problemSolve: r.problemSolve,
      planNextDay: r.planNextDay,
      stt: r.stt,
      projectCode: r.projectCode,
      employeeRequestId: r.employeeRequestId,
      dateReport: r.dateReport,
    );
  }

  /// từ API detail
  factory SaleAdminWork.fromDetailSaleReportResponse(
      DetailSaleAdminReportResponse d,
      ) {
    return SaleAdminWork(
      id: d.id,
      employeeId: d.employeeId,
      reportTypeId: d.reportTypeId,
      customerId: d.customerId,
      reportTypeName: d.reportTypeName,
      employeeFullName: d.employeeFullName,
      reportContent: d.reportContent,
      customerName: d.customerName,
      employeeRequestFullName: d.employeeRequestFullName,
      result: d.result,
      problem: d.problem,
      problemSolve: d.problemSolve,
      planNextDay: d.planNextDay,
      stt: d.stt,
      employeeRequestId: d.employeeRequestId,
      dateReport: d.dateReport,

    );
  }

  SaleAdminWork copyWith({
    int? id,
    int? employeeId,
    int? reportTypeId,
    int? customerId,
    String? reportTypeName,
    String? employeeFullName,
    String? reportContent,
    String? customerName,
    String? employeeRequestFullName,
    String? result,
    String? problem,
    String? problemSolve,
    String? planNextDay,
    int? stt,
    String? projectCode,
    int? projectId,
    int? employeeRequestId,
    DateTime? dateReport,
  }) {
    return SaleAdminWork(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      reportTypeId: reportTypeId ?? this.reportTypeId,
      customerId: customerId ?? this.customerId,
      reportTypeName: reportTypeName ?? this.reportTypeName,
      employeeFullName: employeeFullName ?? this.employeeFullName,
      reportContent: reportContent ?? this.reportContent,
      customerName: customerName ?? this.customerName,
      employeeRequestFullName:
      employeeRequestFullName ?? this.employeeRequestFullName,
      result: result ?? this.result,
      problem: problem ?? this.problem,
      problemSolve: problemSolve ?? this.problemSolve,
      planNextDay: planNextDay ?? this.planNextDay,
      stt: stt ?? this.stt,
      projectCode: projectCode ?? this.projectCode,
      projectId: projectId ?? this.projectId,
      employeeRequestId: employeeRequestId ?? this.employeeRequestId,
      dateReport: dateReport ?? this.dateReport,
    );
  }

  @override
  List<Object?> get props => [
    id,
    employeeId,
    reportTypeId,
    customerId,
    reportTypeName,
    employeeFullName,
    reportContent,
    customerName,
    employeeRequestFullName,
    result,
    problem,
    problemSolve,
    planNextDay,
    stt,
    projectCode,
    projectId,
    employeeRequestId,
    dateReport,
  ];
}