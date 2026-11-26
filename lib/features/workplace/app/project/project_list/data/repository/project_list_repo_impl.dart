import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/model/project_list_model.dart';
import '../datasource/service/project_list_service.dart';
import 'project_list_repo.dart';

/// Triển khai [ProjectListRepo] - chỉ làm cầu nối service, không thêm logic.
@LazySingleton(as: ProjectListRepo)
class ProjectListRepoImpl implements ProjectListRepo {
  final ProjectListService _service;

  ProjectListRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<ProjectItem>>> getProjects({
    required ProjectListParams params,
  }) async {
    try {
      final res = await _service.getProjects(params: params);

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

  @override
  Future<Either<BaseError, List<CustomerItem>>> getCustomers() =>
      _call(_service.getCustomers);

  @override
  Future<Either<BaseError, List<ProjectTypeItem>>> getProjectTypes() =>
      _call(_service.getProjectTypes);

  @override
  Future<Either<BaseError, List<ProjectStatusItem>>> getProjectStatuses() =>
      _call(_service.getProjectStatuses);

  @override
  Future<Either<BaseError, List<BusinessFieldItem>>> getBusinessFields() =>
      _call(_service.getBusinessFields);

  @override
  Future<Either<BaseError, List<PmItem>>> getPms() => _call(_service.getPms);

  @override
  Future<Either<BaseError, List<UserItem>>> getUsers() => _call(_service.getUsers);

  /// Gọi API và bọc kết quả, lỗi mạng trả về [BaseError].
  Future<Either<BaseError, List<T>>> _call<T>(
    Future<List<T>> Function() fetch,
  ) async {
    try {
      final res = await fetch();
      return right(res);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
