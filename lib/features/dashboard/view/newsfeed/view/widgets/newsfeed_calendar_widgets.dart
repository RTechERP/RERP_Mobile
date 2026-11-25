import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'newsfeed_calendar_markers.dart';
import 'newsfeed_season_theme.dart';

/// Thanh điều hướng tháng, nằm ở đầu thẻ lịch.
///
/// Dùng nền nhạt để hòa vào thẻ lịch thay vì tách thành một khối riêng,
/// giúp giao diện gọn và thao tác chuyển tháng nhanh hơn.
class CalendarToolbar extends StatelessWidget {
  final int selectedMonth;
  final int selectedYear;
  final VoidCallback? onPreviousMonth;
  final VoidCallback? onNextMonth;
  final VoidCallback? onPickMonthYear;

  const CalendarToolbar({
    super.key,
    required this.selectedMonth,
    required this.selectedYear,
    this.onPreviousMonth,
    this.onNextMonth,
    this.onPickMonthYear,
  });

  @override
  Widget build(BuildContext context) {
    final palette = SeasonPaletteScope.of(context);
    final monthLabel = DateFormat(
      'MMMM yyyy',
      'vi_VN',
    ).format(DateTime(selectedYear, selectedMonth));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: palette.primary.withValues(alpha: 0.08),
        border: Border.all(color: palette.primary.withValues(alpha: 0.16)),
      ),
      child: Row(
        children: [
          _RoundIconButton(
            icon: Icons.chevron_left,
            palette: palette,
            onTap: onPreviousMonth,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onPickMonthYear,
              child: Column(
                children: [
                  Text(
                    monthLabel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: palette.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Chạm để chọn tháng và năm',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.5,
                      color: palette.onSurface.withValues(alpha: 0.65),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          _RoundIconButton(
            icon: Icons.chevron_right,
            palette: palette,
            onTap: onNextMonth,
          ),
        ],
      ),
    );
  }
}

/// Nút tròn điều hướng tháng, tô theo màu mùa.
class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.palette,
    this.onTap,
  });

  final IconData icon;
  final SeasonPalette palette;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withValues(alpha: 0.75),
          border: Border.all(color: palette.primary.withValues(alpha: 0.20)),
        ),
        child: Icon(icon, color: palette.primary, size: 20),
      ),
    );
  }
}

/// Chú giải trạng thái ngày trong lịch làm việc.
class HolidayLegend extends StatelessWidget {
  const HolidayLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = SeasonPaletteScope.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: palette.surface,
        border: Border.all(color: palette.primary.withValues(alpha: 0.15)),
      ),
      // Chia đều 3 cột cho chú giải, các mục nằm thẳng hàng và cân nhau.
      child: Row(
        children: [
          for (var i = 0; i < CalendarMarkerTypeLegend.legendTypes.length; i++)
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: _LegendItem(
                  type: CalendarMarkerTypeLegend.legendTypes[i],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Một mục trong chú giải, dùng chung huy hiệu với ô lịch.
class _LegendItem extends StatelessWidget {
  const _LegendItem({required this.type});

  final CalendarMarkerType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CalendarMarkerBadge(type: type, size: 18),
        const SizedBox(width: 6),
        Text(
          type.label,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: SeasonPaletteScope.of(context).onSurface,
          ),
        ),
      ],
    );
  }
}
