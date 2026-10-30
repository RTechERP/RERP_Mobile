import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../app_theme/index.dart';

class FormFilePicker extends StatelessWidget {
  final String name;
  final String label;
  final IconData icon;
  final bool allowMultiple;

  /// ➜ thêm callback
  final ValueChanged<List<PlatformFile>>? onChanged;

  /// Danh sách đuôi file được phép chọn (vd `pdf`, `doc`, `xlsx`).
  ///
  /// Null = cho phép mọi định dạng.
  final List<String>? allowedExtensions;

  /// Văn bản mô tả định dạng file được phép, hiển thị dưới danh sách file.
  final String? hintText;

  const FormFilePicker({
    super.key,
    required this.name,
    required this.label,
    required this.icon,
    this.allowMultiple = false,
    this.onChanged,
    this.allowedExtensions,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<PlatformFile>>(
      name: name,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(icon, color: AppColors.primaryERP),
              title: Text(label),
              subtitle: hintText == null
                  ? null
                  : Text(
                      hintText!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.hintText,
                      ),
                    ),
              trailing: const Icon(Icons.upload_file),
              onTap: () async {
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: allowMultiple,
                  // `allowedExtensions` chỉ được dùng cùng `FileType.custom`,
                  // nếu không truyền FileType thì mặc định là `any` → lỗi
                  // "Custom extension filters are only allowed with
                  // FileType.custom".
                  type: allowedExtensions == null || allowedExtensions!.isEmpty
                      ? FileType.any
                      : FileType.custom,
                  allowedExtensions: allowedExtensions,
                );

                if (result != null && result.files.isNotEmpty) {
                  field.didChange(result.files);

                  /// ➜ gọi callback ra ngoài
                  onChanged?.call(result.files);
                }
              },
            ),
            if (field.value != null && field.value!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final file in field.value!)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.attach_file,
                              size: 14,
                              color: AppColors.hintText,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                file.name,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondaryColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              _formatSize(file.size),
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.hintText,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  /// Định dạng dung lượng file theo KB/MB.
  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(0)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}