import 'package:dartz/dartz.dart';
import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/salary_model.dart';

abstract class SalaryRepo {
  Future<Either<BaseError, List<SalaryItem>>> getSalary();
}
