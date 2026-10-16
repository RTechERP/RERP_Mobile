// Date: 16/10/2026
// Nội dung/Chức năng: Service gọi API cho chức năng thuê xe tải.

import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';

import '../models/rental_vehicle_model.dart';

@injectable
class RentalVehicleService extends DioBaseApiService {
  RentalVehicleService(super.dio);

  /// Tìm kiếm yêu cầu thuê xe tải.
  /// API: `POST /VehicleRentalRequest/search`
  /// Response là một mảng JSON các `RentalVehicleItem` (raw array).
  Future<BaseData<List<RentalVehicleItem>>> searchRentalVehicle({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<RentalVehicleItem>>>(
      ApiEndPoint.searchVehicleRental,
      body: payload,
      parser: (json) => _parseList<RentalVehicleItem>(
        json,
        RentalVehicleItem.fromJson,
      ),
    );
  }

  /// Parse response — hỗ trợ cả khi data là List hoặc Map (lấy field 'data'/'items'/'result').
  BaseData<List<T>> _parseList<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List)
            .map((e) => fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    return BaseData<List<T>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) {
          return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
        }
        if (data is Map) {
          final items = (data).values
              .whereType<List>()
              .expand((e) => e)
              .map((e) => fromJson(e as Map<String, dynamic>))
              .toList();
          if (items.isNotEmpty) return items;
        }
        return <T>[];
      },
    );
  }

  /// Lấy danh sách nhân viên (dùng dropdown ở add/detail screen).
  /// API: `GET /Employee?status=&departmentid=&keyword=`
  Future<BaseData<List<RentalVehicleEmployee>>> getEmployees({
    int status = 0,
    int departmentId = 0,
    String keyword = '',
  }) async {
    return get<BaseData<List<RentalVehicleEmployee>>>(
      ApiEndPoint.getEmployee,
      query: {
        'status': status,
        'departmentid': departmentId,
        'keyword': keyword,
      },
      parser: (json) => _parseList<RentalVehicleEmployee>(
        json,
        RentalVehicleEmployee.fromJson,
      ),
    );
  }

  /// Lấy danh sách phòng ban (dùng dropdown ở add/detail screen).
  /// API: `GET /Department/get-all`
  Future<BaseData<List<RentalVehicleDepartment>>> getDepartments() async {
    return get<BaseData<List<RentalVehicleDepartment>>>(
      ApiEndPoint.getDepart,
      parser: (json) => _parseList<RentalVehicleDepartment>(
        json,
        RentalVehicleDepartment.fromJson,
      ),
    );
  }

  /// Lấy danh sách dự án (dùng dropdown ở add screen).
  /// API: `GET /vehiclebookingmanagement/get-projects`
  Future<BaseData<List<RentalVehicleProject>>> getProjects() async {
    return get<BaseData<List<RentalVehicleProject>>>(
      ApiEndPoint.getBookingVehicleProject,
      parser: (json) => BaseData<List<RentalVehicleProject>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => RentalVehicleProject.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Lưu yêu cầu thuê xe tải (tạo mới / cập nhật).
  /// API: `POST /VehicleRentalRequest/save-data`
  Future<BaseData<bool>> saveData({
    required List<Map<String, dynamic>> payload,
  }) async {
    return post<BaseData<bool>>(
      ApiEndPoint.saveVehicleRental,
      body: payload,
      parser: (json) => BaseData<bool>.fromJson(
        json,
        (data) => data == true || data == 1,
      ),
    );
  }

  /// Xoá yêu cầu thuê xe tải theo danh sách id.
  /// API: `POST /VehicleRentalRequest/delete`
  /// Body: `[id1, id2, ...]`
  Future<BaseData<bool>> deleteData({
    required List<int> ids,
  }) async {
    return post<BaseData<bool>>(
      ApiEndPoint.deleteVehicleRental,
      body: ids,
      parser: (json) => BaseData<bool>.fromJson(
        json,
        (data) => data == true || data == 1,
      ),
    );
  }
}
