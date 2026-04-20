// Date: 14/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Card widget cho tài sản cá nhân - tap để xem chi tiết

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/personal_asset_model.dart';

class PersonalAssetCard extends StatelessWidget {
  const PersonalAssetCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final PersonalAssetItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header: Mã tài sản + Status ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Mã tài sản
                        Text(
                          item.seri ?? '—',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: AppColors.heading,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Tên tài sản
                        if (item.tsAssetName != null)
                          Text(
                            item.tsAssetName!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  // Status badge
                  _StatusBadge(status: item.status),
                ],
              ),

              const SizedBox(height: 12),
              const Divider(height: 1, color: AppColors.borderColor),
              const SizedBox(height: 12),

              // --- Thông tin: Loại tài sản ---
              _InfoRow(
                icon: Icons.category_outlined,
                label: 'Loại tài sản',
                value: item.assetType ?? '—',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final String? status;

  _StatusBadgeEntry get _entry {
    switch (status?.toLowerCase()) {
      case 'active':
      case 'đang sử dụng':
      return _StatusBadgeEntry('Đang dùng', AppColors.stateSuccessColor);
      case 'inactive':
      case 'không sử dụng':
        return _StatusBadgeEntry('Không dùng', AppColors.gray);
      case 'broken':
      case 'hỏng':
        return _StatusBadgeEntry('Hỏng', AppColors.alert);
      default:
        return _StatusBadgeEntry(status ?? '—', AppColors.stateInfoColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final e = _entry;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: e.color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: e.color.withValues(alpha: 0.4),
          width: 0.8,
        ),
      ),
      child: Text(
        e.label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: e.color,
        ),
      ),
    );
  }
}

class _StatusBadgeEntry {
  const _StatusBadgeEntry(this.label, this.color);
  final String label;
  final Color color;
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.gray),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 12.5,
            color: AppColors.gray,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
