// Service cho màn Duyệt phiếu Đặt phòng nhà nghỉ.
// API: GET /AccommodationBooking/data-accommodation-booking

import 'package:injectable/injectable.dart';

import '../../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/approve_booking_guest_house_model.dart';

@injectable
class ApproveBookingGuestHouseService extends DioBaseApiService {
  ApproveBookingGuestHouseService(super.dio);

  /// Lấy danh sách đặt phòng nhà nghỉ trong khoảng thời gian (màn duyệt).
  /// Hiện dùng chung API `getBookingGuestHouse` của màn đăng ký — chỉ
  /// khác model parse (màn duyệt dùng `ApproveBookingGuestHouseItem`).
  ///
  /// - [dateStart], [dateEnd]: ISO string (vd `2026-09-30T17:00:00.000Z`).
  /// - [projectId], [employeeId]: bộ lọc (mặc định `0` = tất cả).
  /// - [filterText]: chuỗi tìm kiếm (mặc định rỗng).
  Future<BaseData<List<ApproveBookingGuestHouseItem>>>
      getApproveBookingGuestHouse({
    required String dateStart,
    required String dateEnd,
    int projectId = 0,
    int employeeId = 0,
    String filterText = '',
  }) async {
    return get<BaseData<List<ApproveBookingGuestHouseItem>>>(
      ApiEndPoint.getBookingGuestHouse,
      query: {
        'dateStart': dateStart,
        'dateEnd': dateEnd,
        'projectId': projectId,
        'employeeId': employeeId,
        'filterText': filterText,
      },
      parser: (json) => _parseList(json),
    );
  }

  /// Lấy danh sách dự án cho bộ lọc.
  /// API: GET /ProjectTask/get-all-project
  Future<BaseData<List<ApproveProjectFilterItem>>>
      getApproveBookingGuestHouseProjects() {
    return get<BaseData<List<ApproveProjectFilterItem>>>(
      ApiEndPoint.getAllProject,
      parser: (json) => BaseData<List<ApproveProjectFilterItem>>.fromJson(
        json,
        (data) {
          final list = data as List?;
          return (list ?? [])
              .map((e) => ApproveProjectFilterItem.fromJson(
                    e as Map<String, dynamic>,
                  ))
              .toList();
        },
      ),
    );
  }

  /// Lấy danh sách nhân viên cho bộ lọc người đăng ký.
  /// API: GET /Employee?status=0&departmentID=0&keyword=
  Future<BaseData<List<ApproveEmployeeFilterItem>>>
      getApproveBookingGuestHouseEmployees({String keyword = ''}) {
    return get<BaseData<List<ApproveEmployeeFilterItem>>>(
      ApiEndPoint.getEmployee,
      query: {
        'status': 0,
        'departmentID': 0,
        'keyword': keyword,
      },
      parser: (json) => _parseListGeneric<ApproveEmployeeFilterItem>(
        json,
        (e) => ApproveEmployeeFilterItem.fromJson(
          e as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Parse response — API có thể trả về:
  /// 1. Mảng trực tiếp `[ {...}, {...} ]` (không có envelope `BaseData`).
  /// 2. Envelope `{ status, data: [...] }` chuẩn của project.
  BaseData<List<ApproveBookingGuestHouseItem>> _parseList(dynamic json) {
    if (json is List) {
      return BaseData<List<ApproveBookingGuestHouseItem>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List)
            .map(
              (e) => ApproveBookingGuestHouseItem.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      );
    }

    return BaseData<List<ApproveBookingGuestHouseItem>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) {
          return data
              .map(
                (e) => ApproveBookingGuestHouseItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
        }
        return <ApproveBookingGuestHouseItem>[];
      },
    );
  }

  /// Generic parse cho các list đơn giản.
  /// Response có thể là mảng trực tiếp `[ {...} ]` hoặc envelope chuẩn.
  BaseData<List<T>> _parseListGeneric<T>(
    dynamic json,
    T Function(dynamic e) mapper,
  ) {
    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List).map(mapper).toList(),
      );
    }
    return BaseData<List<T>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) return data.map(mapper).toList();
        return <T>[];
      },
    );
  }
}
