import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/personal_asset_model.dart';

abstract class PersonalAssetRepo {
  Future<Either<BaseError, List<PersonalAssetItem>>> getPersonalAsset({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<PersonalPropertyItem>>> getPersonalProperty({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<DetailPersonalPropertyItem>>> getPersonalPropertyDetail({
    required Map<String, dynamic> query,
  });

  Future<Either<BaseError, void>> approvePersonalProperty({
    required Map<String, dynamic> payload,
  });
}

