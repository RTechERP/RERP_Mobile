// Service cho module Đặt phòng nhà nghỉ.
// API: GET /AccommodationBooking/data-accommodation-booking

import 'package:injectable/injectable.dart';

import '../../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/booking_guest_house_model.dart';

@injectable
class BookingGuestHouseService extends DioBaseApiService {
  BookingGuestHouseService(super.dio);

  /// Lấy danh sách đặt phòng nhà nghỉ trong khoảng thời gian.
  ///
  /// - [dateStart], [dateEnd]: ISO string (vd `2026-09-30T17:00:00.000Z`).
  /// - [projectId], [employeeId]: bộ lọc theo dự án / nhân viên (mặc định `0` = tất cả).
  /// - [filterText]: chuỗi tìm kiếm (mặc định rỗng).
  Future<BaseData<List<BookingGuestHouseItem>>> getBookingGuestHouse({
    required String dateStart,
    required String dateEnd,
    int projectId = 0,
    int employeeId = 0,
    String filterText = '',
  }) async {
    return get<BaseData<List<BookingGuestHouseItem>>>(
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
  Future<BaseData<List<ProjectFilterItem>>> getProjects() {
    return get<BaseData<List<ProjectFilterItem>>>(
      ApiEndPoint.getAllProject,
      parser: (json) => BaseData<List<ProjectFilterItem>>.fromJson(json, (data) {
        final list = data as List?;
        return (list ?? [])
            .map((e) => ProjectFilterItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }

  /// Lấy danh sách nhân viên cho bộ lọc người đăng ký.
  /// API: GET /Employee?status=0&departmentID=0&keyword=
  Future<BaseData<List<EmployeeFilterItem>>> getEmployees({
    String keyword = '',
  }) {
    return get<BaseData<List<EmployeeFilterItem>>>(
      ApiEndPoint.getEmployee,
      query: {
        'status': 0,
        'departmentID': 0,
        'keyword': keyword,
      },
      parser: (json) => BaseData<List<EmployeeFilterItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map(
                  (e) =>
                      EmployeeFilterItem.fromJson(e as Map<String, dynamic>),
                )
                .toList();
          }
          return <EmployeeFilterItem>[];
        },
      ),
    );
  }

  /// Parse response — API trả về có thể là:
  /// 1. Mảng trực tiếp `[ {...}, {...} ]` (không có envelope `BaseData`).
  /// 2. Envelope `{ status, data: [...] }` chuẩn của project.
  BaseData<List<BookingGuestHouseItem>> _parseList(dynamic json) {
    if (json is List) {
      return BaseData<List<BookingGuestHouseItem>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List)
            .map(
              (e) => BookingGuestHouseItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );
    }

    return BaseData<List<BookingGuestHouseItem>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) {
          return data
              .map(
                (e) => BookingGuestHouseItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
        }
        return <BookingGuestHouseItem>[];
      },
    );
  }
}