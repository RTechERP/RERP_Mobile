import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/lunch_model.dart';

@injectable
class LunchService extends DioBaseApiService{
  LunchService(super.dio);

  Future<BaseData<List<LunchItem>>> getLunch({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<LunchItem>>>(
      ApiEndPoint.getLunch,
      body: payload,
      parser: (json) => BaseData<List<LunchItem>>.fromJson(
        json,
        (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => LunchItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<SaveLunchItem>> saveLunch({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<SaveLunchItem>>(
      ApiEndPoint.saveLunch,
      body: payload,
      parser: (json) => BaseData<SaveLunchItem>.fromJson(
        json,
            (data) =>
                SaveLunchItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}