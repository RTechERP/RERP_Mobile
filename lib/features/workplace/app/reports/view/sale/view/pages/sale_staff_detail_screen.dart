import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../routes/route_names.dart';
import '../bloc/sale_bloc.dart';

class SaleStaffDetailScreen extends StatefulWidget {
  const SaleStaffDetailScreen({super.key});

  @override
  State<SaleStaffDetailScreen> createState() => _SaleStaffDetailScreenState();
}

class _SaleStaffDetailScreenState
    extends BaseState<SaleStaffDetailScreen, SaleEvent, SaleState, SaleBloc> {
  int? _dailyId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra;

      if (extra is int) {
        _dailyId = extra;
        bloc.add(SaleEvent.selectReport(dailyID: _dailyId!));
      }
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(title: const Text('Chi tiết báo cáo')),
      body: BlocBuilder<SaleBloc, SaleState>(
        builder: (context, state) {
          if (state.isLoadingDetail) {
            return const Center(child: CircularProgressIndicator());
          }

          final detail = state.selectedReportDetail;

          if (detail == null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.missing, width: 320),
                  const SizedBox(height: 12),
                  const Text('Không có báo cáo'),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _h(
                            'Báo cáo công việc ngày ${DateFormat('dd/MM/yyyy').format(DateTime.parse(detail.dateStart.toString()))}',
                          ),
                          _h(
                            'Báo cáo công việc ngày ${DateFormat('dd/MM/yyyy').format(DateTime.parse(detail.dateStart.toString()))}',
                          ),
                          const Divider(height: 20),

                          _row('* Nội dung công việc:', detail.content),
                          _row('* Kết quả công việc:', detail.result),
                          _row(
                            '* Kế hoạch ngày tiếp theo:',
                            detail.planNext,
                          ),

                          const Divider(height: 20),


                          const Divider(height: 20),

                          _row('* Tồn đọng:', detail.problemBacklog),
                          _row('* Ghi chú:', detail.note),
                          _row('* Vấn đề phát sinh:', detail.note),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// ===== BUTTON GROUP =====
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryERP,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () async {
                    final result = await context.push(
                      RouteNames.reportADdepartEdit,
                      extra: _dailyId,
                    );

                    if (result == true && context.mounted) {
                      context.pop(true);
                    }
                  },
                  child: const Text(
                    'Sửa',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget _row(String title, String? value) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _h(title),
        const SizedBox(height: 2),
        _p(value?.isNotEmpty == true ? value! : '- Không có'),
      ],
    ),
  );


  static Widget _h(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
  );

  static Widget _p(String text) => Padding(
    padding: const EdgeInsets.only(left: 8, bottom: 4),
    child: Text(text),
  );
}
