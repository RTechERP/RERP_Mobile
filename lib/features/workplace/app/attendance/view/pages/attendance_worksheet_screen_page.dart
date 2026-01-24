import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:rtc_erp/base/widgets/base_scaffold.dart";

import "../../../../../../common/utils/navigation/navigation_utils.dart";

class AttandanceWorkSheetScreenPage extends StatelessWidget {
  const AttandanceWorkSheetScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            onBack(context);
          },
        ),
        title: Text('attendance.worksheet'.tr()),
        centerTitle: true,
      ),
      body:  Center(
        child: Text('attendance.worksheet'.tr()),
      ),
    );
  }
}
