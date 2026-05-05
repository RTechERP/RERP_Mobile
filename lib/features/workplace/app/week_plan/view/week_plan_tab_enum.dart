/// 6-step enum cho màn tạo công việc với easy_stepper.
enum WeekPlanAddStep {
  projectInfo(0, 'TT chung'),
  content(1, 'Nội dung'),
  subTask(2, 'CV con'),
  checklist(3, 'Checklist'),
  attachment(4, 'Đính kèm'),
  incident(5, 'Phát sinh');

  const WeekPlanAddStep(this.step, this.label);

  final int step;
  final String label;
}
