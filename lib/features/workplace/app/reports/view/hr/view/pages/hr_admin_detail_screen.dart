import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../routes/route_names.dart';
import '../bloc/hr_bloc.dart';

class HrAdminDetailScreen extends StatefulWidget {
  const HrAdminDetailScreen({super.key});

  @override
  State<HrAdminDetailScreen> createState() => _HrAdminDetailScreenState();
}

class _HrAdminDetailScreenState
    extends BaseState<HrAdminDetailScreen, HrEvent, HrState, HrBloc> {
  int? _dailyId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra;

      if (extra is int) {
        _dailyId = extra;
        bloc.add(HrEvent.selectReport(dailyID: _dailyId!));
      }
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(title: const Text('Chi tiết báo cáo')),
      body: BlocBuilder<HrBloc, HrState>(
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Card(
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
                                'Báo cáo công việc ngày ${DateTime.tryParse(detail.dateReport) != null ? DateFormat('dd/MM/yyyy').format(DateTime.parse(detail.dateReport)) : '-'}',
                              ),
                              const Divider(height: 20),

                              _row('* Nội dung công việc:', detail.content),
                              _row('* Kết quả công việc:', detail.results),
                              _row(
                                '* Kế hoạch ngày tiếp theo:',
                                detail.planNextDay,
                              ),

                              const Divider(height: 20),

                              _row('* Đề xuất cải tiến:', detail.note),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      RouteNames.reportHREdit,
                      extra: {
                        'dailyId': _dailyId,
                        'type': DepartmentType.hr_admin,
                      },
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
