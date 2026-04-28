import 'package:flutter/material.dart';

import '../../../../../common/app_theme/index.dart';
import '../data/datasource/models/week_plan_model.dart';


/// Lấy màu border trái / badge theo trạng thái.
Color weekPlanStatusColor(WeekPlanTaskItem task) {
  final isOverdue = task.deadline != null &&
      DateTime.now().isAfter(task.deadline!) &&
      task.status != 3;

  switch (task.status) {
    case 3:
      return AppColors.stateSuccessColor;
    case 2:
      return isOverdue ? AppColors.alert : AppColors.stateInfoColor;
    case 4:
      return AppColors.alert;
    case 1:
      return isOverdue ? AppColors.alert : AppColors.gray;
    default:
      return AppColors.warning;
  }
}

/// Kiểm tra task có quá hạn không.
bool weekPlanIsOverdue(WeekPlanTaskItem task) {
  if (task.deadline == null) return false;
  return DateTime.now().isAfter(task.deadline!) && task.status != 3;
}

/// Lấy màu badge theo loại công việc (Bug, Task, Improvement, ...).
Color weekPlanTypeColor(WeekPlanTaskItem task) {
  switch (task.projectTaskTypeId) {
    case 1:
      return const Color(0xFFD32F2F); // Bug - đỏ
    case 2:
      return const Color(0xFF1976D2); // Task - xanh dương
    case 3:
      return const Color(0xFF388E3C); // Improvement - xanh lá
    default:
      return AppColors.warning;
  }
}

/// Lấy nhãn trạng thái hiển thị cho task.
String weekPlanStatusLabel(WeekPlanTaskItem task) {
  final t = (task.statusText ?? '').trim();
  if (t.isNotEmpty) return t;

  final isOverdue = task.deadline != null &&
      DateTime.now().isAfter(task.deadline!) &&
      task.status != 3;

  switch (task.status) {
    case 1:
      return isOverdue ? 'Chưa làm quá hạn' : 'Chưa làm';
    case 2:
      return isOverdue ? 'Đang làm quá hạn' : 'Đang làm';
    case 3:
      return 'Hoàn thành';
    default:
      return 'Không xác định';
  }
}
