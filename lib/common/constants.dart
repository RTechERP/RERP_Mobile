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

class ApiEndPoint{
  static const String login = '/home/login';

  static const String currentUser = '/home/current-user';
  static const String getDailyReportTech = '/DailyReportTech/get-daily-report-tech';

  static const String getDepart = '/Department/get-all';

  static const String getStaff = '/Course/get-employees?departmentid=2';

  static const String getTeam = '/Team/department/2';

  static const String getProject = '/project/get-project-modal';

  static const String getProjectItemByUser =
      '/DailyReportTech/get-project-item-by-user';

  static const String saveReportTech = '/DailyReportTech/save-report-tech';
}