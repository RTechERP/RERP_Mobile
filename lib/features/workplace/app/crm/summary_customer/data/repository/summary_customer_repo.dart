import 'package:dartz/dartz.dart';

import '../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/summary_customer_model.dart';

/// Repository trừu tượng cho màn tổng hợp khách hàng CRM.
abstract class SummaryCustomerRepo {
  /// Lấy danh sách khách hàng kèm dự án tương ứng.
  Future<Either<BaseError, List<SummaryCustomerItem>>> getCustomerSynthetic();
}
