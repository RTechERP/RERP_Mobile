import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../common/constants.dart';
import '../../../../../../auth/data/repository/auth_repository.dart';
import '../models/report_model.dart';

@injectable
class ReportService extends DioBaseApiService {
  ReportService(super.dio);


  /// Danh sách báo cáo hàng ngày
  Future<BaseData<List<ReportResponse>>> getDailyReportTech(
      DateTime dateStart,
      DateTime dateEnd,
      int teamId,
      int userId,
      String? keyword,
      int departmentId,
      ) {
    return post<BaseData<List<ReportResponse>>>(
      ApiEndPoint.getDailyReportTech,
      body: {
        'DateStart': dateStart.toIso8601String(),
        'DateEnd': dateEnd.toIso8601String(),
        'TeamID': teamId,
        'UserID': userId,
        'Keyword': keyword,
        'DepartmentID': departmentId,
      },
      parser: (json) => BaseData<List<ReportResponse>>.fromJson(
        json,
            (data) => (data as List)
            .map(
              (e) => ReportResponse.fromJson(
            e as Map<String, dynamic>,
          ),
        )
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
    final token = await AuthRepository.getToken();

    return get<BaseData<List<ProjectResponse>>>(
      ApiEndPoint.getProject,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
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
    final token = await AuthRepository.getToken();

    return get<BaseData<List<ProjectItemResponse>>>(
      ApiEndPoint.getProjectItemByUser,
      query: {
        'projectId': projectId,
        'status': status,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
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
    required SaveReportTechRequest request,
  }) async {
    final token = await AuthRepository.getToken();

    return post<BaseData<void>>(
      ApiEndPoint.saveReportTech,
      body: [
        request
      ],
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
      parser: (json) => BaseData<void>.fromJson(
        json,
            (_) => null, // data = null
      ),
    );
  }

  Future<BaseData<void>> saveReportTechRaw({
    required Map<String, dynamic> payload,
  }) async {
    final token = await AuthRepository.getToken();

    final body = [payload]; // ✅ root là mảng

    print('🔥 RAW BODY = ${jsonEncode(body)}');

    return post<BaseData<void>>(
      ApiEndPoint.saveReportTech,
      body: body, // nếu wrapper không encode thì đổi thành jsonEncode(body)
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

}

