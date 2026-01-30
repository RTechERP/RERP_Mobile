import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/utils/card/index.dart';

class LeaveScreenPage extends StatelessWidget {
  const LeaveScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'reg_work.leave'.tr(),
          style: AppStyles.headingTitle2,
        ),
        actions: const [
          Icon(Icons.search_outlined),
          SizedBox(width: 8),
        ],
      ),

      /// ===== FAB: tạo đơn nghỉ phép =====
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/regwork/leave/add');
        },
        backgroundColor: AppColors.primaryERP,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),

      /// ===== DANH SÁCH ĐƠN =====
      body: AppCardList(
        children: [
          /// ===== PENDING =====
          AppCardItem(
            status: ApprovalStatus.pending,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại nghỉ: Nghỉ phép năm',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Từ ngày: 27/01/2026'),
                SizedBox(height: 4),
                Text('Đến ngày: 28/01/2026'),
                SizedBox(height: 4),
                Text('Số ngày: 2'),
              ],
            ),
            onEdit: () {
              debugPrint('Edit pending leave');
            },
          ),

          /// ===== APPROVED =====
          AppCardItem(
            status: ApprovalStatus.approved,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại nghỉ: Nghỉ không lương',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Từ ngày: 15/01/2026'),
                SizedBox(height: 4),
                Text('Đến ngày: 15/01/2026'),
                SizedBox(height: 4),
                Text('Số ngày: 1'),
              ],
            ),
            onView: () {
              debugPrint('View approved leave');
            },
          ),

          /// ===== CANCELLED =====
          AppCardItem(
            status: ApprovalStatus.cancelled,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại nghỉ: Nghỉ bệnh',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 10/01/2026'),
                SizedBox(height: 4),
                Text('Số ngày: 1'),
              ],
            ),
            onView: () {
              debugPrint('Cancelled leave');
            },
          ),

          /// ===== PREPARE / DRAFT =====
          AppCardItem(
            status: ApprovalStatus.prepare,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại nghỉ: Nghỉ phép năm',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Từ ngày: 05/02/2026'),
                SizedBox(height: 4),
                Text('Đến ngày: 06/02/2026'),
                SizedBox(height: 4),
                Text('Số ngày: 2'),
              ],
            ),
            onTap: () => context.push('/regwork/leave/detail'),
          ),
        ],
      ),
    );
  }
}
