import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../bloc/salary_bloc.dart';
import '../widgets/finger_print_summary_card.dart';
import '../widgets/finger_print_day_row.dart';
import '../widgets/finger_print_month_picker.dart';

class FingerPrintScreen extends StatefulWidget {
  const FingerPrintScreen({super.key});

  @override
  State<FingerPrintScreen> createState() => _FingerPrintScreenState();
}

class _FingerPrintScreenState
    extends BaseState<FingerPrintScreen, SalaryEvent, SalaryState, SalaryBloc> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(const SalaryEvent.init());
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Vân tay'),
        onBackTap: () => onBack(context),
      ),
      body: BlocBuilder<SalaryBloc, SalaryState>(
        builder: (context, state) {
          if (state.status == BaseStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildBody(context, state);
        },
      ),
    );
  }

  //---(_Body)---//
  Widget _buildBody(BuildContext context, SalaryState state) {
    final details = state.fingerDetails;

    return RefreshIndicator(
      onRefresh: () async => bloc.add(const SalaryEvent.refresh()),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildMonthBar(context, state)),
          SliverToBoxAdapter(child: _buildSummaryCard(context, state)),
          if (details.isEmpty)
            SliverFillRemaining(hasScrollBody: false, child: _buildEmptyState())
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    FingerPrintDayRow(detail: details[index], index: index),
                childCount: details.length,
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
        ],
      ),
    );
  }

  //---(_Month Bar)---//
  Widget _buildMonthBar(BuildContext context, SalaryState state) {
    final monthLabel = state.selectedMonth != null
        ? DateFormat('MM/yyyy', 'vi_VN').format(state.selectedMonth!)
        : 'Chọn tháng';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => FingerPrintMonthPicker.show(
          context,
          selectedMonth: state.selectedMonth,
          onApply: (month) => bloc.add(SalaryEvent.changeMonth(month)),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month,
                color: AppColors.primaryERP,
                size: 22,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tháng',
                      style: AppStyles.caption2.copyWith(color: AppColors.gray),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      monthLabel,
                      style: AppStyles.subtitle2.copyWith(
                        color: AppColors.heading,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 12,
              //     vertical: 6,
              //   ),
              //   decoration: BoxDecoration(
              //     color: AppColors.primaryERP.withValues(alpha: 0.1),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Text(
              //     '$totalDay ngày',
              //     style: AppStyles.body2.copyWith(
              //       color: AppColors.primaryERP,
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  //---(_Summary)---//
  Widget _buildSummaryCard(BuildContext context, SalaryState state) {
    final data = state.fingerData;
    final details = state.fingerDetails;

    final lateCount = data?.totalLate ?? 0;
    final earlyCount = data?.totalEarly ?? 0;
    final overtimeCount = details.where((d) => d.overtime == true).length;
    final businessCount = details.where((d) => d.bussiness == true).length;
    final registeredCount =
        (data?.totalRegisterCheckin ?? 0) + (data?.totalRegisterCheckout ?? 0);
    final leaveCount = details.where((d) => d.onLeave == true).length;
    final wfhCount = details.where((d) => d.wfh == true).length;
    final noFingerCount = details.where((d) => d.noFingerprint == true).length;

    final problemDays = details.where((d) {
      return d.isLate == true ||
          d.isEarly == true ||
          d.overtime == true ||
          d.bussiness == true ||
          d.isLateRegister == true ||
          d.isEarlyRegister == true ||
          d.onLeave == true ||
          d.wfh == true ||
          d.noFingerprint == true ||
          d.isNoFinger == 1 ||
          d.isNoCheckIn == 1 ||
          d.isNoCheckOut == 1;
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      child: FingerPrintSummaryCard(
        items: [
          FingerPrintSummaryItem(
            'Đi muộn', lateCount, AppColors.alert, Icons.arrow_upward,
          ),
          FingerPrintSummaryItem(
            'Về sớm', earlyCount, AppColors.warning, Icons.arrow_downward,
          ),
          FingerPrintSummaryItem(
            'Làm thêm', overtimeCount, AppColors.stateInfoColor, Icons.access_time,
          ),
          FingerPrintSummaryItem(
            'Công tác', businessCount, AppColors.secondaryERP, Icons.directions_car,
          ),
          FingerPrintSummaryItem(
            'Khai báo quên', registeredCount, AppColors.primaryERP, Icons.warning_amber,
          ),
          FingerPrintSummaryItem(
            'Nghỉ', leaveCount, AppColors.gray, Icons.event_busy,
          ),
          FingerPrintSummaryItem(
            'WFH', wfhCount, AppColors.stateSuccessColor, Icons.home_work,
          ),
          FingerPrintSummaryItem(
            'Quên CC', noFingerCount, AppColors.alert, Icons.fingerprint,
          ),
        ],
        problemDays: problemDays,
      ),
    );
  }

  //---(_Empty)---//
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fingerprint,
              size: 64,
              color: AppColors.gray.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'Không có dữ liệu',
              style: AppStyles.body2.copyWith(color: AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }
}
