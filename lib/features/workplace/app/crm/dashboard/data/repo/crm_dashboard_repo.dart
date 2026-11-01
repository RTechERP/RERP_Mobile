import 'package:dartz/dartz.dart';

import '../../../../../../../base/network/errors/error.dart';
import '../datasource/models/crm_dashboard_model.dart';

/// Repository interface cho Dashboard CRM.
abstract class CrmDashboardRepo {
  /// Lấy dữ liệu dashboard CRM theo khoảng thời gian.
  Future<Either<BaseError, CrmDashboardData>> getDashboard({
    required DateTime dateStart,
    required DateTime dateEnd,
  });
}
