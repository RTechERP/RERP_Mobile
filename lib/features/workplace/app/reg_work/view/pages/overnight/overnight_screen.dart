import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/utils/card/index.dart';

class OvernightScreen extends StatelessWidget {
  const OvernightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'reg_work.overnight'.tr(), // hoặc "Đăng ký qua đêm"
          style: AppStyles.headingTitle2,
        ),
        actions: const [
          Icon(Icons.search_outlined),
          SizedBox(width: 8),
        ],
      ),

      /// ===== FAB: tạo đơn qua đêm =====
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/regwork/overnight/add');
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

      /// ===== DANH SÁCH ĐƠN QUA ĐÊM =====
      body: AppCardList(
        children: [
          /// ===== PENDING =====
          AppCardItem(
            status: ApprovalStatus.pending,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Ca qua đêm',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 27/01/2026'),
                SizedBox(height: 4),
                Text('Thời gian: 22:00 - 06:00'),
                SizedBox(height: 4),
                Text('Tổng giờ: 8'),
              ],
            ),
            onEdit: () {
              debugPrint('Edit pending overnight');
            },
          ),

          /// ===== APPROVED =====
          AppCardItem(
            status: ApprovalStatus.approved,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Ca qua đêm',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 20/01/2026'),
                SizedBox(height: 4),
                Text('Thời gian: 21:30 - 05:30'),
                SizedBox(height: 4),
                Text('Tổng giờ: 8'),
              ],
            ),
            onView: () {
              debugPrint('View approved overnight');
            },
          ),

          /// ===== CANCELLED =====
          AppCardItem(
            status: ApprovalStatus.cancelled,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Ca qua đêm',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 12/01/2026'),
                SizedBox(height: 4),
                Text('Thời gian: 23:00 - 04:00'),
                SizedBox(height: 4),
                Text('Tổng giờ: 5'),
              ],
            ),
            onView: () {
              debugPrint('Cancelled overnight');
            },
          ),

          /// ===== PREPARE / DRAFT =====
          AppCardItem(
            status: ApprovalStatus.prepare,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Ca qua đêm',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Ngày: 05/02/2026'),
                SizedBox(height: 4),
                Text('Thời gian: 22:00 - 02:00'),
                SizedBox(height: 4),
                Text('Tổng giờ: 4'),
              ],
            ),
            onTap: () =>
                context.push('/regwork/overnight/detail'),
          ),
        ],
      ),
    );
  }
}