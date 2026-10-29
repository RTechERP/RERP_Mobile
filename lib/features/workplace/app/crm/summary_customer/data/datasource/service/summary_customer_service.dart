import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../common/constants.dart';
import '../models/summary_customer_model.dart';

/// Service gọi API lấy danh sách tổng hợp khách hàng và dự án của CRM.
@injectable
class SummaryCustomerService extends DioBaseApiService {
  SummaryCustomerService(super.dio);

  /// Lấy danh sách khách hàng kèm dự án tương ứng.
  ///
  /// API: GET /Customer/customer-synthetic.
  /// Response: `{ status, message, data: [ { CustomerName, ProjectCode, ... } ] }`.
  ///
  /// BE có thể trả `data` dưới dạng mảng trực tiếp hoặc bọc trong object,
  /// nên parser xử lý cả hai trường hợp.
  Future<BaseData<List<SummaryCustomerItem>>> getCustomerSynthetic() async {
    return get<BaseData<List<SummaryCustomerItem>>>(
      ApiEndPoint.getCustomerSynthetic,
      parser: (json) => BaseData<List<SummaryCustomerItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => SummaryCustomerItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }

          final map = data as Map<String, dynamic>?;
          final list = map?['data'] as List? ?? const [];
          return list
              .map((e) => SummaryCustomerItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }
}
