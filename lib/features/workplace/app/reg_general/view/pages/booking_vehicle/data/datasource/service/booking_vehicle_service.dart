import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/booking_vehicle_model.dart';

@injectable
class BookingVehicleService extends DioBaseApiService{
  BookingVehicleService(super.dio);
  Future<BaseData<List<BookingVehicleItem>>> getBookingVehicle({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<BookingVehicleItem>>>(
      ApiEndPoint.getBookingVehicle,
      body: payload,
      parser: (json) => BaseData<List<BookingVehicleItem>>.fromJson(
        json,
            (data) {
          final map = data as Map<String, dynamic>;
          final list = map['data'] as List;

          return list
              .map((e) =>
              BookingVehicleItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }
}