import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../overtime/data/datasource/models/overtime_model.dart';
import '../../data/datasource/models/salary_model.dart';
import '../bloc/salary_bloc.dart';
import 'salary_screen.dart';

class SalaryCardDetailScreen extends StatefulWidget {
  const SalaryCardDetailScreen({
    super.key,
    this.cardType,
    this.month,
  });

  final SalaryCardType? cardType;
  final DateTime? month;

  @override
  State<SalaryCardDetailScreen> createState() => _SalaryCardDetailScreenState();
}

class _SalaryCardDetailScreenState
    extends BaseShareState<SalaryCardDetailScreen, SalaryEvent, SalaryState, SalaryBloc> {
  late SalaryCardType _cardType;
  late DateTime _selectedMonth;

  @override
  void initState() {
    super.initState();
    _cardType = widget.cardType ?? SalaryCardType.standardIncome;
    _selectedMonth = widget.month ?? DateTime.now();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(SalaryEvent.changeMonth(_selectedMonth));
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(_getCardTitle(), style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      backgroundColor: AppColors.background,
      body: blocBuilder((context, state) {
        if (state.status == BaseStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: () async => bloc.add(SalaryEvent.changeMonth(_selectedMonth)),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSummaryBanner(state),
                const SizedBox(height: 16),
                _buildContent(state),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }

  String _getCardTitle() {
    switch (_cardType) {
      case SalaryCardType.standardIncome:
        return 'Thu nhập tiêu chuẩn';
      case SalaryCardType.overtime:
        return 'Làm thêm giờ';
      case SalaryCardType.allowance:
        return 'Phụ cấp';
      case SalaryCardType.otherAdditions:
        return 'Các khoản cộng khác';
      case SalaryCardType.deductions:
        return 'Các khoản phải trừ';
      case SalaryCardType.totalTaxable:
        return 'Thu nhập tính thuế';
      case SalaryCardType.netSalary:
        return 'Thực lĩnh';
    }
  }

  Color get _accentColor {
    switch (_cardType) {
      case SalaryCardType.standardIncome:
        return AppColors.stateInfoColor;
      case SalaryCardType.overtime:
        return AppColors.warning;
      case SalaryCardType.allowance:
        return AppColors.purpleA500;
      case SalaryCardType.otherAdditions:
        return AppColors.greenA500;
      case SalaryCardType.deductions:
        return AppColors.alert;
      case SalaryCardType.totalTaxable:
        return AppColors.secondaryERP;
      case SalaryCardType.netSalary:
        return AppColors.stateSuccessColor;
    }
  }

  String _getCardDescription() {
    switch (_cardType) {
      case SalaryCardType.standardIncome:
        return 'Các ngày đi muộn, về sớm, không check-in/out, quên chấm công';
      case SalaryCardType.overtime:
        return 'Chi tiết các ngày làm thêm giờ (OT ngày thường, cuối tuần, lễ Tết)';
      case SalaryCardType.allowance:
        return 'Cơm ca sau 20h - Đi làm trước 7h15';
      case SalaryCardType.otherAdditions:
        return 'Công tác - Làm đêm - Phương tiện công tác - KPIs/Doanh số - Khác';
      case SalaryCardType.deductions:
        return 'Mức đóng BHXH, các khoản phải trừ: ứng lương, gửi xe, cơm ca...';
      case SalaryCardType.totalTaxable:
        return 'Thu nhập chịu thuế, giảm trừ và thuế TNCN';
      case SalaryCardType.netSalary:
        return 'Tổng hợp thu nhập và các khoản trừ';
    }
  }

  Widget _buildSummaryBanner(SalaryState state) {
    final monthLabel = _formatMonth(_selectedMonth);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _accentColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _accentColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_month, color: _accentColor, size: 18),
              const SizedBox(width: 8),
              Text(
                'Thời gian: $monthLabel',
                style: AppStyles.subtitle3.copyWith(
                  color: _accentColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  String _formatMonth(DateTime dt) {
    final months = ['T1','T2','T3','T4','T5','T6','T7','T8','T9','T10','T11','T12'];
    return '${months[dt.month - 1]}/${dt.year}';
  }

  Widget _buildContent(SalaryState state) {
    switch (_cardType) {
      case SalaryCardType.overtime:
        return _buildOTContent(state);
      case SalaryCardType.allowance:
        return _buildAllowanceContent(state);
      case SalaryCardType.otherAdditions:
        return _buildOtherAdditionsContent(state);
      case SalaryCardType.deductions:
        return _buildDeductionsList(state);
      case SalaryCardType.standardIncome:
      case SalaryCardType.totalTaxable:
      case SalaryCardType.netSalary:
        final days = _getFilteredDays(state.fingerDetails);
        if (days.isEmpty) return _buildEmptyState();
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: days.length,
          itemBuilder: (context, index) => _DayDetailRow(
            detail: days[index],
            cardType: _cardType,
            isEven: index.isEven,
          ),
        );
    }
  }

  Widget _buildOTContent(SalaryState state) {
    final nf = NumberFormat('#,##0', 'vi_VN');
    final otItems = state.overtimeItems;
    final overnightItems = state.overnightItems;

    if (otItems.isEmpty) return _buildEmptyState();

    // Group by TypeName
    final grouped = <String, List<OvertimeItem>>{};
    for (final item in otItems) {
      final typeName = item.typeName ?? 'Khác';
      grouped.putIfAbsent(typeName, () => []).add(item);
    }

    // Color mapping cho 5 loại OT
    final typeColor = {
      'Ngày thường': AppColors.warning,
      'Ngày thường - Đêm': const Color(0xFF7B2D8B),
      'Cuối tuần': AppColors.secondaryERP,
      'Cuối tuần - Đêm': const Color(0xFF6A1B9A),
      'Ngày lễ': AppColors.primaryERP,
    };

    // Summary chips - 5 loại từ state
    final summaryChips = <Widget>[];
    if (state.otMoneyWD > 0) {
      summaryChips.add(_buildSummaryChip('Ngày thường', nf.format(state.otMoneyWD.round()), AppColors.warning));
    }
    if (state.otMoneyWKNight > 0) {
      summaryChips.add(_buildSummaryChip('Ngày thường - Đêm', nf.format(state.otMoneyWKNight.round()), const Color(0xFF7B2D8B)));
    }
    if (state.otMoneyWK > 0) {
      summaryChips.add(_buildSummaryChip('Cuối tuần', nf.format(state.otMoneyWK.round()), AppColors.secondaryERP));
    }
    if (state.otMoneyWKNightWeekend > 0) {
      summaryChips.add(_buildSummaryChip('Cuối tuần - Đêm', nf.format(state.otMoneyWKNight.round()), const Color(0xFF6A1B9A)));
    }
    if (state.otMoneyHD > 0) {
      summaryChips.add(_buildSummaryChip('Ngày lễ', nf.format(state.otMoneyHD.round()), AppColors.primaryERP));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Summary chips
        if (summaryChips.isNotEmpty) ...[
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: summaryChips,
          ),
          const SizedBox(height: 16),
        ],
        // Groups
        ...grouped.entries.map((entry) {
          final typeName = entry.key;
          final items = entry.value;
          final color = typeColor[typeName] ?? AppColors.gray;

          // Group by date
          final byDate = <String, List<OvertimeItem>>{};
          for (final item in items) {
            if (item.timeStart != null) {
              final key = '${item.timeStart!.year}-${item.timeStart!.month}-${item.timeStart!.day}';
              byDate.putIfAbsent(key, () => []).add(item);
            }
          }
          final sortedKeys = byDate.keys.toList()..sort();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOTSectionHeader(typeName, color),
              const SizedBox(height: 8),
              ...sortedKeys.asMap().entries.map((e) => _OTDayRow(
                items: byDate[e.value]!,
                color: color,
                isEven: e.key.isEven,
              )),
              const SizedBox(height: 12),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildOTSectionHeader(String title, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        title,
        style: AppStyles.subtitle3.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  //---(_Allowance)---//

  Widget _buildAllowanceContent(SalaryState state) {
    final nf = NumberFormat('#,##0', 'vi_VN');
    String f(num n) => nf.format(n.round());
    final days = _getFilteredDays(state.fingerDetails);
    final regDays = days.where((d) => d.isLateRegister == true || d.isEarlyRegister == true).toList();

    // Tính tổng tiền cơm ca qua đêm
    final overnightTotal = state.overnightItems.fold<double>(
      0, (sum, o) => sum + (o.costOvernight ?? 0),
    );

    final hasAllowance = state.allowanceMeal > 0 ||
        state.allowanceOTEarly > 0 ||
        overnightTotal > 0;
    if (regDays.isEmpty && state.overnightItems.isEmpty && !hasAllowance) {
      return _buildEmptyState();
    }

    // Tách 2 nhóm: cơm ca sau 20h (isLate) và đi trước 7h15 (isEarly)
    final mealDays = regDays.where((d) => d.isLate == true || d.isLateActual == 1).toList();
    final earlyDays = regDays.where((d) => d.isEarly == true || d.isEarlyActual == 1).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (overnightTotal > 0)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.purpleA500.withValues(alpha: 0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSummaryChip(
                  'Cơm ca đêm:',
                  f(state.allowanceMeal),
                  AppColors.purpleA500,
                ),
                if (state.overnightItems.isNotEmpty)
                  ..._buildOvernightRows(state.overnightItems, AppColors.purpleA500),
              ],
            ),
          ),
        if (state.allowanceOTEarly > 0)
          _buildSummaryChip(
            'Đi trước 7h15',
            f(state.allowanceOTEarly),
            AppColors.warning,
          ),
        if (regDays.isNotEmpty) ...[
          ..._buildAllowanceSection('Cơm ca sau 20h', mealDays, AppColors.purpleA500),
          ..._buildAllowanceSection('Đi trước 7h15', earlyDays, AppColors.warning),
        ],
      ],
    );
  }

  List<Widget> _buildOvernightRows(List<OvertimeItem> items, Color color) {
    final sorted = items.toList()
      ..sort((a, b) {
        final da = a.dateRegister;
        final db = b.dateRegister;
        if (da == null && db == null) return 0;
        if (da == null) return 1;
        if (db == null) return -1;
        return da.compareTo(db);
      });

    return [
      const SizedBox(height: 12),
      _OvernightDateRow(items: sorted, color: AppColors.purpleA500),
    ];
  }

  List<Widget> _buildAllowanceSection(String title, List<SalaryFingerDetail> days, Color color) {
    if (days.isEmpty) return [];

    return [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: AppStyles.subtitle3.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      const SizedBox(height: 8),
      ...days.asMap().entries.map((e) => _AllowanceDayRow(
        detail: e.value,
        color: color,
        isEven: e.key.isEven,
      )),
      const SizedBox(height: 12),
    ];
  }

  //---(_OtherAdditions)---//

  Widget _buildOtherAdditionsContent(SalaryState state) {
    final nf = NumberFormat('#,##0', 'vi_VN');

    final days = _getFilteredDays(state.fingerDetails);

    if (days.isEmpty) return _buildEmptyState();

    // Tách theo loại
    final businessDays = days.where((d) => d.bussiness == true).toList();
    final lateDays = days.where((d) => d.isLate == true || d.isLateActual == 1).toList();
    final earlyDays = days.where((d) => d.isEarly == true || d.isEarlyActual == 1).toList();
    final leaveDays = days.where((d) => d.onLeave == true).toList();
    final wfhDays = days.where((d) => d.wfh == true).toList();
    final noFingerDays = days.where((d) =>
      d.noFingerprint == true || d.isNoFinger == 1 ||
      d.isNoCheckIn == 1 || d.isNoCheckOut == 1
    ).toList();

    // Summary chips - tiền từ state
    final hasStateData = state.bussinessMoney > 0 ||
        state.nightShiftMoney > 0 ||
        state.costVehicleBussiness > 0 ||
        state.bonus > 0 ||
        state.other > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasStateData) ...[
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (state.bussinessMoney > 0)
                _buildSummaryChip('Công tác', nf.format(state.bussinessMoney.round()), AppColors.secondaryERP),
              if (state.nightShiftMoney > 0)
                _buildSummaryChip('Làm đêm', nf.format(state.nightShiftMoney.round()), AppColors.purpleA500),
              if (state.costVehicleBussiness > 0)
                _buildSummaryChip('Phương tiện', nf.format(state.costVehicleBussiness.round()), AppColors.stateInfoColor),
              if (state.bonus > 0)
                _buildSummaryChip('Thưởng', nf.format(state.bonus.round()), AppColors.stateSuccessColor),
              if (state.other > 0)
                _buildSummaryChip('Khác', nf.format(state.other.round()), AppColors.gray),
            ],
          ),
          const SizedBox(height: 16),
        ],
        // Summary chips - số ngày
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            if (businessDays.isNotEmpty)
              _buildSummaryChip('Công tác', '${businessDays.length} ngày', AppColors.secondaryERP),
            if (lateDays.isNotEmpty)
              _buildSummaryChip('Đi muộn', '${lateDays.length} ngày', AppColors.alert),
            if (earlyDays.isNotEmpty)
              _buildSummaryChip('Về sớm', '${earlyDays.length} ngày', AppColors.warning),
            if (leaveDays.isNotEmpty)
              _buildSummaryChip('Nghỉ', '${leaveDays.length} ngày', AppColors.gray),
            if (wfhDays.isNotEmpty)
              _buildSummaryChip('WFH', '${wfhDays.length} ngày', AppColors.stateSuccessColor),
            if (noFingerDays.isNotEmpty)
              _buildSummaryChip('Quên CC', '${noFingerDays.length} ngày', AppColors.stateErrorColor),
          ],
        ),
        const SizedBox(height: 16),
        // Detail sections
        ..._buildOtherAddSection('Công tác', businessDays, AppColors.secondaryERP),
        ..._buildOtherAddSection('Đi muộn', lateDays, AppColors.alert),
        ..._buildOtherAddSection('Về sớm', earlyDays, AppColors.warning),
        ..._buildOtherAddSection('Nghỉ', leaveDays, AppColors.gray),
        ..._buildOtherAddSection('WFH', wfhDays, AppColors.stateSuccessColor),
        ..._buildOtherAddSection('Quên chấm công', noFingerDays, AppColors.stateErrorColor),
      ],
    );
  }

  List<Widget> _buildOtherAddSection(String title, List<SalaryFingerDetail> days, Color color) {
    if (days.isEmpty) return [];

    return [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: AppStyles.subtitle3.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      const SizedBox(height: 8),
      ...days.asMap().entries.map((e) => _OtherAddDayRow(
        detail: e.value,
        color: color,
        isEven: e.key.isEven,
      )),
      const SizedBox(height: 12),
    ];
  }

  //---(_Deductions)---//

  Widget _buildDeductionsList(SalaryState state) {
    final items = <_DeductionItem>[];

    // Group 1: BHXH
    if (state.socialInsurance > 0) {
      items.add(_DeductionItem(
        label: 'Mức đóng BHXH',
        value: state.socialInsurance,
        formula: '(29)',
      ));
    }
    if (state.insurances > 0) {
      items.add(_DeductionItem(
        label: 'Phải thu BHXH',
        value: state.insurances,
        formula: '(30) = 10,5%*(27)',
      ));
    }
    if (state.unionFees > 0) {
      items.add(_DeductionItem(
        label: 'Quỹ BĐS',
        value: state.unionFees,
        formula: '(31) = 1%*(27)',
      ));
    }

    // Group 2
    if (state.advancePayment > 0) {
      items.add(_DeductionItem(
        label: 'Ứng lương',
        value: state.advancePayment,
        formula: '(32)',
      ));
    }
    if (state.departmentalFees > 0) {
      items.add(_DeductionItem(
        label: 'Thu hộ Phòng ban',
        value: state.departmentalFees,
        formula: '(33)',
      ));
    }
    if (state.parkingMoney > 0) {
      items.add(_DeductionItem(
        label: 'Gửi xe ô tô',
        value: state.parkingMoney,
        formula: '(34)',
      ));
    }

    // Group 3
    if (state.punish5S > 0) {
      items.add(_DeductionItem(
        label: '5S',
        value: state.punish5S,
        formula: '(35)',
      ));
    }
    if (state.mealUse > 0) {
      items.add(_DeductionItem(
        label: 'Cơm ca tại VP',
        value: state.mealUse.toDouble(),
        formula: '(36)',
      ));
    }
    if (state.otherDeduction > 0) {
      items.add(_DeductionItem(
        label: 'Khác',
        value: state.otherDeduction,
        formula: '(37)',
      ));
    }

    if (items.isEmpty) return _buildEmptyState();

    return Column(
      children: [
        ...items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return _DeductionRow(
            item: item,
            isEven: index.isEven,
            isLast: index == items.length - 1,
          );
        }),
      ],
    );
  }

  //---(_Helper)---//

  List<SalaryFingerDetail> _getFilteredDays(List<SalaryFingerDetail> details) {
    final filtered = details.where((d) {
      final date = d.attendanceDate;
      if (date == null) return false;
      return date.year == _selectedMonth.year && date.month == _selectedMonth.month;
    }).toList();

    switch (_cardType) {
      case SalaryCardType.standardIncome:
        return filtered.where((d) =>
          d.isLate == true || d.isLateActual == 1 ||
          d.isEarly == true || d.isEarlyActual == 1 ||
          d.isNoCheckIn == 1 || d.isNoCheckOut == 1 ||
          d.noFingerprint == true || d.isNoFinger == 1
        ).toList();

      case SalaryCardType.overtime:
        return const []; // OT dùng listSummary thay vì fingerDetails

      case SalaryCardType.allowance:
        return filtered.where((d) =>
          d.isLateRegister == true || d.isEarlyRegister == true
        ).toList();

      case SalaryCardType.otherAdditions:
        return filtered.where((d) =>
          d.bussiness == true ||
          d.isLate == true || d.isLateActual == 1 ||
          d.isEarly == true || d.isEarlyActual == 1 ||
          d.wfh == true ||
          d.onLeave == true ||
          d.noFingerprint == true || d.isNoFinger == 1 ||
          d.isNoCheckIn == 1 || d.isNoCheckOut == 1
        ).toList();

      case SalaryCardType.deductions:
        return filtered.where((d) =>
          d.isLate == true || d.isLateActual == 1 ||
          d.isEarly == true || d.isEarlyActual == 1 ||
          d.isNoCheckIn == 1 || d.isNoCheckOut == 1 ||
          d.noFingerprint == true || d.isNoFinger == 1
        ).toList();

      case SalaryCardType.totalTaxable:
        return filtered.where((d) =>
          d.isLate == true || d.isLateActual == 1 ||
          d.isEarly == true || d.isEarlyActual == 1
        ).toList();

      case SalaryCardType.netSalary:
        return filtered.where((d) =>
          d.isLate == true || d.isLateActual == 1 ||
          d.isEarly == true || d.isEarlyActual == 1 ||
          d.isNoCheckIn == 1 || d.isNoCheckOut == 1 ||
          d.noFingerprint == true || d.isNoFinger == 1
        ).toList();
    }
  }

  bool _isWeekend(DateTime? date) {
    if (date == null) return false;
    return date.weekday == 6 || date.weekday == 7;
  }

  Widget _buildSummaryChip(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppStyles.subtitle3.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: AppStyles.subtitle2.copyWith(
              color: color,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppImages.missing, width: 320),
          const SizedBox(height: 10),
          const Text('Không có dữ liệu'),
        ],
      ),
    );
  }
}

//---(_OvernightDayRow)---//

class _OvernightDayRow extends StatelessWidget {
  final OvertimeItem item;
  final Color color;
  final bool isEven;

  const _OvernightDayRow({
    required this.item,
    required this.color,
    required this.isEven,
  });

  static const _weekdayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  @override
  Widget build(BuildContext context) {
    final date = item.dateRegister;
    final weekdayStr = date != null ? _weekdayLabels[date.weekday - 1] : '--';

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isEven ? AppColors.white : AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  date?.day.toString() ?? '--',
                  style: AppStyles.subtitle2.copyWith(
                    color: color,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  weekdayStr,
                  style: AppStyles.caption2.copyWith(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Cơm ca qua đêm',
              style: AppStyles.subtitle3.copyWith(
                color: AppColors.heading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//---(_OvernightDateRow)---//

class _OvernightDateRow extends StatelessWidget {
  final List<OvertimeItem> items;
  final Color color;

  const _OvernightDateRow({
    required this.items,
    required this.color,
  });

  static const _weekdayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  @override
  Widget build(BuildContext context) {
    final sorted = items.toList()
      ..sort((a, b) {
        final da = a.dateRegister;
        final db = b.dateRegister;
        if (da == null && db == null) return 0;
        if (da == null) return 1;
        if (db == null) return -1;
        return da.compareTo(db);
      });

    return Row(
      children: sorted.map((item) {
      final date = item.dateRegister;
      final weekdayStr = date != null ? _weekdayLabels[date.weekday - 1] : '--';

      return Container(
        width: 44,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              date?.day.toString() ?? '--',
              style: AppStyles.subtitle2.copyWith(
                color: color,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              weekdayStr,
              style: AppStyles.caption2.copyWith(
                color: color,
                fontSize: 9,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }).toList(),
        );
  }
}

//---(_OTDayRow)---//

class _OTDayRow extends StatelessWidget {
  final List<OvertimeItem> items;
  final Color color;
  final bool isEven;

  const _OTDayRow({
    required this.items,
    required this.color,
    required this.isEven,
  });

  static const _weekdayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final first = items.first;
    final timeFormat = DateFormat('HH:mm');

    final weekdayStr = first.timeStart != null
        ? _weekdayLabels[first.timeStart!.weekday - 1]
        : '--';

    final totalHours = items.fold<double>(
      0,
      (sum, item) => sum + (item.timeReality ?? 0),
    );

    final note = items
        .where((i) => i.note != null && i.note!.isNotEmpty)
        .map((i) => i.note)
        .join(', ');

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isEven ? AppColors.white : AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  first.timeStart?.day.toString() ?? '--',
                  style: AppStyles.subtitle2.copyWith(
                    color: color,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  weekdayStr,
                  style: AppStyles.caption2.copyWith(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: items.map((item) {
                    final start = item.timeStart != null
                        ? timeFormat.format(item.timeStart!)
                        : '--:--';
                    final end = item.endTime != null
                        ? timeFormat.format(item.endTime!)
                        : '--:--';
                    return _buildOTChip('$start - $end');
                  }).toList(),
                ),
                if (note.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    note,
                    style: AppStyles.caption2.copyWith(
                      color: AppColors.gray,
                      fontSize: 11,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${totalHours.toStringAsFixed(2)}h',
                style: AppStyles.subtitle2.copyWith(
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (items.length > 1)
                Text(
                  '${items.length} ca',
                  style: AppStyles.caption2.copyWith(
                    color: AppColors.gray,
                    fontSize: 10,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOTChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.stateInfoColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.stateInfoColor.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.stateInfoColor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

//---(_AllowanceDayRow)---//

class _AllowanceDayRow extends StatelessWidget {
  final SalaryFingerDetail detail;
  final Color color;
  final bool isEven;

  const _AllowanceDayRow({
    required this.detail,
    required this.color,
    required this.isEven,
  });

  static const _weekdayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  DateTime? get _date => detail.attendanceDate;
  String get _weekdayStr => _date != null ? _weekdayLabels[_date!.weekday - 1] : '--';
  bool get _isLate => detail.isLate == true || detail.isLateActual == 1;
  bool get _isEarly => detail.isEarly == true || detail.isEarlyActual == 1;

  @override
  Widget build(BuildContext context) {
    final typeLabel = _isLate ? 'Cơm ca' : (_isEarly ? 'Đi sớm' : 'Khai báo');
    final timeLabel = _isLate && detail.timeLate != null && detail.timeLate! > 0
        ? '${detail.timeLate}p'
        : (_isEarly && detail.timeEarly != null && detail.timeEarly! > 0
            ? '${detail.timeEarly}p' : null);

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isEven ? AppColors.white : AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              children: [
                Text(
                  _date?.day.toString() ?? '--',
                  style: AppStyles.subtitle2.copyWith(
                    color: color,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  _weekdayStr,
                  style: AppStyles.caption2.copyWith(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              children: [
                if (detail.checkIn != null)
                  _buildTimeChip('Vào: ${detail.checkIn}', color),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 12, color: color),
                const SizedBox(width: 4),
                Text(
                  timeLabel != null ? '$typeLabel ($timeLabel)' : typeLabel,
                  style: TextStyle(
                    color: color,
                    fontSize: 11,
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

  Widget _buildTimeChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

//---(_DeductionRow & _OtherAdditionRow)---//

class _DeductionItem {
  const _DeductionItem({
    required this.label,
    required this.value,
    required this.formula,
  });
  final String label;
  final double value;
  final String formula;
}

class _DeductionRow extends StatelessWidget {
  final _DeductionItem item;
  final bool isEven;
  final bool isLast;

  const _DeductionRow({
    required this.item,
    required this.isEven,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat('#,##0', 'vi_VN');

    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isEven ? AppColors.white : AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.alert.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: AppStyles.subtitle3.copyWith(
                    color: AppColors.heading,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.formula,
                  style: AppStyles.caption2.copyWith(
                    color: AppColors.gray,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${nf.format(item.value.round())} đ',
            style: AppStyles.subtitle2.copyWith(
              color: AppColors.alert,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _OtherAddDayRow extends StatelessWidget {
  final SalaryFingerDetail detail;
  final Color color;
  final bool isEven;

  const _OtherAddDayRow({
    required this.detail,
    required this.color,
    required this.isEven,
  });

  static const _weekdayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  DateTime? get _date => detail.attendanceDate;
  String get _weekdayStr => _date != null ? _weekdayLabels[_date!.weekday - 1] : '--';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isEven ? AppColors.white : AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              children: [
                Text(
                  _date?.day.toString() ?? '--',
                  style: AppStyles.subtitle2.copyWith(
                    color: color,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  _weekdayStr,
                  style: AppStyles.caption2.copyWith(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              children: [
                if (detail.checkIn != null)
                  _buildTimeChip('Vào: ${detail.checkIn}', AppColors.stateSuccessColor),
                if (detail.checkOut != null) ...[
                  const SizedBox(width: 6),
                  _buildTimeChip('Ra: ${detail.checkOut}', AppColors.stateSuccessColor),
                ],
              ],
            ),
          ),
          if (detail.totalDay != null && detail.totalDay! > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '${detail.totalDay} ngày',
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTimeChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

//---(_DayDetailRow)---//

class _DayDetailRow extends StatelessWidget {
  final SalaryFingerDetail detail;
  final SalaryCardType cardType;
  final bool isEven;

  const _DayDetailRow({
    required this.detail,
    required this.cardType,
    required this.isEven,
  });

  static const _weekdayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  DateTime? get _date => detail.attendanceDate;
  String get _weekdayStr => _date != null ? _weekdayLabels[_date!.weekday - 1] : '--';

  Color get _headerColor {
    if (_hasLate) return AppColors.alert;
    if (_hasEarly) return AppColors.warning;
    if (_hasNoCheck) return AppColors.stateErrorColor;
    if (_hasOvertime) return AppColors.stateInfoColor;
    if (_hasBusiness) return AppColors.secondaryERP;
    if (_hasRegister) return AppColors.primaryERP;
    if (_hasLeave) return AppColors.gray;
    if (_hasWFH) return AppColors.stateSuccessColor;
    return AppColors.stateInfoColor;
  }

  bool get _hasLate => detail.isLate == true || detail.isLateActual == 1;
  bool get _hasEarly => detail.isEarly == true || detail.isEarlyActual == 1;
  bool get _hasNoCheck => detail.isNoCheckIn == 1 || detail.isNoCheckOut == 1 || detail.noFingerprint == true || detail.isNoFinger == 1;
  bool get _hasOvertime => detail.overtime == true;
  bool get _hasBusiness => detail.bussiness == true;
  bool get _hasRegister => detail.isLateRegister == true || detail.isEarlyRegister == true;
  bool get _hasLeave => detail.onLeave == true;
  bool get _hasWFH => detail.wfh == true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isEven ? AppColors.white : AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _headerColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _headerColor.withValues(alpha: 0.08),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: _headerColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _date?.day.toString() ?? '--',
                        style: AppStyles.subtitle1.copyWith(
                          color: _headerColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        _weekdayStr,
                        style: AppStyles.caption2.copyWith(
                          color: _headerColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    children: [
                      if (detail.checkIn != null)
                        _buildTimeChip('Vào: ${detail.checkIn}', _getCheckInColor()),
                      if (detail.checkOut != null) ...[
                        const SizedBox(width: 6),
                        _buildTimeChip('Ra: ${detail.checkOut}', _getCheckOutColor()),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: _buildTags(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTags() {
    final tags = <Widget>[];

    if (_hasLate) {
      tags.add(_buildTag(
        'Đi muộn${detail.timeLate != null && detail.timeLate! > 0 ? ' ${detail.timeLate}p' : ''}',
        AppColors.alert,
        Icons.arrow_upward,
      ));
    }

    if (_hasEarly) {
      tags.add(_buildTag(
        'Về sớm${detail.timeEarly != null && detail.timeEarly! > 0 ? ' ${detail.timeEarly}p' : ''}',
        AppColors.warning,
        Icons.arrow_downward,
      ));
    }

    if (detail.isNoCheckIn == 1) {
      tags.add(_buildTag('Không check-in', AppColors.alert, Icons.login));
    }

    if (detail.isNoCheckOut == 1) {
      tags.add(_buildTag('Không check-out', AppColors.alert, Icons.logout));
    }

    if (detail.noFingerprint == true || detail.isNoFinger == 1) {
      tags.add(_buildTag('Quên chấm công', AppColors.stateErrorColor, Icons.fingerprint));
    }

    if (_hasOvertime) {
      tags.add(_buildTag('Làm thêm giờ', AppColors.stateInfoColor, Icons.access_time));
    }

    if (_hasBusiness) {
      tags.add(_buildTag('Công tác', AppColors.secondaryERP, Icons.directions_car));
    }

    if (_hasRegister) {
      if (detail.isLateRegister == true) {
        tags.add(_buildTag('Khai báo đi muộn', AppColors.primaryERP, Icons.warning_amber));
      }
      if (detail.isEarlyRegister == true) {
        tags.add(_buildTag('Khai báo về sớm', AppColors.primaryERP, Icons.warning_amber));
      }
    }

    if (_hasLeave) {
      tags.add(_buildTag(
        'Nghỉ${detail.totalDay != null ? ' ${detail.totalDay} ngày' : ''}',
        AppColors.gray,
        Icons.event_busy,
      ));
    }

    if (_hasWFH) {
      tags.add(_buildTag(
        'WFH${detail.totalDay != null ? ' ${detail.totalDay} ngày' : ''}',
        AppColors.stateSuccessColor,
        Icons.home_work,
      ));
    }

    if (detail.holidayDay != null && detail.holidayDay! > 0) {
      tags.add(_buildTag('Ngày lễ/Tết', AppColors.primaryERP, Icons.celebration));
    }

    return tags;
  }

  Widget _buildTag(String label, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Color _getCheckInColor() {
    if (detail.isNoCheckIn == 1) return AppColors.alert;
    if (_hasLate) return AppColors.warning;
    return AppColors.stateSuccessColor;
  }

  Color _getCheckOutColor() {
    if (detail.isNoCheckOut == 1) return AppColors.alert;
    if (_hasEarly) return AppColors.warning;
    return AppColors.stateSuccessColor;
  }
}
