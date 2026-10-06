import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';

import '../model/project_lookup_model.dart';

/// Service cung cấp dữ liệu lookup cho form tạo dự án:
/// - Hãng, khách hàng, loại dự án, PM, trạng thái
/// - Lĩnh vực, user-team, loại ứng dụng, công nghệ
/// - Danh sách dự án (modal)
@injectable
class ProjectAddService extends DioBaseApiService {
  ProjectAddService(super.dio);

  /// GET /project/get-firm-bases
  Future<List<FirmBase>> getFirmBases() => _getList<FirmBase>(
        ApiEndPoint.getProjectFirmBases,
        FirmBase.fromJson,
      );

  /// GET /project/get-customers
  Future<List<CustomerItem>> getCustomers() => _getList<CustomerItem>(
        ApiEndPoint.getProjectCustomers,
        CustomerItem.fromJson,
      );

  /// GET /get-project-type-bases
  Future<List<ProjectTypeBase>> getProjectTypeBases() =>
      _getList<ProjectTypeBase>(
        ApiEndPoint.getProjectTypeBases,
        ProjectTypeBase.fromJson,
      );

  /// GET /project/get-pms
  Future<List<PmItem>> getPms() => _getList<PmItem>(
        ApiEndPoint.getProjectPms,
        PmItem.fromJson,
      );

  /// GET /project/get-project-status
  Future<List<ProjectStatusItem>> getProjectStatuses() =>
      _getList<ProjectStatusItem>(
        ApiEndPoint.getProjectStatuses,
        ProjectStatusItem.fromJson,
      );

  /// GET /project/get-customer-industries
  Future<List<CustomerIndustry>> getCustomerIndustries() =>
      _getList<CustomerIndustry>(
        ApiEndPoint.getProjectCustomerIndustries,
        CustomerIndustry.fromJson,
      );

  /// GET /project/get-user-teams
  Future<List<UserTeamItem>> getUserTeams() => _getList<UserTeamItem>(
        ApiEndPoint.getProjectUserTeams,
        UserTeamItem.fromJson,
      );

  /// GET /project/get-project-modal
  Future<List<ProjectModalItem>> getProjectModal() =>
      _getList<ProjectModalItem>(
        ApiEndPoint.getProjectModal,
        ProjectModalItem.fromJson,
      );

  /// GET /project/get-application-types
  Future<List<ApplicationType>> getApplicationTypes() =>
      _getList<ApplicationType>(
        ApiEndPoint.getProjectApplicationTypes,
        ApplicationType.fromJson,
      );

  /// GET /project/get-technologies
  Future<List<Technology>> getTechnologies() => _getList<Technology>(
        ApiEndPoint.getProjectTechnologies,
        Technology.fromJson,
      );

  /// Helper chung: GET 1 endpoint trả về List, parse qua parser.
  Future<List<T>> _getList<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final result = await get<BaseData<List<T>>>(
      path,
      parser: (json) => _parseList(json, fromJson),
    );
    return result.data ?? <T>[];
  }

  /// Parse response, hỗ trợ nhiều format: list trực tiếp, wrapped trong
  /// `{ data: [...] }`, hoặc map chứa list trong values.
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
          return data
              .map((e) => fromJson(e as Map<String, dynamic>))
              .toList();
        }
        if (data is Map) {
          final items = (data as Map<String, dynamic>).values
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
}
