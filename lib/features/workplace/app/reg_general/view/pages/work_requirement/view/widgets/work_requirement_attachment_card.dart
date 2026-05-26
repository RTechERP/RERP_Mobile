import 'package:flutter/material.dart';

import '../../../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../../../common/widgets/form/index.dart';

class WorkRequirementAttachmentCard extends StatelessWidget {
  const WorkRequirementAttachmentCard({
    super.key,
    required this.attachmentNames,
    required this.onPickFiles,
    required this.onRemoveFile,
  });

  final List<String> attachmentNames;
  final VoidCallback onPickFiles;
  final ValueChanged<String> onRemoveFile;

  @override
  Widget build(BuildContext context) {
    return FormCard(
      title: 'Đính kèm',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onPickFiles,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor, width: 1.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 40,
                    color: AppColors.primaryERP.withValues(alpha: 0.7),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Nhấn để chọn file đính kèm',
                    style: TextStyle(fontSize: 13, color: AppColors.gray),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Hỗ trợ: PDF, DOC, DOCX, XLS, XLSX, JPG, PNG',
                    style: TextStyle(fontSize: 11, color: AppColors.hintText),
                  ),
                ],
              ),
            ),
          ),
          if (attachmentNames.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text(
              'File đã chọn:',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 6),
            ...attachmentNames.map((name) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.attach_file,
                          size: 18, color: AppColors.secondaryERP),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onRemoveFile(name),
                        child: const Icon(
                            Icons.close, size: 16, color: AppColors.gray),
                      ),
                    ],
                  ),
                )),
          ],
        ],
      ),
    );
  }
}
