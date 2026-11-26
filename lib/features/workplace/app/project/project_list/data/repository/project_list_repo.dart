import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/model/project_list_model.dart';

/// Repository cho màn danh sách dự án.
///
/// Gồm API danh sách dự án và các API lookup phục vụ bộ lọc.
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
}
