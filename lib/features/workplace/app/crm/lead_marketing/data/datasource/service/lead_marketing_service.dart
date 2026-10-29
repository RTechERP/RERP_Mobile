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

  /// Lấy danh sách phiếu lead theo khoảng thời gian.
  ///
  /// API: GET /Lead/get-data?ViewMode=1&DateStart=...&DateEnd=...&LeadType=0
  /// &LeadSourceID=0&MarketingEmployeeID=0&SaleEmployeeID=0&IncludeOpen=true.
  Future<BaseData<List<LeadMarketingItem>>> getLeadData({
    required int viewMode,
    required DateTime dateStart,
    required DateTime dateEnd,
    int leadType = 0,
    bool includeOpen = true,
  }) async {
    return get<BaseData<List<LeadMarketingItem>>>(
      ApiEndPoint.getLeadData,
      query: {
        'ViewMode': viewMode,
        'DateStart': _formatDate(dateStart),
        'DateEnd': _formatDate(dateEnd),
        'LeadType': leadType,
        'LeadSourceID': 0,
        'MarketingEmployeeID': 0,
        'SaleEmployeeID': 0,
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
