import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/stationery_model.dart';

@injectable
class StationeryService extends DioBaseApiService {
  StationeryService(super.dio);

  Future<BaseData<List<StationeryItem>>> getStationeryItem() async {
    return get<BaseData<List<StationeryItem>>>(
      ApiEndPoint.getStationery,
      parser: (json) => BaseData<List<StationeryItem>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => StationeryItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<StationerySupplyItem>>> getSupplyItem() async {
    return get<BaseData<List<StationerySupplyItem>>>(
      ApiEndPoint.getStationerySupply,
      parser: (json) => BaseData<List<StationerySupplyItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => StationerySupplyItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }


  Future<BaseData<List<StationeryDetailItem>>> getStationeryDetailItem() async {
    return get<BaseData<List<StationeryDetailItem>>>(
      ApiEndPoint.getStationeryDetail,
      parser: (json) => BaseData<List<StationeryDetailItem>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => StationeryDetailItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}
