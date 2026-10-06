import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/model/project_lookup_model.dart';

/// Repository cho form tạo dự án - chứa các API lookup (hãng, khách hàng...).
abstract class ProjectAddRepo {
  Future<Either<BaseError, List<FirmBase>>> getFirmBases();

  Future<Either<BaseError, List<CustomerItem>>> getCustomers();

  Future<Either<BaseError, List<ProjectTypeBase>>> getProjectTypeBases();

  Future<Either<BaseError, List<PmItem>>> getPms();

  Future<Either<BaseError, List<ProjectStatusItem>>> getProjectStatuses();

  Future<Either<BaseError, List<CustomerIndustry>>> getCustomerIndustries();

  Future<Either<BaseError, List<UserTeamItem>>> getUserTeams();

  Future<Either<BaseError, List<ProjectModalItem>>> getProjectModal();

  Future<Either<BaseError, List<ApplicationType>>> getApplicationTypes();

  Future<Either<BaseError, List<Technology>>> getTechnologies();
}
