import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/stamp_model.dart';

abstract class StampRepo {
  Future<Either<BaseError, List<StampItem>>> getStamp({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, StampDetailItem>> getStampDetail({
    required int id,
  });

  Future<Either<BaseError, List<AssignerStampItem>>> getEmployees();

  Future<Either<BaseError, List<SealItem>>> getSealRegulations();

  Future<Either<BaseError, List<DocumentStampItem>>> getDocumentTypes();

  Future<Either<BaseError, List<CompanyStampItem>>> getTaxCompanies();

  Future<Either<BaseError, Map<String, dynamic>>> saveStamp({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, Map<String, dynamic>>> deleteStamp({
    required int id,
  });
}
