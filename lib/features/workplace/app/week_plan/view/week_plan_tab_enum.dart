/// 6-step enum cho màn tạo công việc với easy_stepper.
///
/// Khi loại công việc là "TT Chung", step [reasonSolution] được chèn vào
/// sau [projectInfo] (index 1), nâng tổng số step lên 7.
enum WeekPlanAddStep {
  projectInfo(0, 'TT chung'),
  reasonSolution(1, 'Sự cố/K.phục'),
  content(2, 'Nội dung'),
  subTask(3, 'CV con'),
  checklist(4, 'Checklist'),
  attachment(5, 'Đính kèm'),
  incident(6, 'Phát sinh');

  const WeekPlanAddStep(this.step, this.label);

  final int step;
  final String label;

  /// Returns step labels cho EasyStepper.
  /// Nếu [isTTChung] = true, chèn thêm "NNhân/Xlý" sau "TT chung".
  static List<String> stepLabels({required bool isTTChung}) {
    if (isTTChung) {
      return [
        projectInfo.label,
        reasonSolution.label,
        content.label,
        subTask.label,
        checklist.label,
        attachment.label,
        incident.label,
      ];
    }
    return [
      projectInfo.label,
      content.label,
      subTask.label,
      checklist.label,
      attachment.label,
      incident.label,
    ];
  }

  /// Tổng số step — 7 nếu là TT Chung, 6 otherwise.
  static int totalSteps({required bool isTTChung}) =>
      isTTChung ? 7 : 6;
}
