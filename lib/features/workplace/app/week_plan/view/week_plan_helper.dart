import '../data/datasource/models/week_plan_model.dart';

/// Lấy nhãn trạng thái hiển thị cho task.
String weekPlanStatusLabel(WeekPlanTaskItem task) {
  final t = (task.statusText ?? '').trim();
  if (t.isNotEmpty) return t;

  switch (task.status) {
    case 0:
    case 1:
      return 'Chưa bắt đầu';
    case 2:
      return 'Đang thực hiện';
    case 3:
      return 'Hoàn thành';
    case 4:
      return 'Quá hạn';
    default:
      return 'Không xác định';
  }
}
