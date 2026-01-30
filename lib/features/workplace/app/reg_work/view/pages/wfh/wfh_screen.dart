import 'package:flutter/material.dart';import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/utils/card/index.dart';

class WfhScreen extends StatelessWidget {
  const WfhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'reg_work.wfh'.tr(), // key WFH
          style: AppStyles.headingTitle2,
        ),
        actions: const [
          Icon(Icons.search_outlined),
          SizedBox(width: 8),
        ],
      ),

      /// ===== FAB: tạo đơn WFH =====
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/regwork/wfh/add');
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

      /// ===== DANH SÁCH ĐƠN WFH =====
      body: AppCardList(
        children: [
          /// ===== PENDING =====
          AppCardItem(
            status: ApprovalStatus.pending,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Làm việc tại nhà',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 27/01/2026'),
                SizedBox(height: 4),
                Text('Thời gian: Cả ngày'),
                SizedBox(height: 4),
                Text('Lý do: Có việc cá nhân'),
              ],
            ),
            onEdit: () {
              debugPrint('Edit pending WFH');
            },
          ),

          /// ===== APPROVED =====
          AppCardItem(
            status: ApprovalStatus.approved,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Làm việc tại nhà',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 20/01/2026'),
                SizedBox(height: 4),
                Text('Thời gian: Sáng'),
              ],
            ),
            onView: () {
              debugPrint('View approved WFH');
            },
          ),

          /// ===== CANCELLED =====
          AppCardItem(
            status: ApprovalStatus.cancelled,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Làm việc tại nhà',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 12/01/2026'),
                SizedBox(height: 4),
                Text('Thời gian: Chiều'),
              ],
            ),
            onView: () {
              debugPrint('Cancelled WFH');
            },
          ),

          /// ===== PREPARE / DRAFT =====
          AppCardItem(
            status: ApprovalStatus.prepare,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Làm việc tại nhà',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 05/02/2026'),
                SizedBox(height: 4),
                Text('Thời gian: Cả ngày'),
              ],
            ),
            onTap: () =>
                context.push('/regwork/wfh/detail'),
          ),
        ],
      ),
    );
  }
}
