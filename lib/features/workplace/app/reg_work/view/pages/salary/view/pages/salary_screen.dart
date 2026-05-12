import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../bloc/salary_bloc.dart';
import '../widgets/salary_card.dart';
import '../widgets/salary_month_picker.dart';

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
                      const SizedBox(height: 12),
                      _buildInfoCard(state),
                      const SizedBox(height: 12),
                      _buildStandardIncomeCard(state),
                      const SizedBox(height: 12),
                      _buildOvertimeCard(state),
                      const SizedBox(height: 12),
                      _buildAllowanceCard(state),
                      const SizedBox(height: 12),
                      _buildOtherAdditionsAndTotalCard(state),
                      const SizedBox(height: 12),
                      _buildDeductionsCard(state),
                      const SizedBox(height: 12),
                      _buildTotalTaxableCard(state),
                      const SizedBox(height: 12),
                      _buildNetSalaryCard(state),
                      const SizedBox(height: 12),
                      _buildNoteCard(state),
                      const SizedBox(height: 24),
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
    final nf = NumberFormat('#,##0', 'vi_VN');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEE4623), Color(0xFFFF6B35)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.employeeName ?? 'Nhân viên',
                      style: AppStyles.headingTitle2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Mã: ${state.employeeCode ?? '-'}',
                      style: AppStyles.body2.copyWith(
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => SalaryMonthPicker.show(
                      context,
                      selectedMonth: state.selectedMonth,
                      onApply: (month) =>
                          bloc.add(SalaryEvent.changeMonth(month)),
                    ),
                    icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  const Text(
                    'Chọn tháng',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTimeRangeBar(state, nf),
        ],
      ),
    );
  }

  Widget _buildTimeRangeBar(SalaryState state, NumberFormat nf) {
    return GestureDetector(
      onTap: () => SalaryMonthPicker.show(
        context,
        selectedMonth: state.selectedMonth,
        onApply: (month) => bloc.add(SalaryEvent.changeMonth(month)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kỳ lương',
                    style: AppStyles.caption1.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    state.selectedMonth != null
                        ? DateFormat(
                            'MMMM yyyy',
                            'vi_VN',
                          ).format(state.selectedMonth!)
                        : 'Chọn tháng',
                    style: AppStyles.subtitle3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    nf.format(state.totalTaxableIncome.round()),
                    style: AppStyles.body2.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Text(
                    'đ',
                    style: AppStyles.caption1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //---(_Card 1: Thông tin chung)---//
  Widget _buildInfoCard(SalaryState state) {
    return SalaryCard(
      accentColor: AppColors.secondaryERP,
      title: 'Thông tin chung',
      icon: Icons.person_outline,
      child: Column(
        children: [
          SalaryInfoRow(label: 'Họ và tên', value: state.employeeName ?? '-'),
          SalaryInfoRow(label: 'Mã NV', value: state.employeeCode ?? '-'),
          SalaryInfoRow(label: 'Chức vụ', value: state.position ?? '-'),
          SalaryInfoRow(label: 'Hợp đồng', value: state.contractType ?? '-'),
          SalaryInfoRow(
            label: 'Ngày vào',
            value: state.joinDate != null
                ? DateFormat('dd/MM/yyyy').format(state.joinDate!)
                : '-',
          ),
        ],
      ),
    );
  }

  //---(_Card 2: Thu nhập tiêu chuẩn)---//
  Widget _buildStandardIncomeCard(SalaryState state) {
    final nf = NumberFormat('#,##0', 'vi_VN');

    return SalaryCard(
      accentColor: AppColors.stateInfoColor,
      title: 'Thu nhập tiêu chuẩn',
      icon: Icons.account_balance_wallet_outlined,
      child: Column(
        children: [
          // Top box: công thức tính
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.stateInfoColor.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.stateInfoColor.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calculate_outlined,
                  color: AppColors.stateInfoColor,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '(6) = (4) / F4 × (5)',
                        style: AppStyles.subtitle3.copyWith(
                          color: AppColors.stateInfoColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Thu nhập thực lĩnh = Thu nhập chuẩn / F4 × Công thực tế',
                        style: AppStyles.caption2.copyWith(
                          color: AppColors.gray,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Data rows
          _CalcRow(
            label: 'Thu nhập tiêu chuẩn tham chiếu',
            value: nf.format(state.refIncome.round()),
            color: AppColors.stateInfoColor,
            formula: '(4)',
          ),
          const Divider(height: 16),
          _CalcRow(
            label: 'Công thực tế',
            value: nf.format(state.actualWorkDays.round()),
            color: AppColors.stateInfoColor,
            formula: '(5)',
          ),
          _CalcRow(
            label: 'Phép',
            value: nf.format(state.leaveDays.round()),
            color: AppColors.stateInfoColor,
          ),
          _CalcRow(
            label: 'Tổng công',
            value: nf.format(state.totalWorkDays.round()),
            color: AppColors.stateInfoColor,
          ),
          _CalcRow(
            label: 'Đơn giá/giờ',
            value: '${nf.format(state.hourlyRate.round())} đ/h',
            color: AppColors.gray,
          ),
          const SizedBox(height: 10),
          // Bottom total box
          _TotalBox(
            label: 'Thu nhập thực lĩnh',
            formula: '(6)',
            value: nf.format(state.standardSalary.round()),
            color: AppColors.stateInfoColor,
          ),
        ],
      ),
    );
  }

  //---(_Card 3: Làm thêm)---//
  Widget _buildOvertimeCard(SalaryState state) {
    final nf = NumberFormat('#,##0', 'vi_VN');

    return SalaryCard(
      accentColor: AppColors.warning,
      title: 'Làm thêm',
      icon: Icons.more_time_outlined,
      child: Column(
        children: [
          // Top box: công thức tính
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.warning.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calculate_outlined,
                  color: AppColors.warning,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '(14) = (9) + (11) + (13)',
                        style: AppStyles.subtitle3.copyWith(
                          color: AppColors.warning,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Tổng làm thêm = Ngày thường + Cuối tuần + Ngày lễ/Tết',
                        style: AppStyles.caption2.copyWith(
                          color: AppColors.gray,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Data rows
          SalaryOvertimeRow(
            label: 'Ngày thường',
            hours: state.weekdayHours,
            amount: state.weekdayOvertimePay,
            multiplier: '×1.5',
            formula: '(8), (9)',
            nf: nf,
            color: AppColors.warning,
          ),
          const Divider(height: 16),
          SalaryOvertimeRow(
            label: 'Cuối tuần',
            hours: state.weekendHours,
            amount: state.weekendOvertimePay,
            multiplier: '×2',
            formula: '(10), (11)',
            nf: nf,
            color: AppColors.orangeA500,
          ),
          const Divider(height: 16),
          SalaryOvertimeRow(
            label: 'Ngày lễ, Tết',
            hours: state.holidayHours,
            amount: state.holidayOvertimePay,
            multiplier: '×3',
            formula: '(12), (13)',
            nf: nf,
            color: AppColors.alert,
          ),
          const SizedBox(height: 10),
          // Bottom total box
          _TotalBox(
            label: 'Tổng làm thêm',
            formula: '(14)',
            value: nf.format(state.totalOvertime.round()),
            color: AppColors.warning,
          ),
        ],
      ),
    );
  }

  //---(_Card 4: Phụ cấp)---//
  Widget _buildAllowanceCard(SalaryState state) {
    final nf = NumberFormat('#,##0', 'vi_VN');

    return SalaryCard(
      accentColor: AppColors.purpleA500,
      title: 'Phụ cấp',
      icon: Icons.add_card,
      child: Column(
        children: [
          // Top box: công thức tính
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.purpleA500.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.purpleA500.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calculate_outlined,
                  color: AppColors.purpleA500,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '(19) = (17) + (18)',
                        style: AppStyles.subtitle3.copyWith(
                          color: AppColors.purpleA500,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Tổng phụ cấp = Cơm ca + Đi làm trước 7h15',
                        style: AppStyles.caption2.copyWith(
                          color: AppColors.gray,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Data rows
          _CalcRow(
            label: 'Cơm ca sau 20H / theo loại công tác',
            value: nf.format(state.mealAllowance.round()),
            color: AppColors.purpleA500,
          ),
          _CalcRow(
            label: 'Đi làm trước 7h15',
            value: nf.format(state.earlyShiftAllowance.round()),
            color: AppColors.purpleA500,
          ),
          const SizedBox(height: 10),
          // Bottom total box
          _TotalBox(
            label: 'Tổng phụ cấp',
            formula: '(19)',
            value: nf.format(state.totalAllowance.round()),
            color: AppColors.purpleA500,
          ),
        ],
      ),
    );
  }

  //---(_Card 5+6: Các khoản cộng khác + Tổng thu nhập)---//
  Widget _buildOtherAdditionsAndTotalCard(SalaryState state) {
    final nf = NumberFormat('#,##0', 'vi_VN');

    return SalaryCard(
      accentColor: AppColors.greenA500,
      title: 'Các khoản cộng & Tổng thu nhập',
      icon: Icons.add_circle_outline,
      child: Column(
        children: [
          // Section 1: Các khoản cộng khác
          _SectionHeader(
            title: 'Các khoản cộng khác',
            formula: '(25) = (20) + (21) + (22) + (23) + (24)',
            color: AppColors.greenA500,
          ),
          const SizedBox(height: 8),
          _CalcRow(
            label: 'Công tác phí',
            value: nf.format(state.travelAllowance.round()),
            color: AppColors.greenA500,
          ),
          _CalcRow(
            label: 'Làm đêm',
            value: nf.format(state.nightWorkPay.round()),
            color: AppColors.greenA500,
          ),
          _CalcRow(
            label: 'Chi phí phương tiện công tác',
            value: nf.format(state.transportCost.round()),
            color: AppColors.greenA500,
          ),
          _CalcRow(
            label: 'Thưởng KPIs / doanh số',
            value: nf.format(state.kpiBonus.round()),
            color: AppColors.greenA500,
          ),
          _CalcRow(
            label: 'Khác',
            value: nf.format(state.otherAddition.round()),
            color: AppColors.greenA500,
          ),
          const SizedBox(height: 8),
          _TotalBox(
            label: 'Tổng cộng khác',
            formula: '(25)',
            value: nf.format(state.totalOtherAdditions.round()),
            color: AppColors.greenA500,
          ),
          const Divider(height: 24),
          // Section 2: Tổng thu nhập tính thuế
          _SectionHeader(
            title: 'Tổng thu nhập tính thuế',
            formula: '(26) = (6) + (14) + (19) + (25)',
            color: AppColors.primaryERP,
          ),
          const SizedBox(height: 8),
          _CalcRow(
            label: 'Thu nhập thực lĩnh',
            value: nf.format(state.standardSalary.round()),
            color: AppColors.primaryERP,
          ),
          _CalcRow(
            label: 'Làm thêm',
            value: nf.format(state.totalOvertime.round()),
            color: AppColors.primaryERP,
          ),
          _CalcRow(
            label: 'Phụ cấp',
            value: nf.format(state.totalAllowance.round()),
            color: AppColors.primaryERP,
          ),
          _CalcRow(
            label: 'Các khoản cộng khác',
            value: nf.format(state.totalOtherAdditions.round()),
            color: AppColors.primaryERP,
          ),
          const SizedBox(height: 8),
          _TotalBox(
            label: 'Tổng thu nhập tính thuế',
            formula: '(26)',
            value: nf.format(state.totalTaxableIncome.round()),
            color: AppColors.primaryERP,
          ),
        ],
      ),
    );
  }

  //---(_Card 7: Các khoản phải trừ)---//
  Widget _buildDeductionsCard(SalaryState state) {
    final nf = NumberFormat('#,##0', 'vi_VN');

    return SalaryCard(
      accentColor: AppColors.alert,
      title: 'Các khoản phải trừ',
      icon: Icons.remove_circle_outline,
      child: Column(
        children: [
          // Top box: công thức tính
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.alert.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.alert.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calculate_outlined,
                  color: AppColors.alert,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '(38) = (31) + (32) + (33) + (34) + (35) + (36) + (37)',
                        style: AppStyles.subtitle3.copyWith(
                          color: AppColors.alert,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Tổng = Quỹ BĐS + Ứng lương + Thu hộ + Xe + 5S + Cơm + Khác',
                        style: AppStyles.caption2.copyWith(
                          color: AppColors.gray,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Data rows
          _CalcRow(
            label: 'Mức đóng BHXH, BHYT, BHTN',
            value: '${state.socialInsuranceRate}%',
            color: AppColors.alert,
          ),
          const Divider(height: 16),
          _CalcRow(
            label: 'Phải thu BHXH, BHYT, BHTN',
            value: nf.format(state.socialInsuranceAmount.round()),
            color: AppColors.alert,
          ),
          _CalcRow(
            label: 'Quỹ BĐS',
            value: nf.format(state.unionFundAmount.round()),
            color: AppColors.alert,
          ),
          const Divider(height: 16),
          _CalcRow(
            label: 'Ứng lương',
            value: nf.format(state.salaryAdvance.round()),
            color: AppColors.alert,
          ),
          _CalcRow(
            label: 'Thu hộ phòng ban',
            value: nf.format(state.deptCollection.round()),
            color: AppColors.alert,
          ),
          _CalcRow(
            label: 'Gửi xe ô tô',
            value: nf.format(state.carParking.round()),
            color: AppColors.alert,
          ),
          _CalcRow(
            label: '5S',
            value: nf.format(state.fiveSParking.round()),
            color: AppColors.alert,
          ),
          _CalcRow(
            label: 'Cơm ca tại VP',
            value: nf.format(state.mealDeduction.round()),
            color: AppColors.alert,
          ),
          _CalcRow(
            label: 'Khác',
            value: nf.format(state.otherDeduction.round()),
            color: AppColors.alert,
          ),
          const SizedBox(height: 10),
          // Bottom total box
          _TotalBox(
            label: 'Tổng các khoản phải trừ',
            formula: '(38)',
            value: nf.format(state.totalDeductions.round()),
            color: AppColors.alert,
          ),
        ],
      ),
    );
  }

  //---(_Card 8: Tổng thu nhập tính thuế - card lớn)---//
  Widget _buildTotalTaxableCard(SalaryState state) {
    final nf = NumberFormat('#,##0', 'vi_VN');

    return _SalaryExpandableCard(
      initiallyExpanded: true,
      accentColor: AppColors.secondaryERP,
      title: 'Tổng thu nhập tính thuế',
      icon: Icons.receipt_long_outlined,
      child: Column(
        children: [
          // Section giảm trừ thuế (collapsible)
          _TaxDeductionSection(state: state, nf: nf),
          const SizedBox(height: 12),
          // Thu nhập tính thuế
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.stateInfoColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thu nhập tính thuế',
                        style: AppStyles.body2.copyWith(
                          color: AppColors.heading,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '(46) = (26) − (30) − (44)',
                        style: AppStyles.caption2.copyWith(
                          color: AppColors.gray,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${nf.format(state.taxableIncome.round())} đ',
                  style: AppStyles.subtitle3.copyWith(
                    color: AppColors.stateInfoColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Khấu trừ Thuế TNCN
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.alert.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Khấu trừ Thuế TNCN',
                    style: AppStyles.body2.copyWith(
                      color: AppColors.heading,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _FormulaBadge(formula: '(47)', color: AppColors.alert),
                const SizedBox(width: 10),
                Text(
                  '${nf.format(state.incomeTax.round())} đ',
                  style: AppStyles.subtitle3.copyWith(
                    color: AppColors.alert,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //---(_Card 9: Thực lĩnh)---//
  Widget _buildNetSalaryCard(SalaryState state) {
    final nf = NumberFormat('#,##0', 'vi_VN');

    return SalaryCard(
      accentColor: AppColors.stateSuccessColor,
      title: 'Thực lĩnh',
      icon: Icons.account_balance_wallet,
      child: Column(
        children: [
          // Top box: công thức tính
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.stateSuccessColor.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.stateSuccessColor.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calculate_outlined,
                  color: AppColors.stateSuccessColor,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '(48) = (26) − (30) − (38) − (45)',
                        style: AppStyles.subtitle3.copyWith(
                          color: AppColors.stateSuccessColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Thực lĩnh = Tổng thu nhập − BHXH − Phải trừ − Giảm trừ thuế',
                        style: AppStyles.caption2.copyWith(
                          color: AppColors.gray,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Data rows
          _CalcRow(
            label: 'Tổng thu nhập tính thuế',
            value: nf.format(state.totalTaxableIncome.round()),
            color: AppColors.stateSuccessColor,
          ),
          _CalcRow(
            label: 'Phải thu BHXH, BHYT, BHTN',
            value: nf.format(state.socialInsuranceAmount.round()),
            color: AppColors.stateSuccessColor,
          ),
          _CalcRow(
            label: 'Tổng các khoản phải trừ',
            value: nf.format(state.totalDeductions.round()),
            color: AppColors.stateSuccessColor,
          ),
          _CalcRow(
            label: 'Tổng các khoản giảm trừ thuế',
            value: nf.format(state.totalTaxDeductions.round()),
            color: AppColors.stateSuccessColor,
          ),
          const SizedBox(height: 10),
          // Bottom total box
          _TotalBox(
            label: 'Thực lĩnh',
            formula: '(48)',
            value: nf.format(state.netSalary.round()),
            color: AppColors.stateSuccessColor,
          ),
        ],
      ),
    );
  }

  //---(_Card 10: Ghi chú)---//
  Widget _buildNoteCard(SalaryState state) {
    return SalaryCard(
      accentColor: AppColors.gray,
      title: 'Ghi chú',
      icon: Icons.note_outlined,
      child: Text(
        state.note ?? 'Không có ghi chú',
        style: AppStyles.body2.copyWith(
          color: state.note != null ? AppColors.heading : AppColors.hintText,
        ),
      ),
    );
  }
}

// =============================================================================
// INNER BOX WIDGETS
// =============================================================================

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.formula,
    required this.color,
  });

  final String title;
  final String formula;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: AppStyles.body2.copyWith(
              color: AppColors.heading,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            formula,
            style: AppStyles.caption2.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _CalcRow extends StatelessWidget {
  const _CalcRow({
    required this.label,
    required this.value,
    required this.color,
    this.formula,
  });

  final String label;
  final String value;
  final Color color;
  final String? formula;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.6),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: AppStyles.body2.copyWith(
                color: AppColors.heading,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
          if (formula != null)
            Container(
              margin: const EdgeInsets.only(right: 6),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                formula!,
                style: AppStyles.caption2.copyWith(
                  color: color,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          Text(
            '$value đ',
            style: AppStyles.body2.copyWith(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalBox extends StatelessWidget {
  const _TotalBox({
    required this.label,
    required this.formula,
    required this.value,
    required this.color,
  });

  final String label;
  final String formula;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppStyles.body2.copyWith(
                color: AppColors.heading,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _FormulaBadge(formula: formula, color: color),
          const SizedBox(width: 8),
          Text(
            '$value đ',
            style: AppStyles.subtitle2.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _TaxDeductionSection extends StatefulWidget {
  const _TaxDeductionSection({
    required this.state,
    required this.nf,
    this.initiallyExpanded = true,
  });

  final SalaryState state;
  final NumberFormat nf;
  final bool initiallyExpanded;

  @override
  State<_TaxDeductionSection> createState() => _TaxDeductionSectionState();
}

class _TaxDeductionSectionState extends State<_TaxDeductionSection> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final nf = widget.nf;
    final state = widget.state;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.tealA700.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.tealA700.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          // Header của section
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.tealA700.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.call_split,
                      color: AppColors.tealA700,
                      size: 15,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Các khoản giảm trừ thuế TNCN',
                          style: AppStyles.body2.copyWith(
                            color: AppColors.heading,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          '(39) → (44)',
                          style: AppStyles.caption2.copyWith(
                            color: AppColors.tealA700.withValues(alpha: 0.7),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _FormulaBadge(formula: '(45)', color: AppColors.tealA700),
                  const SizedBox(width: 8),
                  Text(
                    '${nf.format(state.totalTaxDeductions.round())} đ',
                    style: AppStyles.subtitle3.copyWith(
                      color: AppColors.tealA700,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedRotation(
                    turns: _isExpanded ? 0 : -0.25,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.tealA700,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Nội dung collapsible
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
              child: Column(
                children: [
                  const Divider(height: 16, color: AppColors.borderColor),
                  _DeductionRow(
                    label: 'Lương BHXH (10.5%)',
                    formula: '(39)',
                    value: nf.format(state.taxableSocialInsurance.round()),
                    color: AppColors.tealA700,
                  ),
                  _DeductionRow(
                    label: 'Lương làm thêm',
                    formula: '(40) = (14) + (21)',
                    value: nf.format(state.taxableOvertime.round()),
                    color: AppColors.tealA700,
                  ),
                  _DeductionRow(
                    label: 'PC cơm ca',
                    formula: '(41)',
                    value: nf.format(state.taxableMealAllowance.round()),
                    color: AppColors.tealA700,
                  ),
                  _DeductionRow(
                    label: 'PC điện thoại',
                    formula: '(42)',
                    value: nf.format(state.taxablePhoneAllowance.round()),
                    color: AppColors.tealA700,
                  ),
                  _DeductionRow(
                    label: 'Giảm trừ bản thân',
                    formula: '(43)',
                    value: nf.format(state.taxablePersonalDeduction.round()),
                    color: AppColors.tealA700,
                  ),
                  _DeductionRow(
                    label: 'Giảm trừ người phụ thuộc',
                    formula: '(44)',
                    value: nf.format(state.taxableDependentDeduction.round()),
                    color: AppColors.tealA700,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DeductionRow extends StatelessWidget {
  const _DeductionRow({
    required this.label,
    required this.formula,
    required this.value,
    required this.color,
  });

  final String label;
  final String formula;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.6),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: AppStyles.body2.copyWith(
                color: AppColors.gray,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 6),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              formula,
              style: AppStyles.caption2.copyWith(
                color: color,
                fontSize: 9,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            '$value đ',
            style: AppStyles.body2.copyWith(
              color: AppColors.heading,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _TaxDeductionsTotalBox extends StatelessWidget {
  const _TaxDeductionsTotalBox({required this.state, required this.nf});

  final SalaryState state;
  final NumberFormat nf;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.tealA700.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Tổng các khoản giảm trừ thuế TNCN',
              style: AppStyles.body2.copyWith(
                color: AppColors.heading,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _FormulaBadge(formula: '(45)', color: AppColors.tealA700),
          const SizedBox(width: 8),
          Text(
            '${nf.format(state.totalTaxDeductions.round())} đ',
            style: AppStyles.subtitle2.copyWith(
              color: AppColors.tealA700,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// EXPANDABLE CARD (dùng cho card lớn có card con bên trong)
// =============================================================================

class _SalaryExpandableCard extends StatefulWidget {
  const _SalaryExpandableCard({
    required this.accentColor,
    required this.title,
    required this.icon,
    required this.child,
    this.initiallyExpanded = true,
  });

  final Color accentColor;
  final String title;
  final IconData icon;
  final Widget child;
  final bool initiallyExpanded;

  @override
  State<_SalaryExpandableCard> createState() => _SalaryExpandableCardState();
}

class _SalaryExpandableCardState extends State<_SalaryExpandableCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ExpandableCardHeader(
            accentColor: widget.accentColor,
            icon: widget.icon,
            title: widget.title,
            isExpanded: _isExpanded,
            onToggle: () => setState(() => _isExpanded = !_isExpanded),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.all(16),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpandableCardHeader extends StatelessWidget {
  const _ExpandableCardHeader({
    required this.accentColor,
    required this.icon,
    required this.title,
    required this.isExpanded,
    required this.onToggle,
  });

  final Color accentColor;
  final IconData icon;
  final String title;
  final bool isExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: accentColor.withValues(alpha: 0.06),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          border: Border(
            top: BorderSide(color: accentColor, width: 2),
            left: BorderSide(color: accentColor, width: 2),
            right: BorderSide(color: accentColor, width: 2),
            bottom: BorderSide.none,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: accentColor, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: AppStyles.subtitle3.copyWith(
                  color: AppColors.heading,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            AnimatedRotation(
              turns: isExpanded ? 0 : -0.25,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: accentColor,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormulaBadge extends StatelessWidget {
  const _FormulaBadge({required this.formula, required this.color});

  final String formula;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        formula,
        style: AppStyles.caption2.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
