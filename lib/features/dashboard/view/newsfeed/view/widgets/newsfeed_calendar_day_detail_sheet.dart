import 'package:flutter/material.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/newsfeed_model.dart';
import 'newsfeed_calendar_markers.dart';
import 'newsfeed_season_theme.dart';

/// Bottom sheet chi tiết một ngày trong lịch làm việc.
///
/// Gộp ngày nghỉ (từ API `holidays`) và sự kiện công ty (từ API
/// `companyEvents`) của ngày được chọn.
class CalendarDayDetailSheet extends StatelessWidget {
  const CalendarDayDetailSheet({
    super.key,
    required this.date,
    required this.holidays,
    required this.companyEvents,
    this.isWorkSaturday = false,
    this.isOffSaturday = false,
  });

  /// Ngày dương lịch được chọn.
  final DateTime date;

  /// Các ngày nghỉ của ngày này.
  final List<HolidayItem> holidays;

  /// Các sự kiện công ty của ngày này.
  final List<CompanyEventItem> companyEvents;

  /// Ngày này là thứ bảy được làm việc.
  ///
  /// Khi đúng, ngày này không hiển thị trạng thái ngày nghỉ dù API có
  /// trả về holiday cho thứ bảy đó.
  final bool isWorkSaturday;

  /// Ngày này là thứ bảy nghỉ (đã khai báo đi làm nhưng bị từ chối).
  final bool isOffSaturday;

  /// Mở bottom sheet chi tiết cho ngày [date].
  static Future<void> show(
    BuildContext context, {
    required DateTime date,
    required List<HolidayItem> holidays,
    required List<CompanyEventItem> companyEvents,
    bool isWorkSaturday = false,
    bool isOffSaturday = false,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CalendarDayDetailSheet(
        date: date,
        holidays: holidays,
        companyEvents: companyEvents,
        isWorkSaturday: isWorkSaturday,
        isOffSaturday: isOffSaturday,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = SeasonPaletteScope.of(context);
    final dateText =
        '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/${date.year}';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.gray.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          palette.primary.withValues(alpha: 0.20),
                          palette.secondary.withValues(alpha: 0.12),
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      palette.emoji,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ngày $dateText',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                            color: palette.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Mùa ${palette.label} • ${palette.subtitle}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: palette.onSurface.withValues(alpha: 0.65),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (holidays.isEmpty &&
                  companyEvents.isEmpty &&
                  !isWorkSaturday &&
                  !isOffSaturday) ...[
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: palette.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Ngày này không có ngày nghỉ hay sự kiện nào được đánh dấu.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: palette.onSurface,
                    ),
                  ),
                ),
              ],
              if (isWorkSaturday) ...[
                const SizedBox(height: 14),
                _DetailTile(
                  type: CalendarMarkerType.workSaturday,
                  title: 'Đi làm',
                  subtitle: 'Thứ bảy làm việc',
                  note: 'Ngày này được sắp xếp làm việc, không phải ngày nghỉ.',
                ),
              ],
              if (isOffSaturday) ...[
                const SizedBox(height: 14),
                _DetailTile(
                  type: CalendarMarkerType.dayOff,
                  title: 'Ngày nghỉ',
                  subtitle: 'Thứ bảy nghỉ',
                  note:
                      'Thứ bảy này được khai báo đi làm nhưng không được duyệt, '
                      'nên vẫn là ngày nghỉ.',
                ),
              ],
              for (final holiday in holidays) ...[
                const SizedBox(height: 14),
                _DetailTile(
                  type: holiday.isUnpaid
                      ? CalendarMarkerType.dayOff
                      : CalendarMarkerType.paidHoliday,
                  title: _holidayName(holiday),
                  subtitle: _holidayType(holiday),
                  note: holiday.note?.trim(),
                ),
              ],
              for (final event in companyEvents) ...[
                const SizedBox(height: 14),
                _DetailTile(
                  type: CalendarMarkerType.companyEvent,
                  title: _eventName(event),
                  subtitle: _eventType(event),
                  note: event.note?.trim(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _holidayName(HolidayItem holiday) {
    final name = holiday.holidayName?.trim();
    return name != null && name.isNotEmpty ? name : 'Ngày nghỉ';
  }

  String _holidayType(HolidayItem holiday) {
    final type = holiday.typeHolidayText?.trim();
    return type != null && type.isNotEmpty ? type : 'Ngày nghỉ';
  }

  String _eventName(CompanyEventItem event) {
    final name = event.name?.trim();
    return name != null && name.isNotEmpty ? name : 'Sự kiện công ty';
  }

  String _eventType(CompanyEventItem event) {
    final type = event.typeText?.trim();
    return type != null && type.isNotEmpty ? type : 'Sự kiện công ty';
  }
}

/// Một dòng thông tin ngày nghỉ hoặc sự kiện công ty.
class _DetailTile extends StatelessWidget {
  const _DetailTile({
    required this.type,
    required this.title,
    required this.subtitle,
    this.note,
  });

  final CalendarMarkerType type;
  final String title;
  final String subtitle;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final palette = SeasonPaletteScope.of(context);
    final accent = type.color;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accent.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarMarkerBadge(type: type, size: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: palette.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: accent,
                  ),
                ),
                if (note != null && note!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    note!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.4,
                      color: palette.onSurface.withValues(alpha: 0.70),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
