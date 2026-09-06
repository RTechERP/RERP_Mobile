import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/test_table_model.dart';

abstract class TestTableRepo {
  /// Lấy danh sách phiếu đăng ký bàn test.
  Future<Either<BaseError, List<TestCardItem>>> getTestCardItem({
    String keyword,
  });

  /// Lấy danh sách bàn test ESL.
  Future<Either<BaseError, List<TestTableItem>>> getTestTableItem();

  /// Lấy danh sách nhân viên.
  Future<Either<BaseError, List<EmployeeInfoItem>>> getEmployeeInfoItem({
    int status,
    int departmentId,
    String keyword,
  });

  /// Lấy danh sách dự án.
  Future<Either<BaseError, List<ProjectItem>>> getProjectItem();

  /// Lấy danh sách người duyệt.
  Future<Either<BaseError, List<ApproverItem>>> getApproverItem();
}
