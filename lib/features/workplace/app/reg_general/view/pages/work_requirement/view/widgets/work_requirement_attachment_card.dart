import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/work_requirement_model.dart';

class WorkRequirementAttachmentCard extends StatelessWidget {
  const WorkRequirementAttachmentCard({
    super.key,
    required this.uploadedFiles,
    required this.localFiles,
    required this.isUploading,
    required this.onPickFiles,
    required this.onRemoveUploadedFile,
    required this.onRemoveLocalFile,
  });

  /// Files đã upload lên server.
  final List<WorkRequirementFileRequest> uploadedFiles;

  /// Files local chưa upload.
  final List<File> localFiles;

  /// True khi đang upload.
  final bool isUploading;

  final VoidCallback onPickFiles;

  /// Xoá file đã upload (trong add mode: truyền fileName; trong edit mode: truyền fileId).
  final ValueChanged<dynamic> onRemoveUploadedFile;

  /// Xoá file local (chưa upload).
  final ValueChanged<File> onRemoveLocalFile;

  @override
  Widget build(BuildContext context) {
    final allFiles = [
      ...uploadedFiles.map((f) => _FileEntry(
            displayName: f.fileNameOrigin,
            isLocal: false,
            file: null,
            fileRequest: f,
          )),
      ...localFiles.map((f) => _FileEntry(
            displayName: f.path.split('/').last,
            isLocal: true,
            file: f,
            fileRequest: null,
          )),
    ];

    return FormCard(
      title: 'Đính kèm',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: isUploading ? null : onPickFiles,
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
                  if (isUploading)
                    const SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  else
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 40,
                      color: AppColors.primaryERP.withValues(alpha: 0.7),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    isUploading ? 'Đang tải lên...' : 'Nhấn để chọn file đính kèm',
                    style: const TextStyle(fontSize: 13, color: AppColors.gray),
                  ),
                  if (!isUploading) ...[
                    const SizedBox(height: 2),
                    const Text(
                      'Hỗ trợ: PDF, DOC, DOCX, XLS, XLSX, JPG, PNG',
                      style: TextStyle(fontSize: 11, color: AppColors.hintText),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (allFiles.isNotEmpty) ...[
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
            ...allFiles.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    Icon(
                      entry.isLocal
                          ? Icons.insert_drive_file_outlined
                          : Icons.attach_file,
                      size: 18,
                      color: entry.isLocal
                          ? AppColors.warning
                          : AppColors.secondaryERP,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        entry.displayName,
                        style: const TextStyle(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (entry.isLocal)
                      GestureDetector(
                        onTap: () => onRemoveLocalFile(entry.file!),
                        child: const Icon(Icons.close,
                            size: 16, color: AppColors.gray),
                      )
                    else
                      GestureDetector(
                        onTap: () => onRemoveUploadedFile(
                          entry.fileRequest!.id,
                        ),
                        child: const Icon(Icons.close,
                            size: 16, color: AppColors.gray),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _FileEntry {
  const _FileEntry({
    required this.displayName,
    required this.isLocal,
    required this.file,
    required this.fileRequest,
  });

  final String displayName;
  final bool isLocal;
  final File? file;
  final WorkRequirementFileRequest? fileRequest;
}
