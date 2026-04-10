import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/in_out_model.dart';

@injectable
class InOutService extends DioBaseApiService {
  InOutService(super.dio);

  Future<BaseData<List<InOutItem>>> getInOut({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<InOutItem>>>(
      ApiEndPoint.getEarlyLate,
      body: payload,
      parser: (json) =>
      BaseData<List<InOutItem>>.fromJson(
        json,
            (data) =>
            ((data as List?) ?? const <dynamic>[])
                .map((e) => InOutItem.fromJson(e as Map<String, dynamic>))
                .toList(),
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

  Future<BaseData<void>> saveInOut({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveEarlyLate,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  Future<BaseData<FillApproverItem>> getFillApprover({
    required int employeeID,
    required String tableName,
  }) async {
    return get<BaseData<FillApproverItem>>(
      ApiEndPoint.getFillAprrover,
      query: {'employeeID': employeeID, 'tableName': tableName},
      parser: (json) => BaseData<FillApproverItem>.fromJson(
        json,
            (data) => FillApproverItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}