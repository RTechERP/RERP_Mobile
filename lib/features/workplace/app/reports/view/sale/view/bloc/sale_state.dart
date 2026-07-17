part of 'sale_bloc.dart';

@CopyWith()
class SaleState extends BaseBlocState {

  final bool isSubmitting;
  final bool submitSuccess;
  final bool isDeleting;
  final bool deleteSuccess;
  final bool isLoadingDetail;
  final bool saveSuccess;

  final bool isSaving;
  final int? userId;
  final String? fullName;
  final int? departmentId;
  final int? teamId;
  final int? employeeID;
  final String? positionName;
  final String? departmentName;
  final int? positionId;

  final List<SaleReportItem> reports;

  final List<SaleAdminResponse> adminReports;
  final List<SaleAdminWork> adminWorks;
  final List<SaleProjectResponse> projects;
  final List<SaleStaffWork> staffWorks;

  final List<FirmBaseResponse> firmBases;

  final List<TypeProjectResponse> typeProjectBases;

  final List<TypeTeamSaleResponse> typeTeamSales;

  final List<SaleAdminTypeReportResponse> adminTypeReports;
  final List<SaleAdminCustomerResponse> adminCustomers;
  final List<SaleAdminProjectResponse> adminProjects;

  final List<StatusProjectResponse> statusProjects;

  final DetailSaleReportResponse? selectedReportDetail;

  final DetailSaleAdminReportResponse? selectedReportAdminDetail;
  final List<CustomerResponse> customers;

  final List<CustomerContactResponse> customerContacts;
  final List<CustomerPartResponse> customerParts;

  final List<UserResponse> users;

  final SaleProjectResponse? selectedProject;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? keyword;
  final int? expandedWorkIndex;
  final int? customerId;

  final DateTime? dateReport;

  final String? planNextDay;
  final bool isSaleAdmin;
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
    this.users = const [],
    this.adminWorks = const [],
    this.adminTypeReports = const [],
    this.adminCustomers = const [],
    this.adminProjects = const [],
    this.adminReports = const [],
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
    this.saveSuccess = false,
    this.isSaving = false,
    this.expandedWorkIndex,
    this.customerId,
    this.dateReport,
    this.selectedReportDetail,
    this.selectedProject,
    this.selectedReportAdminDetail,
    this.planNextDay,
    this.isSaleAdmin = false,
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
    users: [],
    adminWorks: [],
    adminTypeReports: [],
    adminCustomers: [],
    adminProjects: [],
    adminReports: [],
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
    isSaving: false,
    expandedWorkIndex: null,
    customerId: null,
    dateReport: null,
    selectedReportDetail: null,
    selectedProject: null,
    saveSuccess: false,
    selectedReportAdminDetail: null,
    planNextDay: null,
    isSaleAdmin: false,
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
    selectedProject,
    saveSuccess,
    isSaving,
    users,
    adminWorks,
    adminTypeReports,
    adminCustomers,
    adminProjects,
    adminReports,
    selectedReportAdminDetail,
    planNextDay,
    isSaleAdmin,
  ];
}
