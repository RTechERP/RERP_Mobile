import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/newsfeed_model.dart';

class CalendarToolbar extends StatelessWidget {
  final int selectedMonth;
  final int selectedYear;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final VoidCallback onPickMonthYear;

  const CalendarToolbar({
    super.key,
    required this.selectedMonth,
    required this.selectedYear,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onPickMonthYear,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.82),
                Colors.white.withValues(alpha: 0.60),
              ],
            ),
            border: Border.all(color: Colors.white.withValues(alpha: 0.52)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14EE4623),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              _GlassIconButton(icon: Icons.chevron_left, onTap: onPreviousMonth),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: onPickMonthYear,
                  child: Column(
                    children: [
                      Text(
                        'Tháng $selectedMonth / $selectedYear',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.heading,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Chạm để chọn tháng và năm',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _GlassIconButton(icon: Icons.chevron_right, onTap: onNextMonth),
            ],
          ),
        ),
      ),
    );
  }
}

class HolidayLegend extends StatelessWidget {
  final int count;

  const HolidayLegend({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withValues(alpha: 0.72),
            border: Border.all(color: Colors.white.withValues(alpha: 0.52)),
          ),
          child: Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE1E1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFFFB5B5)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Màu đỏ là ngày nghỉ • $count ngày trong tháng',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.heading,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalendarMonthCard extends StatelessWidget {
  final DateTime monthDate;
  final Map<int, HolidayItem> holidaysByDay;
  final bool isLoading;

  const CalendarMonthCard({
    super.key,
    required this.monthDate,
    required this.holidaysByDay,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final days = _buildCalendarDays(monthDate);
    const weekDays = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.84),
                Colors.white.withValues(alpha: 0.60),
              ],
            ),
            border: Border.all(color: Colors.white.withValues(alpha: 0.56)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: weekDays
                    .map(
                      (day) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            day,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.gray,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: days.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.02,
                ),
                itemBuilder: (context, index) {
                  final date = days[index];
                  if (date == null) {
                    return const SizedBox.shrink();
                  }

                  final isToday = _isSameDay(date, DateTime.now());
                  final isCurrentMonth = date.month == monthDate.month;
                  final holiday = holidaysByDay[date.day];
                  final isHoliday = holiday != null;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: isHoliday
                          ? const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFFFF0F0), Color(0xFFFFDDDD)],
                            )
                          : LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withValues(alpha: 0.74),
                                Colors.white.withValues(alpha: 0.40),
                              ],
                            ),
                      border: Border.all(
                        color: isHoliday
                            ? const Color(0xFFFFB6B6)
                            : isToday
                                ? AppColors.primaryERP.withValues(alpha: 0.35)
                                : Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${date.day}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: isHoliday
                                  ? const Color(0xFFD14545)
                                  : isCurrentMonth
                                      ? AppColors.heading
                                      : AppColors.gray,
                            ),
                          ),
                          const SizedBox(height: 2),
                          if (isLoading && holidaysByDay.isEmpty)
                            Container(
                              width: 18,
                              height: 4,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE7EAF2),
                                borderRadius: BorderRadius.circular(999),
                              ),
                            )
                          else if (isHoliday)
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Color(0xFFD14545),
                                shape: BoxShape.circle,
                              ),
                            )
                          else
                            const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DateTime?> _buildCalendarDays(DateTime monthDate) {
    final firstDay = DateTime(monthDate.year, monthDate.month, 1);
    final daysInMonth = DateTime(monthDate.year, monthDate.month + 1, 0).day;
    final leadingEmpty = firstDay.weekday - 1;
    final totalCells = ((leadingEmpty + daysInMonth) / 7).ceil() * 7;

    return List.generate(totalCells, (index) {
      final dayNumber = index - leadingEmpty + 1;
      if (dayNumber < 1 || dayNumber > daysInMonth) return null;
      return DateTime(monthDate.year, monthDate.month, dayNumber);
    });
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _GlassIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white.withValues(alpha: 0.52),
          border: Border.all(color: Colors.white.withValues(alpha: 0.45)),
        ),
        child: Icon(icon, color: AppColors.heading),
      ),
    );
  }
}
