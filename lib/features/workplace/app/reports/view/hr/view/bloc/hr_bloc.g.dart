// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hr_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HrStateCWProxy {
  HrState status(BaseStateStatus status);

  HrState message(String? message);

  HrState adList(List<dynamic>? adList);

  HrState lxcpList(List<dynamic>? lxcpList);

  HrState reports(List<ReportResponse> reports);

  HrState lxcpReports(List<HrReportItem> lxcpReports);

  HrState departs(List<DepartResponse> departs);

  HrState projectItem(List<ProjectItemResponse> projectItem);

  HrState filmDetail(List<FilmDetailResponse> filmDetail);

  HrState detailReport(DetailReportResponse? detailReport);

  HrState expandedWorkIndex(int? expandedWorkIndex);

  HrState dateStart(DateTime? dateStart);

  HrState dateEnd(DateTime? dateEnd);

  HrState keyword(String? keyword);

  HrState backlog(String? backlog);

  HrState problem(String? problem);

  HrState problemSolve(String? problemSolve);

  HrState note(String? note);

  HrState planNextDay(String? planNextDay);

  HrState id(int? id);

  HrState fullName(String? fullName);

  HrState isSubmitting(bool isSubmitting);

  HrState submitSuccess(bool submitSuccess);

  HrState workItemError(String? workItemError);

  HrState totalHoursError(String? totalHoursError);

  HrState percentError(String? percentError);

  HrState userId(int? userId);

  HrState sendMailSuccess(bool sendMailSuccess);

  HrState lastPickedDate(DateTime? lastPickedDate);

  HrState isLoadingDetail(bool isLoadingDetail);

  HrState selectedReportDetail(DetailReportNullResponse? selectedReportDetail);

  HrState dateReport(DateTime? dateReport);

  HrState isSaving(bool isSaving);

  HrState saveSuccess(bool saveSuccess);

  HrState isDeleting(bool isDeleting);

  HrState deleteSuccess(bool deleteSuccess);

  HrState copyReports(List<CopyNullResponse> copyReports);

  HrState isCopyLoading(bool isCopyLoading);

  HrState teamId(int? teamId);

  HrState departmentId(int? departmentId);

  HrState employeeID(int? employeeID);

  HrState copyError(String? copyError);

  HrState positionName(String? positionName);

  HrState departmentName(String? departmentName);

  HrState content(String? content);

  HrState results(String? results);

  HrState positionId(int? positionId);

  HrState quantity(int? quantity);

  HrState timeActual(int? timeActual);

  HrState performanceActual(String? performanceActual);

  HrState percentage(String? percentage);

  HrState kmNumber(int? kmNumber);

  HrState totalLate(int? totalLate);

  HrState totalTimeLate(int? totalTimeLate);

  HrState reasonLate(String? reasonLate);

  HrState statusVehicle(String? statusVehicle);

  HrState propose(String? propose);

  HrState filmManagementDetailID(int? filmManagementDetailID);

  HrState selectedFilmDetail(FilmDetailResponse? selectedFilmDetail);

  HrState works(List<LxCpWork> works);

  HrState selectedLXCPReportDetail(
      DetailLXCPReportResponse? selectedLXCPReportDetail);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HrState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HrState(...).copyWith(id: 12, name: "My name")
  /// ````
  HrState call({
    BaseStateStatus? status,
    String? message,
    List<dynamic>? adList,
    List<dynamic>? lxcpList,
    List<ReportResponse>? reports,
    List<HrReportItem>? lxcpReports,
    List<DepartResponse>? departs,
    List<ProjectItemResponse>? projectItem,
    List<FilmDetailResponse>? filmDetail,
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
    bool? sendMailSuccess,
    DateTime? lastPickedDate,
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
    int? quantity,
    int? timeActual,
    String? performanceActual,
    String? percentage,
    int? kmNumber,
    int? totalLate,
    int? totalTimeLate,
    String? reasonLate,
    String? statusVehicle,
    String? propose,
    int? filmManagementDetailID,
    FilmDetailResponse? selectedFilmDetail,
    List<LxCpWork>? works,
    DetailLXCPReportResponse? selectedLXCPReportDetail,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHrState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHrState.copyWith.fieldName(...)`
class _$HrStateCWProxyImpl implements _$HrStateCWProxy {
  const _$HrStateCWProxyImpl(this._value);

  final HrState _value;

  @override
  HrState status(BaseStateStatus status) => this(status: status);

  @override
  HrState message(String? message) => this(message: message);

  @override
  HrState adList(List<dynamic>? adList) => this(adList: adList);

  @override
  HrState lxcpList(List<dynamic>? lxcpList) => this(lxcpList: lxcpList);

  @override
  HrState reports(List<ReportResponse> reports) => this(reports: reports);

  @override
  HrState lxcpReports(List<HrReportItem> lxcpReports) =>
      this(lxcpReports: lxcpReports);

  @override
  HrState departs(List<DepartResponse> departs) => this(departs: departs);

  @override
  HrState projectItem(List<ProjectItemResponse> projectItem) =>
      this(projectItem: projectItem);

  @override
  HrState filmDetail(List<FilmDetailResponse> filmDetail) =>
      this(filmDetail: filmDetail);

  @override
  HrState detailReport(DetailReportResponse? detailReport) =>
      this(detailReport: detailReport);

  @override
  HrState expandedWorkIndex(int? expandedWorkIndex) =>
      this(expandedWorkIndex: expandedWorkIndex);

  @override
  HrState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  HrState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  HrState keyword(String? keyword) => this(keyword: keyword);

  @override
  HrState backlog(String? backlog) => this(backlog: backlog);

  @override
  HrState problem(String? problem) => this(problem: problem);

  @override
  HrState problemSolve(String? problemSolve) =>
      this(problemSolve: problemSolve);

  @override
  HrState note(String? note) => this(note: note);

  @override
  HrState planNextDay(String? planNextDay) => this(planNextDay: planNextDay);

  @override
  HrState id(int? id) => this(id: id);

  @override
  HrState fullName(String? fullName) => this(fullName: fullName);

  @override
  HrState isSubmitting(bool isSubmitting) => this(isSubmitting: isSubmitting);

  @override
  HrState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  HrState workItemError(String? workItemError) =>
      this(workItemError: workItemError);

  @override
  HrState totalHoursError(String? totalHoursError) =>
      this(totalHoursError: totalHoursError);

  @override
  HrState percentError(String? percentError) =>
      this(percentError: percentError);

  @override
  HrState userId(int? userId) => this(userId: userId);

  @override
  HrState sendMailSuccess(bool sendMailSuccess) =>
      this(sendMailSuccess: sendMailSuccess);

  @override
  HrState lastPickedDate(DateTime? lastPickedDate) =>
      this(lastPickedDate: lastPickedDate);

  @override
  HrState isLoadingDetail(bool isLoadingDetail) =>
      this(isLoadingDetail: isLoadingDetail);

  @override
  HrState selectedReportDetail(
          DetailReportNullResponse? selectedReportDetail) =>
      this(selectedReportDetail: selectedReportDetail);

  @override
  HrState dateReport(DateTime? dateReport) => this(dateReport: dateReport);

  @override
  HrState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  HrState saveSuccess(bool saveSuccess) => this(saveSuccess: saveSuccess);

  @override
  HrState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  HrState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  HrState copyReports(List<CopyNullResponse> copyReports) =>
      this(copyReports: copyReports);

  @override
  HrState isCopyLoading(bool isCopyLoading) =>
      this(isCopyLoading: isCopyLoading);

  @override
  HrState teamId(int? teamId) => this(teamId: teamId);

  @override
  HrState departmentId(int? departmentId) => this(departmentId: departmentId);

  @override
  HrState employeeID(int? employeeID) => this(employeeID: employeeID);

  @override
  HrState copyError(String? copyError) => this(copyError: copyError);

  @override
  HrState positionName(String? positionName) =>
      this(positionName: positionName);

  @override
  HrState departmentName(String? departmentName) =>
      this(departmentName: departmentName);

  @override
  HrState content(String? content) => this(content: content);

  @override
  HrState results(String? results) => this(results: results);

  @override
  HrState positionId(int? positionId) => this(positionId: positionId);

  @override
  HrState quantity(int? quantity) => this(quantity: quantity);

  @override
  HrState timeActual(int? timeActual) => this(timeActual: timeActual);

  @override
  HrState performanceActual(String? performanceActual) =>
      this(performanceActual: performanceActual);

  @override
  HrState percentage(String? percentage) => this(percentage: percentage);

  @override
  HrState kmNumber(int? kmNumber) => this(kmNumber: kmNumber);

  @override
  HrState totalLate(int? totalLate) => this(totalLate: totalLate);

  @override
  HrState totalTimeLate(int? totalTimeLate) =>
      this(totalTimeLate: totalTimeLate);

  @override
  HrState reasonLate(String? reasonLate) => this(reasonLate: reasonLate);

  @override
  HrState statusVehicle(String? statusVehicle) =>
      this(statusVehicle: statusVehicle);

  @override
  HrState propose(String? propose) => this(propose: propose);

  @override
  HrState filmManagementDetailID(int? filmManagementDetailID) =>
      this(filmManagementDetailID: filmManagementDetailID);

  @override
  HrState selectedFilmDetail(FilmDetailResponse? selectedFilmDetail) =>
      this(selectedFilmDetail: selectedFilmDetail);

  @override
  HrState works(List<LxCpWork> works) => this(works: works);

  @override
  HrState selectedLXCPReportDetail(
          DetailLXCPReportResponse? selectedLXCPReportDetail) =>
      this(selectedLXCPReportDetail: selectedLXCPReportDetail);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HrState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HrState(...).copyWith(id: 12, name: "My name")
  /// ````
  HrState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? adList = const $CopyWithPlaceholder(),
    Object? lxcpList = const $CopyWithPlaceholder(),
    Object? reports = const $CopyWithPlaceholder(),
    Object? lxcpReports = const $CopyWithPlaceholder(),
    Object? departs = const $CopyWithPlaceholder(),
    Object? projectItem = const $CopyWithPlaceholder(),
    Object? filmDetail = const $CopyWithPlaceholder(),
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
    Object? positionName = const $CopyWithPlaceholder(),
    Object? departmentName = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? results = const $CopyWithPlaceholder(),
    Object? positionId = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? timeActual = const $CopyWithPlaceholder(),
    Object? performanceActual = const $CopyWithPlaceholder(),
    Object? percentage = const $CopyWithPlaceholder(),
    Object? kmNumber = const $CopyWithPlaceholder(),
    Object? totalLate = const $CopyWithPlaceholder(),
    Object? totalTimeLate = const $CopyWithPlaceholder(),
    Object? reasonLate = const $CopyWithPlaceholder(),
    Object? statusVehicle = const $CopyWithPlaceholder(),
    Object? propose = const $CopyWithPlaceholder(),
    Object? filmManagementDetailID = const $CopyWithPlaceholder(),
    Object? selectedFilmDetail = const $CopyWithPlaceholder(),
    Object? works = const $CopyWithPlaceholder(),
    Object? selectedLXCPReportDetail = const $CopyWithPlaceholder(),
  }) {
    return HrState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      adList: adList == const $CopyWithPlaceholder()
          ? _value.adList
          // ignore: cast_nullable_to_non_nullable
          : adList as List<dynamic>?,
      lxcpList: lxcpList == const $CopyWithPlaceholder()
          ? _value.lxcpList
          // ignore: cast_nullable_to_non_nullable
          : lxcpList as List<dynamic>?,
      reports: reports == const $CopyWithPlaceholder() || reports == null
          ? _value.reports
          // ignore: cast_nullable_to_non_nullable
          : reports as List<ReportResponse>,
      lxcpReports:
          lxcpReports == const $CopyWithPlaceholder() || lxcpReports == null
              ? _value.lxcpReports
              // ignore: cast_nullable_to_non_nullable
              : lxcpReports as List<HrReportItem>,
      departs: departs == const $CopyWithPlaceholder() || departs == null
          ? _value.departs
          // ignore: cast_nullable_to_non_nullable
          : departs as List<DepartResponse>,
      projectItem:
          projectItem == const $CopyWithPlaceholder() || projectItem == null
              ? _value.projectItem
              // ignore: cast_nullable_to_non_nullable
              : projectItem as List<ProjectItemResponse>,
      filmDetail:
          filmDetail == const $CopyWithPlaceholder() || filmDetail == null
              ? _value.filmDetail
              // ignore: cast_nullable_to_non_nullable
              : filmDetail as List<FilmDetailResponse>,
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
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int?,
      timeActual: timeActual == const $CopyWithPlaceholder()
          ? _value.timeActual
          // ignore: cast_nullable_to_non_nullable
          : timeActual as int?,
      performanceActual: performanceActual == const $CopyWithPlaceholder()
          ? _value.performanceActual
          // ignore: cast_nullable_to_non_nullable
          : performanceActual as String?,
      percentage: percentage == const $CopyWithPlaceholder()
          ? _value.percentage
          // ignore: cast_nullable_to_non_nullable
          : percentage as String?,
      kmNumber: kmNumber == const $CopyWithPlaceholder()
          ? _value.kmNumber
          // ignore: cast_nullable_to_non_nullable
          : kmNumber as int?,
      totalLate: totalLate == const $CopyWithPlaceholder()
          ? _value.totalLate
          // ignore: cast_nullable_to_non_nullable
          : totalLate as int?,
      totalTimeLate: totalTimeLate == const $CopyWithPlaceholder()
          ? _value.totalTimeLate
          // ignore: cast_nullable_to_non_nullable
          : totalTimeLate as int?,
      reasonLate: reasonLate == const $CopyWithPlaceholder()
          ? _value.reasonLate
          // ignore: cast_nullable_to_non_nullable
          : reasonLate as String?,
      statusVehicle: statusVehicle == const $CopyWithPlaceholder()
          ? _value.statusVehicle
          // ignore: cast_nullable_to_non_nullable
          : statusVehicle as String?,
      propose: propose == const $CopyWithPlaceholder()
          ? _value.propose
          // ignore: cast_nullable_to_non_nullable
          : propose as String?,
      filmManagementDetailID:
          filmManagementDetailID == const $CopyWithPlaceholder()
              ? _value.filmManagementDetailID
              // ignore: cast_nullable_to_non_nullable
              : filmManagementDetailID as int?,
      selectedFilmDetail: selectedFilmDetail == const $CopyWithPlaceholder()
          ? _value.selectedFilmDetail
          // ignore: cast_nullable_to_non_nullable
          : selectedFilmDetail as FilmDetailResponse?,
      works: works == const $CopyWithPlaceholder() || works == null
          ? _value.works
          // ignore: cast_nullable_to_non_nullable
          : works as List<LxCpWork>,
      selectedLXCPReportDetail:
          selectedLXCPReportDetail == const $CopyWithPlaceholder()
              ? _value.selectedLXCPReportDetail
              // ignore: cast_nullable_to_non_nullable
              : selectedLXCPReportDetail as DetailLXCPReportResponse?,
    );
  }
}

extension $HrStateCopyWith on HrState {
  /// Returns a callable class that can be used as follows: `instanceOfHrState.copyWith(...)` or like so:`instanceOfHrState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HrStateCWProxy get copyWith => _$HrStateCWProxyImpl(this);
}
