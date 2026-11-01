import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../common/constants.dart';
import '../models/lead_sale_model.dart';

/// Service gọi API module Lead Marketing của CRM.
@injectable
class LeadSaleService extends DioBaseApiService {
  LeadSaleService(super.dio);

  /// Lấy danh sách nhân viên sale.
  ///
  /// API: GET /Lead/get-sale-employees?onlyAssignable=false.
  /// Response: `{ status, message, data: [ { ID, Code, FullName, DepartmentID } ] }`.
  Future<BaseData<List<LeadSaleEmployee>>> getSaleEmployees({
    bool onlyAssignable = false,
  }) async {
    return get<BaseData<List<LeadSaleEmployee>>>(
      ApiEndPoint.getLeadSaleEmployees,
      query: {'onlyAssignable': onlyAssignable},
      parser: (json) => BaseData<List<LeadSaleEmployee>>.fromJson(json, (data) {
        return _parseList<LeadSaleEmployee>(data, LeadSaleEmployee.fromJson);
      }),
    );
  }

  /// Lấy danh sách nhân viên marketing.
  ///
  /// API: GET /Lead/get-marketing-employees.
  Future<BaseData<List<LeadSaleEmployee>>> getMarketingEmployees() async {
    return get<BaseData<List<LeadSaleEmployee>>>(
      ApiEndPoint.getLeadMarketingEmployees,
      parser: (json) => BaseData<List<LeadSaleEmployee>>.fromJson(json, (data) {
        return _parseList<LeadSaleEmployee>(data, LeadSaleEmployee.fromJson);
      }),
    );
  }

  /// Lấy danh sách nguồn lead.
  ///
  /// API: GET /LeadSource?sourceGroup=0.
  Future<BaseData<List<LeadSaleSource>>> getLeadSources({
    int sourceGroup = 0,
  }) async {
    return get<BaseData<List<LeadSaleSource>>>(
      ApiEndPoint.getLeadSource,
      query: {'sourceGroup': sourceGroup},
      parser: (json) => BaseData<List<LeadSaleSource>>.fromJson(json, (data) {
        return _parseList<LeadSaleSource>(data, LeadSaleSource.fromJson);
      }),
    );
  }

  /// Lấy quyền của người dùng hiện tại trong module Lead.
  ///
  /// API: GET /Lead/get-role-context.
  /// Response: `{ status, message, data: { EmployeeID, IsAdmin, ... } }`.
  Future<BaseData<LeadSaleRoleContext>> getRoleContext() async {
    return get<BaseData<LeadSaleRoleContext>>(
      ApiEndPoint.getLeadRoleContext,
      parser: (json) => BaseData<LeadSaleRoleContext>.fromJson(
        json,
        (data) => LeadSaleRoleContext.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Lấy danh sách phiếu lead Sale theo khoảng thời gian và các bộ lọc.
  ///
  /// API: GET /Lead/get-data?ViewMode=2&DateStart=...&DateEnd=...&LeadType=0
  /// &LeadSourceID=0&MarketingEmployeeID=0&SaleEmployeeID=0&IncludeOpen=true.
  Future<BaseData<List<LeadSaleItem>>> getLeadData({
    required int viewMode,
    required DateTime dateStart,
    required DateTime dateEnd,
    int leadType = 0,
    int leadSourceId = 0,
    int marketingEmployeeId = 0,
    int saleEmployeeId = 0,
    bool includeOpen = true,
  }) async {
    return get<BaseData<List<LeadSaleItem>>>(
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
      parser: (json) => BaseData<List<LeadSaleItem>>.fromJson(json, (data) {
        return _parseList<LeadSaleItem>(data, LeadSaleItem.fromJson);
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
  Future<BaseData<LeadSaleDuplicateCheckResult>> checkDuplicate({
    required String phone,
    String? email,
    String? taxCode,
    String? companyName,
    int excludeLeadId = 0,
  }) async {
    return post<BaseData<LeadSaleDuplicateCheckResult>>(
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
  Future<BaseData<LeadSaleSaveResult>> saveData({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<LeadSaleSaveResult>>(
      ApiEndPoint.saveLeadData,
      body: payload,
      parser: (json) => _parseSaveResult(json),
    );
  }

  /// Parse response check-duplicate — lấy `status`/`message` ở envelope và
  /// danh sách bản ghi bị trùng trong `data`.
  BaseData<LeadSaleDuplicateCheckResult> _parseDuplicateCheck(dynamic json) {
    final root = json is Map
        ? Map<String, dynamic>.from(json)
        : <String, dynamic>{};

    final data = root['data'];
    final message = root['message'] as String?;

    final duplicates = data is List
        ? data
              .whereType<Map>()
              .map(
                (e) => LeadSaleDuplicateInfo.fromJson(
                  Map<String, dynamic>.from(e),
                ),
              )
              .toList()
        : const <LeadSaleDuplicateInfo>[];

    return BaseData<LeadSaleDuplicateCheckResult>(
      status: (root['status'] as num?)?.toInt(),
      data: LeadSaleDuplicateCheckResult(
        message: message,
        duplicates: duplicates,
      ),
    )..message = message;
  }

  /// Ghi hoạt động lên phiếu lead.
  ///
  /// API: POST /Lead/save-activity.
  /// Body: `{ "ID": 0, "ActivityType": 15, "ActivityDate": "...",
  /// "Content": "...", "Result": "...", "NextAction": "...",
  /// "NextActionDate": "...", "LeadID": 11320 }`.
  Future<BaseData<LeadSaleActivitySaveResult>> saveActivity({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<LeadSaleActivitySaveResult>>(
      ApiEndPoint.saveLeadActivity,
      body: payload,
      parser: (json) => _parseActivitySaveResult(json),
    );
  }

  /// Xác nhận TT không phù hợp — loại bỏ lead.
  ///
  /// API: POST /Lead/disqualify.
  /// Body: `{ "Ids": [11337], "Note": "lý do" }`.
  /// Response: `{ status, message, data: [11337] }` — `data` là danh sách ID
  /// đã xử lý thành công.
  Future<BaseData<List<int>>> disqualifyLeads({
    required List<int> ids,
    required String note,
  }) async {
    return post<BaseData<List<int>>>(
      ApiEndPoint.disqualifyLead,
      body: {'Ids': ids, 'Note': note},
      parser: (json) => _parseDeletedIds(json),
    );
  }

  /// Huỷ xác nhận TT không phù hợp — mở lại lead.
  ///
  /// API: POST /Lead/reopen.
  /// Body: `{ "Ids": [11337], "Note": "lý do" }`.
  /// Response: `{ status, message, data: [11337] }`.
  Future<BaseData<List<int>>> reopenLeads({
    required List<int> ids,
    required String note,
  }) async {
    return post<BaseData<List<int>>>(
      ApiEndPoint.reopenLead,
      body: {'Ids': ids, 'Note': note},
      parser: (json) => _parseDeletedIds(json),
    );
  }

  /// Lấy danh sách Leader Sale nhận bàn giao.
  ///
  /// API: GET /Lead/get-sale-leaders.
  /// Response: `{ status, message, data: [ { ID, Code, FullName, DepartmentID } ] }`.
  Future<BaseData<List<LeadSaleEmployee>>> getSaleLeaders() async {
    return get<BaseData<List<LeadSaleEmployee>>>(
      ApiEndPoint.getLeadSaleLeaders,
      parser: (json) => BaseData<List<LeadSaleEmployee>>.fromJson(json, (data) {
        return _parseList<LeadSaleEmployee>(data, LeadSaleEmployee.fromJson);
      }),
    );
  }

  /// Lấy danh sách Admin Sale.
  ///
  /// API: GET /Lead/get-sale-admin.
  /// Response: `{ status, message, data: [ { ID, Code, FullName, DepartmentID } ] }`.
  Future<BaseData<List<LeadSaleEmployee>>> getSaleAdmins() async {
    return get<BaseData<List<LeadSaleEmployee>>>(
      ApiEndPoint.getLeadSaleAdmin,
      parser: (json) => BaseData<List<LeadSaleEmployee>>.fromJson(json, (data) {
        return _parseList<LeadSaleEmployee>(data, LeadSaleEmployee.fromJson);
      }),
    );
  }

  /// Lấy ID Admin Sale tương ứng với Leader Sale đã chọn.
  ///
  /// API: GET /Lead/admin-sale-id?leaderSaleId=36.
  /// Response: `{ status, message, data: 29 }` — `data` là ID Admin Sale.
  Future<BaseData<int>> getAdminSaleId({required int leaderSaleId}) async {
    return get<BaseData<int>>(
      ApiEndPoint.getLeadAdminSaleId,
      query: {'leaderSaleId': leaderSaleId},
      parser: (json) {
        final root = json is Map
            ? Map<String, dynamic>.from(json)
            : <String, dynamic>{};
        final data = root['data'];
        return BaseData<int>(
          status: (root['status'] as num?)?.toInt(),
          data: data is num ? data.toInt() : null,
        )..message = root['message'] as String?;
      },
    );
  }

  /// Bàn giao lead cho Leader Sale.
  ///
  /// API: POST /Lead/handover.
  /// Body: `{ "Ids": [11340], "LeaderEmployeeID": 23, "AdminSaleID": 518,
  /// "Note": "test" }`.
  /// Response: `{ status, message, data: [11340] }` — `data` là danh sách ID
  /// đã bàn giao thành công.
  Future<BaseData<LeadSaleHandoverResult>> handoverLeads({
    required List<int> ids,
    required int leaderEmployeeId,
    required int adminSaleId,
    required String note,
  }) async {
    return post<BaseData<LeadSaleHandoverResult>>(
      ApiEndPoint.handoverLead,
      body: {
        'Ids': ids,
        'LeaderEmployeeID': leaderEmployeeId,
        'AdminSaleID': adminSaleId,
        'Note': note,
      },
      parser: (json) => _parseHandoverResult(json),
    );
  }

  /// Parse response bàn giao — lấy `status`/`message` ở envelope và danh sách
  /// ID đã bàn giao trong `data`.
  BaseData<LeadSaleHandoverResult> _parseHandoverResult(dynamic json) {
    final root = json is Map
        ? Map<String, dynamic>.from(json)
        : <String, dynamic>{};

    final data = root['data'];
    final message = root['message'] as String?;

    final handoverIds = data is List
        ? data.whereType<num>().map((e) => e.toInt()).toList()
        : const <int>[];

    return BaseData<LeadSaleHandoverResult>(
      // BE đôi khi không trả `status` → coi như thành công nếu có dữ liệu.
      status:
          (root['status'] as num?)?.toInt() ?? (handoverIds.isEmpty ? 0 : 1),
      data: LeadSaleHandoverResult(message: message, ids: handoverIds),
    )..message = message;
  }

  /// Lấy danh sách loại nhóm dùng cho hoạt động của phiếu lead.
  ///
  /// API: GET /DailyReportSale/get-mainindex.
  Future<BaseData<List<LeadSaleActivityType>>> getActivityTypes() async {
    return get<BaseData<List<LeadSaleActivityType>>>(
      ApiEndPoint.getTypeTeamSale,
      parser: (json) =>
          BaseData<List<LeadSaleActivityType>>.fromJson(json, (data) {
            return _parseList<LeadSaleActivityType>(
              data,
              LeadSaleActivityType.fromJson,
            );
          }),
    );
  }

  /// Parse response save-activity — lấy `status`/`message` ở envelope và
  /// `data` (object hoạt động) để dựng [LeadSaleActivitySaveResult].
  ///
  /// BE có thể trả `data` dạng object hoặc mảng 1 phần tử → chuẩn hoá về
  /// object trước khi parse.
  BaseData<LeadSaleActivitySaveResult> _parseActivitySaveResult(dynamic json) {
    final root = json is Map
        ? Map<String, dynamic>.from(json)
        : <String, dynamic>{};

    dynamic data = root['data'];
    if (data is List) {
      data = data.isEmpty ? null : data.first;
    }

    final message = root['message'] as String?;

    return BaseData<LeadSaleActivitySaveResult>(
      status: (root['status'] as num?)?.toInt(),
      data: LeadSaleActivitySaveResult.fromJson(
        data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{},
      ).copyWith(message: message),
    )..message = message;
  }

  /// Parse response save-data — lấy `status`/`message` ở envelope và
  /// `data` (object phiếu lead) để dựng [LeadSaleSaveResult].
  BaseData<LeadSaleSaveResult> _parseSaveResult(dynamic json) {
    final root = json is Map
        ? Map<String, dynamic>.from(json)
        : <String, dynamic>{};

    final data = root['data'];
    final message = root['message'] as String?;

    return BaseData<LeadSaleSaveResult>(
      status: (root['status'] as num?)?.toInt(),
      data: LeadSaleSaveResult.fromJson(
        data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{},
      ).copyWith(message: message),
    )..message = message;
  }

  /// Xoá phiếu lead.
  ///
  /// API: POST /Lead/delete — body là mảng ID phiếu cần xoá (vd `[11334]`).
  /// Response: `{ status, message, data: [11334] }` — `data` là danh sách ID
  /// đã xoá thành công.
  Future<BaseData<List<int>>> deleteLeads({required List<int> ids}) async {
    return post<BaseData<List<int>>>(
      ApiEndPoint.deleteLead,
      body: ids,
      parser: (json) => _parseDeletedIds(json),
    );
  }

  /// Parse response customer-po — lấy `status`/`message` ở envelope và file
  /// trong `data`.
  ///
  /// BE trả về 1 object file (không phải mảng) — có thể bọc trong `data`
  /// hoặc `model`, nên phải bóc ra trước khi parse.
  BaseData<List<LeadSaleFile>> _parseCustomerPoFiles(dynamic json) {
    final root = json is Map
        ? Map<String, dynamic>.from(json)
        : <String, dynamic>{};

    dynamic payload = root['data'] ?? root['result'];
    if (payload is Map) {
      payload = payload['data'] ?? payload['model'] ?? payload;
    }

    final files = payload is List
        ? payload
              .whereType<Map>()
              .map((e) => LeadSaleFile.fromJson(Map<String, dynamic>.from(e)))
              .toList()
        : (payload is Map
              ? [LeadSaleFile.fromJson(Map<String, dynamic>.from(payload))]
              : const <LeadSaleFile>[]);

    return BaseData<List<LeadSaleFile>>(
      // BE đôi khi không trả `status` → coi như thành công nếu có dữ liệu.
      status: (root['status'] as num?)?.toInt() ?? (files.isEmpty ? 0 : 1),
      data: files,
    )..message = root['message'] as String?;
  }

  /// Parse response delete — lấy `status`/`message` ở envelope và danh sách
  /// ID đã xoá trong `data`.
  BaseData<List<int>> _parseDeletedIds(dynamic json) {
    final root = json is Map
        ? Map<String, dynamic>.from(json)
        : <String, dynamic>{};

    final data = root['data'];
    final message = root['message'] as String?;

    final deletedIds = data is List
        ? data.whereType<num>().map((e) => e.toInt()).toList()
        : const <int>[];

    return BaseData<List<int>>(
      // BE đôi khi không trả `status` → coi như thành công nếu có dữ liệu.
      status: (root['status'] as num?)?.toInt() ?? (deletedIds.isEmpty ? 0 : 1),
      data: deletedIds,
    )..message = message;
  }

  /// Lấy chi tiết phiếu lead kèm hoạt động, lịch sử và quyền thao tác.
  ///
  /// API: GET /Lead/get-detail?id=X.
  /// Response: `{ status, message, data: { lead, activities, logs, actions } }`.
  Future<BaseData<LeadSaleDetail>> getLeadDetail({required int id}) async {
    return get<BaseData<LeadSaleDetail>>(
      ApiEndPoint.getLeadDetail,
      query: {'id': id},
      parser: (json) => BaseData<LeadSaleDetail>.fromJson(
        json,
        (data) => LeadSaleDetail.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Lấy danh sách file đính kèm của phiếu lead.
  ///
  /// API: GET /Lead/get-files?customerContactId=X&fileType=1.
  /// [customerContactId] là ID của phiếu lead.
  Future<BaseData<List<LeadSaleFile>>> getLeadFiles({
    required int customerContactId,
    int fileType = 1,
  }) async {
    return get<BaseData<List<LeadSaleFile>>>(
      ApiEndPoint.getLeadFiles,
      query: {'customerContactId': customerContactId, 'fileType': fileType},
      parser: (json) => BaseData<List<LeadSaleFile>>.fromJson(json, (data) {
        return _parseList<LeadSaleFile>(data, LeadSaleFile.fromJson);
      }),
    );
  }

  /// Lưu file đính kèm của phiếu lead.
  ///
  /// API: POST /Lead/customer-po?customerContactId=11342&fileType=1&note=.
  /// Body multipart/form-data gồm `customerContactId`, `fileType`, `note` và
  /// `files` (danh sách file cần lưu).
  ///
  /// [customerContactId] là ID của phiếu lead, [fileType] là nhóm file
  /// (1 = file thường, 2 = file PO), [note] là ghi chú đính kèm.
  Future<BaseData<List<LeadSaleFile>>> saveLeadFiles({
    required int customerContactId,
    required int fileType,
    required List<PlatformFile> files,
    String note = '',
  }) async {
    final formData = FormData();

    for (final file in files) {
      final path = file.path;
      if (path != null && path.trim().isNotEmpty) {
        formData.files.add(
          MapEntry(
            'files',
            await MultipartFile.fromFile(path, filename: file.name),
          ),
        );
      } else if (file.bytes != null) {
        formData.files.add(
          MapEntry(
            'files',
            MultipartFile.fromBytes(file.bytes!, filename: file.name),
          ),
        );
      }
    }

    formData.fields.addAll([
      MapEntry('customerContactId', '$customerContactId'),
      MapEntry('fileType', '$fileType'),
      MapEntry('note', note),
    ]);

    return post<BaseData<List<LeadSaleFile>>>(
      ApiEndPoint.leadCustomerPo,
      query: {
        'customerContactId': customerContactId,
        'fileType': fileType,
        'note': note,
      },
      body: formData,
      options: Options(contentType: 'multipart/form-data'),
      parser: (json) => _parseCustomerPoFiles(json),
    );
  }

  /// Xoá file đính kèm của phiếu lead.
  ///
  /// API: GET /Lead/deleted-files?customerContactFileId=10.
  /// [customerContactFileId] là ID của file cần xoá.
  Future<BaseData<void>> deleteLeadFile({
    required int customerContactFileId,
  }) async {
    return get<BaseData<void>>(
      ApiEndPoint.deleteLeadFile,
      query: {'customerContactFileId': customerContactFileId},
      parser: (json) {
        final root = json is Map
            ? Map<String, dynamic>.from(json)
            : <String, dynamic>{};
        return BaseData<void>(status: (root['status'] as num?)?.toInt())
          ..message = root['message'] as String?;
      },
    );
  }

  /// Lấy danh sách nhóm hàng (loại PO) dùng khi tạo phiếu lead.
  ///
  /// API: GET /Lead/po-types.
  Future<BaseData<List<LeadSalePoType>>> getLeadPoTypes() async {
    return get<BaseData<List<LeadSalePoType>>>(
      ApiEndPoint.getLeadPoTypes,
      parser: (json) => BaseData<List<LeadSalePoType>>.fromJson(json, (data) {
        return _parseList<LeadSalePoType>(data, LeadSalePoType.fromJson);
      }),
    );
  }

  /// Lấy danh sách lĩnh vực của khách hàng.
  ///
  /// API: GET /Customer/get-customer-industry.
  Future<BaseData<List<LeadSaleCustomerIndustry>>>
  getCustomerIndustries() async {
    return get<BaseData<List<LeadSaleCustomerIndustry>>>(
      ApiEndPoint.getCustomerIndustries,
      parser: (json) =>
          BaseData<List<LeadSaleCustomerIndustry>>.fromJson(json, (data) {
            return _parseList<LeadSaleCustomerIndustry>(
              data,
              LeadSaleCustomerIndustry.fromJson,
            );
          }),
    );
  }

  /// Lấy danh sách ngành nghề của khách hàng.
  ///
  /// API: GET /Customer/get-customer-specialization.
  Future<BaseData<List<LeadSaleCustomerSpecialization>>>
  getCustomerSpecializations() async {
    return get<BaseData<List<LeadSaleCustomerSpecialization>>>(
      ApiEndPoint.getCustomerSpecializations,
      parser: (json) =>
          BaseData<List<LeadSaleCustomerSpecialization>>.fromJson(json, (data) {
            return _parseList<LeadSaleCustomerSpecialization>(
              data,
              LeadSaleCustomerSpecialization.fromJson,
            );
          }),
    );
  }

  /// Lấy danh sách lĩnh vực kinh doanh.
  ///
  /// API: GET /Customer/get-business-field.
  Future<BaseData<List<LeadSaleBusinessField>>> getBusinessFields() async {
    return get<BaseData<List<LeadSaleBusinessField>>>(
      ApiEndPoint.getBusinessFields,
      parser: (json) =>
          BaseData<List<LeadSaleBusinessField>>.fromJson(json, (data) {
            return _parseList<LeadSaleBusinessField>(
              data,
              LeadSaleBusinessField.fromJson,
            );
          }),
    );
  }

  /// Lấy danh sách tỉnh/thành.
  ///
  /// API: GET /Customer/get-provinces.
  Future<BaseData<List<LeadSaleProvince>>> getCustomerProvinces() async {
    return get<BaseData<List<LeadSaleProvince>>>(
      ApiEndPoint.getCustomerProvinces,
      parser: (json) => BaseData<List<LeadSaleProvince>>.fromJson(json, (data) {
        return _parseList<LeadSaleProvince>(data, LeadSaleProvince.fromJson);
      }),
    );
  }

  /// Lấy danh sách khách hàng.
  ///
  /// API: GET /Customer/get-customers.
  Future<BaseData<List<LeadSaleCustomer>>> getCustomers() async {
    return get<BaseData<List<LeadSaleCustomer>>>(
      ApiEndPoint.getCustomerList,
      parser: (json) => BaseData<List<LeadSaleCustomer>>.fromJson(json, (data) {
        return _parseList<LeadSaleCustomer>(data, LeadSaleCustomer.fromJson);
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
  Future<BaseData<LeadSaleCustomer>> getCustomerDetail({
    required int id,
  }) async {
    return get<BaseData<LeadSaleCustomer>>(
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
  BaseData<LeadSaleCustomer> _parseCustomerDetail(dynamic json) {
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

    return BaseData<LeadSaleCustomer>(
      // BE đôi khi không trả `status` → coi như thành công nếu có dữ liệu.
      status: (root['status'] as num?)?.toInt() ?? 1,
      data: LeadSaleCustomer.fromJson(model),
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

    return list.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }
}
