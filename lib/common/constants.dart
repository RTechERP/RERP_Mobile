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
}
