import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/booking_vehicle_model.dart';

@injectable
class BookingVehicleService extends DioBaseApiService {
  BookingVehicleService(super.dio);
  Future<BaseData<List<BookingVehicleItem>>> getBookingVehicle({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<BookingVehicleItem>>>(
      ApiEndPoint.getBookingVehicle,
      body: payload,
      parser: (json) => BaseData<List<BookingVehicleItem>>.fromJson(json, (
        data,
      ) {
        final map = data as Map<String, dynamic>;
        final list = map['data'] as List;

        return list
            .map((e) => BookingVehicleItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }

  Future<BaseData<List<ProvinceArrivesItem>>> getProvinceArrives({
    required int employeeId,
  }) {
    return get<BaseData<List<ProvinceArrivesItem>>>(
      ApiEndPoint.getProvinceArrives,
      query: {'employeeId': employeeId},
      parser: (json) => BaseData<List<ProvinceArrivesItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => ProvinceArrivesItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<ProvinceDepartureItem>>> getProvinceDeparture({
    required int employeeId,
  }) {
    return get<BaseData<List<ProvinceDepartureItem>>>(
      ApiEndPoint.getProvinceDeparture,
      query: {'employeeId': employeeId},
      parser: (json) => BaseData<List<ProvinceDepartureItem>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) => ProvinceDepartureItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<List<BookingVehicleProjectItem>>> getProject() {
    return get<BaseData<List<BookingVehicleProjectItem>>>(
      ApiEndPoint.getBookingVehicleProject,
      parser: (json) => BaseData<List<BookingVehicleProjectItem>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) =>
                  BookingVehicleProjectItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<List<ApproverItem>>> getApprover() {
    return get<BaseData<List<ApproverItem>>>(
      ApiEndPoint.getBookingVehicleApprover,
      parser: (json) => BaseData<List<ApproverItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => ApproverItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<BookingVehiclePersonalItem>>> getEmployee() {
    return get<BaseData<List<BookingVehiclePersonalItem>>>(
      ApiEndPoint.getBookingVehicleEmployee,
      parser: (json) => BaseData<List<BookingVehiclePersonalItem>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) => BookingVehiclePersonalItem.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<BookingVehiclePersonalItem>> getEmployeeById({
    required int employeeId,
  }) {
    return get<BaseData<BookingVehiclePersonalItem>>(
      ApiEndPoint.getBookingVehicleEmployeeById,
      query: {'employeeId': employeeId},
      parser: (json) => BaseData<BookingVehiclePersonalItem>.fromJson(
        json,
        (data) =>
            BookingVehiclePersonalItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}
