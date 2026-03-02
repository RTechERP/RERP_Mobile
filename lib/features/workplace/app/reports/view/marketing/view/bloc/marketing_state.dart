part of 'marketing_bloc.dart';

@CopyWith()
class MarketingState extends BaseBlocState{
  final List<ReportResponse> reports;

  final List<DepartResponse> departs;
  final List<MarketingDailyFile>? marketingDailyFiles;
  final DetailMarketingReportResponse? detailReport;

  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? keyword;
  final String? planNextDay;

  final int? id;

  final String? fullName;

  final bool isSubmitting;
  final bool submitSuccess;

  final int? userId;

  final bool sendMailSuccess;

  final DateTime? lastPickedDate;
  final bool isLoadingDetail;

  final bool saveSuccess;
  final DateTime? dateReport;

  final bool isSaving;

  final bool isDeleting;

  final bool deleteSuccess;

  final List<CopyResponse> copyReports;

  final bool isCopyLoading;

  final String? copyError;

  final int? teamId;

  final int? departmentId;

  final int? employeeID;

  final String? content;
  final String? results;
  final String? note;

  final List<MarketingFileRequest>? files;
  final List<File>? localFiles;
  final List<int>? deletedFileIds;

  final bool isUploadingFile;

  final bool uploadSuccess;

  final String? positionName;

  final String? departmentName;

  final int? dailyID;

  const MarketingState({
    required super.status,
    super.message,
    this.marketingDailyFiles,
    this.reports = const [],
    this.departs = const [],
    this.detailReport,
    this.dateStart,
    this.dateEnd,
    this.keyword,
    this.planNextDay,
    this.id,
    this.fullName,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.userId,
    this.sendMailSuccess = false,
    this.lastPickedDate,
    this.isLoadingDetail = false,
    this.dateReport,
    this.isSaving = false,
    this.isDeleting = false,
    this.deleteSuccess = false,
    this.copyReports = const [],
    this.isCopyLoading = false,
    this.teamId,
    this.departmentId,
    this.employeeID,
    this.copyError,
    this.content,
    this.results,
    this.note,
    this.files,
    this.deletedFileIds,
    this.isUploadingFile = false,
    this.localFiles,
    this.uploadSuccess = false,
    this.positionName,
    this.departmentName,
    this.saveSuccess = false,
    this.dailyID,
  });

  factory MarketingState.init()=> const MarketingState(
    status: BaseStateStatus.init,
    reports: [],
    departs: [],
    detailReport: null,
    isSubmitting: false,
    submitSuccess: false,
    userId: null,
    fullName: null,
    sendMailSuccess: false,
    lastPickedDate: null,
    isLoadingDetail: false,
    dateReport: null,
    isSaving: false,
    isDeleting: false,
    deleteSuccess: false,
    copyReports: [],
    isCopyLoading: false,
    teamId: null,
    departmentId: null,
    employeeID: null,
    copyError: null,
    content: null,
    results: null,
    note: null,
    files: null,
    deletedFileIds: null,
    isUploadingFile: false,
    localFiles: null,
    uploadSuccess: false,
    positionName: null,
    departmentName: null,
    saveSuccess: false,
    marketingDailyFiles: null,
    dailyID: null,
  );

  @override
  List get props => [
    status,
    message,
    reports,
    departs,
    detailReport,
    dateStart,
    dateEnd,
    keyword,
    planNextDay,
    id,
    fullName,
    isSubmitting,
    submitSuccess,
    userId,
    sendMailSuccess,
    lastPickedDate,
    isLoadingDetail,
    dateReport,
    isSaving,
    isDeleting,
    deleteSuccess,
    copyReports,
    isCopyLoading,
    teamId,
    departmentId,
    employeeID,
    copyError,
    content,
    results,
    note,
    files,
    deletedFileIds,
    isUploadingFile,
    localFiles,
    uploadSuccess,
    deletedFileIds,
    sendMailSuccess,
    positionName,
    departmentName,
    saveSuccess,
    marketingDailyFiles,
    dailyID,
  ];
}