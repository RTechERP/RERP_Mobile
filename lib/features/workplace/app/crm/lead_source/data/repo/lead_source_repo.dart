import 'package:dartz/dartz.dart';

import '../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/lead_source_model.dart';

/// Repository trừu tượng cho màn Nguồn Lead của CRM.
abstract class LeadSourceRepo {
  /// Lấy danh sách nguồn lead.
  Future<Either<BaseError, List<LeadSourceItem>>> getLeadSources();

  /// Lưu nguồn lead (thêm/sửa).
  Future<Either<BaseError, LeadSourceItem>> saveLeadSource(LeadSourceItem source);

  /// Xoá nguồn lead.
  Future<Either<BaseError, List<int>>> deleteLeadSource(List<int> ids);
}
