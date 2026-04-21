/// 6 tab step-by-step cho màn tạo công việc.
enum WeekPlanAddTab {
  content(0, 'Nội dung chính'),
  assignee(1, 'Người thực hiện'),
  related(2, 'Người liên quan'),
  subTask(3, 'Công việc con'),
  checklist(4, 'Checklist'),
  attach(5, 'Đính kèm'),

  problem(6, 'Phát sinh');

  const WeekPlanAddTab(this.step, this.label);

  final int step;
  final String label;
}
