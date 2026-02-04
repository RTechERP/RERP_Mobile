import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../routes/route_names.dart';

class HrLxcpScreen extends StatelessWidget {
  const HrLxcpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('report.lxcp'.tr(), style: AppStyles.headingTitle2),
        onBackTap: () => context.pop(), // 👈 đảm bảo pop đúng GoRouter
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(RouteNames.reportHRAdd, extra: HrType.lxcp);
        },
        backgroundColor: AppColors.primaryERP,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: Center(child: Text('Hello')),
    );
  }
}
