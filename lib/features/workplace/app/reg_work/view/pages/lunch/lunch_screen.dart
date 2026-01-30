import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/utils/card/index.dart';

class LunchScreen extends StatelessWidget {
  const LunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('reg_work.lunch'.tr(), style: AppStyles.headingTitle2),
        actions: const [Icon(Icons.search_outlined), SizedBox(width: 8)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/regwork/lunch/add');
        },
        backgroundColor: AppColors.primaryERP,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),

      body: AppCardList(
        children: [
          AppCardItem(
            status: ApprovalStatus.pending,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Mã nhân viên: 000000',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text('Ngày: 27/01/2026'),
                SizedBox(height: 4),
                Text('Số lượng: 5'),
              ],
            ),
            onEdit: () {
              print('Edit pending item');
            },
          ),

          AppCardItem(
            status: ApprovalStatus.approved,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Mã nhân viên: 000000',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text('Ngày: 27/01/2026'),

                SizedBox(height: 4),
                Text('Số lượng: 5'),
              ],
            ),
            onView: () {
              print('View approved item');
            },
          ),

          AppCardItem(
            status: ApprovalStatus.cancelled,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Mã nhân viên: 000000',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text('Ngày: 27/01/2026'),

                SizedBox(height: 4),
                Text('Số lượng: 5'),
              ],
            ),
            onView: () {
              print('Cancelled item');
            },
          ),


          AppCardItem(
            status: ApprovalStatus.prepare,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Mã nhân viên: 000000',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text('Ngày: 27/01/2026'),
                SizedBox(height: 4),
                Text('Số lượng: 5'),
              ],
            ),
            onTap: () => context.push('/regwork/lunch/detail'),
          ),
        ],
      ),
    );
  }
}