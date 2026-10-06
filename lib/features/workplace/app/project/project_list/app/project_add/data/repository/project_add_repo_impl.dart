import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/model/project_lookup_model.dart';
import '../datasource/service/project_add_service.dart';
import 'project_add_repo.dart';

/// Triển khai [ProjectAddRepo] - chỉ làm cầu nối service, không thêm logic.
@LazySingleton(as: ProjectAddRepo)
class ProjectAddRepoImpl implements ProjectAddRepo {
  final ProjectAddService _service;

  ProjectAddRepoImpl(this._service);

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

  @override
  Future<Either<BaseError, List<FirmBase>>> getFirmBases() =>
      _call(_service.getFirmBases);

  @override
  Future<Either<BaseError, List<CustomerItem>>> getCustomers() =>
      _call(_service.getCustomers);

  @override
  Future<Either<BaseError, List<ProjectTypeBase>>> getProjectTypeBases() =>
      _call(_service.getProjectTypeBases);

  @override
  Future<Either<BaseError, List<PmItem>>> getPms() => _call(_service.getPms);

  @override
  Future<Either<BaseError, List<ProjectStatusItem>>> getProjectStatuses() =>
      _call(_service.getProjectStatuses);

  @override
  Future<Either<BaseError, List<CustomerIndustry>>> getCustomerIndustries() =>
      _call(_service.getCustomerIndustries);

  @override
  Future<Either<BaseError, List<UserTeamItem>>> getUserTeams() =>
      _call(_service.getUserTeams);

  @override
  Future<Either<BaseError, List<ProjectModalItem>>> getProjectModal() =>
      _call(_service.getProjectModal);

  @override
  Future<Either<BaseError, List<ApplicationType>>> getApplicationTypes() =>
      _call(_service.getApplicationTypes);

  @override
  Future<Either<BaseError, List<Technology>>> getTechnologies() =>
      _call(_service.getTechnologies);
}
