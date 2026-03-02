part of 'marketing_bloc.dart';

@freezed
class MarketingEvent with _$MarketingEvent {
  const factory MarketingEvent.init() = _Init;

  /// ===== SUBMIT =====
  const factory MarketingEvent.submitReport(DateTime pickedDate) =
  _SubmitReportWithDate;

  /// ===== RESET SUBMIT FLAGS ====
  const factory MarketingEvent.resetSubmitFlags() = _ResetSubmitFlags;

  const factory MarketingEvent.updateWork({

    String? content,
    String? results,
    String? note,
    String? planNextDay,
  }) = _UpdateWork;

  const factory MarketingEvent.updateDate(DateTime? picked) = _UpdateDate;

  const factory MarketingEvent.uploadFiles(
      List<File> files,
      ) = _UploadFiles;

  const factory MarketingEvent.setLocalFiles(
      List<File> files,
      ) = _SetLocalFiles;
  const factory MarketingEvent.removeLocalFile(
      File file,
      ) = _RemoveLocalFile;

  const factory MarketingEvent.markDeletedFile(
      int fileId,
      ) = _MarkDeletedFile;

  const factory MarketingEvent.deleteReport(int dailyID) = _DeleteReport;

  const factory MarketingEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory MarketingEvent.loadDetailData({required int dailyID}) =
  _LoadDetailData;

  const factory MarketingEvent.selectReport({required int dailyID}) = _SelectReport;

  const factory MarketingEvent.submitEditReport(DateTime pickedDate, int dailyID) =
  _SubmitEditReportWithDate;

  const factory MarketingEvent.uploadEditFiles(
      List<File> files,
      ) = _UploadEditFiles;

  const factory MarketingEvent.removeFile(
      MarketingFileRequest file,
      ) = _RemoveFile;

}