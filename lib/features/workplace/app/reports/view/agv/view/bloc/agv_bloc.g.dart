// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agv_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AgvStateCWProxy {
  AgvState status(BaseStateStatus status);

  AgvState message(String? message);

  AgvState list(List<dynamic>? list);

  AgvState reports(List<ReportResponse> reports);

  AgvState departs(List<DepartResponse> departs);

  AgvState projects(List<ProjectResponse> projects);

  AgvState projectItem(List<ProjectItemResponse> projectItem);

  AgvState detailReport(DetailReportResponse? detailReport);

  AgvState expandedWorkIndex(int? expandedWorkIndex);

  AgvState dateStart(DateTime? dateStart);

  AgvState dateEnd(DateTime? dateEnd);

  AgvState keyword(String? keyword);

  AgvState backlog(String? backlog);

  AgvState problem(String? problem);

  AgvState problemSolve(String? problemSolve);

  AgvState note(String? note);

  AgvState planNextDay(String? planNextDay);

  AgvState id(int? id);

  AgvState fullName(String? fullName);

  AgvState isSubmitting(bool isSubmitting);

  AgvState submitSuccess(bool submitSuccess);

  AgvState workItemError(String? workItemError);

  AgvState totalHoursError(String? totalHoursError);

  AgvState percentError(String? percentError);

  AgvState userId(int? userId);

  AgvState isLoadingDetail(bool isLoadingDetail);

  AgvState selectedReportDetail(DetailReportNullResponse? selectedReportDetail);

  AgvState dateReport(DateTime? dateReport);

  AgvState isSaving(bool isSaving);

  AgvState saveSuccess(bool saveSuccess);

  AgvState isDeleting(bool isDeleting);

  AgvState deleteSuccess(bool deleteSuccess);

  AgvState copyReports(List<CopyNullResponse> copyReports);

  AgvState isCopyLoading(bool isCopyLoading);

  AgvState teamId(int? teamId);

  AgvState departmentId(int? departmentId);

  AgvState employeeID(int? employeeID);

  AgvState copyError(String? copyError);

  AgvState positionName(String? positionName);

  AgvState departmentName(String? departmentName);

  AgvState content(String? content);

  AgvState results(String? results);

  AgvState positionId(int? positionId);

  AgvState works(List<AgvWork> works);

  AgvState locationType(String locationType);

  AgvState location(String? location);

  AgvState projectId(int? projectId);

  AgvState selectedProject(ProjectResponse? selectedProject);

  AgvState selectedProjectItem(ProjectItemResponse? selectedProjectItem);

  AgvState projectName(String? projectName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AgvState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AgvState(...).copyWith(id: 12, name: "My name")
  /// ````
  AgvState call({
    BaseStateStatus? status,
    String? message,
    List<dynamic>? list,
    List<ReportResponse>? reports,
    List<DepartResponse>? departs,
    List<ProjectResponse>? projects,
    List<ProjectItemResponse>? projectItem,
    DetailReportResponse? detailReport,
    int? expandedWorkIndex,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    String? backlog,
    String? problem,
    String? problemSolve,
    String? note,
    String? planNextDay,
    int? id,
    String? fullName,
    bool? isSubmitting,
    bool? submitSuccess,
    String? workItemError,
    String? totalHoursError,
    String? percentError,
    int? userId,
    bool? isLoadingDetail,
    DetailReportNullResponse? selectedReportDetail,
    DateTime? dateReport,
    bool? isSaving,
    bool? saveSuccess,
    bool? isDeleting,
    bool? deleteSuccess,
    List<CopyNullResponse>? copyReports,
    bool? isCopyLoading,
    int? teamId,
    int? departmentId,
    int? employeeID,
    String? copyError,
    String? positionName,
    String? departmentName,
    String? content,
    String? results,
    int? positionId,
    List<AgvWork>? works,
    String? locationType,
    String? location,
    int? projectId,
    ProjectResponse? selectedProject,
    ProjectItemResponse? selectedProjectItem,
    String? projectName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAgvState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAgvState.copyWith.fieldName(...)`
class _$AgvStateCWProxyImpl implements _$AgvStateCWProxy {
  const _$AgvStateCWProxyImpl(this._value);

  final AgvState _value;

  @override
  AgvState status(BaseStateStatus status) => this(status: status);

  @override
  AgvState message(String? message) => this(message: message);

  @override
  AgvState list(List<dynamic>? list) => this(list: list);

  @override
  AgvState reports(List<ReportResponse> reports) => this(reports: reports);

  @override
  AgvState departs(List<DepartResponse> departs) => this(departs: departs);

  @override
  AgvState projects(List<ProjectResponse> projects) => this(projects: projects);

  @override
  AgvState projectItem(List<ProjectItemResponse> projectItem) =>
      this(projectItem: projectItem);

  @override
  AgvState detailReport(DetailReportResponse? detailReport) =>
      this(detailReport: detailReport);

  @override
  AgvState expandedWorkIndex(int? expandedWorkIndex) =>
      this(expandedWorkIndex: expandedWorkIndex);

  @override
  AgvState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  AgvState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  AgvState keyword(String? keyword) => this(keyword: keyword);

  @override
  AgvState backlog(String? backlog) => this(backlog: backlog);

  @override
  AgvState problem(String? problem) => this(problem: problem);

  @override
  AgvState problemSolve(String? problemSolve) =>
      this(problemSolve: problemSolve);

  @override
  AgvState note(String? note) => this(note: note);

  @override
  AgvState planNextDay(String? planNextDay) => this(planNextDay: planNextDay);

  @override
  AgvState id(int? id) => this(id: id);

  @override
  AgvState fullName(String? fullName) => this(fullName: fullName);

  @override
  AgvState isSubmitting(bool isSubmitting) => this(isSubmitting: isSubmitting);

  @override
  AgvState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  AgvState workItemError(String? workItemError) =>
      this(workItemError: workItemError);

  @override
  AgvState totalHoursError(String? totalHoursError) =>
      this(totalHoursError: totalHoursError);

  @override
  AgvState percentError(String? percentError) =>
      this(percentError: percentError);

  @override
  AgvState userId(int? userId) => this(userId: userId);

  @override
  AgvState isLoadingDetail(bool isLoadingDetail) =>
      this(isLoadingDetail: isLoadingDetail);

  @override
  AgvState selectedReportDetail(
          DetailReportNullResponse? selectedReportDetail) =>
      this(selectedReportDetail: selectedReportDetail);

  @override
  AgvState dateReport(DateTime? dateReport) => this(dateReport: dateReport);

  @override
  AgvState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  AgvState saveSuccess(bool saveSuccess) => this(saveSuccess: saveSuccess);

  @override
  AgvState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  AgvState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  AgvState copyReports(List<CopyNullResponse> copyReports) =>
      this(copyReports: copyReports);

  @override
  AgvState isCopyLoading(bool isCopyLoading) =>
      this(isCopyLoading: isCopyLoading);

  @override
  AgvState teamId(int? teamId) => this(teamId: teamId);

  @override
  AgvState departmentId(int? departmentId) => this(departmentId: departmentId);

  @override
  AgvState employeeID(int? employeeID) => this(employeeID: employeeID);

  @override
  AgvState copyError(String? copyError) => this(copyError: copyError);

  @override
  AgvState positionName(String? positionName) =>
      this(positionName: positionName);

  @override
  AgvState departmentName(String? departmentName) =>
      this(departmentName: departmentName);

  @override
  AgvState content(String? content) => this(content: content);

  @override
  AgvState results(String? results) => this(results: results);

  @override
  AgvState positionId(int? positionId) => this(positionId: positionId);

  @override
  AgvState works(List<AgvWork> works) => this(works: works);

  @override
  AgvState locationType(String locationType) =>
      this(locationType: locationType);

  @override
  AgvState location(String? location) => this(location: location);

  @override
  AgvState projectId(int? projectId) => this(projectId: projectId);

  @override
  AgvState selectedProject(ProjectResponse? selectedProject) =>
      this(selectedProject: selectedProject);

  @override
  AgvState selectedProjectItem(ProjectItemResponse? selectedProjectItem) =>
      this(selectedProjectItem: selectedProjectItem);

  @override
  AgvState projectName(String? projectName) => this(projectName: projectName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AgvState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AgvState(...).copyWith(id: 12, name: "My name")
  /// ````
  AgvState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? list = const $CopyWithPlaceholder(),
    Object? reports = const $CopyWithPlaceholder(),
    Object? departs = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? projectItem = const $CopyWithPlaceholder(),
    Object? detailReport = const $CopyWithPlaceholder(),
    Object? expandedWorkIndex = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? backlog = const $CopyWithPlaceholder(),
    Object? problem = const $CopyWithPlaceholder(),
    Object? problemSolve = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? planNextDay = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? fullName = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? workItemError = const $CopyWithPlaceholder(),
    Object? totalHoursError = const $CopyWithPlaceholder(),
    Object? percentError = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? isLoadingDetail = const $CopyWithPlaceholder(),
    Object? selectedReportDetail = const $CopyWithPlaceholder(),
    Object? dateReport = const $CopyWithPlaceholder(),
    Object? isSaving = const $CopyWithPlaceholder(),
    Object? saveSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? copyReports = const $CopyWithPlaceholder(),
    Object? isCopyLoading = const $CopyWithPlaceholder(),
    Object? teamId = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? employeeID = const $CopyWithPlaceholder(),
    Object? copyError = const $CopyWithPlaceholder(),
    Object? positionName = const $CopyWithPlaceholder(),
    Object? departmentName = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? results = const $CopyWithPlaceholder(),
    Object? positionId = const $CopyWithPlaceholder(),
    Object? works = const $CopyWithPlaceholder(),
    Object? locationType = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? projectId = const $CopyWithPlaceholder(),
    Object? selectedProject = const $CopyWithPlaceholder(),
    Object? selectedProjectItem = const $CopyWithPlaceholder(),
    Object? projectName = const $CopyWithPlaceholder(),
  }) {
    return AgvState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      list: list == const $CopyWithPlaceholder()
          ? _value.list
          // ignore: cast_nullable_to_non_nullable
          : list as List<dynamic>?,
      reports: reports == const $CopyWithPlaceholder() || reports == null
          ? _value.reports
          // ignore: cast_nullable_to_non_nullable
          : reports as List<ReportResponse>,
      departs: departs == const $CopyWithPlaceholder() || departs == null
          ? _value.departs
          // ignore: cast_nullable_to_non_nullable
          : departs as List<DepartResponse>,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<ProjectResponse>,
      projectItem:
          projectItem == const $CopyWithPlaceholder() || projectItem == null
              ? _value.projectItem
              // ignore: cast_nullable_to_non_nullable
              : projectItem as List<ProjectItemResponse>,
      detailReport: detailReport == const $CopyWithPlaceholder()
          ? _value.detailReport
          // ignore: cast_nullable_to_non_nullable
          : detailReport as DetailReportResponse?,
      expandedWorkIndex: expandedWorkIndex == const $CopyWithPlaceholder()
          ? _value.expandedWorkIndex
          // ignore: cast_nullable_to_non_nullable
          : expandedWorkIndex as int?,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      keyword: keyword == const $CopyWithPlaceholder()
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String?,
      backlog: backlog == const $CopyWithPlaceholder()
          ? _value.backlog
          // ignore: cast_nullable_to_non_nullable
          : backlog as String?,
      problem: problem == const $CopyWithPlaceholder()
          ? _value.problem
          // ignore: cast_nullable_to_non_nullable
          : problem as String?,
      problemSolve: problemSolve == const $CopyWithPlaceholder()
          ? _value.problemSolve
          // ignore: cast_nullable_to_non_nullable
          : problemSolve as String?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      planNextDay: planNextDay == const $CopyWithPlaceholder()
          ? _value.planNextDay
          // ignore: cast_nullable_to_non_nullable
          : planNextDay as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      fullName: fullName == const $CopyWithPlaceholder()
          ? _value.fullName
          // ignore: cast_nullable_to_non_nullable
          : fullName as String?,
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
      workItemError: workItemError == const $CopyWithPlaceholder()
          ? _value.workItemError
          // ignore: cast_nullable_to_non_nullable
          : workItemError as String?,
      totalHoursError: totalHoursError == const $CopyWithPlaceholder()
          ? _value.totalHoursError
          // ignore: cast_nullable_to_non_nullable
          : totalHoursError as String?,
      percentError: percentError == const $CopyWithPlaceholder()
          ? _value.percentError
          // ignore: cast_nullable_to_non_nullable
          : percentError as String?,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as int?,
      isLoadingDetail: isLoadingDetail == const $CopyWithPlaceholder() ||
              isLoadingDetail == null
          ? _value.isLoadingDetail
          // ignore: cast_nullable_to_non_nullable
          : isLoadingDetail as bool,
      selectedReportDetail: selectedReportDetail == const $CopyWithPlaceholder()
          ? _value.selectedReportDetail
          // ignore: cast_nullable_to_non_nullable
          : selectedReportDetail as DetailReportNullResponse?,
      dateReport: dateReport == const $CopyWithPlaceholder()
          ? _value.dateReport
          // ignore: cast_nullable_to_non_nullable
          : dateReport as DateTime?,
      isSaving: isSaving == const $CopyWithPlaceholder() || isSaving == null
          ? _value.isSaving
          // ignore: cast_nullable_to_non_nullable
          : isSaving as bool,
      saveSuccess:
          saveSuccess == const $CopyWithPlaceholder() || saveSuccess == null
              ? _value.saveSuccess
              // ignore: cast_nullable_to_non_nullable
              : saveSuccess as bool,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      deleteSuccess:
          deleteSuccess == const $CopyWithPlaceholder() || deleteSuccess == null
              ? _value.deleteSuccess
              // ignore: cast_nullable_to_non_nullable
              : deleteSuccess as bool,
      copyReports:
          copyReports == const $CopyWithPlaceholder() || copyReports == null
              ? _value.copyReports
              // ignore: cast_nullable_to_non_nullable
              : copyReports as List<CopyNullResponse>,
      isCopyLoading:
          isCopyLoading == const $CopyWithPlaceholder() || isCopyLoading == null
              ? _value.isCopyLoading
              // ignore: cast_nullable_to_non_nullable
              : isCopyLoading as bool,
      teamId: teamId == const $CopyWithPlaceholder()
          ? _value.teamId
          // ignore: cast_nullable_to_non_nullable
          : teamId as int?,
      departmentId: departmentId == const $CopyWithPlaceholder()
          ? _value.departmentId
          // ignore: cast_nullable_to_non_nullable
          : departmentId as int?,
      employeeID: employeeID == const $CopyWithPlaceholder()
          ? _value.employeeID
          // ignore: cast_nullable_to_non_nullable
          : employeeID as int?,
      copyError: copyError == const $CopyWithPlaceholder()
          ? _value.copyError
          // ignore: cast_nullable_to_non_nullable
          : copyError as String?,
      positionName: positionName == const $CopyWithPlaceholder()
          ? _value.positionName
          // ignore: cast_nullable_to_non_nullable
          : positionName as String?,
      departmentName: departmentName == const $CopyWithPlaceholder()
          ? _value.departmentName
          // ignore: cast_nullable_to_non_nullable
          : departmentName as String?,
      content: content == const $CopyWithPlaceholder()
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String?,
      results: results == const $CopyWithPlaceholder()
          ? _value.results
          // ignore: cast_nullable_to_non_nullable
          : results as String?,
      positionId: positionId == const $CopyWithPlaceholder()
          ? _value.positionId
          // ignore: cast_nullable_to_non_nullable
          : positionId as int?,
      works: works == const $CopyWithPlaceholder() || works == null
          ? _value.works
          // ignore: cast_nullable_to_non_nullable
          : works as List<AgvWork>,
      locationType:
          locationType == const $CopyWithPlaceholder() || locationType == null
              ? _value.locationType
              // ignore: cast_nullable_to_non_nullable
              : locationType as String,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
      projectId: projectId == const $CopyWithPlaceholder()
          ? _value.projectId
          // ignore: cast_nullable_to_non_nullable
          : projectId as int?,
      selectedProject: selectedProject == const $CopyWithPlaceholder()
          ? _value.selectedProject
          // ignore: cast_nullable_to_non_nullable
          : selectedProject as ProjectResponse?,
      selectedProjectItem: selectedProjectItem == const $CopyWithPlaceholder()
          ? _value.selectedProjectItem
          // ignore: cast_nullable_to_non_nullable
          : selectedProjectItem as ProjectItemResponse?,
      projectName: projectName == const $CopyWithPlaceholder()
          ? _value.projectName
          // ignore: cast_nullable_to_non_nullable
          : projectName as String?,
    );
  }
}

extension $AgvStateCopyWith on AgvState {
  /// Returns a callable class that can be used as follows: `instanceOfAgvState.copyWith(...)` or like so:`instanceOfAgvState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AgvStateCWProxy get copyWith => _$AgvStateCWProxyImpl(this);
}
