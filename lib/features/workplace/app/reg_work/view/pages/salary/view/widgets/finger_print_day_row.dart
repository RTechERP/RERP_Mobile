import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/salary_model.dart';

class FingerPrintDayRow extends StatefulWidget {
  final SalaryFingerDetail detail;
  final int index;

  const FingerPrintDayRow({
    super.key,
    required this.detail,
    required this.index,
  });

  @override
  State<FingerPrintDayRow> createState() => _FingerPrintDayRowState();
}

class _FingerPrintDayRowState extends State<FingerPrintDayRow> {
  bool _expanded = false;

  static const _weekdayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  bool get _isWeekend {
    final d = widget.detail.attendanceDate;
    if (d == null) return false;
    return d.weekday == 7;
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

    if (d.isLate == true) {
      tags.add(_TagItem(
        'Đi muộn',
        d.timeLate != null && d.timeLate! > 0
            ? '${d.timeLate} phút'
            : null,
        AppColors.alert,
        Icons.arrow_upward,
      ));
    }
    if (d.isEarly == true) {
      tags.add(_TagItem(
        'Về sớm',
        d.timeEarly != null && d.timeEarly! > 0
            ? '${d.timeEarly} phút'
            : null,
        AppColors.warning,
        Icons.arrow_downward,
      ));
    }
    if (d.overtime == true) {
      tags.add(_TagItem('Làm thêm', null, AppColors.stateInfoColor, Icons.access_time));
    }
    if (d.bussiness == true) {
      tags.add(_TagItem('Công tác', null, AppColors.secondaryERP, Icons.directions_car));
    }
    if (d.isLateRegister == true || d.isEarlyRegister == true) {
      tags.add(_TagItem(
        'Khai báo quen',
        null,
        AppColors.primaryERP,
        Icons.warning_amber,
      ));
    }
    if (d.onLeave == true) {
      tags.add(_TagItem(
        'Nghỉ',
        d.totalDay != null ? '${d.totalDay} Ngày' : null,
        AppColors.gray,
        Icons.event_busy,
      ));
    }
    if (d.wfh == true) {
      tags.add(_TagItem(
        'WFH',
        d.totalDay != null ? '${d.totalDay} Ngày' : null,
        AppColors.stateSuccessColor,
        Icons.home_work,
      ));
    }
    if (d.noFingerprint == true || d.isNoFinger == 1 || d.isNoCheckIn == 1 || d.isNoCheckOut == 1) {
      tags.add(_TagItem('Quên CC', null, AppColors.alert, Icons.fingerprint));
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
                : widget.index.isEven
                    ? AppColors.white
                    : AppColors.bgCard,
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
                        color: _isWeekend ? AppColors.alert : AppColors.heading,
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
                    color: _isWeekend
                        ? AppColors.alert.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _dayOfWeekLabel,
                    style: AppStyles.caption2.copyWith(
                      color: _isWeekend ? AppColors.alert : AppColors.gray,
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

  Widget _buildTimeCell(String label, String? time, bool? isHighlight) {
    final hasTime = time != null && time.isNotEmpty;
    final color = isHighlight == true
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
            hasTime ? time : '--:--',
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
    final count = _activeTags.length;
    final colors = _activeTags.map((t) => t.color).toList();
    final uniqueColors = colors.toSet().toList();

    if (uniqueColors.length == 1) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: uniqueColors.first.withValues(alpha: 0.12),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$count',
            style: AppStyles.subtitle3.copyWith(
              color: uniqueColors.first,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        children: [
          for (int i = 0; i < count.clamp(0, 3); i++)
            Positioned(
              left: i * 8.0,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: colors[i].withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors[i].withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: i == 0
                      ? Text(
                          '$count',
                          style: TextStyle(
                            color: colors[i],
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      : null,
                ),
              ),
            ),
        ],
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

class _TagItem {
  final String label;
  final String? subLabel;
  final Color color;
  final IconData icon;

  const _TagItem(this.label, this.subLabel, this.color, this.icon);
}
