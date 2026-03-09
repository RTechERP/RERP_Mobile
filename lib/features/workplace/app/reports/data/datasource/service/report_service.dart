import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../common/constants.dart';
import '../models/report_model.dart';

@injectable
class ReportService extends DioBaseApiService {
  ReportService(super.dio);

  /// Danh sách báo cáo hàng ngày
  Future<BaseData<List<ReportResponse>>> getDailyReportTech({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String teamId,
    required String userId,
    required String keyword,
    required String departmentId,
  }) async {
    String fmt(DateTime d) {
      final y = d.year.toString().padLeft(4, '0');
      final m = d.month.toString().padLeft(2, '0');
      final day = d.day.toString().padLeft(2, '0');
      final h = d.hour.toString().padLeft(2, '0');
      final min = d.minute.toString().padLeft(2, '0');
      final s = d.second.toString().padLeft(2, '0');
      return '$y-$m-$day'
          'T'
          '$h:$min:$s';
    }

    final body = <String, dynamic>{
      'DateStart': fmt(dateStart),
      'DateEnd': fmt(dateEnd),
      'TeamID': teamId,
      'UserID': userId,
      'Keyword': keyword,
      'DepartmentID': departmentId,
    };

    return post<BaseData<List<ReportResponse>>>(
      ApiEndPoint.getDailyReportTech,
      body: body,
      parser: (json) => BaseData<List<ReportResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => ReportResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách phòng ban
  Future<BaseData<List<DepartResponse>>> getDepart() {
    return get<BaseData<List<DepartResponse>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<DepartResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => DepartResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách dự án
  Future<BaseData<List<ProjectResponse>>> getProject() async {
    return get<BaseData<List<ProjectResponse>>>(
      ApiEndPoint.getProject,
      parser: (json) => BaseData<List<ProjectResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => ProjectResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách hạng mục công việc theo dự án
  Future<BaseData<List<ProjectItemResponse>>> getProjectItemByUser({
    required int projectId,
    int status = 2,
  }) async {
    return get<BaseData<List<ProjectItemResponse>>>(
      ApiEndPoint.getProjectItemByUser,
      query: {'projectId': projectId, 'status': status},
      parser: (json) => BaseData<List<ProjectItemResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => ProjectItemResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Lưu báo cáo công việc "Phòng Kỹ thuật"
  Future<BaseData<void>> saveReportTech({
    required Map<String, dynamic> payload,
  }) async {
    final body = [payload]; // ✅ root là mảng
    return post<BaseData<void>>(
      ApiEndPoint.saveReportTech,
      body: body, // nếu wrapper không encode thì đổi thành jsonEncode(body)
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Gửi mail báo cáo phòng kỹ thuật
  Future<BaseData<void>> sendMailReport({
    required SendMailRequestModel request,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.sendMailReport,
      body: request.toJson(),
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Lấy chi tiết báo cáo theo ID
  Future<BaseData<DetailReportResponse>> getById({required int dailyID}) {
    return get<BaseData<DetailReportResponse>>(
      ApiEndPoint.getById,
      query: {'dailyID': dailyID},
      parser: (json) => BaseData<DetailReportResponse>.fromJson(
        json,
        (data) => DetailReportResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<DetailReportNullResponse>> getByIdNull({
    required int dailyID,
  }) {
    return get<BaseData<DetailReportNullResponse>>(
      ApiEndPoint.getById,
      query: {'dailyID': dailyID},
      parser: (json) => BaseData<DetailReportNullResponse>.fromJson(
        json,
        (data) =>
            DetailReportNullResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<DetailLXCPReportResponse>> getLXCPById({required int dailyID}) {
    return get<BaseData<DetailLXCPReportResponse>>(
      ApiEndPoint.getLXCPById,
      query: {'id': dailyID},
      parser: (json) => BaseData<DetailLXCPReportResponse>.fromJson(
        json,
            (data) => DetailLXCPReportResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Xoá báo cáo theo ID
  Future<BaseData<void>> deleteReportById({required int dailyID}) async {
    return post<BaseData<void>>(
      ApiEndPoint.deleteReportById,
      query: {'dailyReportID': dailyID},
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  /// Copy báo cáo
  Future<BaseData<List<CopyResponse>>> copyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int teamId,
    required int userId,
    required String keyword,
    required int departmentId,
  }) async {
    String fmt(DateTime d) {
      final y = d.year.toString().padLeft(4, '0');
      final m = d.month.toString().padLeft(2, '0');
      final day = d.day.toString().padLeft(2, '0');
      return '$y-$m-$day';
    }

    final body = <String, dynamic>{
      'dateStart': fmt(dateStart),
      'dateEnd': fmt(dateEnd),
      'team_id': teamId,
      'keyword': keyword,
      'userid': userId,
      'departmentid': departmentId,
    };

    return post<BaseData<List<CopyResponse>>>(
      ApiEndPoint.copyReport, // sửa đúng endpoint của bạn
      body: body,
      parser: (json) => BaseData<List<CopyResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => CopyResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<CopyNullResponse>>> copyHrReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int teamId,
    required int userId,
    required String keyword,
    required int departmentId,
  }) async {
    String fmt(DateTime d) {
      final y = d.year.toString().padLeft(4, '0');
      final m = d.month.toString().padLeft(2, '0');
      final day = d.day.toString().padLeft(2, '0');
      return '$y-$m-$day';
    }

    final body = <String, dynamic>{
      'dateStart': fmt(dateStart),
      'dateEnd': fmt(dateEnd),
      'team_id': teamId,
      'keyword': keyword,
      'userid': userId,
      'departmentid': departmentId,
    };

    return post<BaseData<List<CopyNullResponse>>>(
      ApiEndPoint.copyReport, // sửa đúng endpoint của bạn
      body: body,
      parser: (json) => BaseData<List<CopyNullResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => CopyNullResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Lưu file đính kèm
  Future<BaseData<List<UploadFileResponse>>> uploadReportFile({
    required List<File> files,
    required String key,
    required String subPath,
  }) async {
    final formData = FormData();

    // add file(s)
    for (final file in files) {
      formData.files.add(
        MapEntry(
          'files',
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        ),
      );
    }

    // add text fields
    formData.fields.addAll([
      MapEntry('key', key),
      MapEntry('subPath', subPath),
    ]);

    return post<BaseData<List<UploadFileResponse>>>(
      ApiEndPoint.marketing_upload,
      body: formData,
      options: Options(contentType: 'multipart/form-data'),
      parser: (json) => BaseData<List<UploadFileResponse>>.fromJson(
        json,
        (data) =>
            (data as List).map((e) => UploadFileResponse.fromJson(e)).toList(),
      ),
    );
  }

  /// Lưu báo cáo phòng Marketing
  Future<BaseData<void>> saveReportMarketing({
    required Map<String, dynamic> payload,
  }) async {
    final body = payload;

    return post<BaseData<void>>(
      ApiEndPoint.saveReportMarketing,
      body: body,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Lấy chi tiết báo cáo Marketing theo ID
  Future<BaseData<DetailMarketingReportResponse>> getMarketingById({
    required int dailyID,
  }) {
    return get<BaseData<DetailMarketingReportResponse>>(
      ApiEndPoint.getMarketingById,
      query: {'dailyID': dailyID},
      parser: (json) {
        return BaseData<DetailMarketingReportResponse>.fromJson(
          json as Map<String, dynamic>,
          (dataJson) => DetailMarketingReportResponse.fromJson(
            dataJson as Map<String, dynamic>,
          ),
        );
      },
    );
  }

  /// Lưu báo cáo phòng Marketing
  Future<BaseData<void>> saveReportHr({
    required Map<String, dynamic> payload,
  }) async {
    final body = payload;

    return post<BaseData<void>>(
      ApiEndPoint.saveReportMarketing,
      body: body,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Danh sách báo cáo LXCP
  Future<BaseData<ReportLXCPResponse>> getLXCPDailyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String keyword,
    required String employeeID,
  }) async {
    String fmt(DateTime d) {
      final y = d.year.toString().padLeft(4, '0');
      final m = d.month.toString().padLeft(2, '0');
      final day = d.day.toString().padLeft(2, '0');
      final h = d.hour.toString().padLeft(2, '0');
      final min = d.minute.toString().padLeft(2, '0');
      final s = d.second.toString().padLeft(2, '0');
      return '$y-$m-$day'
          'T'
          '$h:$min:$s';
    }

    final body = <String, dynamic>{
      'DateStart': fmt(dateStart),
      'DateEnd': fmt(dateEnd),
      'Keyword': keyword,
      'employeeID': employeeID,
    };

    return post<BaseData<ReportLXCPResponse>>(
      ApiEndPoint.getDailyLXCP,
      body: body,
      parser: (json) => BaseData<ReportLXCPResponse>.fromJson({
        "data": json,
      }, (data) => ReportLXCPResponse.fromJson(data as Map<String, dynamic>)),
    );
  }

  Future<BaseData<void>> saveReportLXCP({
    required List<Map<String, dynamic>> payload,
  }) async {
    final body = payload;

    return post<BaseData<void>>(
      ApiEndPoint.saveReportLXCP,
      body: body,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Danh sách chi tiết phim
  Future<BaseData<List<FilmDetailResponse>>> getFilmDetail() async {
    return get<BaseData<List<FilmDetailResponse>>>(
      ApiEndPoint.getFilmDetail,
      parser: (json) => BaseData<List<FilmDetailResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => FilmDetailResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveReportAgvAd({
    required List<Map<String, dynamic>> payload,
  }) async {
    final body = payload;

    return post<BaseData<void>>(
      ApiEndPoint.saveReportTech,
      body: body,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }
}
