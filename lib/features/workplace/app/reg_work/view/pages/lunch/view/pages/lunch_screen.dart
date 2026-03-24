import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/utils/card/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../bloc/lunch_bloc.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({super.key});

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState
    extends BaseState<LunchScreen, LunchEvent, LunchState, LunchBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const LunchEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<LunchBloc, LunchState>(
      listenWhen: (prev, curr) =>
          prev.deleteSuccess != curr.deleteSuccess ||
          (curr.message != null &&
              curr.message!.isNotEmpty &&
              prev.message != curr.message &&
              !curr.isDeleting),
      listener: (context, state) {
        if (state.deleteSuccess) {
          showMessage(
            context,
            'Hủy đặt cơm thành công',
            type: SnackBarType.success,
          );
        }
        if (state.message != null &&
            state.message!.isNotEmpty &&
            !state.isDeleting) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BaseScaffold(
        appBar: AppBarCommon(
          title: Text('reg_work.lunch'.tr(), style: AppStyles.headingTitle2),
          actions: const [Icon(Icons.search_outlined), SizedBox(width: 8)],
          onBackTap: () => context.pop(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(RouteNames.lunchAdd);
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
                  Text(
                    'Mã nhân viên: 000000',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
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
                  Text(
                    'Mã nhân viên: 000000',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
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
                  Text(
                    'Mã nhân viên: 000000',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
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
                  Text(
                    'Mã nhân viên: 000000',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
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
      ),
    );
  }
}
