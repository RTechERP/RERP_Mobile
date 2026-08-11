import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';

class WarehouseTestScreen extends StatelessWidget {
  final String areaId;
  final String areaName;

  const WarehouseTestScreen({
    super.key,
    required this.areaId,
    required this.areaName,
  });

  String get title => '${'warehouse.test'.tr()} - $areaName';

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          title,
          style: AppStyles.headingTitle2,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warehouse_outlined,
                size: 64,
                color: AppColors.secondaryColor,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: AppStyles.body1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Area ID: $areaId',
                style: AppStyles.body2.copyWith(
                  color: AppColors.secondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
