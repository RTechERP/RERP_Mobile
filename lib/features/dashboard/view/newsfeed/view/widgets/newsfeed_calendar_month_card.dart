import 'package:flutter/material.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/newsfeed_model.dart';
import 'newsfeed_calendar_markers.dart';
import 'newsfeed_calendar_widgets.dart';
import 'newsfeed_season_theme.dart';

/// Lưới lịch tháng theo dương lịch.
///
/// Ô ngày được đánh dấu theo dữ liệu API: ngày nghỉ, sự kiện công ty và
/// thứ bảy được làm việc.
class CalendarMonthCard extends StatelessWidget {
  final DateTime monthDate;
  final Map<int, List<HolidayItem>> holidaysByDay;
  final Map<int, List<CompanyEventItem>> companyEventsByDay;
  final Set<int> workSaturdayDays;
  final Set<int> offSaturdayDays;
  final bool isLoading;
  final ValueChanged<DateTime>? onTapDay;
  final VoidCallback? onPreviousMonth;
  final VoidCallback? onNextMonth;
  final VoidCallback? onPickMonthYear;

  const CalendarMonthCard({
    super.key,
    required this.monthDate,
    required this.holidaysByDay,
    required this.companyEventsByDay,
    required this.workSaturdayDays,
    this.offSaturdayDays = const {},
    required this.isLoading,
    this.onTapDay,
    this.onPreviousMonth,
    this.onNextMonth,
    this.onPickMonthYear,
  });

  @override
  Widget build(BuildContext context) {
    final days = _buildCalendarDays(monthDate);
    const weekDays = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    final palette = SeasonPaletteScope.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: palette.cardGradient,
          ),
          border: Border.all(color: Colors.white.withValues(alpha: 0.7)),
          boxShadow: [
            BoxShadow(
              color: palette.primary.withValues(alpha: 0.10),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Bề rộng ô của lưới: giữ đúng công thức của
            // SliverGridDelegateWithFixedCrossAxisCount để tiêu đề thứ trong
            // tuần thẳng hàng với cột lịch.
            const gap = 8.0;
            final cellWidth = (constraints.maxWidth - gap * 6) / 7;

            return Column(
              children: [
                // Thanh điều hướng tháng nằm ngay trong thẻ lịch để gọn
                // và dễ thao tác hơn so với một thanh công cụ riêng.
                CalendarToolbar(
                  selectedMonth: monthDate.month,
                  selectedYear: monthDate.year,
                  onPreviousMonth: onPreviousMonth,
                  onNextMonth: onNextMonth,
                  onPickMonthYear: onPickMonthYear,
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    for (var i = 0; i < weekDays.length; i++) ...[
                      if (i > 0) const SizedBox(width: gap),
                      SizedBox(
                        width: cellWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            weekDays[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: palette.onSurface.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: days.length,
                  // Ô vuông vừa đủ cho số ngày và dấu hiệu, tránh tràn dọc
                  // trên màn hình hẹp hoặc khi người dùng tăng cỡ chữ.
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: gap,
                    crossAxisSpacing: gap,
                    childAspectRatio: 0.92,
                  ),
                  itemBuilder: (context, index) {
                    final date = days[index];
                    if (date == null) return const SizedBox.shrink();

                    final holiday = holidaysByDay[date.day];
                    final companyEvents = companyEventsByDay[date.day];
                    final isWorkSaturday = workSaturdayDays.contains(date.day);
                    final isOffSaturday = offSaturdayDays.contains(date.day);

                    return _DayCell(
                      date: date,
                      holidays: holiday,
                      companyEvents: companyEvents,
                      isWorkSaturday: isWorkSaturday,
                      isOffSaturday: isOffSaturday,
                      isToday: _isSameDay(date, DateTime.now()),
                      palette: palette,
                      isLoading: isLoading && holidaysByDay.isEmpty,
                      onTap: onTapDay == null ? null : () => onTapDay!(date),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Lập danh sách các ô của lưới, `null` cho ngày ngoài tháng đang xem.
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

/// Một ô ngày trong lưới lịch.
class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.date,
    required this.holidays,
    required this.companyEvents,
    required this.isWorkSaturday,
    required this.isOffSaturday,
    required this.isToday,
    required this.palette,
    required this.isLoading,
    this.onTap,
  });

  final DateTime date;
  final List<HolidayItem>? holidays;
  final List<CompanyEventItem>? companyEvents;
  final bool isWorkSaturday;
  final bool isOffSaturday;
  final bool isToday;
  final SeasonPalette palette;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final markerTypes = _resolveMarkers();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: _backgroundFor(markerTypes),
            border: Border.all(
              color: _borderColorFor(markerTypes),
              width: isToday ? 1.4 : 1,
            ),
          ),
          // FittedBox co nội dung vừa khít ô lịch, tránh tràn khi
          // font lớn hoặc màn hình nhỏ.
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _dayNumberColor(markerTypes),
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 16,
                  child: isLoading
                      ? Container(
                          width: 16,
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE7EAF2),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        )
                      : _DayMarkers(types: markerTypes),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Các loại đánh dấu của ngày này.
  ///
  /// Thứ bảy được làm việc ghi đè ngày nghỉ, vì ngày đó nhân viên vẫn đi làm.
  List<CalendarMarkerType> _resolveMarkers() {
    if (isWorkSaturday) return const [CalendarMarkerType.workSaturday];

    final types = <CalendarMarkerType>{};
    // Thứ bảy được khai báo đi làm nhưng bị từ chối thì vẫn là ngày nghỉ.
    if (isOffSaturday) types.add(CalendarMarkerType.dayOff);
    for (final holiday in holidays ?? const <HolidayItem>[]) {
      types.add(
        holiday.isUnpaid
            ? CalendarMarkerType.dayOff
            : CalendarMarkerType.paidHoliday,
      );
    }
    if (companyEvents != null && companyEvents!.isNotEmpty) {
      types.add(CalendarMarkerType.companyEvent);
    }
    return types.toList();
  }

  /// Màu chữ của số ngày.
  ///
  /// Ngày nghỉ và nghỉ lễ cùng dùng màu đỏ.
  Color _dayNumberColor(List<CalendarMarkerType> types) {
    if (types.contains(CalendarMarkerType.paidHoliday) ||
        types.contains(CalendarMarkerType.dayOff)) {
      return CalendarMarkerType.paidHoliday.color;
    }
    if (types.contains(CalendarMarkerType.workSaturday)) {
      return CalendarMarkerType.workSaturday.color;
    }
    if (types.contains(CalendarMarkerType.companyEvent)) {
      return CalendarMarkerType.companyEvent.color;
    }
    return AppColors.heading;
  }

  /// Nền của ô ngày.
  ///
  /// Ngày nghỉ và nghỉ lễ cùng dùng nền đỏ.
  Gradient _backgroundFor(List<CalendarMarkerType> types) {
    if (types.contains(CalendarMarkerType.paidHoliday) ||
        types.contains(CalendarMarkerType.dayOff)) {
      return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFFF0F0), Color(0xFFFFDDDD)],
      );
    }
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withValues(alpha: 0.80),
        Colors.white.withValues(alpha: 0.45),
      ],
    );
  }

  /// Viền của ô ngày.
  Color _borderColorFor(List<CalendarMarkerType> types) {
    if (types.contains(CalendarMarkerType.paidHoliday) ||
        types.contains(CalendarMarkerType.dayOff)) {
      return const Color(0xFFFFB6B6);
    }
    if (isToday) return palette.primary.withValues(alpha: 0.55);
    return Colors.white.withValues(alpha: 0.55);
  }
}

/// Hàng huy hiệu nhỏ báo trạng thái của một ngày trong lịch.
class _DayMarkers extends StatelessWidget {
  const _DayMarkers({required this.types});

  final List<CalendarMarkerType> types;

  @override
  Widget build(BuildContext context) {
    if (types.isEmpty) return const SizedBox.shrink();

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < types.length; i++) ...[
          if (i > 0) const SizedBox(width: 2),
          CalendarMarkerBadge(type: types[i], size: 16),
        ],
      ],
    );
  }
}
