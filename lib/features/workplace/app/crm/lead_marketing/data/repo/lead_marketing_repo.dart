import 'package:dartz/dartz.dart';

import '../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/lead_marketing_model.dart';

/// Repository trừu tượng cho màn Lead Marketing của CRM.
abstract class LeadMarketingRepo {
  /// Lấy danh sách nhân viên sale.
  Future<Either<BaseError, List<LeadEmployee>>> getSaleEmployees();

  /// Lấy danh sách nhân viên marketing.
  Future<Either<BaseError, List<LeadEmployee>>> getMarketingEmployees();

  /// Lấy danh sách nguồn lead.
  Future<Either<BaseError, List<LeadSource>>> getLeadSources();

  /// Lấy quyền của người dùng hiện tại trong module Lead.
  Future<Either<BaseError, LeadRoleContext>> getRoleContext();

  /// Lấy danh sách phiếu lead theo khoảng thời gian.
  Future<Either<BaseError, List<LeadMarketingItem>>> getLeadData({
    required int viewMode,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int leadType,
    required bool includeOpen,
  });

  /// Lấy chi tiết phiếu lead kèm hoạt động, lịch sử và quyền thao tác.
  Future<Either<BaseError, LeadDetail>> getLeadDetail({
    required int id,
  });

  /// Lấy danh sách file đính kèm của phiếu lead.
  ///
  /// [customerContactId] là ID của phiếu lead.
  Future<Either<BaseError, List<LeadFile>>> getLeadFiles({
    required int customerContactId,
    required int fileType,
  });
}
