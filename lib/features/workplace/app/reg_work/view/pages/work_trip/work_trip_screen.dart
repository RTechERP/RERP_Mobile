import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/utils/card/index.dart';

class WorkTripScreen extends StatelessWidget {
  const WorkTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'reg_work.work_trip'.tr(), // 🔑 key WORK TRIP
          style: AppStyles.headingTitle2,
        ),
        actions: const [
          Icon(Icons.search_outlined),
          SizedBox(width: 8),
        ],
      ),

      /// ===== FAB: tạo đơn công tác =====
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/regwork/work_trip/add');
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

      /// ===== DANH SÁCH ĐƠN CÔNG TÁC =====
      body: AppCardList(
        children: [
          /// ===== PENDING =====
          AppCardItem(
            status: ApprovalStatus.pending,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Công tác',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Địa điểm: Hà Nội → TP.HCM'),
                SizedBox(height: 4),
                Text('Thời gian: 27/01/2026 - 29/01/2026'),
                SizedBox(height: 4),
                Text('Lý do: Làm việc với đối tác'),
              ],
            ),
            onEdit: () {
              debugPrint('Edit pending WorkTrip');
            },
          ),

          /// ===== APPROVED =====
          AppCardItem(
            status: ApprovalStatus.approved,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Công tác',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Địa điểm: Đà Nẵng'),
                SizedBox(height: 4),
                Text('Thời gian: 20/01/2026 - 22/01/2026'),
              ],
            ),
            onView: () {
              debugPrint('View approved WorkTrip');
            },
          ),

          /// ===== CANCELLED =====
          AppCardItem(
            status: ApprovalStatus.cancelled,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Công tác',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Địa điểm: Hải Phòng'),
                SizedBox(height: 4),
                Text('Thời gian: 12/01/2026 - 13/01/2026'),
              ],
            ),
            onView: () {
              debugPrint('Cancelled WorkTrip');
            },
          ),

          /// ===== PREPARE / DRAFT =====
          AppCardItem(
            status: ApprovalStatus.prepare,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loại: Công tác',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Địa điểm: Cần Thơ'),
                SizedBox(height: 4),
                Text('Thời gian: 05/02/2026 - 06/02/2026'),
              ],
            ),
            onTap: () =>
                context.push('/regwork/work_trip/detail'),
          ),
        ],
      ),
    );
  }
}