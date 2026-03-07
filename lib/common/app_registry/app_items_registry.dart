import 'package:flutter/material.dart';
import '../../routes/route_names.dart';
import '../constants/index.dart';
import '../models/index.dart';
import 'package:easy_localization/easy_localization.dart';

class AppItemRegistry {
  static final List<AppItemModel> regwork = [
    /// ================= REG WORK =================
    AppItemModel(
      id: 'reg_work:lunch',
      name: 'reg_work.lunch'.tr(),
      iconCodePoint: Icons.restaurant_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_work',
      route: '/regwork/lunch',
      imageUrl: AppImages.app_lunch,
    ),

    AppItemModel(
      id: 'reg_work:leaving',
      name: 'reg_work.leave'.tr(),
      iconCodePoint: Icons.event_busy_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_work',
      route: '/regwork/leave',
      imageUrl: AppImages.app_leave,
    ),

    AppItemModel(
      id: 'reg_work:in_out',
      name: 'reg_work.in_out'.tr(),
      iconCodePoint: Icons.swap_horiz_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_work',
      route: '/regwork/in_out',
      imageUrl: AppImages.app_in_out,
    ),

    AppItemModel(
      id: 'reg_work:overtime',
      name: 'reg_work.overtime'.tr(),
      iconCodePoint: Icons.schedule_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_work',
      route: '/regwork/overtime',
      imageUrl: AppImages.app_overtime,
    ),

    AppItemModel(
      id: 'reg_work:overnight',
      name: 'reg_work.overnight'.tr(),
      iconCodePoint: Icons.nightlight_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_work',
      route: '/regwork/overnight',
      imageUrl: AppImages.app_overnight,
    ),

    AppItemModel(
      id: 'reg_work:work_trip',
      name: 'reg_work.work_trip'.tr(),
      iconCodePoint: Icons.airport_shuttle_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_work',
      route: '/regwork/work_trip',
      imageUrl: AppImages.app_work_trip,
    ),

    AppItemModel(
      id: 'reg_work:wfh',
      name: 'reg_work.wfh'.tr(),
      iconCodePoint: Icons.home_work_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_work',
      route: '/regwork/wfh',
      imageUrl: AppImages.app_wfh,
    ),

    AppItemModel(
      id: 'reg_work:missed',
      name: 'reg_work.missed'.tr(),
      iconCodePoint: Icons.error_outline.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_work',
      route: '/regwork/missed',
      imageUrl: AppImages.app_missed,
    ),

    AppItemModel(
      id: 'reg_work:sum_personal',
      name: 'reg_work.sum_personal'.tr(),
      iconCodePoint: Icons.person_outline.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_work',
      route: '/regwork/sum-personal',
      imageUrl: AppImages.app_sum_personal,
    ),
  ];

  static final List<AppItemModel> reggeneral = [
    /// ================= REG GENERAL =================
    AppItemModel(
      id: 'reg_general:meeting_room',
      name: 'reg_general.meeting_room'.tr(),
      iconCodePoint: Icons.meeting_room_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/meeting-room',
    ),

    AppItemModel(
      id: 'reg_general:booking_car',
      name: 'reg_general.booking_car'.tr(),
      iconCodePoint: Icons.directions_car_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/booking-car',
    ),

    AppItemModel(
      id: 'reg_general:purchase',
      name: 'reg_general.purchase'.tr(),
      iconCodePoint: Icons.request_quote_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/purchase',
    ),

    AppItemModel(
      id: 'reg_general:special_purchase',
      name: 'reg_general.special_purchase'.tr(),
      iconCodePoint: Icons.price_check_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/special-purchase',
    ),

    AppItemModel(
      id: 'reg_general:work_request',
      name: 'reg_general.work_request'.tr(),
      iconCodePoint: Icons.assignment_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/work-request',
    ),

    AppItemModel(
      id: 'reg_general:idea',
      name: 'reg_general.idea'.tr(),
      iconCodePoint: Icons.lightbulb_outline.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/idea',
    ),

    AppItemModel(
      id: 'reg_general:contract',
      name: 'reg_general.contract'.tr(),
      iconCodePoint: Icons.description_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/contract',
    ),

    AppItemModel(
      id: 'reg_general:stationery',
      name: 'reg_general.stationery'.tr(),
      iconCodePoint: Icons.edit_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/stationery',
    ),

    AppItemModel(
      id: 'reg_general:work_category',
      name: 'reg_general.work_category'.tr(),
      iconCodePoint: Icons.category_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/work-category',
    ),

    AppItemModel(
      id: 'reg_general:personal_asset',
      name: 'reg_general.personal_asset'.tr(),
      iconCodePoint: Icons.inventory_2_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/personal-asset',
    ),

    AppItemModel(
      id: 'reg_general:stamp',
      name: 'reg_general.stamp'.tr(),
      iconCodePoint: Icons.approval_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'reg_general',
      route: '/reg-general/stamp',
    ),
  ];

  static final List<AppItemModel> summaryword = [
    /// ================= SUMMARY WORK =================
    AppItemModel(
      id: 'summary_work:leaving',
      name: 'summary_work.leaving'.tr(),
      iconCodePoint: Icons.event_busy_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'summary_work',
      route: '/summary-work/leaving',
    ),

    AppItemModel(
      id: 'summary_work:in_out',
      name: 'summary_work.in_out'.tr(),
      iconCodePoint: Icons.swap_horiz_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'summary_work',
      route: '/summary-work/in-out',
    ),

    AppItemModel(
      id: 'summary_work:wfh',
      name: 'summary_work.wfh'.tr(),
      iconCodePoint: Icons.home_work_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'summary_work',
      route: '/summary-work/wfh',
    ),

    AppItemModel(
      id: 'summary_work:fingerprint',
      name: 'summary_work.fingerprint'.tr(),
      iconCodePoint: Icons.fingerprint_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'summary_work',
      route: '/summary-work/fingerprint',
    ),

    AppItemModel(
      id: 'summary_work:overtime',
      name: 'summary_work.overtime'.tr(),
      iconCodePoint: Icons.schedule_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'summary_work',
      route: '/summary-work/overtime',
    ),

    AppItemModel(
      id: 'summary_work:overnight',
      name: 'summary_work.overnight'.tr(),
      iconCodePoint: Icons.nightlight_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'summary_work',
      route: '/summary-work/overnight',
    ),
  ];

  static final List<AppItemModel> generalforms = [];

  static final List<AppItemModel> reports = [
    /// ================= REPORT =================
    AppItemModel(
      id: 'report:sale',
      name: 'report.sale'.tr(),
      iconCodePoint: Icons.attach_money_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'report',
      type: 'sale',
      route: null,
      imageUrl: AppImages.report_sale,
    ),
    AppItemModel(
      id: 'report:ad',
      name: 'report.ad'.tr(),
      iconCodePoint: Icons.campaign_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'report',
      route: RouteNames.reportADdepart,
      imageUrl: AppImages.report_sale_admin,
    ),
    AppItemModel(
      id: 'report:tech',
      name: 'report.tech'.tr(),
      iconCodePoint: Icons.engineering_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'report',
      route: '/report/tech',
      imageUrl: AppImages.report_tech,
    ),
    AppItemModel(
      id: 'report:hr',
      name: 'report.hr'.tr(),
      iconCodePoint: Icons.people_alt_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'report',
      type: 'hr',
      route: null,
      imageUrl: AppImages.report_hr,
    ),
    AppItemModel(
      id: 'report:marketing',
      name: 'report.marketing'.tr(),
      iconCodePoint: Icons.trending_up_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'report',
      route: RouteNames.reportMarketingdepart,
      imageUrl: AppImages.report_marketing,
    ),
    AppItemModel(
      id: 'report:agv',
      name: 'report.agv'.tr(),
      iconCodePoint: Icons.precision_manufacturing_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'report',
      route: RouteNames.reportAGVdepart,
      imageUrl: AppImages.report_agv,
    ),
  ];

  static final List<AppItemModel> weekplan = [
    /// ================= WEEK PLAN =================
    AppItemModel(
      id: 'week_plan:personal',
      name: 'week_plan.personal'.tr(),
      iconCodePoint: Icons.person_outline.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'week_plan',
      route: '/week-plan/personal',
    ),

    AppItemModel(
      id: 'week_plan:summary',
      name: 'week_plan.summary'.tr(),
      iconCodePoint: Icons.view_list_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'week_plan',
      route: '/week-plan/summary',
    ),
  ];
  static final List<AppItemModel> all = [
    ...regwork,
    ...weekplan,
    ...reggeneral,
    ...summaryword,
    ...generalforms,
    ...reports,
  ];

  /// 🔍 Lookup theo id (quan trọng cho favorites)
  static AppItemModel? byId(String id) {
    try {
      return all.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  /// 📂 Lấy theo tab
  static List<AppItemModel> byTab(String tab) {
    return all.where((e) => e.tab == tab).toList();
  }
}
