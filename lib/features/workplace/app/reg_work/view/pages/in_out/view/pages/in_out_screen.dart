import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/utils/card/index.dart';
import '../bloc/in_out_bloc.dart';

class InOutScreenPage extends StatefulWidget {
  const InOutScreenPage({super.key});

  @override
  State<InOutScreenPage> createState() => _InOutScreenPageState();
}

class _InOutScreenPageState extends BaseState<InOutScreenPage, InOutEvent, InOutState, InOutBloc> {
  ApprovalStatus _mapApprovalStatus(bool? isApproved) {
    if (isApproved == true) return ApprovalStatus.approved;
    if (isApproved == false) return ApprovalStatus.pending;
    return ApprovalStatus.prepare;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<InOutBloc>().add(const InOutEvent.init());
    });
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '--/--/----';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  String _formatTime(DateTime? date) {
    if (date == null) return '--:--';
    return DateFormat('HH:mm').format(date);
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'reg_work.in_out'.tr(),
          style: AppStyles.headingTitle2,
        ),
        actions: const [
          Icon(Icons.search_outlined),
          SizedBox(width: 8),
        ],
        onBackTap: () => context.pop(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/regwork/in_out/add');
        },
        backgroundColor: AppColors.primaryERP,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: BlocBuilder<InOutBloc, InOutState>(
        builder: (context, state) {
          if (state.status == BaseStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == BaseStateStatus.failed) {
            return const Center(child: Text('Load dữ liệu thất bại'));
          }
          if (state.inOut.isEmpty) {
            return const Center(child: Text('Chưa có dữ liệu in/out'));
          }

          final listWidgets = state.inOut.map((item) {
            final status = _mapApprovalStatus(item.isApproved);
            return AppCardItem(
              status: status,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Loại: ${item.typeText ?? '--'}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text('Ngày: ${_formatDate(item.dateStart)}'),
                  const SizedBox(height: 4),
                  Text(
                    'Giờ: ${_formatTime(item.dateStart)} - ${_formatTime(item.dateEnd)}',
                  ),
                  const SizedBox(height: 4),
                  if ((item.reason ?? '').isNotEmpty) ...[
                    Text('Lý do: ${item.reason}'),
                  ],
                ],
              ),
              onTap: () async {
                final reload = await context.push<bool?>(
                  '/regwork/in_out/detail',
                  extra: item,
                );
                if (reload == true && mounted) {
                  context.read<InOutBloc>().add(const InOutEvent.init());
                }
              },
            );
          }).toList();

          return AppCardList(
            children: [
              // RefreshIndicator không phù hợp cấu trúc AppCardList hiện tại,
              // nên chỉ hiển thị list theo state.
              ...listWidgets,
            ],
          );
        },
      ),
    );
  }
}
