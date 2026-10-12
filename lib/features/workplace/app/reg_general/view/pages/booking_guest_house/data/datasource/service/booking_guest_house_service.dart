// Service cho module Đặt phòng nhà nghỉ.
// API: GET /AccommodationBooking/data-accommodation-booking

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
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

  /// Lấy chi tiết TT Quyết toán (TTQT) theo `accommodationBookingId`.
  /// API: `GET /AccommodationBookingPaymentOrder/get-detail-by-booking-id?accommodationBookingId=<id>`
  /// Dùng để pre-fill form Cập nhật TTQT. Có thể trả:
  /// 1. Envelope `BaseData<BookingGuestHousePaymentDetailItem>` chuẩn.
  /// 2. Trực tiếp 1 object `{ ID, AccommodationBookingID, ... }`.
  /// 3. Mảng `[{...}, {...}]` — lấy phần tử đầu tiên.
  /// 4. Chuỗi JSON bọc — parse lại.
  ///
  /// Khi không có TTQT (DetailStatus = 0 / null / không tồn tại) → trả
  /// `BaseData` với `data == null` (UI sẽ hiểu là "chưa có TTQT, giữ
  /// form rỗng").
  Future<BaseData<BookingGuestHousePaymentDetailItem?>>
      getPaymentOrderDetailByBookingId({required int id}) async {
    return get<BaseData<BookingGuestHousePaymentDetailItem?>>(
      ApiEndPoint.getPaymentOrderDetailByBookingId,
      query: <String, dynamic>{'accommodationBookingId': id},
      parser: (json) => _parsePaymentDetailByBookingId(json),
    );
  }

  /// Tạo / tạo lại đề nghị tạm ứng (ĐNTU) cho 1 phiếu đặt phòng nhà nghỉ.
  /// API: POST `/AccommodationBookingPaymentOrder/create-advance`
  /// Body: AccommodationBookingAdvanceRequest (xem mục 4.6 spec):
  /// ```
  /// {
  ///   AccommodationBookingID, ApprovedTBPID, Reason, ProjectID,
  ///   TransferType, BankAccount, BankListID, BankName, TotalAmount,
  ///   Note, CompanyID, CompanyName, DepartmentName, RecipientName
  /// }
  /// ```
  /// Khi phiếu cũ bị hủy duyệt ở bước hiện tại, BE tự tạo lại trên
  /// chính master cũ — response có `data.IsRecreated = true` + message
  /// "Đã tạo lại đề nghị tạm ứng (chờ TBP duyệt lại)".
  Future<BaseData<BookingGuestHouseAdvanceResponse>>
      createBookingGuestHouseAdvance({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<BookingGuestHouseAdvanceResponse>>(
      ApiEndPoint.createBookingGuestHouseAdvance,
      body: payload,
      parser: (json) => _parseAdvanceResponse(json),
    );
  }

  /// Lưu cập nhật TT Quyết toán (TTQT) standalone cho 1 phiếu đặt phòng nhà
  /// nghỉ. API: POST `/AccommodationBookingPaymentOrder/save-standalone-detail`
  /// Body: AccommodationBookingPaymentOrderRequest (mục 4.7 spec) — 19 field:
  /// ```
  /// {
  ///   ID, TotalAmount, TotalAmountWithInvoice, InvoiceNumber, BankAccount,
  ///   BankListID, BankName, TransferType, ApprovedTBPID, Reason, ProjectID,
  ///   CompanyID, CompanyName, DepartmentName, Note, AccommodationBookingID,
  ///   DetailStatus (2 = chờ duyệt), HotelName, HotelTaxCode
  /// }
  /// ```
  /// Response: `{ status, message, data: { ID, DetailStatus } }`.
  Future<BaseData<BookingGuestHouseSaveDetailResponse>>
      saveBookingGuestHouseStandaloneDetail({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<BookingGuestHouseSaveDetailResponse>>(
      ApiEndPoint.saveBookingGuestHouseStandaloneDetail,
      body: payload,
      parser: (json) => _parseSaveDetailResponse(json),
    );
  }

  /// Upload file đính kèm cho 1 detail TTQT (sau khi đã save-detail).
  /// API: POST `/AccommodationBookingPaymentOrder/upload-file`
  /// Query: `detailId` (ID từ save-standalone-detail), `fileType`
  /// (`INVOICE` | `BILL_CK`).
  /// Body: multipart form-data với key `key`, `subPath`, `files`.
  /// [files] - 1 hoặc nhiều file cần upload; mỗi file upload 1 request
  /// riêng (BE nhận mảng nhưng gọi nhiều lần cho chắc — pattern giống
  /// `uploadBookingVehicleFile`).
  /// Response `data` là 1 object (hoặc mảng) `BookingGuestHouseFileItem`.
  Future<BaseData<BookingGuestHouseFileItem>> uploadBookingGuestHouseFile({
    required int detailId,
    required String fileType,
    required PlatformFile file,
  }) async {
    late final MultipartFile part;
    final path = file.path;
    if (path != null && path.trim().isNotEmpty) {
      part = await MultipartFile.fromFile(path, filename: file.name);
    } else if (file.bytes != null) {
      part = MultipartFile.fromBytes(file.bytes!, filename: file.name);
    } else {
      throw ArgumentError('PlatformFile has no path or bytes');
    }

    // subPath trỏ tới thư mục con tương ứng với fileType — trùng với
    // quy ước BE (vd "NN-24\\INVOICE"). Để an toàn: lấy từ BE ở bước
    // tiếp theo nếu BE trả về path; hiện tại tự set theo fileType.
    final subPath = fileType;

    final formData = FormData.fromMap(<String, dynamic>{
      'key': 'AccommodationBookingPaymentOrderFile',
      'subPath': subPath,
      'files': part,
    });

    final res = await post<BaseData<BookingGuestHouseFileItem>>(
      ApiEndPoint.uploadBookingGuestHouseFile,
      query: <String, dynamic>{
        'detailId': detailId,
        'fileType': fileType,
      },
      body: formData,
      parser: (json) => _parseUploadFileResponse(json),
    );

    return res;
  }

  /// Parser defensive cho response upload-file — chấp nhận nhiều dạng
  /// JSON server có thể trả:
  /// 1. Envelope `BaseData<BookingGuestHouseFileItem>` chuẩn.
  /// 2. Trực tiếp 1 object `{ ID, FileName, ... }` (không envelope).
  /// 3. Mảng `[{...}, {...}]` (khi upload nhiều file).
  BaseData<BookingGuestHouseFileItem> _parseUploadFileResponse(dynamic json) {
    if (json is String) {
      final raw = json.trim();
      if (raw.isEmpty) {
        return BaseData<BookingGuestHouseFileItem>(
          status: 1,
          data: const BookingGuestHouseFileItem(),
        );
      }
      try {
        return _parseUploadFileResponse(jsonDecode(raw));
      } catch (_) {
        return BaseData<BookingGuestHouseFileItem>(
          status: 1,
          data: const BookingGuestHouseFileItem(),
        );
      }
    }

    // Mảng trực tiếp — lấy phần tử đầu tiên (mỗi request upload 1 file).
    if (json is List) {
      if (json.isEmpty) {
        return BaseData<BookingGuestHouseFileItem>(
          status: 1,
          data: const BookingGuestHouseFileItem(),
        );
      }
      final first = json.first;
      if (first is Map<String, dynamic>) {
        return BaseData<BookingGuestHouseFileItem>(
          status: 1,
          data: BookingGuestHouseFileItem.fromJson(first),
        );
      }
    }

    if (json is Map<String, dynamic>) {
      // BE trả thẳng object file (không envelope) — detect bằng presence
      // của `FileName` (key đặc trưng của file, không có ở envelope
      // `BaseData` chuẩn).
      if (json.containsKey('FileName') || json.containsKey('FileType')) {
        return BaseData<BookingGuestHouseFileItem>(
          status: 1,
          data: BookingGuestHouseFileItem.fromJson(json),
        );
      }
      // Còn lại: parse theo envelope chuẩn.
      return BaseData<BookingGuestHouseFileItem>.fromJson(
        json,
        (data) => BookingGuestHouseFileItem.fromJson(
          data is Map<String, dynamic>
              ? data
              : <String, dynamic>{},
        ),
      );
    }

    return BaseData<BookingGuestHouseFileItem>(
      status: 1,
      data: const BookingGuestHouseFileItem(),
    );
  }

  /// Parser defensive cho response `save-standalone-detail` — chấp nhận
  /// nhiều dạng JSON server có thể trả:
  /// 1. Envelope chuẩn `BaseData` chứa `data: { ID, DetailStatus }`.
  /// 2. Trực tiếp `{ ID, DetailStatus }` (không envelope).
  /// 3. Raw primitive / string bọc JSON.
  BaseData<BookingGuestHouseSaveDetailResponse> _parseSaveDetailResponse(
    dynamic json,
  ) {
    if (json is String) {
      final raw = json.trim();
      if (raw.isEmpty) {
        return BaseData<BookingGuestHouseSaveDetailResponse>(
          status: 1,
          data: const BookingGuestHouseSaveDetailResponse(),
        );
      }
      try {
        return _parseSaveDetailResponse(jsonDecode(raw));
      } catch (_) {
        return BaseData<BookingGuestHouseSaveDetailResponse>(
          status: 1,
          data: const BookingGuestHouseSaveDetailResponse(),
        );
      }
    }

    if (json is Map<String, dynamic>) {
      // BE trả thẳng `{ ID, DetailStatus }` (không envelope) — detect bằng
      // presence của `DetailStatus` (key này chỉ có ở detail, không có ở
      // envelope `BaseData` chuẩn).
      if (json.containsKey('DetailStatus') || json.containsKey('data')) {
        final inner = json.containsKey('DetailStatus')
            ? json
            : (json['data'] is Map<String, dynamic>
                ? json['data'] as Map<String, dynamic>
                : <String, dynamic>{});
        return BaseData<BookingGuestHouseSaveDetailResponse>(
          status: 1,
          data: BookingGuestHouseSaveDetailResponse.fromJson(inner),
        );
      }
      return BaseData<BookingGuestHouseSaveDetailResponse>.fromJson(
        json,
        (data) => BookingGuestHouseSaveDetailResponse.fromJson(
          data is Map<String, dynamic>
              ? data
              : <String, dynamic>{},
        ),
      );
    }

    return BaseData<BookingGuestHouseSaveDetailResponse>(
      status: 1,
      data: const BookingGuestHouseSaveDetailResponse(),
    );
  }

  /// Parser defensive cho response create-advance — chấp nhận nhiều dạng
  /// JSON server có thể trả (envelope `BaseData`, raw object, string bọc JSON).
  BaseData<BookingGuestHouseAdvanceResponse> _parseAdvanceResponse(
    dynamic json,
  ) {
    if (json is String) {
      final raw = json.trim();
      if (raw.isEmpty) {
        return BaseData<BookingGuestHouseAdvanceResponse>(
          status: 1,
          data: const BookingGuestHouseAdvanceResponse(),
        );
      }
      try {
        return _parseAdvanceResponse(jsonDecode(raw));
      } catch (_) {
        return BaseData<BookingGuestHouseAdvanceResponse>(
          status: 1,
          data: const BookingGuestHouseAdvanceResponse(),
        );
      }
    }

    if (json is Map<String, dynamic>) {
      // BE trả thẳng `{ ID, Code, DetailID, IsRecreated }` (không envelope)
      // — detect bằng presence của key `Code` (ĐNTU...) hoặc `ID`.
      if (json.containsKey('Code') || json.containsKey('ID')) {
        return BaseData<BookingGuestHouseAdvanceResponse>(
          status: 1,
          data: BookingGuestHouseAdvanceResponse.fromJson(json),
        );
      }
      // Còn lại: parse theo envelope chuẩn `{ status, message, data }`.
      return BaseData<BookingGuestHouseAdvanceResponse>.fromJson(
        json,
        (data) => BookingGuestHouseAdvanceResponse.fromJson(
          data is Map<String, dynamic>
              ? data
              : <String, dynamic>{},
        ),
      );
    }

    return BaseData<BookingGuestHouseAdvanceResponse>(
      status: 1,
      data: const BookingGuestHouseAdvanceResponse(),
    );
  }

  /// Parser defensive cho response `get-detail-by-booking-id` — chấp nhận
  /// nhiều dạng JSON server có thể trả:
  /// 1. Envelope chuẩn `BaseData` chứa `data: { ID, ... }`.
  /// 2. Trực tiếp 1 object `{ ID, AccommodationBookingID, ... }`
  ///    (không envelope) — detect bằng presence của `ID` hoặc
  ///    `AccommodationBookingID` (key đặc trưng của detail).
  /// 3. Mảng `[{...}]` (BE có thể bọc vào mảng 1 phần tử) — lấy phần
  ///    tử đầu tiên.
  /// 4. Chuỗi JSON bọc — parse lại.
  /// 5. Rỗng / null / không nhận dạng được → success với `data == null`
  ///    (UI xử lý như "chưa có TTQT").
  BaseData<BookingGuestHousePaymentDetailItem?>
      _parsePaymentDetailByBookingId(dynamic json) {
    // 1. Chuỗi JSON — parse lại.
    if (json is String) {
      final raw = json.trim();
      if (raw.isEmpty) {
        return BaseData<BookingGuestHousePaymentDetailItem?>(
          status: 1,
          data: null,
        );
      }
      try {
        return _parsePaymentDetailByBookingId(jsonDecode(raw));
      } catch (_) {
        return BaseData<BookingGuestHousePaymentDetailItem?>(
          status: 1,
          data: null,
        );
      }
    }

    // 2. Null hoặc primitive → coi như "chưa có TTQT".
    if (json == null) {
      return BaseData<BookingGuestHousePaymentDetailItem?>(
        status: 1,
        data: null,
      );
    }

    // 3. Mảng — lấy phần tử đầu tiên (BE có thể trả `[{...}]`).
    if (json is List) {
      if (json.isEmpty) {
        return BaseData<BookingGuestHousePaymentDetailItem?>(
          status: 1,
          data: null,
        );
      }
      final first = json.first;
      if (first is Map<String, dynamic>) {
        return BaseData<BookingGuestHousePaymentDetailItem?>(
          status: 1,
          data: BookingGuestHousePaymentDetailItem.fromJson(first),
        );
      }
      return BaseData<BookingGuestHousePaymentDetailItem?>(
        status: 1,
        data: null,
      );
    }

    // 4. Map — detect trực tiếp vs envelope.
    if (json is Map<String, dynamic>) {
      // BE trả thẳng object detail (không envelope) — detect bằng
      // presence của key `ID` hoặc `AccommodationBookingID`. Vẫn phải
      // lọc thêm: nếu có cả `data` và `ID` thì ưu tiên xem là
      // envelope.
      final hasDetailKeys = (json.containsKey('AccommodationBookingID') ||
              json.containsKey('DetailStatus')) &&
          !json.containsKey('data');
      if (hasDetailKeys) {
        try {
          return BaseData<BookingGuestHousePaymentDetailItem?>(
            status: 1,
            data: BookingGuestHousePaymentDetailItem.fromJson(json),
          );
        } catch (_) {
          return BaseData<BookingGuestHousePaymentDetailItem?>(
            status: 1,
            data: null,
          );
        }
      }

      // Còn lại: parse theo envelope chuẩn.
      try {
        return BaseData<BookingGuestHousePaymentDetailItem?>.fromJson(
          json,
          (data) {
            if (data == null) return null;
            if (data is Map<String, dynamic>) {
              return BookingGuestHousePaymentDetailItem.fromJson(data);
            }
            return null;
          },
        );
      } catch (_) {
        return BaseData<BookingGuestHousePaymentDetailItem?>(
          status: 1,
          data: null,
        );
      }
    }

    return BaseData<BookingGuestHousePaymentDetailItem?>(
      status: 1,
      data: null,
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