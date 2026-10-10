// Service cho module Đặt phòng nhà nghỉ.
// API: GET /AccommodationBooking/data-accommodation-booking

import 'dart:convert';

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

  /// Lấy danh sách tỉnh/thành phục vụ lọc lưu trú.
  /// API: GET /vehiclebookingmanagement/get-province-departure?employeeId=0
  Future<BaseData<List<ProvinceFilterItem>>> getProvinces({
    int employeeId = 0,
  }) {
    return get<BaseData<List<ProvinceFilterItem>>>(
      ApiEndPoint.getProvinceDeparture,
      query: {'employeeId': employeeId},
      parser: (json) => _parseListGeneric<ProvinceFilterItem>(
            json,
            (e) => ProvinceFilterItem.fromJson(e as Map<String, dynamic>),
          ),
    );
  }

  /// Lấy danh sách nhân viên cho bộ lọc người đăng ký.
  /// API: GET /Employee?status=0&departmentID=0&keyword=
  /// Response có thể là mảng trực tiếp `[...]` hoặc envelope `BaseData`.
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
      parser: (json) => _parseListGeneric<EmployeeFilterItem>(
            json,
            (e) => EmployeeFilterItem.fromJson(e as Map<String, dynamic>),
          ),
    );
  }

  /// Lấy danh sách công ty phát hành hóa đơn — cho picker "Công ty".
  /// API: GET /TaxCompany/get-tax-companies
  Future<BaseData<List<TaxCompanyItem>>> getTaxCompanies() {
    return get<BaseData<List<TaxCompanyItem>>>(
      ApiEndPoint.getTaxCompanies,
      parser: (json) => _parseListGeneric<TaxCompanyItem>(
        json,
        (e) => TaxCompanyItem.fromJson(e as Map<String, dynamic>),
      ),
    );
  }

  /// Lấy danh sách ngân hàng — cho picker "Ngân hàng".
  /// API: GET /banklist
  Future<BaseData<List<BankItem>>> getBankList() {
    return get<BaseData<List<BankItem>>>(
      ApiEndPoint.getBankList,
      parser: (json) => _parseListGeneric<BankItem>(
        json,
        (e) => BankItem.fromJson(e as Map<String, dynamic>),
      ),
    );
  }

  /// Lưu phiếu đặt phòng nhà nghỉ (thêm mới).
  /// API: POST /AccommodationBooking/save-data
  ///
  /// Payload dạng:
  /// ```
  /// {
  ///   "accommodationBooking": { ID, RegisterID, ProjectID, ProvinceID,
  ///                             StartDate, EndDate, Note, ApprovedTBP,
  ///                             SpecificDestinationAddress, Address },
  ///   "accommodationBookingDetails": [ { ID, AccommodationBookingID, EmployeeID,
  ///                                      PhoneNumber, FullName, DepartmentName,
  ///                                      Note, EmployeeCode } ],
  ///   "idDeleteds": []
  /// }
  /// ```
  ///
  /// Server có thể trả về:
  /// 1. Envelope chuẩn `{ status, message, data: <id> }`.
  /// 2. JSON string bọc JSON (Dio parse về String do content-type không match).
  /// 3. `true` / `false` / số (một số endpoint ASP.NET trả raw primitive).
  Future<BaseData<BookingGuestHouseSaveResponse>> saveBookingGuestHouse({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<BookingGuestHouseSaveResponse>>(
      ApiEndPoint.saveBookingGuestHouse,
      body: payload,
      parser: (json) => _parseSaveResponse(json),
    );
  }

  /// Xoá phiếu đặt phòng nhà nghỉ.
  /// API: POST /AccommodationBooking/delete
  /// Body: `[19]` — mảng ID cần xoá (API nhận nhiều ID trong 1 lần gọi).
  Future<BaseData<void>> deleteBookingGuestHouse({required List<int> ids}) {
    return post<BaseData<void>>(
      ApiEndPoint.deleteBookingGuestHouse,
      body: ids,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  /// Lấy chi tiết 1 phiếu đặt phòng nhà nghỉ (kèm danh sách người ở).
  /// API: GET `/AccommodationBooking/accommodation-booking-by-id?id=<id>`
  /// Query: `id=<id>`.
  ///
  /// Server trả thẳng object `{ "accommodationBooking", "accommodationBookingDetail" }`
  /// (không bọc envelope `BaseData`) — xem `_parseDetail`.
  Future<BaseData<BookingGuestHouseDetailData>>
      getBookingGuestHouseById({required int id}) {
    return get<BaseData<BookingGuestHouseDetailData>>(
      ApiEndPoint.getBookingGuestHouseById,
      query: <String, dynamic>{'id': id},
      parser: (json) => _parseDetail(json),
    );
  }

  /// Parser cho response detail — server có thể trả:
  /// 1. trực tiếp object detail (không envelope): parse luôn.
  /// 2. envelope `BaseData<...>` chuẩn của project.
  BaseData<BookingGuestHouseDetailData> _parseDetail(dynamic json) {
    // 1. Chuỗi JSON — parse lại thành Map.
    if (json is String) {
      final raw = json.trim();
      if (raw.isEmpty) {
        final r = BaseData<BookingGuestHouseDetailData>(status: 0);
        r.message = 'Response rỗng';
        return r;
      }
      try {
        final decoded = jsonDecode(raw);
        return _parseDetail(decoded);
      } catch (_) {
        final r = BaseData<BookingGuestHouseDetailData>(status: 0);
        r.message = 'Không parse được JSON';
        return r;
      }
    }

    // 2. Đã là envelope `{ status, message, data }` → parse chuẩn.
    if (json is Map<String, dynamic>) {
      // Nếu object có key `accommodationBooking` (cấu trúc BRTC) → đây là
      // server trả thẳng object detail, không bọc BaseData.
      if (json.containsKey('accommodationBooking') ||
          json.containsKey('accommodationBookingDetail')) {
        try {
          final data = BookingGuestHouseDetailData.fromJson(json);
          return BaseData<BookingGuestHouseDetailData>(
            status: 1,
            data: data,
          );
        } catch (e) {
          final r = BaseData<BookingGuestHouseDetailData>(status: 0);
          r.message = 'Lỗi parse detail: $e';
          return r;
        }
      }

      // Còn lại: parse theo envelope.
      return BaseData<BookingGuestHouseDetailData>.fromJson(
        json,
        (data) => BookingGuestHouseDetailData.fromJson(
          data is Map<String, dynamic>
              ? data
              : <String, dynamic>{},
        ),
      );
    }

    final r = BaseData<BookingGuestHouseDetailData>(status: 0);
    r.message = 'Response không đúng format';
    return r;
  }

  /// Parser defensive cho response save — chấp nhận nhiều dạng JSON
  /// server có thể trả về.
  BaseData<BookingGuestHouseSaveResponse> _parseSaveResponse(dynamic json) {
    // 1. Dio đã parse thành String (do content-type không match JSON).
    //    Thử parse lại thành Map/List/primitive.
    if (json is String) {
      final raw = json.trim();
      if (raw.isEmpty) {
        return BaseData<BookingGuestHouseSaveResponse>(
          status: 1,
          data: const BookingGuestHouseSaveResponse(),
        );
      }
      try {
        final decoded = jsonDecode(raw);
        return _parseSaveResponse(decoded);
      } catch (_) {
        // Không phải JSON — coi như success với ID rỗng.
        return BaseData<BookingGuestHouseSaveResponse>(
          status: 1,
          data: const BookingGuestHouseSaveResponse(),
        );
      }
    }

    // 2. JSON primitive (bool, num, null): success với ID rỗng.
    if (json == null || json is num || json is bool) {
      return BaseData<BookingGuestHouseSaveResponse>(
        status: 1,
        data: const BookingGuestHouseSaveResponse(),
      );
    }

    // 3. Envelope chuẩn BaseData: { status, message, data }.
    if (json is Map<String, dynamic>) {
      return BaseData<BookingGuestHouseSaveResponse>.fromJson(
        json,
        (data) => BookingGuestHouseSaveResponse.fromJson(
          data is Map<String, dynamic>
              ? data
              : <String, dynamic>{},
        ),
      );
    }

    // 4. Fallback — trả success nhưng ID rỗng.
    return BaseData<BookingGuestHouseSaveResponse>(
      status: 1,
      data: const BookingGuestHouseSaveResponse(),
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

  /// Generic parse cho các list đơn giản (Province, Employee...).
  /// Response có thể là mảng trực tiếp `[ {...} ]` hoặc envelope chuẩn.
  BaseData<List<T>> _parseListGeneric<T>(
    dynamic json,
    T Function(dynamic e) mapper,
  ) {
    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
        (data) =>
            (data as List).map(mapper).toList(),
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