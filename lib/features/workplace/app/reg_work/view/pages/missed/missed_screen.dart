import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/utils/card/index.dart';

class MissedScreen extends StatelessWidget {
  const MissedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'Quên chấm công',
          style: AppStyles.headingTitle2,
        ),
        actions: const [
          Icon(Icons.search_outlined),
          SizedBox(width: 8),
        ],
      ),

      /// FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/regwork/missed/add'),
        backgroundColor: AppColors.primaryERP,
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: AppCardList(
        children: [
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
            onEdit: () {},
          ),

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
            onView: () {},
          ),

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
            onTap: () => context.push('/regwork/missed/detail'),
          ),
        ],
      ),
    );
  }
}
