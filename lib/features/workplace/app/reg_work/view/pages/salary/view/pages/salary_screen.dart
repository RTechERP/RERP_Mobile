import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../bloc/salary_bloc.dart';
import '../widgets/salary_allowance_card.dart';
import '../widgets/salary_deductions_card.dart';
import '../widgets/salary_month_picker.dart';
import '../widgets/salary_net_salary_card.dart';
import '../widgets/salary_note_card.dart';
import '../widgets/salary_other_additions_card.dart';
import '../widgets/salary_overtime_card.dart';
import '../widgets/salary_standard_income_card.dart';
import '../widgets/salary_total_taxable_card.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({super.key});

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState
    extends BaseState<SalaryScreen, SalaryEvent, SalaryState, SalaryBloc> {
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
        title: Text('Bảng lương', style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      body: BlocBuilder<SalaryBloc, SalaryState>(
        builder: (context, state) {
          if (state.status == BaseStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () async => bloc.add(const SalaryEvent.refresh()),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(state),
                      // const SizedBox(height: 12),
                      // Card thông tin chung

                      // SalaryInfoCard(state: state),
                      const SizedBox(height: 12),
                      // Card thu nhập
                      SalaryStandardIncomeCard(state: state),
                      const SizedBox(height: 12),
                      // Card làm thêm
                      SalaryOvertimeCard(state: state),
                      const SizedBox(height: 12),
                      // Card phụ cấp
                      SalaryAllowanceCard(state: state),
                      const SizedBox(height: 12),
                      // Card các khoản cộng & tổng thu nhập
                      SalaryOtherAdditionsCard(state: state),
                      const SizedBox(height: 12),
                      // Card các khoản phải trừ
                      SalaryDeductionsCard(state: state),
                      const SizedBox(height: 12),
                      // Card tổng thu nhập tính thuế
                      SalaryTotalTaxableCard(state: state),
                      const SizedBox(height: 12),
                      // Card thực lĩnh
                      SalaryNetSalaryCard(state: state),
                      const SizedBox(height: 12),
// Card ghi chú       // Card ghi chú
                      SalaryNoteCard(state: state),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //---(_Header)---//
  Widget _buildHeader(SalaryState state) {
    final monthLabel = state.selectedMonth != null
        ? DateFormat('MM/yyyy', 'vi_VN').format(state.selectedMonth!)
        : 'Chọn tháng';

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => SalaryMonthPicker.show(
        context,
        selectedMonth: state.selectedMonth,
        onApply: (month) => bloc.add(SalaryEvent.changeMonth(month)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month,
                color: AppColors.primaryERP, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kỳ lương',
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _formatCurrency(state.netSalary.round()),
                style: AppStyles.body2.copyWith(
                  color: AppColors.primaryERP,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCurrency(int value) {
    return NumberFormat('#,##0', 'vi_VN').format(value);
  }
}
