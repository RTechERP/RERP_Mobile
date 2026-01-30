import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/utils/card/index.dart';

class InOutScreenPage extends StatelessWidget {
  const InOutScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'reg_work.in_out'.tr(), // key mới
          style: AppStyles.headingTitle2,
        ),
        actions: const [
          Icon(Icons.search_outlined),
          SizedBox(width: 8),
        ],
      ),

      /// ===== FAB: tạo đơn ra/vào =====
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/regwork/in_out/add');
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

      /// ===== DANH SÁCH ĐƠN RA/VÀO =====
      body: AppCardList(
        children: [
          /// ===== PENDING =====
          AppCardItem(
            status: ApprovalStatus.pending,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Quên check-in',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 27/01/2026'),
                SizedBox(height: 4),
                Text('Giờ: 08:05'),
                SizedBox(height: 4),
                Text('Lý do: Quên bấm máy'),
              ],
            ),
            onEdit: () {
              debugPrint('Edit pending in-out');
            },
          ),

          /// ===== APPROVED =====
          AppCardItem(
            status: ApprovalStatus.approved,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Quên check-out',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 20/01/2026'),
                SizedBox(height: 4),
                Text('Giờ: 17:45'),
              ],
            ),
            onView: () {
              debugPrint('View approved in-out');
            },
          ),

          /// ===== CANCELLED =====
          AppCardItem(
            status: ApprovalStatus.cancelled,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Điều chỉnh giờ vào',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 12/01/2026'),
                SizedBox(height: 4),
                Text('Giờ: 08:30'),
              ],
            ),
            onView: () {
              debugPrint('Cancelled in-out');
            },
          ),

          /// ===== PREPARE / DRAFT =====
          AppCardItem(
            status: ApprovalStatus.prepare,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Quên check-in',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 05/02/2026'),
                SizedBox(height: 4),
                Text('Giờ: 08:10'),
              ],
            ),
            onTap: () =>
                context.push('/regwork/in_out/detail'),
          ),
        ],
      ),
    );
  }
}
