import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/leave_model.dart';


class LeaveTimeStatsSection extends StatelessWidget {
  const LeaveTimeStatsSection({
    super.key,
    required this.stat,
    required this.showLoading,
  });

  final LeaveTimeItem? stat;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    String formatLeaveStat(num? v) {
      if (v == null) return '0';
      // Kiểm tra nếu là số nguyên (2.0, 3.0, ...) → hiển thị int
      // Nếu có phần thập phân (0.5, 1.5, 0.50, ...) → hiển thị double
      final intVal = v.toInt();
      final isWhole = (v - intVal).abs() < 0.001;
      return isWhole ? intVal.toString() : v.toString();
    }

    return Column(
      children: [
        if (showLoading)
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Center(child: CircularProgressIndicator()),
          ),
        FormLeftBorderCard(
          borderColor: AppColors.primaryERP,
          backgroundColor: AppColors.white,
          borderWidth: 4,
          child: Row(
            children: [
              Icon(
                Icons.calendar_month_rounded,
                color: AppColors.primaryERP,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Phép còn lại (Năm)',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
              Text(
                formatLeaveStat(stat?.totalDayOnleaveActual),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryERP,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: FormLeftBorderCard(
                borderColor: Colors.orange,
                backgroundColor: AppColors.white,
                borderWidth: 4,
                child: Row(
                  children: [
                    const Icon(
                      Icons.send_time_extension_rounded,
                      color: Colors.orange,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Xin nghỉ (Tháng)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Text(
                      formatLeaveStat(stat?.totalDay),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FormLeftBorderCard(
                borderColor: Colors.green,
                backgroundColor: AppColors.white,
                borderWidth: 4,
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Đã duyệt (Tháng)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Text(
                      formatLeaveStat(stat?.totalDayApproved),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: FormLeftBorderCard(
                borderColor: AppColors.black,
                backgroundColor: AppColors.white,
                borderWidth: 4,
                child: Row(
                  children: [
                    const Icon(
                      Icons.pending_actions_rounded,
                      color: AppColors.black,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Chưa duyệt (Tháng)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Text(
                      formatLeaveStat(stat?.totalDayUnApproved),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FormLeftBorderCard(
                borderColor: AppColors.blueA500,
                backgroundColor: AppColors.white,
                borderWidth: 4,
                child: Row(
                  children: [
                    Icon(
                      Icons.event_available_rounded,
                      color: AppColors.blueA500,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Phép còn lại (Tháng)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Text(
                      formatLeaveStat(stat?.totalDayRemain),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueA500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
