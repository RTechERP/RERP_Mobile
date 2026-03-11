part of 'sale_bloc.dart';

@CopyWith()
class SaleState extends BaseBlocState {

  final bool isSubmitting;
  final bool submitSuccess;
  final bool isDeleting;

  final int? userId;
  final String? fullName;
  final int? departmentId;
  final int? teamId;
  final int? employeeID;
  final String? positionName;
  final String? departmentName;
  final int? positionId;

  final List<SaleReportItem> reports;
  final List<SaleProjectResponse> projects;
  final List<SaleStaffWork> staffWorks;

  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? keyword;

  final int? expandedWorkIndex;


  const SaleState({
    required super.status,
    super.message,
    this.reports = const [],
    this.projects = const [],
    this.staffWorks = const [],
    this.userId,
    this.fullName,
    this.departmentId,
    this.teamId,
    this.employeeID,
    this.positionName,
    this.departmentName,
    this.positionId,
    this.dateStart,
    this.dateEnd,
    this.keyword,
    this.isDeleting = false,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.expandedWorkIndex,
  });

  factory SaleState.init() => const SaleState(
    status: BaseStateStatus.init,
    reports: [],
    projects: [],
    staffWorks: [],
    userId: null,
    fullName: null,
    departmentId: null,
    teamId: null,
    employeeID: null,
    positionName: null,
    departmentName: null,
    message: null,
    positionId: null,
    dateStart: null,
    dateEnd: null,
    keyword: null,
    isDeleting: false,
    isSubmitting: false,
    submitSuccess: false,
    expandedWorkIndex: null,
  );

  @override
  List get props => [
    status,
    message,
    reports,
    projects,
    staffWorks,
    userId,
    fullName,
    departmentId,
    teamId,
    employeeID,
    positionName,
    departmentName,
    positionId,
    dateStart,
    dateEnd,
    keyword,
    isDeleting,
    isSubmitting,
    submitSuccess,
    expandedWorkIndex,
  ];
}
