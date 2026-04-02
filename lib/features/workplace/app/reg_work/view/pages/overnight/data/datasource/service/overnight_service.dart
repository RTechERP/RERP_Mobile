import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/overnight_model.dart';

@injectable
class OverNightService extends DioBaseApiService {
  OverNightService(super.dio);

  Future<BaseData<List<OvernightItem>>> getOverNight({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<OvernightItem>>>(
      ApiEndPoint.getOvernight,
      body: payload,
      parser: (json) => BaseData<List<OvernightItem>>.fromJson(
        json,
            (data) {
          if (data is List) {
            return data
                .map((e) => OvernightItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => OvernightItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<List<ApproverItem>>> getApprover() {
    return get<BaseData<List<ApproverItem>>>(
      ApiEndPoint.getApprover,
      parser: (json) => BaseData<List<ApproverItem>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => ApproverItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveOverNight({
    required dynamic payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveOvernight,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }
}