import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/personal_asset_model.dart';

abstract class PersonalAssetRepo {
  Future<Either<BaseError, List<PersonalAssetItem>>> getPersonalAsset({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<PersonalPropertyItem>>> getPersonalProperty();
}

