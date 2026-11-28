import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../model/project_list_model.dart';

/// Service cung cấp dữ liệu cho màn danh sách dự án.
///
/// Gồm API danh sách dự án và các API lookup phục vụ bộ lọc và form
/// tạo dự án (khách hàng, kiểu dự án, trạng thái, nhân sự, lĩnh vực,
/// hãng, lĩnh vực khách hàng).
@injectable
class ProjectListService extends DioBaseApiService {
  ProjectListService(super.dio);

  /// GET /project/get-projects
  Future<BaseData<List<ProjectItem>>> getProjects({
    required ProjectListParams params,
  }) async {
    return get<BaseData<List<ProjectItem>>>(
      ApiEndPoint.getProjects,
      query: params.toQueryParams(),
      parser: (json) => BaseData<List<ProjectItem>>.fromJson(json, (data) {
        if (data is! Map<String, dynamic>) return <ProjectItem>[];
        final projectList = data['project'] as List?;
        if (projectList == null) return <ProjectItem>[];
        return projectList
            .map((e) => ProjectItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }

  /// GET /project/get-customers
  Future<List<CustomerItem>> getCustomers() {
    return _getList<CustomerItem>(
      ApiEndPoint.getProjectCustomers,
      CustomerItem.fromJson,
    );
  }

  /// GET /project/get-project-types
  Future<List<ProjectTypeItem>> getProjectTypes() {
    return _getList<ProjectTypeItem>(
      ApiEndPoint.getProjectTypes,
      ProjectTypeItem.fromJson,
    );
  }

  /// GET /project/get-project-status
  Future<List<ProjectStatusItem>> getProjectStatuses() {
    return _getList<ProjectStatusItem>(
      ApiEndPoint.getProjectStatuses,
      ProjectStatusItem.fromJson,
    );
  }

  /// GET /project/get-business-fields
  Future<List<BusinessFieldItem>> getBusinessFields() {
    return _getList<BusinessFieldItem>(
      ApiEndPoint.getProjectBusinessFields,
      BusinessFieldItem.fromJson,
    );
  }

  /// GET /project/get-pms
  Future<List<PmItem>> getPms() {
    return _getList<PmItem>(ApiEndPoint.getProjectPms, PmItem.fromJson);
  }

  /// GET /project/get-users
  Future<List<UserItem>> getUsers() {
    return _getList<UserItem>(ApiEndPoint.getProjectUsers, UserItem.fromJson);
  }

  /// GET /project/get-firm-bases
  Future<List<FirmBase>> getFirmBases() {
    return _getList<FirmBase>(
      ApiEndPoint.getProjectFirmBases,
      FirmBase.fromJson,
    );
  }

  /// GET /project/get-customer-industries
  Future<List<CustomerIndustry>> getCustomerIndustries() {
    return _getList<CustomerIndustry>(
      ApiEndPoint.getProjectCustomerIndustries,
      CustomerIndustry.fromJson,
    );
  }

  /// GET /project/get-project-type-bases
  Future<List<ProjectTypeBase>> getProjectTypeBases() {
    return _getList<ProjectTypeBase>(
      ApiEndPoint.getProjectTypeBases,
      ProjectTypeBase.fromJson,
    );
  }

  /// GET /project/get-project-priority-modal?projectId=0
  ///
  /// Trả về danh sách mốc ưu tiên dạng cây: `data.prjPriority` gồm các mốc
  /// cha (`ParentID = 0`) và mốc con (`ParentID` trỏ tới mốc cha).
  Future<List<ProjectPriorityType>> getProjectPriorityModal() async {
    final result = await get<BaseData<List<ProjectPriorityType>>>(
      ApiEndPoint.getProjectPriorityModal,
      query: {'projectId': 0},
      parser: (json) => BaseData<List<ProjectPriorityType>>.fromJson(
        json as Map<String, dynamic>,
        (data) {
          if (data is! Map<String, dynamic>) return <ProjectPriorityType>[];
          final list = data['prjPriority'];
          if (list is! List) return <ProjectPriorityType>[];
          return list
              .map(
                (e) => ProjectPriorityType.fromJson(e as Map<String, dynamic>),
              )
              .toList();
        },
      ),
    );
    return result.data ?? <ProjectPriorityType>[];
  }

  /// POST /project/get-project-code-modal - sinh mã dự án tự động.
  ///
  /// [customerShortName] là tên viết tắt của khách hàng, [projectType] là
  /// ID kiểu dự án. Trả về mã dự án hoặc `null` nếu API lỗi.
  Future<String?> generateProjectCode({
    required String customerShortName,
    required int projectType,
  }) async {
    final result = await post<BaseData<String>>(
      ApiEndPoint.getProjectCodeModal,
      body: {
        'projectId': 0,
        'customerShortName': customerShortName,
        'projectType': projectType,
      },
      parser: (json) => BaseData<String>.fromJson(
        json as Map<String, dynamic>,
        (data) => data is String ? data : '',
      ),
    );

    /// API trả `status: 1` khi thành công, `data` là chuỗi mã dự án.
    if (result.status != 1) return null;

    final code = result.data?.trim();
    if (code == null || code.isEmpty) return null;
    return code;
  }

  /// POST /project/save-project - lưu dự án (thêm mới / cập nhật).
  ///
  /// Trả về kết quả lưu kèm ID dự án vừa tạo.
  Future<ProjectSaveResult> saveProject({
    required ProjectSavePayload payload,
  }) async {
    final result = await post<BaseData<ProjectSaveResult>>(
      ApiEndPoint.saveProject,
      body: payload.toJson(),
      parser: (json) => BaseData<ProjectSaveResult>.fromJson(
        json as Map<String, dynamic>,
        (data) => data is Map<String, dynamic>
            ? ProjectSaveResult.fromJson(data)
            : const ProjectSaveResult(),
      ),
    );

    if (result.status != 1) {
      throw BaseError.httpInternalServerError(
        result.message ?? 'Lưu dự án thất bại',
      );
    }

    return result.data ?? const ProjectSaveResult();
  }

  /// POST /ProjectGateStepLink/InitMasterTimeline/{projectId}
  ///
  /// Khởi tạo Master Timeline và công việc cho dự án vừa tạo.
  Future<List<ProjectGateItem>> initMasterTimeline({
    required int projectId,
  }) async {
    final result = await post<BaseData<List<ProjectGateItem>>>(
      '${ApiEndPoint.initMasterTimeline}/$projectId',
      parser: (json) => BaseData<List<ProjectGateItem>>.fromJson(
        json as Map<String, dynamic>,
        (data) {
          if (data is! List) return <ProjectGateItem>[];
          return data
              .map((e) => ProjectGateItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );

    if (result.status != 1) {
      throw BaseError.httpInternalServerError(
        result.message ?? 'Khởi tạo Master Timeline thất bại',
      );
    }

    return result.data ?? <ProjectGateItem>[];
  }

  /// POST /project/create-tree-v2 - tạo cây dự án cho loại dự án đã chọn.
  ///
  /// [selectedProjectTypeIds] là danh sách ID loại dự án được chọn.
  Future<void> createProjectTree({
    required int projectId,
    required List<int> selectedProjectTypeIds,
  }) async {
    final result = await post<BaseData<void>>(
      ApiEndPoint.createProjectTree,
      body: {
        'ProjectId': projectId,
        'SelectedProjectTypeIds': selectedProjectTypeIds,
      },
      parser: (json) => BaseData<void>.fromJson(json as Map<String, dynamic>, (_) {}),
    );

    if (result.status != 1) {
      throw BaseError.httpInternalServerError(
        result.message ?? 'Tạo cây dự án thất bại',
      );
    }
  }

  /// Helper chung: GET 1 endpoint trả về List, parse qua parser.
  Future<List<T>> _getList<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic>? query,
  }) async {
    final result = await get<BaseData<List<T>>>(
      path,
      query: query,
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

    return BaseData<List<T>>.fromJson(json as Map<String, dynamic>, (data) {
      if (data is List) {
        return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
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
    });
  }
}
