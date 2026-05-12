import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../data/datasource/models/timekeeping_model.dart';
import '../bloc/timekeeping_bloc.dart';
import 'widgets/timekeeping_month_picker.dart';
import 'widgets/timekeeping_day_cell.dart';

class TimekeepingScreen extends StatefulWidget {
  const TimekeepingScreen({super.key});

  @override
  State<TimekeepingScreen> createState() => _TimekeepingScreenState();
}

class _TimekeepingScreenState
    extends BaseState<TimekeepingScreen, TimekeepingEvent, TimekeepingState,
        TimekeepingBloc> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(const TimekeepingEvent.init());
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Chấm công', style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      body: BlocBuilder<TimekeepingBloc, TimekeepingState>(
        builder: (context, state) {
          if (state.status == BaseStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () async => bloc.add(const TimekeepingEvent.refresh()),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMonthBar(state),
                  const SizedBox(height: 16),
                  _buildCalendar(state),
                  const SizedBox(height: 16),
                  _buildSummaryRow(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //---(_Month Bar)---//
  Widget _buildMonthBar(TimekeepingState state) {
    final monthLabel = state.selectedMonth != null
        ? DateFormat('MM/yyyy', 'vi_VN').format(state.selectedMonth!)
        : 'Chọn tháng';

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => TimekeepingMonthPicker.show(
        context,
        selectedMonth: state.selectedMonth,
        onApply: (month) => bloc.add(TimekeepingEvent.changeMonth(month)),
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
                    'Tháng chấm công',
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
                '${state.actualWorkDays.toInt()} công',
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

  //---(_Summary Row)---//
  Widget _buildSummaryRow(TimekeepingState state) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            color: AppColors.primaryERP.withValues(alpha: 0.05),
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
            child: Row(
              children: [
                Text(
                  'Tổng hợp',
                  style: AppStyles.subtitle3.copyWith(
                    color: AppColors.primaryERP,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  '${state.totalDays.toInt()} ngày',
                  style: AppStyles.subtitle3.copyWith(
                    color: AppColors.primaryERP,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          _buildStatRow('Đi làm thực tế', state.actualWorkDays, AppColors.stateSuccessColor),
          _buildStatRow('Nghỉ lễ, Tết', state.holidayDays + state.tetDays, AppColors.warning),
          _buildStatRow('Nghỉ phép', state.leaveDays, AppColors.secondaryERP),
          _buildStatRow('Việc riêng có lương', state.privatePaidDays, AppColors.primaryERP),
          _buildStatRow('WFH', state.wfhDays, AppColors.stateInfoColor),
          _buildStatRow('Nghỉ không lương', state.unpaidLeaveDays, AppColors.alert),
          const Divider(height: 1, indent: 16, endIndent: 16),
          Container(
            color: AppColors.stateSuccessColor.withValues(alpha: 0.07),
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
            child: Row(
              children: [
                Text(
                  'Công được hưởng',
                  style: AppStyles.body2.copyWith(
                    color: AppColors.stateSuccessColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  '${state.paidWorkDays.toInt()} ngày',
                  style: AppStyles.subtitle3.copyWith(
                    color: AppColors.stateSuccessColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: AppStyles.caption2.copyWith(color: AppColors.label),
            ),
          ),
          Text(
            '${value.toInt()}',
            style: AppStyles.body2.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  //---(_Calendar)---//
  Widget _buildCalendar(TimekeepingState state) {
    final days = state.days;
    final firstDay = state.firstDayOfMonth ?? DateTime.now();
    final lastDay = state.lastDayOfMonth ?? DateTime.now();
    final totalDays = lastDay.day;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            color: AppColors.secondaryERP.withValues(alpha: 0.05),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
            child: Row(
              children: [
                Text(
                  'Bảng chấm công',
                  style: AppStyles.subtitle3.copyWith(
                    color: AppColors.secondaryERP,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  '${totalDays} ngày',
                  style: AppStyles.body2.copyWith(
                    color: AppColors.secondaryERP,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: _buildCalendarWeeks(days, totalDays, firstDay),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCalendarWeeks(
    List<TimekeepingDayItem> days,
    int totalDays,
    DateTime firstDayOfMonth,
  ) {
    final weeks = <Widget>[];

    // Header row: T2 T3 T4 T5 T6 T7 CN
    weeks.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          children: ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'].map((d) {
            final isWeekend = d == 'T6' || d == 'CN';
            return Expanded(
              child: Center(
                child: Text(
                  d,
                  style: AppStyles.caption2.copyWith(
                    color: isWeekend ? AppColors.alert : AppColors.gray,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );

    int currentDay = 1;
    while (currentDay <= totalDays) {
      final weekCells = <Widget>[];

      // weekday 1 = Monday (T2), 7 = Sunday (CN)
      final startWeekday = firstDayOfMonth.weekday;
      for (int col = 1; col <= 7; col++) {
        if ((currentDay == 1 && col < startWeekday) || currentDay > totalDays) {
          weekCells.add(const Expanded(child: SizedBox(height: 52)));
        } else {
          final dayIndex = currentDay - 1;
          final dayItem = dayIndex < days.length ? days[dayIndex] : null;
          weekCells.add(
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: TimekeepingDayCell(
                  day: currentDay,
                  date: DateTime(firstDayOfMonth.year, firstDayOfMonth.month, currentDay),
                  dayItem: dayItem,
                ),
              ),
            ),
          );
          currentDay++;
        }
      }

      weeks.add(Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(children: weekCells),
      ));

      if (currentDay > totalDays) break;
    }

    return weeks;
  }
}
