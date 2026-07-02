import 'package:dartz/dartz.dart';
import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../datasource/models/idea_registration_model.dart';

abstract class IdeaRegistrationRepo {
  Future<Either<BaseError, List<IdeaItem>>> getIdeas({
    required Map<String, dynamic> query,
  });

  Future<Either<BaseError, List<DepartResponse>>> getDepart();

  Future<Either<BaseError, List<IdeaCatalogItem>>> getCourseCatalog();

  Future<Either<BaseError, int>> saveIdea({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, void>> deleteIdea({required int id});

  Future<Either<BaseError, IdeaDetail>> getIdeaDetail({
    required int id,
    required int currentUserEmployeeId,
  });
}
