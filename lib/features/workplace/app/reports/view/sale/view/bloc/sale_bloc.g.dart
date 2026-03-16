// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SaleStateCWProxy {
  SaleState status(BaseStateStatus status);

  SaleState message(String? message);

  SaleState reports(List<SaleReportItem> reports);

  SaleState projects(List<SaleProjectResponse> projects);

  SaleState staffWorks(List<SaleStaffWork> staffWorks);

  SaleState firmBases(List<FirmBaseResponse> firmBases);

  SaleState typeProjectBases(List<TypeProjectResponse> typeProjectBases);

  SaleState customers(List<CustomerResponse> customers);

  SaleState typeTeamSales(List<TypeTeamSaleResponse> typeTeamSales);

  SaleState statusProjects(List<StatusProjectResponse> statusProjects);

  SaleState customerContacts(List<CustomerContactResponse> customerContacts);

  SaleState customerParts(List<CustomerPartResponse> customerParts);

  SaleState users(List<UserResponse> users);

  SaleState adminWorks(List<SaleAdminWork> adminWorks);

  SaleState adminTypeReports(
      List<SaleAdminTypeReportResponse> adminTypeReports);

  SaleState adminCustomers(List<SaleAdminCustomerResponse> adminCustomers);

  SaleState adminProjects(List<SaleAdminProjectResponse> adminProjects);

  SaleState adminReports(List<SaleAdminResponse> adminReports);

  SaleState userId(int? userId);

  SaleState fullName(String? fullName);

  SaleState departmentId(int? departmentId);

  SaleState teamId(int? teamId);

  SaleState employeeID(int? employeeID);

  SaleState positionName(String? positionName);

  SaleState departmentName(String? departmentName);

  SaleState positionId(int? positionId);

  SaleState dateStart(DateTime? dateStart);

  SaleState dateEnd(DateTime? dateEnd);

  SaleState keyword(String? keyword);

  SaleState isDeleting(bool isDeleting);

  SaleState isSubmitting(bool isSubmitting);

  SaleState submitSuccess(bool submitSuccess);

  SaleState deleteSuccess(bool deleteSuccess);

  SaleState isLoadingDetail(bool isLoadingDetail);

  SaleState saveSuccess(bool saveSuccess);

  SaleState isSaving(bool isSaving);

  SaleState expandedWorkIndex(int? expandedWorkIndex);

  SaleState customerId(int? customerId);

  SaleState dateReport(DateTime? dateReport);

  SaleState selectedReportDetail(
      DetailSaleReportResponse? selectedReportDetail);

  SaleState selectedProject(SaleProjectResponse? selectedProject);

  SaleState selectedReportAdminDetail(
      DetailSaleAdminReportResponse? selectedReportAdminDetail);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SaleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SaleState(...).copyWith(id: 12, name: "My name")
  /// ````
  SaleState call({
    BaseStateStatus? status,
    String? message,
    List<SaleReportItem>? reports,
    List<SaleProjectResponse>? projects,
    List<SaleStaffWork>? staffWorks,
    List<FirmBaseResponse>? firmBases,
    List<TypeProjectResponse>? typeProjectBases,
    List<CustomerResponse>? customers,
    List<TypeTeamSaleResponse>? typeTeamSales,
    List<StatusProjectResponse>? statusProjects,
    List<CustomerContactResponse>? customerContacts,
    List<CustomerPartResponse>? customerParts,
    List<UserResponse>? users,
    List<SaleAdminWork>? adminWorks,
    List<SaleAdminTypeReportResponse>? adminTypeReports,
    List<SaleAdminCustomerResponse>? adminCustomers,
    List<SaleAdminProjectResponse>? adminProjects,
    List<SaleAdminResponse>? adminReports,
    int? userId,
    String? fullName,
    int? departmentId,
    int? teamId,
    int? employeeID,
    String? positionName,
    String? departmentName,
    int? positionId,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    bool? isDeleting,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    bool? isLoadingDetail,
    bool? saveSuccess,
    bool? isSaving,
    int? expandedWorkIndex,
    int? customerId,
    DateTime? dateReport,
    DetailSaleReportResponse? selectedReportDetail,
    SaleProjectResponse? selectedProject,
    DetailSaleAdminReportResponse? selectedReportAdminDetail,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSaleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSaleState.copyWith.fieldName(...)`
class _$SaleStateCWProxyImpl implements _$SaleStateCWProxy {
  const _$SaleStateCWProxyImpl(this._value);

  final SaleState _value;

  @override
  SaleState status(BaseStateStatus status) => this(status: status);

  @override
  SaleState message(String? message) => this(message: message);

  @override
  SaleState reports(List<SaleReportItem> reports) => this(reports: reports);

  @override
  SaleState projects(List<SaleProjectResponse> projects) =>
      this(projects: projects);

  @override
  SaleState staffWorks(List<SaleStaffWork> staffWorks) =>
      this(staffWorks: staffWorks);

  @override
  SaleState firmBases(List<FirmBaseResponse> firmBases) =>
      this(firmBases: firmBases);

  @override
  SaleState typeProjectBases(List<TypeProjectResponse> typeProjectBases) =>
      this(typeProjectBases: typeProjectBases);

  @override
  SaleState customers(List<CustomerResponse> customers) =>
      this(customers: customers);

  @override
  SaleState typeTeamSales(List<TypeTeamSaleResponse> typeTeamSales) =>
      this(typeTeamSales: typeTeamSales);

  @override
  SaleState statusProjects(List<StatusProjectResponse> statusProjects) =>
      this(statusProjects: statusProjects);

  @override
  SaleState customerContacts(List<CustomerContactResponse> customerContacts) =>
      this(customerContacts: customerContacts);

  @override
  SaleState customerParts(List<CustomerPartResponse> customerParts) =>
      this(customerParts: customerParts);

  @override
  SaleState users(List<UserResponse> users) => this(users: users);

  @override
  SaleState adminWorks(List<SaleAdminWork> adminWorks) =>
      this(adminWorks: adminWorks);

  @override
  SaleState adminTypeReports(
          List<SaleAdminTypeReportResponse> adminTypeReports) =>
      this(adminTypeReports: adminTypeReports);

  @override
  SaleState adminCustomers(List<SaleAdminCustomerResponse> adminCustomers) =>
      this(adminCustomers: adminCustomers);

  @override
  SaleState adminProjects(List<SaleAdminProjectResponse> adminProjects) =>
      this(adminProjects: adminProjects);

  @override
  SaleState adminReports(List<SaleAdminResponse> adminReports) =>
      this(adminReports: adminReports);

  @override
  SaleState userId(int? userId) => this(userId: userId);

  @override
  SaleState fullName(String? fullName) => this(fullName: fullName);

  @override
  SaleState departmentId(int? departmentId) => this(departmentId: departmentId);

  @override
  SaleState teamId(int? teamId) => this(teamId: teamId);

  @override
  SaleState employeeID(int? employeeID) => this(employeeID: employeeID);

  @override
  SaleState positionName(String? positionName) =>
      this(positionName: positionName);

  @override
  SaleState departmentName(String? departmentName) =>
      this(departmentName: departmentName);

  @override
  SaleState positionId(int? positionId) => this(positionId: positionId);

  @override
  SaleState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  SaleState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  SaleState keyword(String? keyword) => this(keyword: keyword);

  @override
  SaleState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  SaleState isSubmitting(bool isSubmitting) => this(isSubmitting: isSubmitting);

  @override
  SaleState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  SaleState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  SaleState isLoadingDetail(bool isLoadingDetail) =>
      this(isLoadingDetail: isLoadingDetail);

  @override
  SaleState saveSuccess(bool saveSuccess) => this(saveSuccess: saveSuccess);

  @override
  SaleState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  SaleState expandedWorkIndex(int? expandedWorkIndex) =>
      this(expandedWorkIndex: expandedWorkIndex);

  @override
  SaleState customerId(int? customerId) => this(customerId: customerId);

  @override
  SaleState dateReport(DateTime? dateReport) => this(dateReport: dateReport);

  @override
  SaleState selectedReportDetail(
          DetailSaleReportResponse? selectedReportDetail) =>
      this(selectedReportDetail: selectedReportDetail);

  @override
  SaleState selectedProject(SaleProjectResponse? selectedProject) =>
      this(selectedProject: selectedProject);

  @override
  SaleState selectedReportAdminDetail(
          DetailSaleAdminReportResponse? selectedReportAdminDetail) =>
      this(selectedReportAdminDetail: selectedReportAdminDetail);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SaleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SaleState(...).copyWith(id: 12, name: "My name")
  /// ````
  SaleState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? reports = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? staffWorks = const $CopyWithPlaceholder(),
    Object? firmBases = const $CopyWithPlaceholder(),
    Object? typeProjectBases = const $CopyWithPlaceholder(),
    Object? customers = const $CopyWithPlaceholder(),
    Object? typeTeamSales = const $CopyWithPlaceholder(),
    Object? statusProjects = const $CopyWithPlaceholder(),
    Object? customerContacts = const $CopyWithPlaceholder(),
    Object? customerParts = const $CopyWithPlaceholder(),
    Object? users = const $CopyWithPlaceholder(),
    Object? adminWorks = const $CopyWithPlaceholder(),
    Object? adminTypeReports = const $CopyWithPlaceholder(),
    Object? adminCustomers = const $CopyWithPlaceholder(),
    Object? adminProjects = const $CopyWithPlaceholder(),
    Object? adminReports = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? fullName = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? teamId = const $CopyWithPlaceholder(),
    Object? employeeID = const $CopyWithPlaceholder(),
    Object? positionName = const $CopyWithPlaceholder(),
    Object? departmentName = const $CopyWithPlaceholder(),
    Object? positionId = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isLoadingDetail = const $CopyWithPlaceholder(),
    Object? saveSuccess = const $CopyWithPlaceholder(),
    Object? isSaving = const $CopyWithPlaceholder(),
    Object? expandedWorkIndex = const $CopyWithPlaceholder(),
    Object? customerId = const $CopyWithPlaceholder(),
    Object? dateReport = const $CopyWithPlaceholder(),
    Object? selectedReportDetail = const $CopyWithPlaceholder(),
    Object? selectedProject = const $CopyWithPlaceholder(),
    Object? selectedReportAdminDetail = const $CopyWithPlaceholder(),
  }) {
    return SaleState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      reports: reports == const $CopyWithPlaceholder() || reports == null
          ? _value.reports
          // ignore: cast_nullable_to_non_nullable
          : reports as List<SaleReportItem>,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<SaleProjectResponse>,
      staffWorks:
          staffWorks == const $CopyWithPlaceholder() || staffWorks == null
              ? _value.staffWorks
              // ignore: cast_nullable_to_non_nullable
              : staffWorks as List<SaleStaffWork>,
      firmBases: firmBases == const $CopyWithPlaceholder() || firmBases == null
          ? _value.firmBases
          // ignore: cast_nullable_to_non_nullable
          : firmBases as List<FirmBaseResponse>,
      typeProjectBases: typeProjectBases == const $CopyWithPlaceholder() ||
              typeProjectBases == null
          ? _value.typeProjectBases
          // ignore: cast_nullable_to_non_nullable
          : typeProjectBases as List<TypeProjectResponse>,
      customers: customers == const $CopyWithPlaceholder() || customers == null
          ? _value.customers
          // ignore: cast_nullable_to_non_nullable
          : customers as List<CustomerResponse>,
      typeTeamSales:
          typeTeamSales == const $CopyWithPlaceholder() || typeTeamSales == null
              ? _value.typeTeamSales
              // ignore: cast_nullable_to_non_nullable
              : typeTeamSales as List<TypeTeamSaleResponse>,
      statusProjects: statusProjects == const $CopyWithPlaceholder() ||
              statusProjects == null
          ? _value.statusProjects
          // ignore: cast_nullable_to_non_nullable
          : statusProjects as List<StatusProjectResponse>,
      customerContacts: customerContacts == const $CopyWithPlaceholder() ||
              customerContacts == null
          ? _value.customerContacts
          // ignore: cast_nullable_to_non_nullable
          : customerContacts as List<CustomerContactResponse>,
      customerParts:
          customerParts == const $CopyWithPlaceholder() || customerParts == null
              ? _value.customerParts
              // ignore: cast_nullable_to_non_nullable
              : customerParts as List<CustomerPartResponse>,
      users: users == const $CopyWithPlaceholder() || users == null
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as List<UserResponse>,
      adminWorks:
          adminWorks == const $CopyWithPlaceholder() || adminWorks == null
              ? _value.adminWorks
              // ignore: cast_nullable_to_non_nullable
              : adminWorks as List<SaleAdminWork>,
      adminTypeReports: adminTypeReports == const $CopyWithPlaceholder() ||
              adminTypeReports == null
          ? _value.adminTypeReports
          // ignore: cast_nullable_to_non_nullable
          : adminTypeReports as List<SaleAdminTypeReportResponse>,
      adminCustomers: adminCustomers == const $CopyWithPlaceholder() ||
              adminCustomers == null
          ? _value.adminCustomers
          // ignore: cast_nullable_to_non_nullable
          : adminCustomers as List<SaleAdminCustomerResponse>,
      adminProjects:
          adminProjects == const $CopyWithPlaceholder() || adminProjects == null
              ? _value.adminProjects
              // ignore: cast_nullable_to_non_nullable
              : adminProjects as List<SaleAdminProjectResponse>,
      adminReports:
          adminReports == const $CopyWithPlaceholder() || adminReports == null
              ? _value.adminReports
              // ignore: cast_nullable_to_non_nullable
              : adminReports as List<SaleAdminResponse>,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as int?,
      fullName: fullName == const $CopyWithPlaceholder()
          ? _value.fullName
          // ignore: cast_nullable_to_non_nullable
          : fullName as String?,
      departmentId: departmentId == const $CopyWithPlaceholder()
          ? _value.departmentId
          // ignore: cast_nullable_to_non_nullable
          : departmentId as int?,
      teamId: teamId == const $CopyWithPlaceholder()
          ? _value.teamId
          // ignore: cast_nullable_to_non_nullable
          : teamId as int?,
      employeeID: employeeID == const $CopyWithPlaceholder()
          ? _value.employeeID
          // ignore: cast_nullable_to_non_nullable
          : employeeID as int?,
      positionName: positionName == const $CopyWithPlaceholder()
          ? _value.positionName
          // ignore: cast_nullable_to_non_nullable
          : positionName as String?,
      departmentName: departmentName == const $CopyWithPlaceholder()
          ? _value.departmentName
          // ignore: cast_nullable_to_non_nullable
          : departmentName as String?,
      positionId: positionId == const $CopyWithPlaceholder()
          ? _value.positionId
          // ignore: cast_nullable_to_non_nullable
          : positionId as int?,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      keyword: keyword == const $CopyWithPlaceholder()
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String?,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      isSubmitting:
          isSubmitting == const $CopyWithPlaceholder() || isSubmitting == null
              ? _value.isSubmitting
              // ignore: cast_nullable_to_non_nullable
              : isSubmitting as bool,
      submitSuccess:
          submitSuccess == const $CopyWithPlaceholder() || submitSuccess == null
              ? _value.submitSuccess
              // ignore: cast_nullable_to_non_nullable
              : submitSuccess as bool,
      deleteSuccess:
          deleteSuccess == const $CopyWithPlaceholder() || deleteSuccess == null
              ? _value.deleteSuccess
              // ignore: cast_nullable_to_non_nullable
              : deleteSuccess as bool,
      isLoadingDetail: isLoadingDetail == const $CopyWithPlaceholder() ||
              isLoadingDetail == null
          ? _value.isLoadingDetail
          // ignore: cast_nullable_to_non_nullable
          : isLoadingDetail as bool,
      saveSuccess:
          saveSuccess == const $CopyWithPlaceholder() || saveSuccess == null
              ? _value.saveSuccess
              // ignore: cast_nullable_to_non_nullable
              : saveSuccess as bool,
      isSaving: isSaving == const $CopyWithPlaceholder() || isSaving == null
          ? _value.isSaving
          // ignore: cast_nullable_to_non_nullable
          : isSaving as bool,
      expandedWorkIndex: expandedWorkIndex == const $CopyWithPlaceholder()
          ? _value.expandedWorkIndex
          // ignore: cast_nullable_to_non_nullable
          : expandedWorkIndex as int?,
      customerId: customerId == const $CopyWithPlaceholder()
          ? _value.customerId
          // ignore: cast_nullable_to_non_nullable
          : customerId as int?,
      dateReport: dateReport == const $CopyWithPlaceholder()
          ? _value.dateReport
          // ignore: cast_nullable_to_non_nullable
          : dateReport as DateTime?,
      selectedReportDetail: selectedReportDetail == const $CopyWithPlaceholder()
          ? _value.selectedReportDetail
          // ignore: cast_nullable_to_non_nullable
          : selectedReportDetail as DetailSaleReportResponse?,
      selectedProject: selectedProject == const $CopyWithPlaceholder()
          ? _value.selectedProject
          // ignore: cast_nullable_to_non_nullable
          : selectedProject as SaleProjectResponse?,
      selectedReportAdminDetail:
          selectedReportAdminDetail == const $CopyWithPlaceholder()
              ? _value.selectedReportAdminDetail
              // ignore: cast_nullable_to_non_nullable
              : selectedReportAdminDetail as DetailSaleAdminReportResponse?,
    );
  }
}

extension $SaleStateCopyWith on SaleState {
  /// Returns a callable class that can be used as follows: `instanceOfSaleState.copyWith(...)` or like so:`instanceOfSaleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SaleStateCWProxy get copyWith => _$SaleStateCWProxyImpl(this);
}
