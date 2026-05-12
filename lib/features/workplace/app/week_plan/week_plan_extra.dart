

import 'data/datasource/models/week_plan_model.dart';

/// Data truyền từ WeekPlanScreen qua route extra.
/// Chứa projects/taskTypes/employees đã fetch sẵn để dùng ngay trên màn add/detail.
class WeekPlanAddExtra {
  const WeekPlanAddExtra({
    required this.projects,
    required this.taskTypes,
    required this.employees,
    this.projectTypes = const [],
  });

  final List<ProjectTaskItem> projects;
  final List<TaskTypeItem> taskTypes;
  final List<EmployeeTaskItem> employees;
  final List<ProjectTypeItem> projectTypes;
}
