import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../routes/route_names.dart';
import '../bloc/hr_bloc.dart';

class HrHclxDetailScreen extends StatefulWidget {
  const HrHclxDetailScreen({super.key});

  @override
  State<HrHclxDetailScreen> createState() => _HrHclxDetailScreenState();
}

class _HrHclxDetailScreenState
    extends BaseState<HrHclxDetailScreen, HrEvent, HrState, HrBloc> {
  int? _dailyId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra;

      if (extra is int) {
        _dailyId = extra;
        bloc.add(HrEvent.selectLXCPReport(dailyID: _dailyId!));
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

          /// Ưu tiên check position trước
          if (state.positionId == 6) {
            final detail = state.selectedLXCPReportDetail;
            if (detail == null) return _buildEmpty();
            return _buildLxForm(detail);
          }

          if (state.positionId == 72) {
            final detail = state.selectedLXCPReportDetail;
            if (detail == null) return _buildEmpty();
            return _buildCpForm(detail);
          }

          /// nếu position chưa load
          if (state.positionId == null) {
            return const Center(child: CircularProgressIndicator());
          }

          /// fallback
          return _buildEmpty();

        },
      ),
    );
  }

  Widget _buildEmpty() {
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
  Widget _buildLxForm(detail) {
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
                      'Báo cáo công việc ngày ${DateFormat('dd/MM/yyyy').format(
                        DateTime.tryParse(detail.dateReport ?? '') ?? DateTime.now(),
                      )}',
                    ),
                    const Divider(height: 20),

                    _row('* Số KM:', (detail.kmNumber ?? 0).toInt().toString()),
                    _row(
                      '* Số cuốc muộn so với Lịch:',
                      (detail.totalLate ?? 0).toString(),
                    ),
                    _row(
                      '* Số phút muộn:',
                      (detail.totalTimeLate ?? 0).toInt().toString(),
                    ),

                    const Divider(height: 20),

                    _info('Lý do muộn:', '${detail.reasonLate}'),
                    _info('Tình trạng xe:', '${detail.statusVehicle}'),
                    _info('Kiến nghị/Đề xuất:', '${detail.propose}'),
                  ],
                ),
              ),
            ),
          ),
        ),
        _buildEditButton(),
      ],
    );
  }

  Widget _buildCpForm(detail) {
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
                      'Báo cáo công việc ngày ${DateFormat('dd/MM/yyyy').format(
                        DateTime.tryParse(detail.dateReport ?? '') ?? DateTime.now(),
                      )}',
                    ),

                    const Divider(height: 20),

                    _info(
                      'Kết quả thực hiện:',
                      (detail.quantity ?? 0).toInt().toString(),
                    ),

                    _info(
                      'Thời gian thực hiện:',
                      (detail.timeActual ?? 0).toInt().toString(),
                    ),

                    _info(
                      'Năng suất thực tế (Phút/Đơn vị sản phẩm):',
                      (detail.performanceActual ?? 0).toInt().toString(),
                    ),

                    _info(
                      'Năng suất trung bình/Năng suất thực tế:',
                      (detail.percentage ?? 0).toInt().toString(),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        _buildEditButton(),
      ],
    );
  }

  Widget _buildEditButton() {
    return Padding(
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
            RouteNames.reportHRLxcpEdit,
            extra: {
              'dailyId': _dailyId,
              'positionId': bloc.state.positionId,
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

  static Widget _info(String label, String? value) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width:150,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(child: Text(value?.isNotEmpty == true ? value! : '-')),
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
