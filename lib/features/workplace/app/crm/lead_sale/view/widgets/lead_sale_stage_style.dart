import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/lead_sale_model.dart';

/// Màu nhấn mạnh của từng giai đoạn lead.
///
/// Đây là nguồn màu duy nhất dùng cho status chip giai đoạn, đảm bảo chip ở
/// danh sách, trong bottom sheet chi tiết và trong bộ lọc đều giống nhau.
///
/// Màu được gắn theo **tên** giai đoạn (`StageName`) do API trả về, không
/// phụ thuộc mã số `Stage` vì mã số chưa được chốt.
class LeadSaleStageStyle {
  const LeadSaleStageStyle._();

  /// Màu của chip `Tất cả` trong bộ lọc.
  static const Color all = AppColors.secondaryERP;

  /// Màu nhấn mạnh theo giai đoạn, `null` dùng cho chip `Tất cả`.
  static Color of(LeadSaleStage? stage) {
    switch (stage) {
      case LeadSaleStage.newLead:
        return AppColors.tealA400;
      case LeadSaleStage.waitingAssign:
        return AppColors.matchaA500;
      case LeadSaleStage.assigned:
        return AppColors.blueMain;
      case LeadSaleStage.nurturing:
        return AppColors.purpleA400;
      case LeadSaleStage.returned:
        return AppColors.orangeA500;
      case LeadSaleStage.handedOver:
        return AppColors.greenA500;
      case LeadSaleStage.notMatched:
        return AppColors.redA500;
      default:
        return all;
    }
  }

  /// Màu nhấn mạnh theo tên giai đoạn mà API trả về.
  ///
  /// Trả về [all] khi tên không khớp giai đoạn nào.
  static Color ofName(String? stageName) =>
      of(LeadSaleStage.fromName(stageName));
}
