import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../reports/data/datasource/models/report_model.dart';
import '../datasource/model/general_form_model.dart';

abstract class GeneralFormRepo {
  Future<Either<BaseError, List<DepartResponse>>> getDepart();

  Future<Either<BaseError, List<FormItem>>> getGeneralForm({
    required int departmentId,
  });
}
