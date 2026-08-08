import 'package:dartz/dartz.dart';

import '../../../../../base/network/errors/error.dart';
import '../datasource/models/contact_model.dart';

abstract class ContactRepo {
  Future<Either<BaseError, List<ContactPersonalItem>>> getContact({
    required int departmentID,
    String? keyword,
  });
}
