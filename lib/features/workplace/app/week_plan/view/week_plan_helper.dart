import 'package:flutter/material.dart';

import '../../../../../common/app_theme/index.dart';
import '../data/datasource/models/week_plan_model.dart';

/// Kiểm tra task có quá hạn không.
///
/// So sánh effectiveEndDate với PlanEndDate:
/// - actualEndDate nếu có, không thì DateTime.now()
/// vs PlanEndDate (hoặc DateTime.now() nếu null).
///
/// Nếu effectiveEndDate > PlanEndDate → quá hạn.
bool weekPlanIsOverdue(WeekPlanTaskItem task) {
  final effectiveEnd = task.actualEndDate ?? DateTime.now();
  final planEnd = task.planEndDate ?? DateTime.now();
  return effectiveEnd.isAfter(planEnd);
}

/// Lấy màu border trái / badge theo trạng thái.
Color weekPlanStatusColor(WeekPlanTaskItem task) {
  final isOverdue = weekPlanIsOverdue(task);

  switch (task.status) {
    case 2:
      return isOverdue
          ? AppColors.primaryERP.withValues(alpha: 0.8)
          : AppColors.stateSuccessColor;
    case 1:
      return isOverdue ? AppColors.alert : AppColors.stateInfoColor;
    case 3:
      return AppColors.warning;
    case 0:
      return isOverdue ? AppColors.alert : AppColors.gray;
    default:
      return AppColors.gray;
  }
}

/// Lấy màu badge theo loại công việc (Bug, Task, Issue Log, Improvement, ...).
Color weekPlanTypeColor(WeekPlanTaskItem task) {
  final name = (task.projectTaskTypeName ?? '').toLowerCase();
  if (name.contains('bug')) {
    return const Color(0xFFD32F2F); // Bug - đỏ
  }
  if (name.contains('task')) {
    return const Color(0xFF1976D2); // Task - xanh dương
  }
  if (name.contains('issue')) {
    return const Color(0xFF7B1FA2); // Issue Log - tím
  }
  if (name.contains('improvement')) {
    return const Color(0xFF388E3C); // Improvement - xanh lá
  }
  if (name.contains('sub')) {
    return const Color(0xFFFF9800); // Sub Task - cam
  }
  return AppColors.warning;
}

/// Lấy nhãn trạng thái hiển thị cho task.
///
/// Lấy từ API (task.statusText) nếu có, không thì dùng hardcoded.
/// Quá hạn = ActualEndDate > effectiveEndDate (PlanEndDate hoặc DateTime.now()).
String weekPlanStatusLabel(WeekPlanTaskItem task) {
  final isOverdue = weekPlanIsOverdue(task);
  final apiLabel = task.statusText;

  if (isOverdue) {
    if (apiLabel != null && apiLabel.isNotEmpty) {
      return '$apiLabel Overdue';
    }
    // Fallback hardcoded
    switch (task.status) {
      case 0:
        return 'Not Started Overdue';
      case 1:
        return 'In Progress Overdue';
      case 2:
        return 'Done Overdue';
      case 3:
        return 'Pending Overdue';
      default:
        return 'Unknown Overdue';
    }
  }

  if (apiLabel != null && apiLabel.isNotEmpty) {
    return apiLabel;
  }

  // Fallback hardcoded khi không có statusText từ API
  switch (task.status) {
    case 0:
      return 'Not Started';
    case 1:
      return 'In Progress';
    case 2:
      return 'Done';
    case 3:
      return 'Pending';
    default:
      return 'Unknown';
  }
}
