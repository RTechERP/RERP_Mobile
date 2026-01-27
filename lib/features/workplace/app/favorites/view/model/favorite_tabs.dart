// favorites_tabs.dart
import 'package:easy_localization/easy_localization.dart';

enum AppTab {
  all,
  regWork,
  summaryWork,
  regGeneral,
  weekPlan,
  report,
  generalForms,

}

extension AppTabX on AppTab {
  String get key {
    switch (this) {
      case AppTab.regWork:
        return 'applications.reg_work';
      case AppTab.summaryWork:
        return 'applications.summary_work';
      case AppTab.regGeneral:
        return 'applications.reg_general';
      case AppTab.weekPlan:
        return 'applications.week_plan';
      case AppTab.report:
        return 'applications.report';
        case AppTab.generalForms:
        return 'applications.general_forms';
      case AppTab.all:
        return 'applications.all';
    }
  }

  String get label {
    switch (this) {
      case AppTab.all:
        return 'applications.all'.tr();
      case AppTab.regWork:
        return 'applications.reg_work'.tr();
      case AppTab.summaryWork:
        return 'applications.summary_work'.tr();
      case AppTab.regGeneral:
        return 'applications.reg_general'.tr();
      case AppTab.weekPlan:
        return 'applications.week_plan'.tr();
        case AppTab.report:
        return 'applications.report'.tr();
        case AppTab.generalForms:
        return 'applications.general_forms'.tr();

    }
  }
}

class FavoriteTabs {
  static const values = [
    AppTab.all,
    AppTab.regWork,
    AppTab.summaryWork,
    AppTab.regGeneral,
    AppTab.weekPlan,
    AppTab.report,
    AppTab.generalForms,
  ];
}
