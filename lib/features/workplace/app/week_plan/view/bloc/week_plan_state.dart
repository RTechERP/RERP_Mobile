part of 'week_plan_bloc.dart';

@CopyWith()
class WeekPlanState extends BaseBlocState {
  /// viewNumber: 1 = Công việc của tôi, 2 = Công việc liên quan,
  ///             3 = Công việc tôi giao, -1 = Tổng công việc.
  final int viewNumber;

  final List<WeekPlanTaskItem> myTasks;
  final List<WeekPlanTaskItem> relatedTasks;
  final List<WeekPlanTaskItem> assignedTasks;
  final List<WeekPlanTaskItem> allTasks;

  final String searchKeyword;
  final List<String> selectedStatuses;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  final int? employeeId;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool checkInSuccess;
  final int? checkInTaskId;
  final bool? checkInTaskNewValue;

  // Step 1: Thông tin dự án
  final int? headerProjectId;
  final String? headerProjectName;
  final int? headerParentTaskId;
  final String? headerParentTaskName;
  final int? headerAssignerId;
  final String? headerAssignerName;
  final bool headerIsPersonalTask;
  final int headerComplexity;
  final int? headerTaskCategory;
  final String? headerTaskCategoryName;
  final int? headerWorkType;
  final String? headerWorkTypeName;
  final int? headerStatus;
  final String? headerStatusName;
  final int headerPriority; // 0=Bình thường, 1=Trung, 2=Cao, 3=Khẩn cấp
  final double? headerTimeEstimate; // giờ

  // Danh sách loại công việc (từ API /ProjectTask/project-task-type)
  final List<TaskTypeItem> taskTypes;

  // Danh sách dự án (từ API /ProjectTask/get-all-project)
  final List<ProjectTaskItem> projects;

  // Danh sách hạng mục dự án (từ API /WorkItem/get-type-project-item)
  final List<ProjectTypeItem> projectTypes;

  // Danh sách nhân viên (từ API /Employee) - dùng cho 3 trường employee
  final List<EmployeeTaskItem> employees;

  // Danh sách công việc cha (từ API /ProjectTask/list-project-task)
  final List<ParentProjectTaskItem> parentProjectTasks;

  // Step 2: Nội dung chính
  final String? taskName;
  final int? contentAssigneeId;
  final String? contentAssigneeName;
  final int? contentAssignerId;
  final String? contentAssignerName;
  final DateTime? contentStartDate;
  final DateTime? contentEndDate;
  final DateTime? contentActualStartDate;
  final DateTime? contentActualEndDate;
  final DateTime? contentDeadline;
  final String? contentDescription;
  final String? contentResult;
  /// Lý do / phương án xử lý — hiển thị khi loại công việc là "TT Chung".
  final String? contentReasonSolution;

  /// Địa điểm làm việc: -1=chưa chọn, 0=Hà Nội, 1=Đan Phượng, 2=Khác.
  final int contentWorkplace;
  /// Giá trị nhập tay khi contentWorkplace = 2 (Khác).
  final String? contentWorkplaceOther;

  // Step 3: Người thực hiện (multi-select)
  final List<EmployeeTaskItem> selectedAssignees;

  // Step 4: Người liên quan (multi-select)
  final List<EmployeeTaskItem> selectedRelatedPersons;

  // Step 5: Công việc con
  final List<WeekPlanSubTaskItem> subTasks;

  // Step 6: Checklist (form — local list)
  final List<String> checklistItems;
  final List<bool> checklistDone;

  /// Checklist tu API GET /ProjectTask/{taskId}/Checklists — dung o step Checklist cua detail screen.
  final List<ChecklistWeekPlanResponse> detailChecklists;

  /// Danh sach ID cua checklist da bi xoa boi user — se goi DELETE /ProjectTask/Checklists/{id} sau khi submit thanh cong.
  final List<int> deletedChecklistIds;

  // Step 7: Tệp đính kèm
  final List<WeekPlanAttachmentItem> attachments;

  // Danh sách file đã upload lên server (sau khi gọi API upload)
  final List<UploadAttachmentResponse> uploadedAttachmentFiles;

  // Step 7b: Link đính kèm
  final List<WeekPlanLinkItem> links;

  // Step 8: Phát sinh
  final List<WeekPlanIncidentItem> incidents;
  /// Index cua incident dang duoc expand (-1 = tat ca collapsed).
  final int expandedIncidentIndex;

  // Add/Detail screen step tracking
  final int currentStep;

  /// Task ID đang xem chi tiết. Null = màn add mới.
  final int? detailTaskId;

  /// Lý do tạm dừng — bắt buộc nhập khi chuyển status = 3 (Pending).
  final String? pauseReason;

  /// Cờ khóa Deadline sau lần lưu đầu tiên. Khi true, Deadline chỉ người
  /// giao việc (assigner) mới có quyền sửa. Reset = false khi tạo mới.
  final bool isDeadlineLocked;

  const WeekPlanState({
    required super.status,
    super.message,
    this.viewNumber = 1,
    this.myTasks = const [],
    this.relatedTasks = const [],
    this.assignedTasks = const [],
    this.allTasks = const [],
    this.searchKeyword = '',
    this.selectedStatuses = const ['Chưa làm', 'Đang làm'],
    this.dateStart,
    this.dateEnd,
    this.employeeId,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.checkInSuccess = false,
    this.checkInTaskId,
    this.checkInTaskNewValue,
    // Step 1
    this.headerProjectId,
    this.headerProjectName,
    this.headerParentTaskId,
    this.headerParentTaskName,
    this.headerAssignerId,
    this.headerAssignerName,
    this.headerIsPersonalTask = false,
    this.headerComplexity = 1,
    this.headerTaskCategory,
    this.headerTaskCategoryName,
    this.headerWorkType,
    this.headerWorkTypeName,
    this.headerStatus,
    this.headerStatusName,
    this.headerPriority = 0, // 0=Bình thường, 1=Trung, 2=Cao, 3=Khẩn cấp
    this.headerTimeEstimate,
        this.taskTypes = const [],
        this.projects = const [],
        this.projectTypes = const [],
        this.employees = const [],
        this.parentProjectTasks = const [],
        // Step 2
    this.taskName,
    this.contentAssigneeId,
    this.contentAssigneeName,
    this.contentAssignerId,
    this.contentAssignerName,
    this.contentStartDate,
    this.contentEndDate,
    this.contentActualStartDate,
    this.contentActualEndDate,
        this.contentDeadline,
    this.contentDescription,
    this.contentResult,
    this.contentReasonSolution,
    this.contentWorkplace = -1,
    this.contentWorkplaceOther,
        // Step 3
    this.selectedAssignees = const [],
    // Step 4
    this.selectedRelatedPersons = const [],
    // Step 5
    this.subTasks = const [],
    // Step 6
    this.checklistItems = const [],
    this.checklistDone = const [],
    this.detailChecklists = const [],
    this.deletedChecklistIds = const [],
    // Step 7
    this.attachments = const [],
    // Danh sách file đã upload lên server
    this.uploadedAttachmentFiles = const [],
    // Step 7b
    this.links = const [],
    // Step 8
    this.incidents = const [],
    this.expandedIncidentIndex = -1,
    // Step tracking
    this.currentStep = 0,
    // Detail mode
    this.detailTaskId,
    this.pauseReason,
    this.isDeadlineLocked = false,
  });

  factory WeekPlanState.init() => const WeekPlanState(
        status: BaseStateStatus.init,
        viewNumber: 1,
        myTasks: [],
        relatedTasks: [],
        assignedTasks: [],
        allTasks: [],
        searchKeyword: '',
        selectedStatuses: const ['Chưa làm', 'Đang làm'],
        isSubmitting: false,
        submitSuccess: false,
        checkInSuccess: false,
        checkInTaskId: null,
        checkInTaskNewValue: null,
        headerComplexity: 1,
        headerPriority: 0,
        headerStatus: 0,
        headerStatusName: 'Chưa làm',
        headerAssignerId: null,
        headerAssignerName: null,
        headerIsPersonalTask: false,
        headerTaskCategory: null,
        headerTaskCategoryName: null,
        taskTypes: const [],
        projects: const [],
        projectTypes: const [],
        employees: const [],
        parentProjectTasks: const [],
        contentDescription: null,
        contentResult: null,
        contentReasonSolution: null,
        contentWorkplace: -1,
        contentWorkplaceOther: null,
        selectedAssignees: [],
        selectedRelatedPersons: [],
        subTasks: [],
        checklistItems: [],
        checklistDone: [],
        detailChecklists: const [],
        deletedChecklistIds: const [],
        attachments: [],
        uploadedAttachmentFiles: [],
        links: [],
        incidents: [],
        expandedIncidentIndex: -1,
        currentStep: 0,
        pauseReason: null,
        isDeadlineLocked: false,
      );

  @override
  List get props => [
        status,
        message,
        viewNumber,
        myTasks,
        relatedTasks,
        assignedTasks,
        allTasks,
        searchKeyword,
        selectedStatuses,
        dateStart,
        dateEnd,
        employeeId,
        isSubmitting,
        submitSuccess,
        checkInSuccess,
        checkInTaskId,
        checkInTaskNewValue,
        // Step 1
        headerProjectId,
        headerProjectName,
        headerParentTaskId,
        headerParentTaskName,
        headerAssignerId,
        headerAssignerName,
        headerIsPersonalTask,
        headerComplexity,
        headerTaskCategory,
        headerTaskCategoryName,
        headerWorkType,
        headerWorkTypeName,
        headerStatus,
        headerStatusName,
        headerPriority,
        headerTimeEstimate,
        taskTypes,
        projects,
        projectTypes,
        employees,
        parentProjectTasks,
        // Step 2
        taskName,
        contentAssigneeId,
        contentAssigneeName,
        contentAssignerId,
        contentAssignerName,
        contentStartDate,
        contentEndDate,
        contentActualStartDate,
        contentActualEndDate,
        contentDeadline,
        contentDescription,
        contentResult,
        contentReasonSolution,
        contentWorkplace,
        contentWorkplaceOther,
        // Step 3
        selectedAssignees,
        // Step 4
        selectedRelatedPersons,
        // Step 5
        subTasks,
        // Step 6
        checklistItems,
        checklistDone,
        detailChecklists,
        deletedChecklistIds,
        // Step 7
        attachments,
        uploadedAttachmentFiles,
        // Step 7b
        links,
        // Step 8
        incidents,
        expandedIncidentIndex,
        // Step tracking
        currentStep,
        // Detail mode
        detailTaskId,
        pauseReason,
        isDeadlineLocked,
      ];
}
