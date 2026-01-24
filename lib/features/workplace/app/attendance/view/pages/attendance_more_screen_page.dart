import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";

import "../../../../../../base/widgets/base_scaffold.dart";
import "../../../../../../common/utils/navigation/navigation_utils.dart";

class AttendanceMoreScreenPage extends StatelessWidget {
  const AttendanceMoreScreenPage({super.key});

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
        title: Text('attendance.more'.tr()),
        centerTitle: true,
      ),
      body:  Center(
        child: Text('attendance.more'.tr()),
      ),
    );
  }
}
