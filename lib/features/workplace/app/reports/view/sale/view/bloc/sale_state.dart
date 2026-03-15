part of 'sale_bloc.dart';

@CopyWith()
class SaleState extends BaseBlocState {

  final bool isSubmitting;
  final bool submitSuccess;
  final bool isDeleting;
  final bool deleteSuccess;
  final bool isLoadingDetail;
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

  final List<FirmBaseResponse> firmBases;

  final List<TypeProjectResponse> typeProjectBases;

  final List<TypeTeamSaleResponse> typeTeamSales;
  final List<StatusProjectResponse> statusProjects;

  final DetailSaleReportResponse? selectedReportDetail;
  final List<CustomerResponse> customers;

  final List<CustomerContactResponse> customerContacts;
  final List<CustomerPartResponse> customerParts;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? keyword;
  final int? expandedWorkIndex;
  final int? customerId;

  final DateTime? dateReport;
  const SaleState({
    required super.status,
    super.message,
    this.reports = const [],
    this.projects = const [],
    this.staffWorks = const [],
    this.firmBases = const [],
    this.typeProjectBases = const [],
    this.customers = const [],
    this.typeTeamSales = const [],
    this.statusProjects = const [],
    this.customerContacts = const [],
    this.customerParts = const [],
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
    this.deleteSuccess = false,
    this.isLoadingDetail = false,
    this.expandedWorkIndex,
    this.customerId,
    this.dateReport,
    this.selectedReportDetail,
  });

  factory SaleState.init() => const SaleState(
    status: BaseStateStatus.init,
    reports: [],
    projects: [],
    staffWorks: [],
    firmBases: [],
    typeProjectBases: [],
    customers: [],
    typeTeamSales: [],
    statusProjects: [],
    customerContacts: [],
    customerParts: [],
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
    deleteSuccess: false,
    isLoadingDetail: false,
    expandedWorkIndex: null,
    customerId: null,
    dateReport: null,
    selectedReportDetail: null,
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
    firmBases,
    typeProjectBases,
    customers,
    typeTeamSales,
    statusProjects,
    customerContacts,
    customerParts,
    customerId,
    dateReport,
    deleteSuccess,
    isLoadingDetail,
    selectedReportDetail,
  ];
}
