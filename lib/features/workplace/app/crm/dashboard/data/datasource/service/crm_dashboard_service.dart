import 'package:injectable/injectable.dart';

import '../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../base/network/models/base_data.dart';
import '../models/crm_dashboard_model.dart';

/// Service gọi API Dashboard CRM.
@injectable
class CrmDashboardService extends DioBaseApiService {
  CrmDashboardService(super.dio);

  /// Lấy dữ liệu dashboard CRM theo khoảng thời gian.
  ///
  /// API: GET /Lead/get-dashboard?dateStart=...&dateEnd=...
  /// Response: `{ status, message, data: { bySource: [...], ... } }`.
  Future<BaseData<CrmDashboardData>> getDashboard({
    required String dateStart,
    required String dateEnd,
  }) async {
    return get<BaseData<CrmDashboardData>>(
      '/Lead/get-dashboard',
      query: {
        'dateStart': dateStart,
        'dateEnd': dateEnd,
      },
      parser: (json) => BaseData<CrmDashboardData>.fromJson(
        json,
        (data) => CrmDashboardData.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}
