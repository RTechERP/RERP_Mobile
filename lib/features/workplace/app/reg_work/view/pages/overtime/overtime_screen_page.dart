import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/utils/card/index.dart';

class OvertimeScreenPage extends StatelessWidget {
  const OvertimeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'reg_work.overtime'.tr(),
          style: AppStyles.headingTitle2,
        ),
        actions: const [
          Icon(Icons.search_outlined),
          SizedBox(width: 8),
        ],
      ),

      /// ===== FAB: tạo đơn tăng ca =====
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/regwork/overtime/add');
        },
        backgroundColor: AppColors.primaryERP,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),

      /// ===== DANH SÁCH ĐƠN TĂNG CA =====
      body: AppCardList(
        children: [
          /// ===== PENDING =====
          AppCardItem(
            status: ApprovalStatus.pending,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại tăng ca: Ngày thường',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 27/01/2026'),
                SizedBox(height: 4),
                Text('Thời gian: 18:00 - 21:00'),
                SizedBox(height: 4),
                Text('Số giờ: 3'),
              ],
            ),
            onEdit: () {
              debugPrint('Edit pending overtime');
            },
          ),

          /// ===== APPROVED =====
          AppCardItem(
            status: ApprovalStatus.approved,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại tăng ca: Cuối tuần',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 20/01/2026'),
                SizedBox(height: 4),
                Text('Thời gian: 09:00 - 12:00'),
                SizedBox(height: 4),
                Text('Số giờ: 3'),
              ],
            ),
            onView: () {
              debugPrint('View approved overtime');
            },
          ),

          /// ===== CANCELLED =====
          AppCardItem(
            status: ApprovalStatus.cancelled,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại tăng ca: Ngày lễ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 12/01/2026'),
                SizedBox(height: 4),
                Text('Thời gian: 18:30 - 22:00'),
                SizedBox(height: 4),
                Text('Số giờ: 3.5'),
              ],
            ),
            onView: () {
              debugPrint('Cancelled overtime');
            },
          ),

          /// ===== PREPARE / DRAFT =====
          AppCardItem(
            status: ApprovalStatus.prepare,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại tăng ca: Ngày thường',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 05/02/2026'),
                SizedBox(height: 4),
                Text('Thời gian: 18:00 - 20:00'),
                SizedBox(height: 4),
                Text('Số giờ: 2'),
              ],
            ),
            onTap: () =>
                context.push('/regwork/overtime/detail'),
          ),
        ],
      ),
    );
  }
}
