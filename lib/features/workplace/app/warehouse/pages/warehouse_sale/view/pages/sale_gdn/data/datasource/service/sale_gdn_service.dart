import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';

@injectable
class SaleGdnService extends DioBaseApiService {
  SaleGdnService(super.dio);

  Future<BaseData<List<BillExporResponse>>> getBillExports({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<BillExporResponse>>>(
      ApiEndPoint.getBillExport,
      body: payload,
      parser: (json) {
        if (json is! Map<String, dynamic>) {
          return BaseData<List<BillExporResponse>>(
            status: 0,
            data: [],
          );
        }

        final status = json['status'] as int?;
        final dataJson = json['data'];

        List<BillExporResponse> items = [];
        if (dataJson is List) {
          items = dataJson
              .map((e) => BillExporResponse.fromJson(e as Map<String, dynamic>))
              .toList();
        }

        return BaseData<List<BillExporResponse>>(
          status: status,
          data: items,
        );
      },
    );
  }
}
