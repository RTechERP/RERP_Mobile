import 'package:flutter/material.dart';

import '../../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../../common/utils/dialog/index.dart';

class OverviewRecord extends StatelessWidget {
  final int totalWorkDay;
  final int overtimeHour;
  final int lateEarlyCount;
  final int offDay;

  const OverviewRecord({
    super.key,
    required this.totalWorkDay,
    required this.overtimeHour,
    required this.lateEarlyCount,
    required this.offDay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.grey_bg,
        borderRadius: BorderRadius.circular(12), // ✅ bo tròn 4 góc
      ),
      child: Row(
        children: [
          _Record(
            value: totalWorkDay.toString(),
            label: 'Tổng công\n(ngày)',
            color: Colors.green,
            onTap: () {
              DialogService.showOverall(
                context: context,
                contentWidget: _RecordItem(
                  title: "Tổng công hưởng lương",
                  number: 0,
                  suffix: 'ngày',
                ),
              );
            },
          ),
          _Record(
            value: overtimeHour.toString(),
            label: 'Làm thêm\n(giờ)',
            color: Colors.blue,
            onTap: () {
              DialogService.showOverall(
                context: context,
                contentWidget: Column(
                  children: [
                    _RecordItem(
                      title: "Tổng giờ đã làm thêm",
                      number: 0,
                      suffix: 'Giờ',
                    ),
                    const SizedBox(height: 12),
                    _RecordItem(
                      title: "Tổng giờ làm thêm (Đã nhân hệ số)",
                      number: 0,
                      suffix: 'Giờ',
                    ),
                  ],
                ),
              );
            },
          ),
          _Record(
            value: lateEarlyCount.toString(),
            label: 'Đi muộn/\nVề sớm (lần)',
            color: Colors.orange,
            onTap: () {
              DialogService.showOverall(
                context: context,
                contentWidget: Column(
                  children: [
                    _RecordItem(
                      title: "Tổng số lần đi muộn, về sớm",
                      number: 0,
                      suffix: 'Lần',
                    ),
                    const SizedBox(height: 12),
                    _RecordItem(
                      title: "Tổng thời gian đi muộn, về sớm",
                      number: 0,
                      suffix: 'Giờ',
                    ),
                  ],
                ),
              );
            },
          ),
          _Record(
            value: offDay.toString(),
            label: 'Nghỉ\n(ngày)',
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class _Record extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _Record({
    required this.value,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecordItem extends StatelessWidget {
  final String title;
  final num number;
  final String? suffix; // ví dụ: ngày, giờ, lần

  const _RecordItem({
    required this.title,
    required this.number,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    final displayValue = suffix != null
        ? '${number.toString()} $suffix'
        : number.toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              AppStyles.caption1,
        ),
        const SizedBox(width: 20),
        Text(
          displayValue,
          style:

              AppStyles.caption1,
        ),
      ],
    );
  }
}
