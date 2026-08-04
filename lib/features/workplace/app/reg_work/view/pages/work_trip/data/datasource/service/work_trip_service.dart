import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/work_trip_model.dart';

@injectable
class WorkTripService extends DioBaseApiService {
  WorkTripService(super.dio);

  Future<BaseData<List<WorkTripItem>>> getWorkTrip({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<WorkTripItem>>>(
      ApiEndPoint.getWorkTrip,
      body: payload,
      parser: (json) => BaseData<List<WorkTripItem>>.fromJson(
        json,
            (data) {
          if (data is List) {
            return data
                .map((e) => WorkTripItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => WorkTripItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<List<WorkTripTypeItem>>> getWorkTripType() {
    return get<BaseData<List<WorkTripTypeItem>>>(
      ApiEndPoint.getWorkTripTypeBussiness,
      parser: (json) => BaseData<List<WorkTripTypeItem>>.fromJson(
        json,
            (data) {
          if (data is List) {
            return data
                .map((e) => WorkTripTypeItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => WorkTripTypeItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<List<WorkTripTypeVehicle>>> getWorkTripVehicleType() {
    return get<BaseData<List<WorkTripTypeVehicle>>>(
      ApiEndPoint.getWorkTripTypeVehicle,
      parser: (json) => BaseData<List<WorkTripTypeVehicle>>.fromJson(
        json,
            (data) {
          if (data is List) {
            return data
                .map((e) => WorkTripTypeVehicle.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => WorkTripTypeVehicle.fromJson(e as Map<String, dynamic>))
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


  Future<BaseData<List<WorkTripProject>>> getWorkTripProject() {
    return get<BaseData<List<WorkTripProject>>>(
      ApiEndPoint.getWorkTripProject,
      parser: (json) => BaseData<List<WorkTripProject>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => WorkTripProject.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveWorkTrip({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveWorkTrip,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  Future<BaseData<WorkTripDetailItem>> getWorkTripById(int id) {
    return get<BaseData<WorkTripDetailItem>>(
      '${ApiEndPoint.getWorkTripById}?id=$id',
      parser: (json) => BaseData<WorkTripDetailItem>.fromJson(
        json,
            (data) {
          // Response: { "employeeWorkTrip": {...}, "WorkTripFile": {...} }
          final map = data as Map<String, dynamic>;
          final inner = (map['employeeWorkTrip'] ?? map) as Map<String, dynamic>;
          return WorkTripDetailItem.fromJson(inner);
        },
      ),
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

  Future<BaseData<List<WorkTripSelfVehicle>>> getVehicleBookingsForBussiness({
    required int employeeId,
    required DateTime dateStart,
    required DateTime dateEnd,
  }) {
    return get<BaseData<List<WorkTripSelfVehicle>>>(
      ApiEndPoint.getVehicleBookingsForBussiness,
      query: {
        'employeeId': employeeId,
        'dateStart': dateStart.toIso8601String(),
        'dateEnd': dateEnd.toIso8601String(),
      },
      parser: (json) => BaseData<List<WorkTripSelfVehicle>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => WorkTripSelfVehicle.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => WorkTripSelfVehicle.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }
}