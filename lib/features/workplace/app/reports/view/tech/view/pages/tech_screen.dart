import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/card/index.dart';
class TechScreen extends StatelessWidget {
  const TechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('report.tech'.tr(), style: AppStyles.headingTitle2),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/report/tech/add');
        },
        backgroundColor: AppColors.primaryERP,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: AppCardList(
        children: [
          AppCardReport(
            category: 'RTC 02.26.002_2',
            project: 'RTC1.26.002 - R-ERP Mobile',
            time: DateTime.now(),
            progress: 0.25,
            onTap: () {
              context.push('/report/tech/detail');
          },
          ),
          AppCardReport(
            category: 'RTC 02.26.002_2',
            project: 'RTC1.26.002 - R-ERP Mobile',
            time: DateTime.now(),
            progress: 0.25,
            onTap: () {
              context.push('/report/tech/detail');
            },

          ),
        ],
      ),
    );
  }
}
