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
  Future<Either<BaseError, List<UserItem>>> getUsers() =>
      _call(_service.getUsers);

  @override
  Future<Either<BaseError, List<FirmBase>>> getFirmBases() =>
      _call(_service.getFirmBases);

  @override
  Future<Either<BaseError, List<CustomerIndustry>>> getCustomerIndustries() =>
      _call(_service.getCustomerIndustries);

  @override
  Future<Either<BaseError, List<ProjectTypeBase>>> getProjectTypeBases() =>
      _call(_service.getProjectTypeBases);

  @override
  Future<Either<BaseError, List<ProjectPriorityType>>>
      getProjectPriorityModal() => _call(_service.getProjectPriorityModal);

  @override
  Future<Either<BaseError, String>> generateProjectCode({
    required String customerShortName,
    required int projectType,
  }) async {
    try {
      final code = await _service.generateProjectCode(
        customerShortName: customerShortName,
        projectType: projectType,
      );
      if (code == null) {
        return left(
          BaseError.httpInternalServerError('Không sinh được mã dự án'),
        );
      }
      return right(code);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, ProjectSaveResult>> saveProject({
    required ProjectSavePayload payload,
  }) async {
    try {
      final res = await _service.saveProject(payload: payload);
      return right(res);
    } on DioException catch (e) {
      return left(e.baseError);
    } on BaseError catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<BaseError, List<ProjectGateItem>>> initMasterTimeline({
    required int projectId,
  }) async {
    try {
      final res = await _service.initMasterTimeline(projectId: projectId);
      return right(res);
    } on DioException catch (e) {
      return left(e.baseError);
    } on BaseError catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<BaseError, void>> createProjectTree({
    required int projectId,
    required List<int> selectedProjectTypeIds,
  }) async {
    try {
      await _service.createProjectTree(
        projectId: projectId,
        selectedProjectTypeIds: selectedProjectTypeIds,
      );
      return right(null);
    } on DioException catch (e) {
      return left(e.baseError);
    } on BaseError catch (e) {
      return left(e);
    }
  }

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