part of 'week_plan_bloc.dart';

@freezed
class WeekPlanEvent with _$WeekPlanEvent {
  //---(Menu)---//
  const factory WeekPlanEvent.initMenu() = _InitMenu;

  //---(Screen)---//
  const factory WeekPlanEvent.initScreen() = _InitScreen;

  /// Khởi tạo dữ liệu cho màn Dashboard. Gọi API getTask với viewNumber = 1
  /// (Công việc của tôi) để thống kê theo trạng thái & loại công việc.
  const factory WeekPlanEvent.initDashboard() = _InitDashboard;

  const factory WeekPlanEvent.initScreenWithView(int viewNumber) = _InitScreenWithView;

  const factory WeekPlanEvent.changeView(int viewNumber) = _ChangeView;

  const factory WeekPlanEvent.refresh() = _Refresh;

  const factory WeekPlanEvent.search(String keyword) = _Search;

  const factory WeekPlanEvent.clearSearch() = _ClearSearch;

  const factory WeekPlanEvent.filterByStatuses(List<String> statuses) = _FilterByStatuses;

  const factory WeekPlanEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory WeekPlanEvent.clearDateFilter() = _ClearDateFilter;

  const factory WeekPlanEvent.checkIn(int taskId, bool isCheck) = _CheckIn;

  //---(Add Screen)---//
  const factory WeekPlanEvent.initAddScreen() = _InitAddScreen;

  const factory WeekPlanEvent.initDetailScreen({required int taskId}) = _InitDetailScreen;

  const factory WeekPlanEvent.changeStep(int step) = _ChangeStep;

  // Step 1: Thông tin dự án
  const factory WeekPlanEvent.updateHeaderProject({
    required int projectId,
    required String projectName,
  }) = _UpdateHeaderProject;

  const factory WeekPlanEvent.updateHeaderParentTask({
    required int parentTaskId,
    required String parentTaskName,
  }) = _UpdateHeaderParentTask;

  const factory WeekPlanEvent.updateHeaderAssigner({
    required int assignerId,
    required String assignerName,
  }) = _UpdateHeaderAssigner;

  const factory WeekPlanEvent.updateHeaderPersonalTask(bool isPersonal) =
      _UpdateHeaderPersonalTask;

  const factory WeekPlanEvent.updateHeaderComplexity(int complexity) =
      _UpdateHeaderComplexity;

  const factory WeekPlanEvent.updateHeaderPriority(int priority) =
      _UpdateHeaderPriority;

  const factory WeekPlanEvent.updateHeaderStatus({
    required int statusId,
    required String statusName,
  }) = _UpdateHeaderStatus;

  const factory WeekPlanEvent.updateHeaderTimeEstimate(double? timeEstimate) =
      _UpdateHeaderTimeEstimate;

  const factory WeekPlanEvent.updateHeaderTaskCategory({
    required int categoryId,
    required String categoryName,
  }) = _UpdateHeaderTaskCategory;

  const factory WeekPlanEvent.updateHeaderWorkTypeAndStatus({
    required int workTypeId,
    required String workTypeName,
    required int statusId,
    required String statusName,
  }) = _UpdateHeaderWorkTypeAndStatus;

  const factory WeekPlanEvent.fetchTaskTypes() = _FetchTaskTypes;

  const factory WeekPlanEvent.fetchProjects() = _FetchProjects;

  const factory WeekPlanEvent.fetchProjectTypes() = _FetchProjectTypes;

  const factory WeekPlanEvent.fetchEmployees() = _FetchEmployees;

  const factory WeekPlanEvent.fetchParentProjectTasks({
    required int projectId,
    required bool isPersonalProject,
  }) = _FetchParentProjectTasks;

  // Step 2: Nội dung chính
  const factory WeekPlanEvent.updateContentTaskName(String name) =
      _UpdateContentTaskName;

  const factory WeekPlanEvent.updateContentAssignee({
    required int assigneeId,
    required String assigneeName,
  }) = _UpdateContentAssignee;

  const factory WeekPlanEvent.updateContentAssigner({
    required int assignerId,
    required String assignerName,
  }) = _UpdateContentAssigner;

  const factory WeekPlanEvent.updateContentDates({
    DateTime? startDate,
    DateTime? endDate,
    DateTime? actualStartDate,
    DateTime? actualEndDate,
    DateTime? deadline,
  }) = _UpdateContentDates;

  const factory WeekPlanEvent.updateContentDescription(String description) =
      _UpdateContentDescription;

  const factory WeekPlanEvent.updateContentResult(String result) =
      _UpdateContentResult;

  const factory WeekPlanEvent.updateContentReasonSolution(String reasonSolution) =
      _UpdateContentReasonSolution;

  /// Cập nhật địa điểm làm việc (-1=chưa chọn, 0=Hà Nội, 1=Đan Phượng, 2=Khác)
  /// và giá trị nhập tay khi chọn Khác.
  const factory WeekPlanEvent.updateContentWorkplace({
    required int value,
    String? otherText,
  }) = _UpdateContentWorkplace;

  // Step 3: Người thực hiện (multi-select)
  const factory WeekPlanEvent.setAssignees(List<EmployeeTaskItem> assignees) =
      _SetAssignees;

  const factory WeekPlanEvent.addAssignee(EmployeeTaskItem employee) =
      _AddAssignee;

  const factory WeekPlanEvent.removeAssignee(int employeeId) =
      _RemoveAssignee;

  // Step 4: Người liên quan (multi-select)
  const factory WeekPlanEvent.setRelatedPersons(
      List<EmployeeTaskItem> persons) = _SetRelatedPersons;

  const factory WeekPlanEvent.addRelatedPerson(EmployeeTaskItem employee) =
      _AddRelatedPerson;

  const factory WeekPlanEvent.removeRelatedPerson(int employeeId) =
      _RemoveRelatedPerson;

  // Step 5: Công việc con
  const factory WeekPlanEvent.addSubTaskWithData(WeekPlanSubTaskItem subTask) =
      _AddSubTaskWithData;

  const factory WeekPlanEvent.updateSubTask(int index, WeekPlanSubTaskItem subTask) =
      _UpdateSubTask;

  const factory WeekPlanEvent.removeSubTask(int index) = _RemoveSubTask;

  // Step 6: Checklist
  const factory WeekPlanEvent.fetchChecklists({required int taskId}) = _FetchChecklists;

  /// Cap nhat local state cua detail checklist (toggle/edit) — chi update
  /// state, khong goi API. API chi duoc goi khi bam nut "Cap nhat".
  const factory WeekPlanEvent.updateDetailChecklistItem({
    required int checklistId,
    String? checklistTitle,
    int? orderIndex,
    bool? isDone,
  }) = _UpdateDetailChecklistItem;

  const factory WeekPlanEvent.updateChecklistItemOnServer({
    required int checklistId,
    required String checklistTitle,
    required int orderIndex,
    required bool isDone,
  }) = _UpdateChecklistItemOnServer;

  const factory WeekPlanEvent.addChecklistItem(String item) = _AddChecklistItem;

  const factory WeekPlanEvent.updateChecklistItem(int index, String item) =
      _UpdateChecklistItem;

  const factory WeekPlanEvent.toggleChecklistDone(int index) =
      _ToggleChecklistDone;

  const factory WeekPlanEvent.removeChecklistItem(int index) =
      _RemoveChecklistItem;

  const factory WeekPlanEvent.markChecklistDeleted({
    required int checklistId,
  }) = _MarkChecklistDeleted;

  // Step 7: Tệp đính kèm
  const factory WeekPlanEvent.addAttachment(WeekPlanAttachmentItem attachment) =
      _AddAttachment;

  const factory WeekPlanEvent.removeAttachment(int index) =
      _RemoveAttachment;

  // Step 7b: Link đính kèm
  const factory WeekPlanEvent.addLink(WeekPlanLinkItem link) = _AddLink;

  const factory WeekPlanEvent.removeLink(int index) = _RemoveLink;

  // Step 8: Phát sinh
  const factory WeekPlanEvent.addIncident() = _AddIncident;

  const factory WeekPlanEvent.updateIncident(int index, WeekPlanIncidentItem incident) =
      _UpdateIncident;

  const factory WeekPlanEvent.removeIncident(int index) = _RemoveIncident;

  const factory WeekPlanEvent.toggleIncidentExpand(int index) =
      _ToggleIncidentExpand;

  // Pause
  const factory WeekPlanEvent.updatePauseReason(String? reason) =
      _UpdatePauseReason;

  /// Khóa/mở khóa trường Deadline. Sau khi lưu lần đầu sẽ tự động lock; chỉ
  /// người giao việc mới có thể mở khóa để sửa.
  const factory WeekPlanEvent.setDeadlineLocked(bool locked) =
      _SetDeadlineLocked;

  // Submit
  const factory WeekPlanEvent.createTask() = _CreateTask;

  /// Submit từ màn detail — copy logic từ createTask, dùng để phân biệt flow
  /// tạo mới vs cập nhật trong UI (navigate/refresh khác nhau).
  const factory WeekPlanEvent.editTask() = _EditTask;

  const factory WeekPlanEvent.clearSubmitState() = _ClearSubmitState;

  const factory WeekPlanEvent.clearCheckInState() = _ClearCheckInState;

  // Upload file
  const factory WeekPlanEvent.uploadFiles({
    required List<String> filePaths,
    required String subPath,
  }) = _UploadFiles;

  const factory WeekPlanEvent.clearUploadedFiles() = _ClearUploadedFiles;

  // Timeline
  const factory WeekPlanEvent.fetchTimelineData({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _FetchTimelineData;
}
