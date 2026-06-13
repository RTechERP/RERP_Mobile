import 'package:flutter/material.dart';

import '../models/app_info.dart';

class AppInfoConstants {
  static final AppInfoConstants instance = AppInfoConstants._();

  static late final AppInfo _appInfo;

  AppInfoConstants._();

  static void initialize(Map<String, dynamic> appInfoJson) {
    try {
      _appInfo = AppInfo.fromJson(appInfoJson);
      print('app info: ${_appInfo.appId}');
    } catch (e) {
      debugPrint('Error initializing app info: $e');
    }
    return;
  }

  static String get appId => _appInfo.appId;

  static String get appStoreUrl => _appInfo.appStoreUrl;

  static String get googlePlayUrl => _appInfo.googlePlayUrl;

  static String get termsAndConditions => _appInfo.termsAndConditions;

  static String get termsOfService => _appInfo.termsOfService;

  static String get privacyPolicy => _appInfo.privacyPolicy;
}

class NotificationConfig {
  static const highImportance = "High Importance channel";
  static const highChannelId = "flutter_channel_id_0";
  static const highChannelDescription = "Floating notification with sound";
  static const notificationIconPath = '@mipmap/ic_launcher';
}

class Config {
  static const memCacheHeight = 150;
  static const memCacheWidth = 150;
  static const minCacheHeight = 100;
  static const minCacheWidth = 100;
}

class SharedKeys {
  static const accessToken = 'accessToken';
  static const userId = 'userId';

  static const isAppOpened = 'isAppOpened';

  static const rememberMe = 'rememberMe';
  static const savedUsername = 'savedUsername';
  static const savedPassword = 'savedPassword';

  /// FCM token đã refresh nhưng chưa gửi lên server (user đang logged-in).
  static const savedFcmToken = 'savedFcmToken';
}

class BlocMessages {
  static const appNotOpened = 'appNotOpened';
  static const notLoggedIn = 'notLoggedIn';
  static const loggedIn = 'loggedIn';
  static const loginSuccess = 'loginSuccess';
}

class FireBaseLog {
  static const String loginPage = 'login_page';
}

class ApiEndPoint {
  static const String login = '/home/login';

  static const String loginMobile = '/homemobile/login-mobile';
  static const String currentUser = '/home/current-user';
  static const String getDailyReportTech =
      '/DailyReportTech/get-daily-report-tech';

  static const String getDepart = '/Department/get-all';

  static const String getStaff = '/Course/get-employees?departmentid=2';

  static const String getTeam = '/Team/department/2';

  static const String getProject = '/project/get-project-modal';

  static const String getProjectItemByUser =
      '/DailyReportTech/get-project-item-by-user';

  static const String saveReportTech = '/DailyReportTech/save-report-tech';

  static const String sendMailReport = '/DailyReportTech/send-email-report';

  static const String getById = '/DailyReportTech/get-by-id';

  static const String deleteReportById = '/DailyReportTech/delete-daily-report';

  static const String copyReport = '/DailyReportTech/get-for-copy';

  static const String marketing_upload = '/home/upload-multiple';

  static const String saveReportMarketing = '/DailyReportTech/save-report-mar';

  static const String getMarketingById = '/DailyReportTech/get-by-id-hr';

  static const String saveReportHr = '/DailyReportTech/save-report-hr';

  static const String getDailyLXCP = '/DailyReportHr/get-daily-report-hr';

  static const String saveReportLXCP = '/DailyReportHr/save-report-hr';

  static const String getFilmDetail = '/DailyReportHr/get-film-detail';

  static const String getLXCPById = '/DailyReportHr/get-data-by-id';

  static const String getSaleById = '/DailyReportSale/get-by-id';

  static const String getSaleProject = '/DailyReportSale/get-projects';

  static const String getTeamSale = '/DailyReportSale/get-employee-team-sale';

  static const String getCustomerPart = '/DailyReportSale/get-customerpart';

  static const String getTypeTeamSale = '/DailyReportSale/get-mainindex';

  static const String getCustomer = '/DailyReportSale/get-customers';

  static const String getFirmBase = '/DailyReportSale/get-firmbase';

  static const String getTypeProject = '/DailyReportSale/get-projecttypebase';

  static const String getStatusProject = '/DailyReportSale/get-projectstatus';
  static const String getCustomerContact =
      '/DailyReportSale/get-customercontact';

  static const String deleteSaleReport = '/DailyReportSale/delete';

  static const String deleteSaleAdminReport = '/DailyReportSaleAdmin/delete';

  static const String saveSaleStaffReport = '/DailyReportSale/save-data';

  static const String getSaleDailyReport = '/DailyReportSale/get-data';

  static const String getAllUser = '/DailyReportSaleAdmin/get-user';

  static const String saveSaleAdminReport = '/DailyReportSaleAdmin/save-data';

  static const String getAdminTypeReport =
      '/DailyReportSaleAdmin/get-reporttypes';

  static const String getAdminProject = '/DailyReportSaleAdmin/get-projects';

  static const String getAdminCustomer = '/DailyReportSaleAdmin/get-customers';

  static const String getAdminReport = '/DailyReportSaleAdmin/load-data';

  static const String getSaleAdminById = '/DailyReportSaleAdmin/get-details';

  static const String getMeetingRoom = '/bookingroom/get-booking-room';

  static const String saveMeetingRoom = '/BookingRoom/save-data';

  static const String getDetailMeetingRoom = '/bookingroom/get-by-id';

  static const String getUserMeetingRoom = '/Employee';

  static const String getBookingVehicle =
      '/vehiclebookingmanagement/get-vehicle-booking-management';

  static const String getProvinceArrives =
      '/vehiclebookingmanagement/get-province-arrives';

  static const String getProvinceDeparture =
      '/vehiclebookingmanagement/get-province-departure';

  static const String getBookingVehicleProject =
      '/vehiclebookingmanagement/get-projects';

  static const String getBookingVehicleApprover =
      '/vehiclebookingmanagement/get-approved-list';

  static const String getBookingVehicleEmployee =
      '/vehiclebookingmanagement/get-employees';

  static const String getBookingVehicleEmployeeById =
      '/vehiclebookingmanagement/get-employee-by-id';

  static const String createBookingVehicle = '/vehiclebookingmanagement/create';

  static const String cancelBookingVehicle =
      '/vehiclebookingmanagement/vehicle-booking-cancel';

  static const String uploadBookingVehicleFile =
      '/vehiclebookingmanagement/upload-file';

  static const String getLunch = '/EmployeeFoodOrder';
  static const String saveLunch = '/EmployeeFoodOrder/save-data';

  static const String getEarlyLate = '/EmployeeEarlyLate';
  static const String saveEarlyLate = '/EmployeeEarlyLate/save-data';
  static const String getApprover = '/Employee/get-approve';

  static const String getWfh = '/EmployeeWFH/get-wfh';
  static const String saveWfh = '/EmployeeWFH/save-data';

  static const String getMissed =
      '/EmployeeNoFingerprint/get-employee-no-fingerprint';

  static const String saveMissed = '/EmployeeNoFingerprint/savedata';

  static const String checkDuplicateEnfMissed =
      '/EmployeeNoFingerprint/check-duplicate-enf';

  static const String getLeave = '/EmployeeOnLeave';
  static const String getLeavePhaseMulti = '/EmployeeOnLeave/get-multi';
  static const String saveLeave = '/EmployeeOnLeave/save-data';

  static const String getLeaveTime =
      '/employeeonleave/list-summary-employee-on-leave';

  static const String saveMultiLeave = '/EmployeeOnLeave/SaveMultiPhase';

  static const String getEmployeeLeave = '/Employee';

  static const String getOvertime =
      '/EmployeeOverTime/get-over-time-by-employee';

  static const String getOvertimeType = '/EmployeeTypeOverTime';

  static const String getOvertimeProject = '/project/get-project-modal';

  static const String saveOvertime = '/EmployeeOverTime/save-data-employee';

  static const String getOvertimeById = '/EmployeeOverTime/get-by-id';

  static const String getApproverOvertime = '/EmployeeOverTime/get-approver';

  static const String getWorkTrip =
      '/EmployeeBussiness/get-employee-bussinesss-person';

  static const String getWorkTripProject = '/project/get-project-modal';

  static const String getWorkTripTypeBussiness = '/EmployeeTypeBussiness';

  static const String getWorkTripTypeVehicle = '/EmployeeVehicleBussiness';

  static const String saveWorkTrip = '/EmployeeBussiness/save-data-employee';

  static const String getWorkTripById = '/EmployeeBussiness/get-by-id';

  static const String getOvernight =
      '/EmployeeNightShift/get-employee-night-shift';

  static const String saveOvernight = '/EmployeeNightShift/save-data';

  // TODO: Thay đường dẫn API thực tế của Backend tại đây

  static const String getWorkCategory =
      '/projectitemnew/get-project-item-person';

  static const String getWorkProjectType = '/WorkItem/get-type-project-item';

  static const String getWorkAssigner = '/projectitemnew/get-employee-request';

  static const String getWorkParent = '/projectitemnew/get-project-item-parent';

  static const String saveWorkCategory = '/projectitemnew/save-data-person';

  static const String getWorkCategoryDetail = '/projectitemnew/get-by-id';

  static const String getWorkCategoryProblem =
      '/ProjectItem/get-project-item-problem';

  static const String saveWorkCategoryProblem = '/ProjectItem/save-problem';

  static const String getFillAprrover = '/employeeonleave/get-approve-id';

  static const String getPersonalAsset = '/Assets/get-asset-person';

  static const String getPersonalProperty = '/Assets/get-personal-properties';

  static const String getPersonalPropertyDetail =
      '/Assets/get-personal-property-details';

  static const String savePersonalProperty = '/Assets/save-personal-property';

  static const String getTypeNotification =
      '/notificationtype/get-data-by-userid';

  static const String saveNotificationType = '/notificationtype/save-data';

  static const String getStationery =
      '/OfficeSupplyRequests/get-office-supply-request';
  static const String getStationerySupply = '/officesupply/get-office-supply';

  static const String getStationeryDetail =
      '/OfficeSupplyRequests/get-office-supply-request-detail';

  static const String saveStationery = '/OfficeSupplyRequests/save-data';

  // Week Plan
  static const String getProjectTask = '/ProjectTask';
  static const String getProjectTaskType = '/ProjectTask/project-task-type';
  static const String projectTaskAttendance = '/ProjectTask/attendance';
  static const String saveProjectTask = '/ProjectTask/SaveData';
  static const String projectTaskFiles = '/ProjectTask/Files';
  static const String projectTaskChecklists = '/ProjectTask/Checklists';
  static const String projectTaskChecklistsGet =
      '/ProjectTask/{taskId}/Checklists';
  static const String projectTaskChecklistsUpdate =
      '/ProjectTask/Checklists/{id}';
  static const String projectTaskLinks = '/ProjectTask/Links';
  static const String projectTaskChild = '/ProjectTask/project-task-child';
  static const String projectTaskAdditional = '/ProjectTask/Additional';

  static const String getAllProjectTask = '/ProjectTask/get-all-project';
  static const String listProjectTask = '/ProjectTask/list-project-task';
  static const String projectTaskDetail = '/ProjectTask';
  static const String projectTaskEmployee = '/ProjectTask/employee';

  static const String getEmployees = '/Employee';

  // Salary
  static const String getPersonalSyntheticByMonth =
      '/Home/get-personal-synthetic-by-month';

  // PIN
  static const String checkPin = '/PinAuth/check-pin-status';
  static const String setPin = '/Account/set-pin';
  static const String verifyPin = '/PinAuth/verify-pin';
  static const String requestPin = '/Account/request-pin';
  static const String requestResetPin = '/PinAuth/request-reset-pin';
  static const String validateToken = '/PinAuth/validate-token';
  static const String resetPin = '/PinAuth/reset-pin';

  // Timekeeping
  static const String getTimekeeping = '/ChamCong';
  static const String getTimekeepingDays = '/ChamCong/get-days';

  // Contract
  static const String getContract = '/RegisterContract/get-all-data';
  static const String getDocumentType = '/RegisterContract/get-document-type';
  static const String getTaxCompany = '/RegisterContract/get-tax-company';
  static const String saveContract = '/registercontract/save-data';
  static const String getContractById = '/registercontract/get-data-by-id';
  static const String sendEmailNewContract =
      '/RegisterContract/send-email-new-contract';
  static const String approveOrCancel = '/RegisterContract/approve-or-cancel';

  // Job requirement
  static const String getWorkRequirement =
      '/jobrequirement/get-job-requirement-personal';
  static const String saveWorkRequirement = '/jobrequirement/save-data';
  static const String getWorkRequirementDepartment =
      '/handover/get-departments';
  static const String getWorkRequirementApprover =
      '/EmployeeWFH/get-employee-approver';
  static const String getWorkRequirementDetail = '/jobrequirement/details';
  static const String deleteWorkRequirement = '/jobrequirement/delete';

  // Idea Registration
  static const String getIdeaRegistration = '/RegisterIdea/get-ideas';
  static const String getCourseCatalog = '/RegisterIdea/get-course-catalog';
  static const String saveIdea = '/RegisterIdea/save-idea';
  static const String deleteIdea = '/RegisterIdea/delete-idea';
  static const String getIdeaDetail = '/RegisterIdea/get-idea-detail';

  // Stamp Registration
  static const String getStamp = '/TrackingMarks/get-all';
  static const String saveStamp = '/TrackingMarks/save';
  static const String getStampEmployees = '/TrackingMarks/get-employees';
  static const String getStampSealRegulations =
      '/TrackingMarks/seal-regulations';
  static const String getStampDocumentTypes = '/TrackingMarks/document-types';
  static const String getStampTaxCompanies = '/TrackingMarks/tax-companies';

  // Poll
  static const String getPolls = '/pollform/all';
  static const String getDetailPoll = '/pollform';
  static const String getPollMyResponse = '/pollform';
  static const String submitPoll = '/pollform/respond';
  static const String submitPollBulk = '/pollform';

  // Newsfeed
  static const String getNewsletter = '/newsletter/get-limit-newsletter';
  static const String getNewsletterById = '/newsletter/get-newsletter-by-id';
  static const String getNewsletterFileByNewsletterId =
      '/newsletter/get-newsletter-file-by-newsletterid';
  static const String getCalendar = '/Holiday';
}
