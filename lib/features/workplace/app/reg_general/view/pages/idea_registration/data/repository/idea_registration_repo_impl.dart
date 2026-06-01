import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../datasource/models/idea_registration_model.dart';
import '../datasource/service/idea_registration_service.dart';
import 'idea_registration_repo.dart';

@LazySingleton(as: IdeaRegistrationRepo)
class IdeaRegistrationRepoImpl implements IdeaRegistrationRepo {
  final IdeaRegistrationService _service;

  IdeaRegistrationRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<IdeaItem>>> getIdeas({
    required Map<String, dynamic> query,
  }) async {
    try {
      final res = await _service.getIdeas(query: query);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }

      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<DepartResponse>>> getDepart() async {
    try {
      final res = await _service.getDepart();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<IdeaCatalogItem>>> getCourseCatalog() async {
    try {
      final res = await _service.getCourseCatalog();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, int>> saveIdea({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveIdea(payload: payload);

      if (res.status == 1) {
        return right(res.data ?? 0);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> deleteIdea({required int id}) async {
    try {
      final res = await _service.deleteIdea(id: id);

      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
