import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';

/// Nút tròn ở góc AppBar mở thông báo "Quy định điền giờ".
class TechHoursRuleButton extends StatelessWidget {
  const TechHoursRuleButton({super.key, required this.onPressed});

  /// Callback khi người dùng nhấn vào nút.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Quy định điền giờ',
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryERP.withValues(alpha: 0.3),
            ),
          ),
          child: const Icon(
            Icons.info_outline_rounded,
            size: 18,
            color: AppColors.primaryERP,
          ),
        ),
      ),
    );
  }
}
