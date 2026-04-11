// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Định nghĩa các tab trong màn favorites - all, reg_work, summary_work, reg_general, week_plan, report, general_forms

import 'package:easy_localization/easy_localization.dart';

/// Các tab trong màn favorites.
///
/// Tab khớp với [AppItemModel.tab] để filter items theo từng nhóm.
/// [AppTab.all] hiển thị tất cả items.
enum AppTab {
  all,
  regWork,
  // summaryWork,
  regGeneral,
  // weekPlan,
  // report,
  // generalForms,
}

extension AppTabX on AppTab {
  /// Key dùng để lookup translation và filter items.
  String get key {
    switch (this) {
      case AppTab.regWork:
        return 'applications.reg_work';
      // case AppTab.summaryWork:
      //   return 'applications.summary_work';
      case AppTab.regGeneral:
        return 'applications.reg_general';
      // case AppTab.weekPlan:
      //   return 'applications.week_plan';
      // case AppTab.report:
      //   return 'applications.report';
      // case AppTab.generalForms:
      //   return 'applications.general_forms';
      case AppTab.all:
        return 'applications.all';
    }
  }

  /// Label hiển thị (translated).
  String get label {
    switch (this) {
      case AppTab.all:
        return 'applications.all'.tr();
      case AppTab.regWork:
        return 'applications.reg_work'.tr();
      // case AppTab.summaryWork:
      //   return 'applications.summary_work'.tr();
      case AppTab.regGeneral:
        return 'applications.reg_general'.tr();
      // case AppTab.weekPlan:
      //   return 'applications.week_plan'.tr();
      // case AppTab.report:
      //   return 'applications.report'.tr();
      // case AppTab.generalForms:
      //   return 'applications.general_forms'.tr();
    }
  }

  /// Tab name dùng để filter items theo [AppItemModel.tab].
  String? get filterTabName {
    switch (this) {
      case AppTab.all:
        return null;
      case AppTab.regWork:
        return 'reg_work';
      // case AppTab.summaryWork:
      //   return 'summary_work';
      case AppTab.regGeneral:
        return 'reg_general';
      // case AppTab.weekPlan:
      //   return 'week_plan';
      // case AppTab.report:
      //   return 'report';
      // case AppTab.generalForms:
      //   return 'general_forms';
    }
  }
}

class FavoriteTabs {
  static const values = [
    AppTab.all,
    AppTab.regWork,
    // AppTab.summaryWork,
    AppTab.regGeneral,
    // AppTab.weekPlan,
    // AppTab.report,
    // AppTab.generalForms,
  ];
}
