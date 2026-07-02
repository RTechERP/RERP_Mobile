import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/week_plan_model.dart';

/// Widget hiển thị một file đính kèm.
class WeekPlanAttachmentCard extends StatelessWidget {
  const WeekPlanAttachmentCard({
    super.key,
    required this.index,
    required this.attachment,
    required this.onDelete,
  });

  final int index;
  final WeekPlanAttachmentItem attachment;
  final VoidCallback onDelete;

  IconData get _icon {
    final ext = (attachment.fileName ?? '').split('.').last.toLowerCase();
    switch (ext) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'gif':
        return Icons.image;
      case 'zip':
      case 'rar':
      case '7z':
        return Icons.folder_zip;
      default:
        return Icons.insert_drive_file;
    }
  }

  Color get _iconColor {
    final ext = (attachment.fileName ?? '').split('.').last.toLowerCase();
    switch (ext) {
      case 'pdf':
        return Colors.red;
      case 'doc':
      case 'docx':
        return Colors.blue;
      case 'xls':
      case 'xlsx':
        return Colors.green;
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'gif':
        return Colors.purple;
      default:
        return AppColors.hintText;
    }
  }

  String get _formattedSize {
    final size = attachment.fileSize ?? 0;
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(_icon, color: _iconColor, size: 24),
          ),

          // Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    attachment.fileName ?? 'Tệp không tên',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _formattedSize,
                    style: TextStyle(fontSize: 12, color: AppColors.hintText),
                  ),
                ],
              ),
            ),
          ),

          // Delete
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete_outline, size: 20, color: AppColors.alert),
            tooltip: 'Xoá tệp',
          ),
        ],
      ),
    );
  }
}
