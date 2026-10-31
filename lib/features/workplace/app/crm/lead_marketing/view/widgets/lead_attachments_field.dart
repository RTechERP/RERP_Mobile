import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import 'lead_attachment_picker_sheet.dart';
import 'lead_file_tile.dart';

/// Khối đính kèm file trong form tạo / sửa phiếu lead.
///
/// Hiển thị 2 nhóm file:
/// - **File đã lưu trên server**: lấy từ `GET /Lead/get-files?fileType=1`,
///   người dùng xem trước và xoá được ngay.
/// - **File mới chọn**: chưa upload, sẽ được gửi lên server sau khi lưu
///   phiếu lead, người dùng xem trước và bỏ chọn được.
class LeadAttachmentsField extends StatelessWidget {
  const LeadAttachmentsField({
    super.key,
    this.savedFiles = const [],
    this.pendingFiles = const [],
    this.isLoading = false,
    this.deletingFileId,
    this.onPickFiles,
    this.onPreviewSaved,
    this.onDeleteSaved,
    this.onPreviewPending,
    this.onRemovePending,
    this.allowedExtensions = const [
      'pdf',
      'doc',
      'docx',
      'xls',
      'xlsx',
      'png',
      'jpg',
      'jpeg',
      'gif',
      'zip',
      'rar',
    ],
  });

  /// Danh sách file đã lưu trên server.
  final List<LeadFile> savedFiles;

  /// Danh sách file mới chọn, chưa upload.
  final List<PlatformFile> pendingFiles;

  /// Đang tải danh sách file đã lưu.
  final bool isLoading;

  /// ID file đang được xoá (null khi không xoá file nào).
  final int? deletingFileId;

  /// Callback khi người dùng chọn file mới.
  final ValueChanged<List<PlatformFile>>? onPickFiles;

  /// Callback xem trước file đã lưu.
  final ValueChanged<LeadFile>? onPreviewSaved;

  /// Callback xoá file đã lưu.
  final ValueChanged<LeadFile>? onDeleteSaved;

  /// Callback xem trước file mới chọn.
  final ValueChanged<PlatformFile>? onPreviewPending;

  /// Callback bỏ file mới chọn khỏi danh sách chờ upload.
  final ValueChanged<PlatformFile>? onRemovePending;

  /// Danh sách đuôi file được phép chọn.
  final List<String> allowedExtensions;

  @override
  Widget build(BuildContext context) {
    final hasFiles = savedFiles.isNotEmpty || pendingFiles.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nút chọn file + mô tả định dạng.
        _PickerButton(
          icon: Icons.attach_file,
          label: 'File đính kèm',
          hint: 'Chụp ảnh, chọn ảnh hoặc tệp (PDF, Word, Excel...)',
          onTap: onPickFiles == null ? null : () => _pickFiles(context),
        ),
        const SizedBox(height: 10),
        if (isLoading && !hasFiles)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          )
        else if (!hasFiles)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.borderColor,
                style: BorderStyle.solid,
              ),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.folder_open_outlined,
                  size: 26,
                  color: AppColors.placeholder,
                ),
                SizedBox(height: 6),
                Text(
                  'Chưa có file đính kèm nào',
                  style: TextStyle(fontSize: 12, color: AppColors.gray),
                ),
              ],
            ),
          )
        else
          for (final file in savedFiles)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: LeadFileTile(
                fileName: file.fileName ?? 'File không tên',
                subtitle: _savedSubtitle(file),
                isBusy: deletingFileId == file.id,
                busyIcon: Icons.hourglass_top_rounded,
                onPreview:
                    onPreviewSaved == null ? null : () => onPreviewSaved!(file),
                onDelete:
                    onDeleteSaved == null ? null : () => onDeleteSaved!(file),
              ),
            ),
        for (final file in pendingFiles)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: LeadFileTile(
              fileName: file.name,
              subtitle: '${_formatSize(file.size)} • Chưa tải lên',
              onPreview: onPreviewPending == null
                  ? null
                  : () => onPreviewPending!(file),
              onDelete:
                  onRemovePending == null ? null : () => onRemovePending!(file),
            ),
          ),
      ],
    );
  }

  /// Mở hộp thoại chọn file và trả về danh sách file người dùng chọn.
  Future<void> _pickFiles(BuildContext context) async {
    final files = await LeadAttachmentPickerSheet.pick(
      context,
      allowedExtensions: allowedExtensions,
    );
    if (files == null || files.isEmpty) return;
    onPickFiles?.call(files);
  }

  /// Dòng mô tả của file đã lưu: đuôi file + ngày tạo.
  String _savedSubtitle(LeadFile file) {
    final name = (file.fileName ?? '').trim();
    final extension = leadFileExtensionLabel(name);
    final created = (file.createdDate ?? '').trim();
    if (created.isEmpty) return extension;
    return '$extension • $created';
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

/// Nút chọn file đính kèm — hiển thị icon, tiêu đề và mô tả định dạng.
class _PickerButton extends StatelessWidget {
  const _PickerButton({
    required this.icon,
    required this.label,
    required this.hint,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String hint;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primaryERP.withValues(alpha: 0.25),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.primaryERP, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.enableText,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      hint,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.hintText,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.upload_file,
                size: 20,
                color: AppColors.primaryERP,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Xem trước file mới chọn (chưa upload) từ bytes trong bộ nhớ.
Future<void> showPendingFilePreview(
  BuildContext context,
  PlatformFile file,
) async {
  final bytes = file.bytes;
  if (bytes == null || bytes.isEmpty) {
    context.showMessage(
      'Không đọc được nội dung file',
      type: SnackBarType.info,
    );
    return;
  }

  final extension = leadFileExtension(file.name).toLowerCase();
  final isImage = const [
    'jpg',
    'jpeg',
    'png',
    'gif',
    'bmp',
    'webp',
  ].contains(extension);
  final isPdf = extension == 'pdf';

  if (!isImage && !isPdf) {
    context.showMessage(
      'Định dạng này không xem trước được',
      type: SnackBarType.info,
    );
    return;
  }

  await showLeadBytesPreview(
    context,
    title: file.name,
    bytes: bytes,
    isImage: isImage,
  );
}
