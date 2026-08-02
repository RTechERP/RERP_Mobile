import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

/// Widget hiển thị trạng thái trống cho màn chi tiết phiếu xuất kho.
class SaleGdnEmptyView extends StatelessWidget {
  const SaleGdnEmptyView({
    super.key,
    this.message = 'Phiếu này chưa có dòng chi tiết',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 64,
            color: AppColors.gray.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.gray.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
