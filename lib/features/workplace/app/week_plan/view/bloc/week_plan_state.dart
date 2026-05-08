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
  final String selectedStatus;
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

  // Step 3: Người thực hiện (multi-select)
  final List<EmployeeTaskItem> selectedAssignees;

  // Step 4: Người liên quan (multi-select)
  final List<EmployeeTaskItem> selectedRelatedPersons;

  // Step 5: Công việc con
  final List<WeekPlanSubTaskItem> subTasks;

  // Step 6: Checklist (tạm thời stub)
  final List<String> checklistItems;
  final List<bool> checklistDone;

  // Step 7: Tệp đính kèm
  final List<WeekPlanAttachmentItem> attachments;

  // Danh sách file đã upload lên server (sau khi gọi API upload)
  final List<UploadAttachmentResponse> uploadedAttachmentFiles;

  // Step 7b: Link đính kèm
  final List<WeekPlanLinkItem> links;

  // Step 8: Phát sinh
  final List<WeekPlanIncidentItem> incidents;

  // Add screen step tracking
  final int currentStep;

  const WeekPlanState({
    required super.status,
    super.message,
    this.viewNumber = 1,
    this.myTasks = const [],
    this.relatedTasks = const [],
    this.assignedTasks = const [],
    this.allTasks = const [],
    this.searchKeyword = '',
    this.selectedStatus = 'Tất cả',
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
    // Step 3
    this.selectedAssignees = const [],
    // Step 4
    this.selectedRelatedPersons = const [],
    // Step 5
    this.subTasks = const [],
    // Step 6
    this.checklistItems = const [],
    this.checklistDone = const [],
    // Step 7
    this.attachments = const [],
    // Danh sách file đã upload lên server
    this.uploadedAttachmentFiles = const [],
    // Step 7b
    this.links = const [],
    // Step 8
    this.incidents = const [],
    // Step tracking
    this.currentStep = 0,
  });

  factory WeekPlanState.init() => const WeekPlanState(
        status: BaseStateStatus.init,
        viewNumber: 1,
        myTasks: [],
        relatedTasks: [],
        assignedTasks: [],
        allTasks: [],
        searchKeyword: '',
        selectedStatus: 'Tất cả',
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
        taskTypes: const [],
        projects: const [],
        projectTypes: const [],
        employees: const [],
        parentProjectTasks: const [],
        selectedAssignees: [],
        selectedRelatedPersons: [],
        subTasks: [],
        checklistItems: [],
        checklistDone: [],
        attachments: [],
        uploadedAttachmentFiles: [],
        links: [],
        incidents: [],
        currentStep: 0,
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
        selectedStatus,
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
        // Step 3
        selectedAssignees,
        // Step 4
        selectedRelatedPersons,
        // Step 5
        subTasks,
        // Step 6
        checklistItems,
        checklistDone,
        // Step 7
        attachments,
        uploadedAttachmentFiles,
        // Step 7b
        links,
        // Step 8
        incidents,
        // Step tracking
        currentStep,
      ];
}
