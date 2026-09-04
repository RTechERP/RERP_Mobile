import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/test_table_model.dart';
import '../datasource/service/test_table_service.dart';
import 'test_table_repo.dart';

/// Triển khai [TestTableRepo]: map response và lỗi mạng.
@LazySingleton(as: TestTableRepo)
class TestTableRepoImpl implements TestTableRepo {
  final TestTableService _service;
  TestTableRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<TestTableItem>>> getTestTableItem({
    String keyword = '',
  }) async {
    try {
      final res = await _service.getTestTableItem(keyword: keyword);
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        return left(
          BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
