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
      return '$y-$m-$day' 'T' '$h:$min:$s';
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
  Future<BaseData<List<DepartResponse>>> getDepart(){

    return get<BaseData<List<DepartResponse>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<DepartResponse>>.fromJson(
        json,
            (data) => (data as List)
            .map(
              (e) => DepartResponse.fromJson(
            e as Map<String, dynamic>,
          ),
        )
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
            .map(
              (e) => ProjectResponse.fromJson(
            e as Map<String, dynamic>,
          ),
        )
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
      query: {
        'projectId': projectId,
        'status': status,
      },
      parser: (json) => BaseData<List<ProjectItemResponse>>.fromJson(
        json,
            (data) => (data as List)
            .map(
              (e) => ProjectItemResponse.fromJson(
            e as Map<String, dynamic>,
          ),
        )
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
  Future<BaseData<DetailReportResponse>> getById({
    required int dailyID,
  }) {
    return get<BaseData<DetailReportResponse>>(
      ApiEndPoint.getById,
      query: {
        'dailyID': dailyID,
      },
      parser: (json) => BaseData<DetailReportResponse>.fromJson(
        json,
            (data) => DetailReportResponse.fromJson(
          data as Map<String, dynamic>,
        ),
      ),
    );
  }
}

