import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../common/app_theme/index.dart';

/// Ảnh kiện hàng: thêm nhiều ảnh từ thư viện, xoá từng ảnh đã chọn.
class BookingVehiclePackageImagesSection extends StatelessWidget {
  const BookingVehiclePackageImagesSection({
    super.key,
    required this.files,
    required this.onAddPressed,
    required this.onRemoveAt,
  });

  final List<PlatformFile> files;
  final Future<void> Function() onAddPressed;
  final void Function(int index) onRemoveAt;

  static String _shortName(String name, int maxChars) {
    final t = name.trim();
    if (t.length <= maxChars) return t;
    return '${t.substring(0, maxChars - 1)}…';
  }

  @override
  Widget build(BuildContext context) {
    final secondary = Theme.of(context).colorScheme.onSurfaceVariant;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () async => onAddPressed(),
            icon: Icon(
              Icons.add_photo_alternate_outlined,
              size: 22,
              color: AppColors.primaryERP,
            ),
            label: Text(
              'Thêm ảnh',
              style: TextStyle(
                color: AppColors.primaryERP,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: OutlinedButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              side: BorderSide(
                color: AppColors.primaryERP.withOpacity(0.45),
              ),
            ),
          ),
        ),
        if (files.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            'Đã chọn (${files.length})',
            style: TextStyle(fontSize: 11, color: secondary),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var i = 0; i < files.length; i++)
                InputChip(
                  label: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: Text(
                      _shortName(files[i].name, 32),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  onDeleted: () => onRemoveAt(i),
                  deleteIcon: const Icon(Icons.close, size: 18),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
