import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/model/project_list_model.dart';

/// Repository cho màn danh sách dự án.
///
/// Gồm API danh sách dự án và các API lookup phục vụ bộ lọc và form
/// tạo dự án.
abstract class ProjectListRepo {
  /// Lấy danh sách dự án theo bộ tham số.
  Future<Either<BaseError, List<ProjectItem>>> getProjects({
    required ProjectListParams params,
  });

  /// Lấy danh sách khách hàng.
  Future<Either<BaseError, List<CustomerItem>>> getCustomers();

  /// Lấy danh sách kiểu dự án.
  Future<Either<BaseError, List<ProjectTypeItem>>> getProjectTypes();

  /// Lấy danh sách trạng thái dự án.
  Future<Either<BaseError, List<ProjectStatusItem>>> getProjectStatuses();

  /// Lấy danh sách lĩnh vực (business field) của dự án.
  Future<Either<BaseError, List<BusinessFieldItem>>> getBusinessFields();

  /// Lấy danh sách PM.
  Future<Either<BaseError, List<PmItem>>> getPms();

  /// Lấy danh sách nhân sự (kỹ thuật & sale).
  Future<Either<BaseError, List<UserItem>>> getUsers();

  /// Lấy danh sách hãng (dùng cho form tạo dự án).
  Future<Either<BaseError, List<FirmBase>>> getFirmBases();

  /// Lấy danh sách lĩnh vực khách hàng (dùng cho form tạo dự án).
  Future<Either<BaseError, List<CustomerIndustry>>> getCustomerIndustries();

  /// Lấy danh sách kiểu dự án cơ bản (dùng làm danh sách cho ô lĩnh vực).
  Future<Either<BaseError, List<ProjectTypeBase>>> getProjectTypeBases();

  /// Lấy danh sách mốc ưu tiên của dự án dạng cây (cha - con).
  Future<Either<BaseError, List<ProjectPriorityType>>>
      getProjectPriorityModal();

  /// Sinh mã dự án tự động từ tên viết tắt khách hàng và kiểu dự án.
  Future<Either<BaseError, String>> generateProjectCode({
    required String customerShortName,
    required int projectType,
  });

  /// Lưu dự án (thêm mới / cập nhật).
  Future<Either<BaseError, ProjectSaveResult>> saveProject({
    required ProjectSavePayload payload,
  });

  /// Khởi tạo Master Timeline và công việc cho dự án vừa tạo.
  Future<Either<BaseError, List<ProjectGateItem>>> initMasterTimeline({
    required int projectId,
  });

  /// Tạo cây dự án cho loại dự án đã chọn.
  Future<Either<BaseError, void>> createProjectTree({
    required int projectId,
    required List<int> selectedProjectTypeIds,
  });
}
