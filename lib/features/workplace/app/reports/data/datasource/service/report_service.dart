import 'package:injectable/injectable.dart';

import '../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../common/constants.dart';
import '../models/report_model.dart';

@injectable
class ReportService extends DioBaseApiService {
  ReportService(super.dio);

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
}

