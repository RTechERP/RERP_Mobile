import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';

/// Màu nhấn mạnh của từng giai đoạn lead.
///
/// Đây là nguồn màu duy nhất dùng cho status chip giai đoạn, đảm bảo chip ở
/// danh sách, trong bottom sheet chi tiết và trong bộ lọc đều giống nhau.
///
/// Màu được gắn theo **tên** giai đoạn (`StageName`) do API trả về, không
/// phụ thuộc mã số `Stage` vì mã số chưa được chốt.
class LeadStageStyle {
  const LeadStageStyle._();

  /// Màu của chip `Tất cả` trong bộ lọc.
  static const Color all = AppColors.secondaryERP;

  /// Màu nhấn mạnh theo giai đoạn, `null` dùng cho chip `Tất cả`.
  static Color of(LeadStage? stage) {
    switch (stage) {
      case LeadStage.newLead:
        return AppColors.tealA400;
      case LeadStage.waitingAssign:
        return AppColors.matchaA500;
      case LeadStage.assigned:
        return AppColors.blueMain;
      case LeadStage.nurturing:
        return AppColors.purpleA400;
      case LeadStage.returned:
        return AppColors.orangeA500;
      case LeadStage.handedOver:
        return AppColors.greenA500;
      case LeadStage.notMatched:
        return AppColors.redA500;
      default:
        return all;
    }
  }

  /// Màu nhấn mạnh theo tên giai đoạn mà API trả về.
  ///
  /// Trả về [all] khi tên không khớp giai đoạn nào.
  static Color ofName(String? stageName) => of(LeadStage.fromName(stageName));
}
