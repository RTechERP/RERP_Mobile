import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';

/// Nội dung thông báo "Quy định điền giờ".
///
/// Hiển thị 2 nhóm quy định (ngày làm việc thường / ngày nghỉ - ngày lễ)
/// kèm cảnh báo không được cộng dồn giờ OT vào ô "Số giờ".
class TechHoursRuleContent extends StatelessWidget {
  const TechHoursRuleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Quy định cách khai báo giờ làm việc trong báo cáo:',
          style: AppStyles.body2.copyWith(color: AppColors.textSecondaryColor),
        ),
        const SizedBox(height: 12),
        _RuleSection(
          number: '1',
          title: 'Ngày làm việc thường',
          items: const [
            'Ô "Số giờ": chỉ điền số giờ hành chính, tổng tối đa các phiếu 8h.',
            'Làm thêm ngoài giờ: tích chọn ô "Làm thêm" để khai báo ca OT.',
          ],
        ),
        const SizedBox(height: 10),
        _RuleSection(
          number: '2',
          title: 'Ngày nghỉ / Ngày lễ',
          items: const [
            'Ô "Số giờ": điền 0h vì không có giờ hành chính.',
            'Làm thêm ngoài giờ: toàn bộ thời gian làm việc khai báo ở phần "Làm thêm" (OT).',
          ],
        ),
        const SizedBox(height: 14),
        const _WarningBanner(),
      ],
    );
  }
}

/// Một nhóm quy định: số thứ tự + tiêu đề + các gạch đầu dòng.
class _RuleSection extends StatelessWidget {
  const _RuleSection({
    required this.number,
    required this.title,
    required this.items,
  });

  /// Số thứ tự nhóm quy định.
  final String number;

  /// Tiêu đề nhóm quy định.
  final String title;

  /// Danh sách nội dung dạng gạch đầu dòng.
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.primaryERP,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  number,
                  style: AppStyles.caption1.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: AppStyles.body22.copyWith(
                    color: AppColors.neutralText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6, right: 6),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppColors.textTertiaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: AppStyles.body2.copyWith(
                        color: AppColors.textSecondaryColor,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Banner cảnh báo tuyệt đối không cộng dồn giờ OT vào ô "Số giờ".
class _WarningBanner extends StatelessWidget {
  const _WarningBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.alert.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.alert.withValues(alpha: 0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            size: 20,
            color: AppColors.alert,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: AppStyles.body2.copyWith(
                  color: AppColors.textSecondaryColor,
                  height: 1.45,
                ),
                children: const [
                  TextSpan(
                    text: 'Cảnh báo: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.alert,
                    ),
                  ),
                  TextSpan(
                    text:
                        'tuyệt đối không cộng dồn giờ OT vào ô "Số giờ".',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
