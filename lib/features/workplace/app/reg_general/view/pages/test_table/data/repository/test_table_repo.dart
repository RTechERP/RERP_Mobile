import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/test_table_model.dart';

/// Hợp đồng lấy danh sách phiếu bàn test.
abstract class TestTableRepo {
  Future<Either<BaseError, List<TestTableItem>>> getTestTableItem({
    String keyword,
  });
}
