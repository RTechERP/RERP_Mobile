import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/test_table_model.dart';

abstract class TestTableRepo {
  /// Lấy danh sách phiếu đăng ký bàn test.
  /// [employeeId] = id nhân viên của currentUser — chỉ lấy phiếu do nhân viên
  /// đó đăng ký. Truyền `0` (mặc định) thì BE trả tất cả.
  Future<Either<BaseError, List<TestCardItem>>> getTestCardItem({
    String keyword,
    int employeeId,
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

  /// Kiểm tra bàn test đã có ai đăng ký trùng khoảng ngày chưa.
  ///
  /// Trả về `Right(null)` khi KHÔNG trùng, `Right(<message>)` khi trùng,
  /// `Left(error)` khi lỗi mạng / server.
  Future<Either<BaseError, String?>> checkConflict({
    required Map<String, dynamic> payload,
  });

  /// Lưu phiếu đăng ký mới. Trả về id phiếu vừa tạo.
  Future<Either<BaseError, int>> saveRegistration({
    required Map<String, dynamic> payload,
  });

  /// Lấy danh sách máy test thuộc một bàn test.
  Future<Either<BaseError, List<TestMachineItem>>> getTestMachineByTable({
    required int testTableId,
  });
}
