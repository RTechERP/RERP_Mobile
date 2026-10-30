import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../common/constants.dart';
import '../models/lead_marketing_model.dart';

/// Service gọi API module Lead Marketing của CRM.
@injectable
class LeadMarketingService extends DioBaseApiService {
  LeadMarketingService(super.dio);

  /// Lấy danh sách nhân viên sale.
  ///
  /// API: GET /Lead/get-sale-employees?onlyAssignable=false.
  /// Response: `{ status, message, data: [ { ID, Code, FullName, DepartmentID } ] }`.
  Future<BaseData<List<LeadEmployee>>> getSaleEmployees({
    bool onlyAssignable = false,
  }) async {
    return get<BaseData<List<LeadEmployee>>>(
      ApiEndPoint.getLeadSaleEmployees,
      query: {'onlyAssignable': onlyAssignable},
      parser: (json) => BaseData<List<LeadEmployee>>.fromJson(json, (data) {
        return _parseList<LeadEmployee>(
          data,
          LeadEmployee.fromJson,
        );
      }),
    );
  }

  /// Lấy danh sách nhân viên marketing.
  ///
  /// API: GET /Lead/get-marketing-employees.
  Future<BaseData<List<LeadEmployee>>> getMarketingEmployees() async {
    return get<BaseData<List<LeadEmployee>>>(
      ApiEndPoint.getLeadMarketingEmployees,
      parser: (json) => BaseData<List<LeadEmployee>>.fromJson(json, (data) {
        return _parseList<LeadEmployee>(
          data,
          LeadEmployee.fromJson,
        );
      }),
    );
  }

  /// Lấy danh sách nguồn lead.
  ///
  /// API: GET /LeadSource?sourceGroup=0.
  Future<BaseData<List<LeadSource>>> getLeadSources({
    int sourceGroup = 0,
  }) async {
    return get<BaseData<List<LeadSource>>>(
      ApiEndPoint.getLeadSource,
      query: {'sourceGroup': sourceGroup},
      parser: (json) => BaseData<List<LeadSource>>.fromJson(json, (data) {
        return _parseList<LeadSource>(
          data,
          LeadSource.fromJson,
        );
      }),
    );
  }

  /// Lấy quyền của người dùng hiện tại trong module Lead.
  ///
  /// API: GET /Lead/get-role-context.
  /// Response: `{ status, message, data: { EmployeeID, IsAdmin, ... } }`.
  Future<BaseData<LeadRoleContext>> getRoleContext() async {
    return get<BaseData<LeadRoleContext>>(
      ApiEndPoint.getLeadRoleContext,
      parser: (json) => BaseData<LeadRoleContext>.fromJson(
        json,
        (data) => LeadRoleContext.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Lấy danh sách phiếu lead theo khoảng thời gian và các bộ lọc.
  ///
  /// API: GET /Lead/get-data?ViewMode=1&DateStart=...&DateEnd=...&LeadType=0
  /// &LeadSourceID=0&MarketingEmployeeID=0&SaleEmployeeID=0&IncludeOpen=true.
  Future<BaseData<List<LeadMarketingItem>>> getLeadData({
    required int viewMode,
    required DateTime dateStart,
    required DateTime dateEnd,
    int leadType = 0,
    int leadSourceId = 0,
    int marketingEmployeeId = 0,
    int saleEmployeeId = 0,
    bool includeOpen = true,
  }) async {
    return get<BaseData<List<LeadMarketingItem>>>(
      ApiEndPoint.getLeadData,
      query: {
        'ViewMode': viewMode,
        'DateStart': _formatDate(dateStart),
        'DateEnd': _formatDate(dateEnd),
        'LeadType': leadType,
        'LeadSourceID': leadSourceId,
        'MarketingEmployeeID': marketingEmployeeId,
        'SaleEmployeeID': saleEmployeeId,
        'IncludeOpen': includeOpen,
      },
      parser: (json) => BaseData<List<LeadMarketingItem>>.fromJson(json, (data) {
        return _parseList<LeadMarketingItem>(
          data,
          LeadMarketingItem.fromJson,
        );
      }),
    );
  }

  /// Kiểm tra trùng lặp phiếu lead trước khi lưu.
  ///
  /// API: POST /Lead/check-duplicate.
  /// Body: `{ "Phone": ..., "Email": ..., "TaxCode": ..., "CompanyName": ...,
  /// "ExcludeLeadID": ... }`.
  /// Response: `{ status, message, data: { ... } }` — `status = 1` nghĩa là
  /// dữ liệu hợp lệ, được phép gọi tiếp API lưu.
  Future<BaseData<LeadDuplicateCheckResult>> checkDuplicate({
    required String phone,
    String? email,
    String? taxCode,
    String? companyName,
    int excludeLeadId = 0,
  }) async {
    return post<BaseData<LeadDuplicateCheckResult>>(
      ApiEndPoint.checkLeadDuplicate,
      body: {
        'Phone': phone,
        'Email': email ?? '',
        'TaxCode': taxCode ?? '',
        'CompanyName': companyName ?? '',
        'ExcludeLeadID': excludeLeadId,
      },
      parser: (json) => _parseDuplicateCheck(json),
    );
  }

  /// Lưu phiếu lead (thêm mới hoặc cập nhật).
  ///
  /// API: POST /Lead/save-data.
  /// Body: map payload đúng format BE mong đợi (do UI dựng từ form).
  /// Response: `{ status, message, data: { ID, LeadCode, ... } }`.
  Future<BaseData<LeadSaveResult>> saveData({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<LeadSaveResult>>(
      ApiEndPoint.saveLeadData,
      body: payload,
      parser: (json) => _parseSaveResult(json),
    );
  }

  /// Parse response check-duplicate — lấy `status`/`message` ở envelope và
  /// danh sách bản ghi bị trùng trong `data`.
  BaseData<LeadDuplicateCheckResult> _parseDuplicateCheck(dynamic json) {
    final root = json is Map
        ? Map<String, dynamic>.from(json)
        : <String, dynamic>{};

    final data = root['data'];
    final message = root['message'] as String?;

    final duplicates = data is List
        ? data
              .whereType<Map>()
              .map((e) => LeadDuplicateInfo.fromJson(Map<String, dynamic>.from(e)))
              .toList()
        : const <LeadDuplicateInfo>[];

    return BaseData<LeadDuplicateCheckResult>(
      status: (root['status'] as num?)?.toInt(),
      data: LeadDuplicateCheckResult(
        message: message,
        duplicates: duplicates,
      ),
    )..message = message;
  }

  /// Parse response save-data — lấy `status`/`message` ở envelope và
  /// `data` (object phiếu lead) để dựng [LeadSaveResult].
  BaseData<LeadSaveResult> _parseSaveResult(dynamic json) {
    final root = json is Map
        ? Map<String, dynamic>.from(json)
        : <String, dynamic>{};

    final data = root['data'];
    final message = root['message'] as String?;

    return BaseData<LeadSaveResult>(
      status: (root['status'] as num?)?.toInt(),
      data: LeadSaveResult.fromJson(
        data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{},
      ).copyWith(message: message),
    )..message = message;
  }

  /// Lấy chi tiết phiếu lead kèm hoạt động, lịch sử và quyền thao tác.
  ///
  /// API: GET /Lead/get-detail?id=X.
  /// Response: `{ status, message, data: { lead, activities, logs, actions } }`.
  Future<BaseData<LeadDetail>> getLeadDetail({
    required int id,
  }) async {
    return get<BaseData<LeadDetail>>(
      ApiEndPoint.getLeadDetail,
      query: {'id': id},
      parser: (json) => BaseData<LeadDetail>.fromJson(
        json,
        (data) => LeadDetail.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Lấy danh sách file đính kèm của phiếu lead.
  ///
  /// API: GET /Lead/get-files?customerContactId=X&fileType=1.
  /// [customerContactId] là ID của phiếu lead.
  Future<BaseData<List<LeadFile>>> getLeadFiles({
    required int customerContactId,
    int fileType = 1,
  }) async {
    return get<BaseData<List<LeadFile>>>(
      ApiEndPoint.getLeadFiles,
      query: {
        'customerContactId': customerContactId,
        'fileType': fileType,
      },
      parser: (json) => BaseData<List<LeadFile>>.fromJson(json, (data) {
        return _parseList<LeadFile>(
          data,
          LeadFile.fromJson,
        );
      }),
    );
  }

  /// Lấy danh sách nhóm hàng (loại PO) dùng khi tạo phiếu lead.
  ///
  /// API: GET /Lead/po-types.
  Future<BaseData<List<LeadPoType>>> getLeadPoTypes() async {
    return get<BaseData<List<LeadPoType>>>(
      ApiEndPoint.getLeadPoTypes,
      parser: (json) => BaseData<List<LeadPoType>>.fromJson(json, (data) {
        return _parseList<LeadPoType>(
          data,
          LeadPoType.fromJson,
        );
      }),
    );
  }

  /// Lấy danh sách lĩnh vực của khách hàng.
  ///
  /// API: GET /Customer/get-customer-industry.
  Future<BaseData<List<LeadCustomerIndustry>>> getCustomerIndustries() async {
    return get<BaseData<List<LeadCustomerIndustry>>>(
      ApiEndPoint.getCustomerIndustries,
      parser: (json) => BaseData<List<LeadCustomerIndustry>>.fromJson(
        json,
        (data) {
          return _parseList<LeadCustomerIndustry>(
            data,
            LeadCustomerIndustry.fromJson,
          );
        },
      ),
    );
  }

  /// Lấy danh sách ngành nghề của khách hàng.
  ///
  /// API: GET /Customer/get-customer-specialization.
  Future<BaseData<List<LeadCustomerSpecialization>>>
      getCustomerSpecializations() async {
    return get<BaseData<List<LeadCustomerSpecialization>>>(
      ApiEndPoint.getCustomerSpecializations,
      parser: (json) => BaseData<List<LeadCustomerSpecialization>>.fromJson(
        json,
        (data) {
          return _parseList<LeadCustomerSpecialization>(
            data,
            LeadCustomerSpecialization.fromJson,
          );
        },
      ),
    );
  }

  /// Lấy danh sách lĩnh vực kinh doanh.
  ///
  /// API: GET /Customer/get-business-field.
  Future<BaseData<List<LeadBusinessField>>> getBusinessFields() async {
    return get<BaseData<List<LeadBusinessField>>>(
      ApiEndPoint.getBusinessFields,
      parser: (json) => BaseData<List<LeadBusinessField>>.fromJson(
        json,
        (data) {
          return _parseList<LeadBusinessField>(
            data,
            LeadBusinessField.fromJson,
          );
        },
      ),
    );
  }

  /// Lấy danh sách tỉnh/thành.
  ///
  /// API: GET /Customer/get-provinces.
  Future<BaseData<List<LeadProvince>>> getCustomerProvinces() async {
    return get<BaseData<List<LeadProvince>>>(
      ApiEndPoint.getCustomerProvinces,
      parser: (json) => BaseData<List<LeadProvince>>.fromJson(json, (data) {
        return _parseList<LeadProvince>(
          data,
          LeadProvince.fromJson,
        );
      }),
    );
  }

  /// Lấy danh sách khách hàng.
  ///
  /// API: GET /Customer/get-customers.
  Future<BaseData<List<LeadCustomer>>> getCustomers() async {
    return get<BaseData<List<LeadCustomer>>>(
      ApiEndPoint.getCustomerList,
      parser: (json) => BaseData<List<LeadCustomer>>.fromJson(json, (data) {
        return _parseList<LeadCustomer>(
          data,
          LeadCustomer.fromJson,
        );
      }),
    );
  }

  /// Lấy chi tiết khách hàng.
  ///
  /// API: GET /Customer/get-detail?id=X.
  ///
  /// BE bọc thông tin khách hàng trong key `model` (đôi khi trong `data`),
  /// nên phải bóc ra trước khi parse — nếu không mọi field sẽ ra null và
  /// form không fill được.
  Future<BaseData<LeadCustomer>> getCustomerDetail({
    required int id,
  }) async {
    return get<BaseData<LeadCustomer>>(
      ApiEndPoint.getCustomerDetail,
      query: {'id': id},
      parser: (json) => _parseCustomerDetail(json),
    );
  }

  /// Parse response chi tiết khách hàng, hỗ trợ nhiều shape của BE.
  ///
  /// Các shape đã biết:
  /// - `{ status, message, data: { model: { ... } } }`
  /// - `{ status, message, data: { ... } }`
  /// - `{ model: { ... } }`
  BaseData<LeadCustomer> _parseCustomerDetail(dynamic json) {
    final root = json is Map
        ? Map<String, dynamic>.from(json)
        : <String, dynamic>{};

    dynamic payload = root['data'] ?? root['result'] ?? root;
    if (payload is Map) {
      payload = payload['model'] ?? payload['data'] ?? payload;
    }

    final model = payload is Map
        ? Map<String, dynamic>.from(payload)
        : <String, dynamic>{};

    return BaseData<LeadCustomer>(
      // BE đôi khi không trả `status` → coi như thành công nếu có dữ liệu.
      status: (root['status'] as num?)?.toInt() ?? 1,
      data: LeadCustomer.fromJson(model),
    );
  }

  /// Định dạng ngày theo chuẩn `yyyy-MM-dd` mà API mong đợi.
  String _formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

  /// Parse danh sách từ `data` — hỗ trợ cả mảng trực tiếp lẫn object bọc ngoài.
  List<T> _parseList<T>(
    dynamic data,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final list = data is List
        ? data
        : (data as Map<String, dynamic>?)?['data'] as List? ?? const [];

    return list
        .map((e) => fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
