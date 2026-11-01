import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/network/errors/error.dart';
import '../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/crm_dashboard_model.dart';
import '../datasource/service/crm_dashboard_service.dart';
import 'crm_dashboard_repo.dart';

/// Implementation của [CrmDashboardRepo].
@LazySingleton(as: CrmDashboardRepo)
class CrmDashboardRepoImpl implements CrmDashboardRepo {
  final CrmDashboardService _service;

  CrmDashboardRepoImpl(this._service);

  @override
  Future<Either<BaseError, CrmDashboardData>> getDashboard({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    try {
      final formatter = DateFormat('yyyy-MM-dd');
      final res = await _service.getDashboard(
        dateStart: formatter.format(dateStart),
        dateEnd: formatter.format(dateEnd),
      );
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
