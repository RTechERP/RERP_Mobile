// Một dòng filter: icon + placeholder/value, tap mở picker.
// Khi đang có giá trị, hiện nút `X` để xoá riêng tiêu chí này
// (không ảnh hưởng các tiêu chí khác) và icon edit để mở lại picker.

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

class FilterField extends StatelessWidget {
  const FilterField({
    super.key,
    required this.icon,
    required this.placeholder,
    required this.value,
    required this.onTap,
    this.onClear,
  });

  final IconData icon;
  final String placeholder;
  final String? value;
  final VoidCallback onTap;

  /// Xoá riêng tiêu chí này. `null` = không hiện nút X.
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: hasValue
                ? AppColors.primaryERP.withValues(alpha: 0.08)
                : AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: hasValue
                  ? AppColors.primaryERP.withValues(alpha: 0.4)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: hasValue ? AppColors.primaryERP : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: hasValue ? Colors.white : AppColors.gray,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  hasValue ? value! : placeholder,
                  style: TextStyle(
                    fontSize: 13.5,
                    color: hasValue ? AppColors.enableText : AppColors.gray,
                    fontWeight:
                        hasValue ? FontWeight.w600 : FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (hasValue) ...[
                if (onClear != null)
                  GestureDetector(
                    onTap: onClear,
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.cancel,
                        size: 17,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Icon(
                    Icons.edit_outlined,
                    size: 16,
                    color: AppColors.primaryERP.withValues(alpha: 0.7),
                  ),
                ),
              ] else
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.gray,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}