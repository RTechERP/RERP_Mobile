import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/salary_model.dart';

class FingerPrintSummaryItem {
  final String label;
  final int count;
  final Color color;
  final IconData icon;

  const FingerPrintSummaryItem(this.label, this.count, this.color, this.icon);
}

class FingerPrintSummaryCard extends StatelessWidget {
  final List<FingerPrintSummaryItem> items;
  final List<SalaryFingerDetail> problemDays;
  final EdgeInsets? padding;

  const FingerPrintSummaryCard({
    super.key,
    required this.items,
    required this.problemDays,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: padding ?? const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGridSummary(),
          if (problemDays.isNotEmpty) ...[
            const SizedBox(height: 8),
            _buildProblemDayChips(),
          ],
        ],
      ),
    );
  }

  Widget _buildGridSummary() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.info_outline_rounded, size: 16, color: AppColors.primaryERP),
            const SizedBox(width: 6),
            Text(
              'Tổng quan',
              style: AppStyles.subtitle3.copyWith(
                color: AppColors.primaryERP,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 1.1,
          children: items.map((item) => _SummaryChip(item: item)).toList(),
        ),
      ],
    );
  }

  Widget _buildProblemDayChips() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.warning_amber_rounded, size: 16, color: AppColors.alert),
            const SizedBox(width: 6),
            Text(
              'Lịch sử thông tin',
              style: AppStyles.subtitle3.copyWith(
                color: AppColors.primaryERP,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.alert.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${problemDays.length} ngày',
                style: AppStyles.caption2.copyWith(
                  color: AppColors.alert,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: problemDays.map((d) => _ProblemDayChip(detail: d)).toList(),
        ),
      ],
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final FingerPrintSummaryItem item;

  const _SummaryChip({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: item.color.withValues(alpha: 0.2),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(item.icon, size: 16, color: item.color),
          ),
          const SizedBox(height: 2),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${item.count}',
              style: AppStyles.subtitle3.copyWith(
                color: item.color,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 1),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              item.label,
              style: AppStyles.caption2.copyWith(
                color: AppColors.label,
                fontSize: 9,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProblemDayChip extends StatelessWidget {
  final SalaryFingerDetail detail;

  const _ProblemDayChip({required this.detail});

  static const _weekdayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  bool get _isWeekend {
    final d = detail.attendanceDate;
    return d != null && d.weekday == 7;
  }

  String get _dateLabel {
    final d = detail.attendanceDate;
    if (d == null) return '--';
    final day = DateFormat('dd').format(d);
    final wd = _weekdayLabels[d.weekday - 1];
    return '$day ($wd)';
  }

  List<_ProblemTag> get _tags {
    final tags = <_ProblemTag>[];

    if (detail.isLate == true) {
      tags.add(_ProblemTag(
        'Đi muộn',
        detail.timeLate != null && detail.timeLate! > 0
            ? '${detail.timeLate!.toInt()}phút'
            : null,
        AppColors.alert,
        Icons.arrow_upward,
      ));
    }
    if (detail.isEarly == true) {
      tags.add(_ProblemTag(
        'Về sớm',
        detail.timeEarly != null && detail.timeEarly! > 0
            ? '${detail.timeEarly!.toInt()}phút'
            : null,
        AppColors.warning,
        Icons.arrow_downward,
      ));
    }
    if (detail.overtime == true) {
      tags.add(_ProblemTag('Làm thêm', null, AppColors.stateInfoColor, Icons.access_time));
    }
    if (detail.bussiness == true) {
      tags.add(_ProblemTag('Công tác', null, AppColors.secondaryERP, Icons.directions_car));
    }
    if (detail.isLateRegister == true || detail.isEarlyRegister == true) {
      tags.add(_ProblemTag('Khai báo', null, AppColors.primaryERP, Icons.warning_amber));
    }
    if (detail.onLeave == true) {
      tags.add(_ProblemTag('Nghỉ', null, AppColors.gray, Icons.event_busy));
    }
    if (detail.wfh == true) {
      tags.add(_ProblemTag('WFH', null, AppColors.stateSuccessColor, Icons.home_work));
    }
    if (detail.noFingerprint == true ||
        detail.isNoFinger == 1 ||
        detail.isNoCheckIn == 1 ||
        detail.isNoCheckOut == 1) {
      tags.add(_ProblemTag('Quên CC', null, AppColors.alert, Icons.fingerprint));
    }

    return tags;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _isWeekend
              ? AppColors.alert.withValues(alpha: 0.3)
              : AppColors.borderColor.withValues(alpha: 0.5),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _dateLabel,
            style: AppStyles.caption2.copyWith(
              color: _isWeekend ? AppColors.alert : AppColors.heading,
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
          ),
          if (_tags.isNotEmpty) ...[
            Container(
              width: 1,
              height: 16,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              color: AppColors.borderColor.withValues(alpha: 0.4),
            ),
            ..._tags.map(
              (t) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(t.icon, size: 12, color: t.color),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ProblemTag {
  final String label;
  final String? subLabel;
  final Color color;
  final IconData icon;

  const _ProblemTag(this.label, this.subLabel, this.color, this.icon);
}
