import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/salary_model.dart';

class FingerPrintDayRow extends StatefulWidget {
  final SalaryFingerDetail detail;
  final int index;
  final List<DateTime> holidays;
  final List<DateTime> workSaturdays;

  const FingerPrintDayRow({
    super.key,
    required this.detail,
    required this.index,
    required this.holidays,
    required this.workSaturdays,
  });

  @override
  State<FingerPrintDayRow> createState() => _FingerPrintDayRowState();
}

class _FingerPrintDayRowState extends State<FingerPrintDayRow> {
  bool _expanded = false;

  static const _weekdayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  bool get _isHolidayOrWeekend {
    final d = widget.detail.attendanceDate;
    if (d == null) return false;
    // Sunday is always weekend
    if (d.weekday == DateTime.sunday) return true;
    // Saturday: red if in workSaturdays (work Saturday), black if not (normal Saturday)
    if (d.weekday == DateTime.saturday) {
      return widget.workSaturdays.any((ws) => DateUtils.isSameDay(ws, d));
    }
    // T2-T6: only red if in holidays list
    return widget.holidays.any((h) => DateUtils.isSameDay(h, d));
  }

  bool get _isToday {
    final d = widget.detail.attendanceDate;
    if (d == null) return false;
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }

  String get _dayOfWeekLabel {
    final d = widget.detail.attendanceDate;
    if (d == null) return '--';
    return _weekdayLabels[d.weekday - 1];
  }

  List<_TagItem> get _activeTags {
    final d = widget.detail;
    final tags = <_TagItem>[];

    final isHoliday = _isHolidayOrWeekend;

    // Đi muộn: chỉ hiển thị khi isLate = true VÀ KHÔNG phải ngày nghỉ
    if (d.isLate == true && !isHoliday) {
      tags.add(_TagItem(
        'Đi muộn',
        d.timeLate != null && d.timeLate! > 0
            ? '${d.timeLate} phút'
            : null,
        AppColors.alert,
        Icons.arrow_upward,
        _TagGroup.red,
      ));
    }
    // Về sớm: chỉ hiển thị khi isEarly = true VÀ KHÔNG phải ngày nghỉ
    if (d.isEarly == true && !isHoliday) {
      tags.add(_TagItem(
        'Về sớm',
        d.timeEarly != null && d.timeEarly! > 0
            ? '${d.timeEarly} phút'
            : null,
        AppColors.warning,
        Icons.arrow_downward,
        _TagGroup.red,
      ));
    }
    if (d.overtime == true) {
      tags.add(_TagItem('Làm thêm', null, AppColors.stateInfoColor, Icons.access_time, _TagGroup.blue));
    }
    if (d.bussiness == true) {
      tags.add(_TagItem('Công tác', null, AppColors.secondaryERP, Icons.directions_car, _TagGroup.blue));
    }
    // Khai báo quên: chỉ hiển thị khi đã đăng ký VÀ noFingerprint = true
    if ((d.isLateRegister == true || d.isEarlyRegister == true) && d.noFingerprint == true) {
      tags.add(_TagItem(
        'Khai báo quên',
        null,
        AppColors.primaryERP,
        Icons.warning_amber,
        _TagGroup.red,
      ));
    }
    if (d.onLeave == true) {
      tags.add(_TagItem(
        'Nghỉ',
        d.totalDay != null ? '${d.totalDay} Ngày' : null,
        AppColors.gray,
        Icons.event_busy,
        _TagGroup.gray,
      ));
    }
    if (d.wfh == true) {
      tags.add(_TagItem(
        'WFH',
        d.totalDay != null ? '${d.totalDay} Ngày' : null,
        AppColors.stateSuccessColor,
        Icons.home_work,
        _TagGroup.blue,
      ));
    }
    // Quên CC: dựa vào response model (noFingerprint, isNoFinger, isNoCheckIn, isNoCheckOut)
    if (d.noFingerprint == true || d.isNoFinger == 1 || d.isNoCheckIn == 1 || d.isNoCheckOut == 1) {
      tags.add(_TagItem('Quên CC', null, AppColors.alert, Icons.fingerprint, _TagGroup.red));
    }

    return tags;
  }

  bool get _hasAnyTag => _activeTags.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final d = widget.detail;
    final date = d.attendanceDate;
    final dayStr = date != null ? DateFormat('dd').format(date) : '--';
    final monthStr = date != null ? DateFormat('MM').format(date) : '--';

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: _hasAnyTag ? () => setState(() => _expanded = !_expanded) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: _isToday
                ? AppColors.primaryERP.withValues(alpha: 0.05)
                : (_isHolidayOrWeekend)
                    ? AppColors.bgCard
                    : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: _isToday
                ? Border.all(color: AppColors.primaryERP.withValues(alpha: 0.3), width: 1)
                : Border.all(color: AppColors.borderColor.withValues(alpha: 0.5), width: 0.5),
          ),
          child: Column(
            children: [
              _buildHeader(dayStr, monthStr),
              if (_expanded) _buildTagSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String dayStr, String monthStr) {
    final d = widget.detail;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          // Date + Weekday
          SizedBox(
            width: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      dayStr,
                      style: AppStyles.subtitle1.copyWith(
                        color: (_isHolidayOrWeekend)
                            ? AppColors.alert
                            : AppColors.heading,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '/$monthStr',
                      style: AppStyles.caption2.copyWith(
                        color: AppColors.gray,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: (_isHolidayOrWeekend)
                        ? AppColors.alert.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _dayOfWeekLabel,
                    style: AppStyles.caption2.copyWith(
                      color: (_isHolidayOrWeekend)
                          ? AppColors.alert
                          : AppColors.gray,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Check-in / Check-out
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildTimeCell('Vào', d.checkIn, d.isLate),
                ),
                Container(
                  width: 1,
                  height: 32,
                  color: AppColors.borderColor.withValues(alpha: 0.5),
                ),
                Expanded(
                  child: _buildTimeCell('Ra', d.checkOut, d.isEarly),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Status indicator column
          if (_hasAnyTag) ...[
            _buildStatusIndicator(),
            const SizedBox(width: 4),
            Icon(
              _expanded ? Icons.expand_less : Icons.expand_more,
              size: 18,
              color: AppColors.gray,
            ),
          ] else
            Icon(
              Icons.check_circle,
              size: 18,
              color: AppColors.stateSuccessColor.withValues(alpha: 0.6),
            ),
        ],
      ),
    );
  }

  String _formatTime(String? time) {
    if (time == null || time.isEmpty) return '--:--';
    // Handle both HH:mm and HH:mm:ss formats
    if (time.length >= 5) {
      return time.substring(0, 5);
    }
    return time;
  }

  Widget _buildTimeCell(String label, String? time, bool? isHighlight) {
    final formattedTime = _formatTime(time);
    final hasTime = formattedTime != '--:--';
    final isHoliday = _isHolidayOrWeekend;
    // Không hiển thị màu đỏ cho thời gian khi là ngày nghỉ
    final effectiveHighlight = isHighlight == true && !isHoliday ? true : false;
    final color = effectiveHighlight
        ? AppColors.alert
        : hasTime
            ? AppColors.heading
            : AppColors.hintText;

    return Column(
      children: [
        Text(
          label,
          style: AppStyles.caption2.copyWith(
            color: AppColors.gray,
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            formattedTime,
            style: AppStyles.subtitle3.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusIndicator() {
    final tags = _activeTags;
    final count = tags.length;

    // Ưu tiên hiển thị theo nhóm: đỏ > xanh nước biển > xám
    final hasRed = tags.any((t) => t.group == _TagGroup.red);
    final hasBlue = tags.any((t) => t.group == _TagGroup.blue);

    Color color;
    if (hasRed) {
      color = AppColors.alert;
    } else if (hasBlue) {
      color = AppColors.stateInfoColor;
    } else {
      color = AppColors.gray;
    }

    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$count',
          style: AppStyles.subtitle3.copyWith(
            color: color,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Widget _buildTagSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: AppColors.borderColor.withValues(alpha: 0.5),
            height: 12,
          ),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: _activeTags.map((tag) => _buildTag(tag)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(_TagItem tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: tag.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: tag.color.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(tag.icon, size: 12, color: tag.color),
          const SizedBox(width: 4),
          Text(
            tag.label,
            style: AppStyles.caption2.copyWith(
              color: tag.color,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
          if (tag.subLabel != null) ...[
            const SizedBox(width: 4),
            Text(
              tag.subLabel!,
              style: AppStyles.caption2.copyWith(
                color: tag.color.withValues(alpha: 0.7),
                fontSize: 10,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

enum _TagGroup { red, blue, gray }

class _TagItem {
  final String label;
  final String? subLabel;
  final Color color;
  final IconData icon;
  final _TagGroup group;

  const _TagItem(this.label, this.subLabel, this.color, this.icon, this.group);
}
