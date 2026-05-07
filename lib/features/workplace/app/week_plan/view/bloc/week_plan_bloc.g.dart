// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_plan_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeekPlanStateCWProxy {
  WeekPlanState status(BaseStateStatus status);

  WeekPlanState message(String? message);

  WeekPlanState viewNumber(int viewNumber);

  WeekPlanState myTasks(List<WeekPlanTaskItem> myTasks);

  WeekPlanState relatedTasks(List<WeekPlanTaskItem> relatedTasks);

  WeekPlanState assignedTasks(List<WeekPlanTaskItem> assignedTasks);

  WeekPlanState allTasks(List<WeekPlanTaskItem> allTasks);

  WeekPlanState searchKeyword(String searchKeyword);

  WeekPlanState selectedStatus(String selectedStatus);

  WeekPlanState dateStart(DateTime? dateStart);

  WeekPlanState dateEnd(DateTime? dateEnd);

  WeekPlanState employeeId(int? employeeId);

  WeekPlanState isSubmitting(bool isSubmitting);

  WeekPlanState submitSuccess(bool submitSuccess);

  WeekPlanState checkInSuccess(bool checkInSuccess);

  WeekPlanState checkInTaskId(int? checkInTaskId);

  WeekPlanState checkInTaskNewValue(bool? checkInTaskNewValue);

  WeekPlanState headerProjectId(int? headerProjectId);

  WeekPlanState headerProjectName(String? headerProjectName);

  WeekPlanState headerParentTaskId(int? headerParentTaskId);

  WeekPlanState headerParentTaskName(String? headerParentTaskName);

  WeekPlanState headerAssignerId(int? headerAssignerId);

  WeekPlanState headerAssignerName(String? headerAssignerName);

  WeekPlanState headerIsPersonalTask(bool headerIsPersonalTask);

  WeekPlanState headerComplexity(int headerComplexity);

  WeekPlanState headerTaskCategory(int? headerTaskCategory);

  WeekPlanState headerTaskCategoryName(String? headerTaskCategoryName);

  WeekPlanState headerWorkType(int? headerWorkType);

  WeekPlanState headerWorkTypeName(String? headerWorkTypeName);

  WeekPlanState headerStatus(int? headerStatus);

  WeekPlanState headerStatusName(String? headerStatusName);

  WeekPlanState headerPriority(int headerPriority);

  WeekPlanState headerTimeEstimate(double? headerTimeEstimate);

  WeekPlanState taskTypes(List<TaskTypeItem> taskTypes);

  WeekPlanState projects(List<ProjectTaskItem> projects);

  WeekPlanState projectTypes(List<ProjectTypeItem> projectTypes);

  WeekPlanState employees(List<EmployeeTaskItem> employees);

  WeekPlanState parentProjectTasks(
      List<ParentProjectTaskItem> parentProjectTasks);

  WeekPlanState taskName(String? taskName);

  WeekPlanState contentAssigneeId(int? contentAssigneeId);

  WeekPlanState contentAssigneeName(String? contentAssigneeName);

  WeekPlanState contentAssignerId(int? contentAssignerId);

  WeekPlanState contentAssignerName(String? contentAssignerName);

  WeekPlanState contentStartDate(DateTime? contentStartDate);

  WeekPlanState contentEndDate(DateTime? contentEndDate);

  WeekPlanState contentActualStartDate(DateTime? contentActualStartDate);

  WeekPlanState contentActualEndDate(DateTime? contentActualEndDate);

  WeekPlanState contentDeadline(DateTime? contentDeadline);

  WeekPlanState contentDescription(String? contentDescription);

  WeekPlanState contentResult(String? contentResult);

  WeekPlanState selectedAssignees(List<EmployeeTaskItem> selectedAssignees);

  WeekPlanState selectedRelatedPersons(
      List<EmployeeTaskItem> selectedRelatedPersons);

  WeekPlanState subTasks(List<WeekPlanSubTaskItem> subTasks);

  WeekPlanState checklistItems(List<String> checklistItems);

  WeekPlanState checklistDone(List<bool> checklistDone);

  WeekPlanState attachments(List<WeekPlanAttachmentItem> attachments);

  WeekPlanState uploadedAttachmentFiles(
      List<UploadAttachmentResponse> uploadedAttachmentFiles);

  WeekPlanState incidents(List<WeekPlanIncidentItem> incidents);

  WeekPlanState currentStep(int currentStep);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeekPlanState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeekPlanState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeekPlanState call({
    BaseStateStatus? status,
    String? message,
    int? viewNumber,
    List<WeekPlanTaskItem>? myTasks,
    List<WeekPlanTaskItem>? relatedTasks,
    List<WeekPlanTaskItem>? assignedTasks,
    List<WeekPlanTaskItem>? allTasks,
    String? searchKeyword,
    String? selectedStatus,
    DateTime? dateStart,
    DateTime? dateEnd,
    int? employeeId,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? checkInSuccess,
    int? checkInTaskId,
    bool? checkInTaskNewValue,
    int? headerProjectId,
    String? headerProjectName,
    int? headerParentTaskId,
    String? headerParentTaskName,
    int? headerAssignerId,
    String? headerAssignerName,
    bool? headerIsPersonalTask,
    int? headerComplexity,
    int? headerTaskCategory,
    String? headerTaskCategoryName,
    int? headerWorkType,
    String? headerWorkTypeName,
    int? headerStatus,
    String? headerStatusName,
    int? headerPriority,
    double? headerTimeEstimate,
    List<TaskTypeItem>? taskTypes,
    List<ProjectTaskItem>? projects,
    List<ProjectTypeItem>? projectTypes,
    List<EmployeeTaskItem>? employees,
    List<ParentProjectTaskItem>? parentProjectTasks,
    String? taskName,
    int? contentAssigneeId,
    String? contentAssigneeName,
    int? contentAssignerId,
    String? contentAssignerName,
    DateTime? contentStartDate,
    DateTime? contentEndDate,
    DateTime? contentActualStartDate,
    DateTime? contentActualEndDate,
    DateTime? contentDeadline,
    String? contentDescription,
    String? contentResult,
    List<EmployeeTaskItem>? selectedAssignees,
    List<EmployeeTaskItem>? selectedRelatedPersons,
    List<WeekPlanSubTaskItem>? subTasks,
    List<String>? checklistItems,
    List<bool>? checklistDone,
    List<WeekPlanAttachmentItem>? attachments,
    List<UploadAttachmentResponse>? uploadedAttachmentFiles,
    List<WeekPlanIncidentItem>? incidents,
    int? currentStep,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeekPlanState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeekPlanState.copyWith.fieldName(...)`
class _$WeekPlanStateCWProxyImpl implements _$WeekPlanStateCWProxy {
  const _$WeekPlanStateCWProxyImpl(this._value);

  final WeekPlanState _value;

  @override
  WeekPlanState status(BaseStateStatus status) => this(status: status);

  @override
  WeekPlanState message(String? message) => this(message: message);

  @override
  WeekPlanState viewNumber(int viewNumber) => this(viewNumber: viewNumber);

  @override
  WeekPlanState myTasks(List<WeekPlanTaskItem> myTasks) =>
      this(myTasks: myTasks);

  @override
  WeekPlanState relatedTasks(List<WeekPlanTaskItem> relatedTasks) =>
      this(relatedTasks: relatedTasks);

  @override
  WeekPlanState assignedTasks(List<WeekPlanTaskItem> assignedTasks) =>
      this(assignedTasks: assignedTasks);

  @override
  WeekPlanState allTasks(List<WeekPlanTaskItem> allTasks) =>
      this(allTasks: allTasks);

  @override
  WeekPlanState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override
  WeekPlanState selectedStatus(String selectedStatus) =>
      this(selectedStatus: selectedStatus);

  @override
  WeekPlanState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  WeekPlanState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  WeekPlanState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  WeekPlanState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  WeekPlanState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  WeekPlanState checkInSuccess(bool checkInSuccess) =>
      this(checkInSuccess: checkInSuccess);

  @override
  WeekPlanState checkInTaskId(int? checkInTaskId) =>
      this(checkInTaskId: checkInTaskId);

  @override
  WeekPlanState checkInTaskNewValue(bool? checkInTaskNewValue) =>
      this(checkInTaskNewValue: checkInTaskNewValue);

  @override
  WeekPlanState headerProjectId(int? headerProjectId) =>
      this(headerProjectId: headerProjectId);

  @override
  WeekPlanState headerProjectName(String? headerProjectName) =>
      this(headerProjectName: headerProjectName);

  @override
  WeekPlanState headerParentTaskId(int? headerParentTaskId) =>
      this(headerParentTaskId: headerParentTaskId);

  @override
  WeekPlanState headerParentTaskName(String? headerParentTaskName) =>
      this(headerParentTaskName: headerParentTaskName);

  @override
  WeekPlanState headerAssignerId(int? headerAssignerId) =>
      this(headerAssignerId: headerAssignerId);

  @override
  WeekPlanState headerAssignerName(String? headerAssignerName) =>
      this(headerAssignerName: headerAssignerName);

  @override
  WeekPlanState headerIsPersonalTask(bool headerIsPersonalTask) =>
      this(headerIsPersonalTask: headerIsPersonalTask);

  @override
  WeekPlanState headerComplexity(int headerComplexity) =>
      this(headerComplexity: headerComplexity);

  @override
  WeekPlanState headerTaskCategory(int? headerTaskCategory) =>
      this(headerTaskCategory: headerTaskCategory);

  @override
  WeekPlanState headerTaskCategoryName(String? headerTaskCategoryName) =>
      this(headerTaskCategoryName: headerTaskCategoryName);

  @override
  WeekPlanState headerWorkType(int? headerWorkType) =>
      this(headerWorkType: headerWorkType);

  @override
  WeekPlanState headerWorkTypeName(String? headerWorkTypeName) =>
      this(headerWorkTypeName: headerWorkTypeName);

  @override
  WeekPlanState headerStatus(int? headerStatus) =>
      this(headerStatus: headerStatus);

  @override
  WeekPlanState headerStatusName(String? headerStatusName) =>
      this(headerStatusName: headerStatusName);

  @override
  WeekPlanState headerPriority(int headerPriority) =>
      this(headerPriority: headerPriority);

  @override
  WeekPlanState headerTimeEstimate(double? headerTimeEstimate) =>
      this(headerTimeEstimate: headerTimeEstimate);

  @override
  WeekPlanState taskTypes(List<TaskTypeItem> taskTypes) =>
      this(taskTypes: taskTypes);

  @override
  WeekPlanState projects(List<ProjectTaskItem> projects) =>
      this(projects: projects);

  @override
  WeekPlanState projectTypes(List<ProjectTypeItem> projectTypes) =>
      this(projectTypes: projectTypes);

  @override
  WeekPlanState employees(List<EmployeeTaskItem> employees) =>
      this(employees: employees);

  @override
  WeekPlanState parentProjectTasks(
          List<ParentProjectTaskItem> parentProjectTasks) =>
      this(parentProjectTasks: parentProjectTasks);

  @override
  WeekPlanState taskName(String? taskName) => this(taskName: taskName);

  @override
  WeekPlanState contentAssigneeId(int? contentAssigneeId) =>
      this(contentAssigneeId: contentAssigneeId);

  @override
  WeekPlanState contentAssigneeName(String? contentAssigneeName) =>
      this(contentAssigneeName: contentAssigneeName);

  @override
  WeekPlanState contentAssignerId(int? contentAssignerId) =>
      this(contentAssignerId: contentAssignerId);

  @override
  WeekPlanState contentAssignerName(String? contentAssignerName) =>
      this(contentAssignerName: contentAssignerName);

  @override
  WeekPlanState contentStartDate(DateTime? contentStartDate) =>
      this(contentStartDate: contentStartDate);

  @override
  WeekPlanState contentEndDate(DateTime? contentEndDate) =>
      this(contentEndDate: contentEndDate);

  @override
  WeekPlanState contentActualStartDate(DateTime? contentActualStartDate) =>
      this(contentActualStartDate: contentActualStartDate);

  @override
  WeekPlanState contentActualEndDate(DateTime? contentActualEndDate) =>
      this(contentActualEndDate: contentActualEndDate);

  @override
  WeekPlanState contentDeadline(DateTime? contentDeadline) =>
      this(contentDeadline: contentDeadline);

  @override
  WeekPlanState contentDescription(String? contentDescription) =>
      this(contentDescription: contentDescription);

  @override
  WeekPlanState contentResult(String? contentResult) =>
      this(contentResult: contentResult);

  @override
  WeekPlanState selectedAssignees(List<EmployeeTaskItem> selectedAssignees) =>
      this(selectedAssignees: selectedAssignees);

  @override
  WeekPlanState selectedRelatedPersons(
          List<EmployeeTaskItem> selectedRelatedPersons) =>
      this(selectedRelatedPersons: selectedRelatedPersons);

  @override
  WeekPlanState subTasks(List<WeekPlanSubTaskItem> subTasks) =>
      this(subTasks: subTasks);

  @override
  WeekPlanState checklistItems(List<String> checklistItems) =>
      this(checklistItems: checklistItems);

  @override
  WeekPlanState checklistDone(List<bool> checklistDone) =>
      this(checklistDone: checklistDone);

  @override
  WeekPlanState attachments(List<WeekPlanAttachmentItem> attachments) =>
      this(attachments: attachments);

  @override
  WeekPlanState uploadedAttachmentFiles(
          List<UploadAttachmentResponse> uploadedAttachmentFiles) =>
      this(uploadedAttachmentFiles: uploadedAttachmentFiles);

  @override
  WeekPlanState incidents(List<WeekPlanIncidentItem> incidents) =>
      this(incidents: incidents);

  @override
  WeekPlanState currentStep(int currentStep) => this(currentStep: currentStep);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeekPlanState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeekPlanState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeekPlanState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? viewNumber = const $CopyWithPlaceholder(),
    Object? myTasks = const $CopyWithPlaceholder(),
    Object? relatedTasks = const $CopyWithPlaceholder(),
    Object? assignedTasks = const $CopyWithPlaceholder(),
    Object? allTasks = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
    Object? selectedStatus = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? checkInSuccess = const $CopyWithPlaceholder(),
    Object? checkInTaskId = const $CopyWithPlaceholder(),
    Object? checkInTaskNewValue = const $CopyWithPlaceholder(),
    Object? headerProjectId = const $CopyWithPlaceholder(),
    Object? headerProjectName = const $CopyWithPlaceholder(),
    Object? headerParentTaskId = const $CopyWithPlaceholder(),
    Object? headerParentTaskName = const $CopyWithPlaceholder(),
    Object? headerAssignerId = const $CopyWithPlaceholder(),
    Object? headerAssignerName = const $CopyWithPlaceholder(),
    Object? headerIsPersonalTask = const $CopyWithPlaceholder(),
    Object? headerComplexity = const $CopyWithPlaceholder(),
    Object? headerTaskCategory = const $CopyWithPlaceholder(),
    Object? headerTaskCategoryName = const $CopyWithPlaceholder(),
    Object? headerWorkType = const $CopyWithPlaceholder(),
    Object? headerWorkTypeName = const $CopyWithPlaceholder(),
    Object? headerStatus = const $CopyWithPlaceholder(),
    Object? headerStatusName = const $CopyWithPlaceholder(),
    Object? headerPriority = const $CopyWithPlaceholder(),
    Object? headerTimeEstimate = const $CopyWithPlaceholder(),
    Object? taskTypes = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? projectTypes = const $CopyWithPlaceholder(),
    Object? employees = const $CopyWithPlaceholder(),
    Object? parentProjectTasks = const $CopyWithPlaceholder(),
    Object? taskName = const $CopyWithPlaceholder(),
    Object? contentAssigneeId = const $CopyWithPlaceholder(),
    Object? contentAssigneeName = const $CopyWithPlaceholder(),
    Object? contentAssignerId = const $CopyWithPlaceholder(),
    Object? contentAssignerName = const $CopyWithPlaceholder(),
    Object? contentStartDate = const $CopyWithPlaceholder(),
    Object? contentEndDate = const $CopyWithPlaceholder(),
    Object? contentActualStartDate = const $CopyWithPlaceholder(),
    Object? contentActualEndDate = const $CopyWithPlaceholder(),
    Object? contentDeadline = const $CopyWithPlaceholder(),
    Object? contentDescription = const $CopyWithPlaceholder(),
    Object? contentResult = const $CopyWithPlaceholder(),
    Object? selectedAssignees = const $CopyWithPlaceholder(),
    Object? selectedRelatedPersons = const $CopyWithPlaceholder(),
    Object? subTasks = const $CopyWithPlaceholder(),
    Object? checklistItems = const $CopyWithPlaceholder(),
    Object? checklistDone = const $CopyWithPlaceholder(),
    Object? attachments = const $CopyWithPlaceholder(),
    Object? uploadedAttachmentFiles = const $CopyWithPlaceholder(),
    Object? incidents = const $CopyWithPlaceholder(),
    Object? currentStep = const $CopyWithPlaceholder(),
  }) {
    return WeekPlanState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      viewNumber:
          viewNumber == const $CopyWithPlaceholder() || viewNumber == null
              ? _value.viewNumber
              // ignore: cast_nullable_to_non_nullable
              : viewNumber as int,
      myTasks: myTasks == const $CopyWithPlaceholder() || myTasks == null
          ? _value.myTasks
          // ignore: cast_nullable_to_non_nullable
          : myTasks as List<WeekPlanTaskItem>,
      relatedTasks:
          relatedTasks == const $CopyWithPlaceholder() || relatedTasks == null
              ? _value.relatedTasks
              // ignore: cast_nullable_to_non_nullable
              : relatedTasks as List<WeekPlanTaskItem>,
      assignedTasks:
          assignedTasks == const $CopyWithPlaceholder() || assignedTasks == null
              ? _value.assignedTasks
              // ignore: cast_nullable_to_non_nullable
              : assignedTasks as List<WeekPlanTaskItem>,
      allTasks: allTasks == const $CopyWithPlaceholder() || allTasks == null
          ? _value.allTasks
          // ignore: cast_nullable_to_non_nullable
          : allTasks as List<WeekPlanTaskItem>,
      searchKeyword:
          searchKeyword == const $CopyWithPlaceholder() || searchKeyword == null
              ? _value.searchKeyword
              // ignore: cast_nullable_to_non_nullable
              : searchKeyword as String,
      selectedStatus: selectedStatus == const $CopyWithPlaceholder() ||
              selectedStatus == null
          ? _value.selectedStatus
          // ignore: cast_nullable_to_non_nullable
          : selectedStatus as String,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      isSubmitting:
          isSubmitting == const $CopyWithPlaceholder() || isSubmitting == null
              ? _value.isSubmitting
              // ignore: cast_nullable_to_non_nullable
              : isSubmitting as bool,
      submitSuccess:
          submitSuccess == const $CopyWithPlaceholder() || submitSuccess == null
              ? _value.submitSuccess
              // ignore: cast_nullable_to_non_nullable
              : submitSuccess as bool,
      checkInSuccess: checkInSuccess == const $CopyWithPlaceholder() ||
              checkInSuccess == null
          ? _value.checkInSuccess
          // ignore: cast_nullable_to_non_nullable
          : checkInSuccess as bool,
      checkInTaskId: checkInTaskId == const $CopyWithPlaceholder()
          ? _value.checkInTaskId
          // ignore: cast_nullable_to_non_nullable
          : checkInTaskId as int?,
      checkInTaskNewValue: checkInTaskNewValue == const $CopyWithPlaceholder()
          ? _value.checkInTaskNewValue
          // ignore: cast_nullable_to_non_nullable
          : checkInTaskNewValue as bool?,
      headerProjectId: headerProjectId == const $CopyWithPlaceholder()
          ? _value.headerProjectId
          // ignore: cast_nullable_to_non_nullable
          : headerProjectId as int?,
      headerProjectName: headerProjectName == const $CopyWithPlaceholder()
          ? _value.headerProjectName
          // ignore: cast_nullable_to_non_nullable
          : headerProjectName as String?,
      headerParentTaskId: headerParentTaskId == const $CopyWithPlaceholder()
          ? _value.headerParentTaskId
          // ignore: cast_nullable_to_non_nullable
          : headerParentTaskId as int?,
      headerParentTaskName: headerParentTaskName == const $CopyWithPlaceholder()
          ? _value.headerParentTaskName
          // ignore: cast_nullable_to_non_nullable
          : headerParentTaskName as String?,
      headerAssignerId: headerAssignerId == const $CopyWithPlaceholder()
          ? _value.headerAssignerId
          // ignore: cast_nullable_to_non_nullable
          : headerAssignerId as int?,
      headerAssignerName: headerAssignerName == const $CopyWithPlaceholder()
          ? _value.headerAssignerName
          // ignore: cast_nullable_to_non_nullable
          : headerAssignerName as String?,
      headerIsPersonalTask:
          headerIsPersonalTask == const $CopyWithPlaceholder() ||
                  headerIsPersonalTask == null
              ? _value.headerIsPersonalTask
              // ignore: cast_nullable_to_non_nullable
              : headerIsPersonalTask as bool,
      headerComplexity: headerComplexity == const $CopyWithPlaceholder() ||
              headerComplexity == null
          ? _value.headerComplexity
          // ignore: cast_nullable_to_non_nullable
          : headerComplexity as int,
      headerTaskCategory: headerTaskCategory == const $CopyWithPlaceholder()
          ? _value.headerTaskCategory
          // ignore: cast_nullable_to_non_nullable
          : headerTaskCategory as int?,
      headerTaskCategoryName:
          headerTaskCategoryName == const $CopyWithPlaceholder()
              ? _value.headerTaskCategoryName
              // ignore: cast_nullable_to_non_nullable
              : headerTaskCategoryName as String?,
      headerWorkType: headerWorkType == const $CopyWithPlaceholder()
          ? _value.headerWorkType
          // ignore: cast_nullable_to_non_nullable
          : headerWorkType as int?,
      headerWorkTypeName: headerWorkTypeName == const $CopyWithPlaceholder()
          ? _value.headerWorkTypeName
          // ignore: cast_nullable_to_non_nullable
          : headerWorkTypeName as String?,
      headerStatus: headerStatus == const $CopyWithPlaceholder()
          ? _value.headerStatus
          // ignore: cast_nullable_to_non_nullable
          : headerStatus as int?,
      headerStatusName: headerStatusName == const $CopyWithPlaceholder()
          ? _value.headerStatusName
          // ignore: cast_nullable_to_non_nullable
          : headerStatusName as String?,
      headerPriority: headerPriority == const $CopyWithPlaceholder() ||
              headerPriority == null
          ? _value.headerPriority
          // ignore: cast_nullable_to_non_nullable
          : headerPriority as int,
      headerTimeEstimate: headerTimeEstimate == const $CopyWithPlaceholder()
          ? _value.headerTimeEstimate
          // ignore: cast_nullable_to_non_nullable
          : headerTimeEstimate as double?,
      taskTypes: taskTypes == const $CopyWithPlaceholder() || taskTypes == null
          ? _value.taskTypes
          // ignore: cast_nullable_to_non_nullable
          : taskTypes as List<TaskTypeItem>,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<ProjectTaskItem>,
      projectTypes:
          projectTypes == const $CopyWithPlaceholder() || projectTypes == null
              ? _value.projectTypes
              // ignore: cast_nullable_to_non_nullable
              : projectTypes as List<ProjectTypeItem>,
      employees: employees == const $CopyWithPlaceholder() || employees == null
          ? _value.employees
          // ignore: cast_nullable_to_non_nullable
          : employees as List<EmployeeTaskItem>,
      parentProjectTasks: parentProjectTasks == const $CopyWithPlaceholder() ||
              parentProjectTasks == null
          ? _value.parentProjectTasks
          // ignore: cast_nullable_to_non_nullable
          : parentProjectTasks as List<ParentProjectTaskItem>,
      taskName: taskName == const $CopyWithPlaceholder()
          ? _value.taskName
          // ignore: cast_nullable_to_non_nullable
          : taskName as String?,
      contentAssigneeId: contentAssigneeId == const $CopyWithPlaceholder()
          ? _value.contentAssigneeId
          // ignore: cast_nullable_to_non_nullable
          : contentAssigneeId as int?,
      contentAssigneeName: contentAssigneeName == const $CopyWithPlaceholder()
          ? _value.contentAssigneeName
          // ignore: cast_nullable_to_non_nullable
          : contentAssigneeName as String?,
      contentAssignerId: contentAssignerId == const $CopyWithPlaceholder()
          ? _value.contentAssignerId
          // ignore: cast_nullable_to_non_nullable
          : contentAssignerId as int?,
      contentAssignerName: contentAssignerName == const $CopyWithPlaceholder()
          ? _value.contentAssignerName
          // ignore: cast_nullable_to_non_nullable
          : contentAssignerName as String?,
      contentStartDate: contentStartDate == const $CopyWithPlaceholder()
          ? _value.contentStartDate
          // ignore: cast_nullable_to_non_nullable
          : contentStartDate as DateTime?,
      contentEndDate: contentEndDate == const $CopyWithPlaceholder()
          ? _value.contentEndDate
          // ignore: cast_nullable_to_non_nullable
          : contentEndDate as DateTime?,
      contentActualStartDate:
          contentActualStartDate == const $CopyWithPlaceholder()
              ? _value.contentActualStartDate
              // ignore: cast_nullable_to_non_nullable
              : contentActualStartDate as DateTime?,
      contentActualEndDate: contentActualEndDate == const $CopyWithPlaceholder()
          ? _value.contentActualEndDate
          // ignore: cast_nullable_to_non_nullable
          : contentActualEndDate as DateTime?,
      contentDeadline: contentDeadline == const $CopyWithPlaceholder()
          ? _value.contentDeadline
          // ignore: cast_nullable_to_non_nullable
          : contentDeadline as DateTime?,
      contentDescription: contentDescription == const $CopyWithPlaceholder()
          ? _value.contentDescription
          // ignore: cast_nullable_to_non_nullable
          : contentDescription as String?,
      contentResult: contentResult == const $CopyWithPlaceholder()
          ? _value.contentResult
          // ignore: cast_nullable_to_non_nullable
          : contentResult as String?,
      selectedAssignees: selectedAssignees == const $CopyWithPlaceholder() ||
              selectedAssignees == null
          ? _value.selectedAssignees
          // ignore: cast_nullable_to_non_nullable
          : selectedAssignees as List<EmployeeTaskItem>,
      selectedRelatedPersons:
          selectedRelatedPersons == const $CopyWithPlaceholder() ||
                  selectedRelatedPersons == null
              ? _value.selectedRelatedPersons
              // ignore: cast_nullable_to_non_nullable
              : selectedRelatedPersons as List<EmployeeTaskItem>,
      subTasks: subTasks == const $CopyWithPlaceholder() || subTasks == null
          ? _value.subTasks
          // ignore: cast_nullable_to_non_nullable
          : subTasks as List<WeekPlanSubTaskItem>,
      checklistItems: checklistItems == const $CopyWithPlaceholder() ||
              checklistItems == null
          ? _value.checklistItems
          // ignore: cast_nullable_to_non_nullable
          : checklistItems as List<String>,
      checklistDone:
          checklistDone == const $CopyWithPlaceholder() || checklistDone == null
              ? _value.checklistDone
              // ignore: cast_nullable_to_non_nullable
              : checklistDone as List<bool>,
      attachments:
          attachments == const $CopyWithPlaceholder() || attachments == null
              ? _value.attachments
              // ignore: cast_nullable_to_non_nullable
              : attachments as List<WeekPlanAttachmentItem>,
      uploadedAttachmentFiles:
          uploadedAttachmentFiles == const $CopyWithPlaceholder() ||
                  uploadedAttachmentFiles == null
              ? _value.uploadedAttachmentFiles
              // ignore: cast_nullable_to_non_nullable
              : uploadedAttachmentFiles as List<UploadAttachmentResponse>,
      incidents: incidents == const $CopyWithPlaceholder() || incidents == null
          ? _value.incidents
          // ignore: cast_nullable_to_non_nullable
          : incidents as List<WeekPlanIncidentItem>,
      currentStep:
          currentStep == const $CopyWithPlaceholder() || currentStep == null
              ? _value.currentStep
              // ignore: cast_nullable_to_non_nullable
              : currentStep as int,
    );
  }
}

extension $WeekPlanStateCopyWith on WeekPlanState {
  /// Returns a callable class that can be used as follows: `instanceOfWeekPlanState.copyWith(...)` or like so:`instanceOfWeekPlanState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeekPlanStateCWProxy get copyWith => _$WeekPlanStateCWProxyImpl(this);
}
