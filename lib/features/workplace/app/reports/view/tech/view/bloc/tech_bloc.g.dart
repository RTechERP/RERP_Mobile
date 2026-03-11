// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tech_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TechStateCWProxy {
  TechState status(BaseStateStatus status);

  TechState message(String? message);

  TechState reports(List<ReportResponse> reports);

  TechState projects(List<TechProject> projects);

  TechState departs(List<DepartResponse> departs);

  TechState rtcProject(List<ProjectResponse> rtcProject);

  TechState projectItem(List<ProjectItemResponse> projectItem);

  TechState works(List<TechWork> works);

  TechState detailReport(DetailReportResponse? detailReport);

  TechState selectedProject(TechProject? selectedProject);

  TechState expandedProjectIndex(int? expandedProjectIndex);

  TechState expandedWorkIndex(int? expandedWorkIndex);

  TechState dateStart(DateTime? dateStart);

  TechState dateEnd(DateTime? dateEnd);

  TechState keyword(String? keyword);

  TechState locationType(String locationType);

  TechState location(String? location);

  TechState backlog(String? backlog);

  TechState problem(String? problem);

  TechState problemSolve(String? problemSolve);

  TechState note(String? note);

  TechState planNextDay(String? planNextDay);

  TechState id(int? id);

  TechState fullName(String? fullName);

  TechState selectedProjectItem(ProjectItemResponse? selectedProjectItem);

  TechState isSubmitting(bool isSubmitting);

  TechState submitSuccess(bool submitSuccess);

  TechState projectError(String? projectError);

  TechState workItemError(String? workItemError);

  TechState totalHoursError(String? totalHoursError);

  TechState percentError(String? percentError);

  TechState userId(int? userId);

  TechState sendMailSuccess(bool sendMailSuccess);

  TechState lastPickedDate(DateTime? lastPickedDate);

  TechState isLoadingDetail(bool isLoadingDetail);

  TechState selectedReportDetail(DetailReportResponse? selectedReportDetail);

  TechState dateReport(DateTime? dateReport);

  TechState isSaving(bool isSaving);

  TechState saveSuccess(bool saveSuccess);

  TechState isDeleting(bool isDeleting);

  TechState deleteSuccess(bool deleteSuccess);

  TechState copyReports(List<CopyResponse> copyReports);

  TechState isCopyLoading(bool isCopyLoading);

  TechState teamId(int? teamId);

  TechState departmentId(int? departmentId);

  TechState employeeID(int? employeeID);

  TechState copyError(String? copyError);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TechState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TechState(...).copyWith(id: 12, name: "My name")
  /// ````
  TechState call({
    BaseStateStatus? status,
    String? message,
    List<ReportResponse>? reports,
    List<TechProject>? projects,
    List<DepartResponse>? departs,
    List<ProjectResponse>? rtcProject,
    List<ProjectItemResponse>? projectItem,
    List<TechWork>? works,
    DetailReportResponse? detailReport,
    TechProject? selectedProject,
    int? expandedProjectIndex,
    int? expandedWorkIndex,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    String? locationType,
    String? location,
    String? backlog,
    String? problem,
    String? problemSolve,
    String? note,
    String? planNextDay,
    int? id,
    String? fullName,
    ProjectItemResponse? selectedProjectItem,
    bool? isSubmitting,
    bool? submitSuccess,
    String? projectError,
    String? workItemError,
    String? totalHoursError,
    String? percentError,
    int? userId,
    bool? sendMailSuccess,
    DateTime? lastPickedDate,
    bool? isLoadingDetail,
    DetailReportResponse? selectedReportDetail,
    DateTime? dateReport,
    bool? isSaving,
    bool? saveSuccess,
    bool? isDeleting,
    bool? deleteSuccess,
    List<CopyResponse>? copyReports,
    bool? isCopyLoading,
    int? teamId,
    int? departmentId,
    int? employeeID,
    String? copyError,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTechState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTechState.copyWith.fieldName(...)`
class _$TechStateCWProxyImpl implements _$TechStateCWProxy {
  const _$TechStateCWProxyImpl(this._value);

  final TechState _value;

  @override
  TechState status(BaseStateStatus status) => this(status: status);

  @override
  TechState message(String? message) => this(message: message);

  @override
  TechState reports(List<ReportResponse> reports) => this(reports: reports);

  @override
  TechState projects(List<TechProject> projects) => this(projects: projects);

  @override
  TechState departs(List<DepartResponse> departs) => this(departs: departs);

  @override
  TechState rtcProject(List<ProjectResponse> rtcProject) =>
      this(rtcProject: rtcProject);

  @override
  TechState projectItem(List<ProjectItemResponse> projectItem) =>
      this(projectItem: projectItem);

  @override
  TechState works(List<TechWork> works) => this(works: works);

  @override
  TechState detailReport(DetailReportResponse? detailReport) =>
      this(detailReport: detailReport);

  @override
  TechState selectedProject(TechProject? selectedProject) =>
      this(selectedProject: selectedProject);

  @override
  TechState expandedProjectIndex(int? expandedProjectIndex) =>
      this(expandedProjectIndex: expandedProjectIndex);

  @override
  TechState expandedWorkIndex(int? expandedWorkIndex) =>
      this(expandedWorkIndex: expandedWorkIndex);

  @override
  TechState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  TechState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  TechState keyword(String? keyword) => this(keyword: keyword);

  @override
  TechState locationType(String locationType) =>
      this(locationType: locationType);

  @override
  TechState location(String? location) => this(location: location);

  @override
  TechState backlog(String? backlog) => this(backlog: backlog);

  @override
  TechState problem(String? problem) => this(problem: problem);

  @override
  TechState problemSolve(String? problemSolve) =>
      this(problemSolve: problemSolve);

  @override
  TechState note(String? note) => this(note: note);

  @override
  TechState planNextDay(String? planNextDay) => this(planNextDay: planNextDay);

  @override
  TechState id(int? id) => this(id: id);

  @override
  TechState fullName(String? fullName) => this(fullName: fullName);

  @override
  TechState selectedProjectItem(ProjectItemResponse? selectedProjectItem) =>
      this(selectedProjectItem: selectedProjectItem);

  @override
  TechState isSubmitting(bool isSubmitting) => this(isSubmitting: isSubmitting);

  @override
  TechState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  TechState projectError(String? projectError) =>
      this(projectError: projectError);

  @override
  TechState workItemError(String? workItemError) =>
      this(workItemError: workItemError);

  @override
  TechState totalHoursError(String? totalHoursError) =>
      this(totalHoursError: totalHoursError);

  @override
  TechState percentError(String? percentError) =>
      this(percentError: percentError);

  @override
  TechState userId(int? userId) => this(userId: userId);

  @override
  TechState sendMailSuccess(bool sendMailSuccess) =>
      this(sendMailSuccess: sendMailSuccess);

  @override
  TechState lastPickedDate(DateTime? lastPickedDate) =>
      this(lastPickedDate: lastPickedDate);

  @override
  TechState isLoadingDetail(bool isLoadingDetail) =>
      this(isLoadingDetail: isLoadingDetail);

  @override
  TechState selectedReportDetail(DetailReportResponse? selectedReportDetail) =>
      this(selectedReportDetail: selectedReportDetail);

  @override
  TechState dateReport(DateTime? dateReport) => this(dateReport: dateReport);

  @override
  TechState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  TechState saveSuccess(bool saveSuccess) => this(saveSuccess: saveSuccess);

  @override
  TechState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  TechState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  TechState copyReports(List<CopyResponse> copyReports) =>
      this(copyReports: copyReports);

  @override
  TechState isCopyLoading(bool isCopyLoading) =>
      this(isCopyLoading: isCopyLoading);

  @override
  TechState teamId(int? teamId) => this(teamId: teamId);

  @override
  TechState departmentId(int? departmentId) => this(departmentId: departmentId);

  @override
  TechState employeeID(int? employeeID) => this(employeeID: employeeID);

  @override
  TechState copyError(String? copyError) => this(copyError: copyError);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TechState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TechState(...).copyWith(id: 12, name: "My name")
  /// ````
  TechState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? reports = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? departs = const $CopyWithPlaceholder(),
    Object? rtcProject = const $CopyWithPlaceholder(),
    Object? projectItem = const $CopyWithPlaceholder(),
    Object? works = const $CopyWithPlaceholder(),
    Object? detailReport = const $CopyWithPlaceholder(),
    Object? selectedProject = const $CopyWithPlaceholder(),
    Object? expandedProjectIndex = const $CopyWithPlaceholder(),
    Object? expandedWorkIndex = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? locationType = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? backlog = const $CopyWithPlaceholder(),
    Object? problem = const $CopyWithPlaceholder(),
    Object? problemSolve = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? planNextDay = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? fullName = const $CopyWithPlaceholder(),
    Object? selectedProjectItem = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? projectError = const $CopyWithPlaceholder(),
    Object? workItemError = const $CopyWithPlaceholder(),
    Object? totalHoursError = const $CopyWithPlaceholder(),
    Object? percentError = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? sendMailSuccess = const $CopyWithPlaceholder(),
    Object? lastPickedDate = const $CopyWithPlaceholder(),
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
  }) {
    return TechState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      reports: reports == const $CopyWithPlaceholder() || reports == null
          ? _value.reports
          // ignore: cast_nullable_to_non_nullable
          : reports as List<ReportResponse>,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<TechProject>,
      departs: departs == const $CopyWithPlaceholder() || departs == null
          ? _value.departs
          // ignore: cast_nullable_to_non_nullable
          : departs as List<DepartResponse>,
      rtcProject:
          rtcProject == const $CopyWithPlaceholder() || rtcProject == null
              ? _value.rtcProject
              // ignore: cast_nullable_to_non_nullable
              : rtcProject as List<ProjectResponse>,
      projectItem:
          projectItem == const $CopyWithPlaceholder() || projectItem == null
              ? _value.projectItem
              // ignore: cast_nullable_to_non_nullable
              : projectItem as List<ProjectItemResponse>,
      works: works == const $CopyWithPlaceholder() || works == null
          ? _value.works
          // ignore: cast_nullable_to_non_nullable
          : works as List<TechWork>,
      detailReport: detailReport == const $CopyWithPlaceholder()
          ? _value.detailReport
          // ignore: cast_nullable_to_non_nullable
          : detailReport as DetailReportResponse?,
      selectedProject: selectedProject == const $CopyWithPlaceholder()
          ? _value.selectedProject
          // ignore: cast_nullable_to_non_nullable
          : selectedProject as TechProject?,
      expandedProjectIndex: expandedProjectIndex == const $CopyWithPlaceholder()
          ? _value.expandedProjectIndex
          // ignore: cast_nullable_to_non_nullable
          : expandedProjectIndex as int?,
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
      locationType:
          locationType == const $CopyWithPlaceholder() || locationType == null
              ? _value.locationType
              // ignore: cast_nullable_to_non_nullable
              : locationType as String,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
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
      selectedProjectItem: selectedProjectItem == const $CopyWithPlaceholder()
          ? _value.selectedProjectItem
          // ignore: cast_nullable_to_non_nullable
          : selectedProjectItem as ProjectItemResponse?,
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
      projectError: projectError == const $CopyWithPlaceholder()
          ? _value.projectError
          // ignore: cast_nullable_to_non_nullable
          : projectError as String?,
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
      sendMailSuccess: sendMailSuccess == const $CopyWithPlaceholder() ||
              sendMailSuccess == null
          ? _value.sendMailSuccess
          // ignore: cast_nullable_to_non_nullable
          : sendMailSuccess as bool,
      lastPickedDate: lastPickedDate == const $CopyWithPlaceholder()
          ? _value.lastPickedDate
          // ignore: cast_nullable_to_non_nullable
          : lastPickedDate as DateTime?,
      isLoadingDetail: isLoadingDetail == const $CopyWithPlaceholder() ||
              isLoadingDetail == null
          ? _value.isLoadingDetail
          // ignore: cast_nullable_to_non_nullable
          : isLoadingDetail as bool,
      selectedReportDetail: selectedReportDetail == const $CopyWithPlaceholder()
          ? _value.selectedReportDetail
          // ignore: cast_nullable_to_non_nullable
          : selectedReportDetail as DetailReportResponse?,
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
              : copyReports as List<CopyResponse>,
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
    );
  }
}

extension $TechStateCopyWith on TechState {
  /// Returns a callable class that can be used as follows: `instanceOfTechState.copyWith(...)` or like so:`instanceOfTechState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TechStateCWProxy get copyWith => _$TechStateCWProxyImpl(this);
}
