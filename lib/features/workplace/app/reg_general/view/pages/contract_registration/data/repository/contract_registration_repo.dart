import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/contract_registration_model.dart';

abstract class ContractRegistrationRepo {
  Future<Either<BaseError, List<ContractResponseItem>>> getContract({
    required Map<String, dynamic> payload,
  });
}
