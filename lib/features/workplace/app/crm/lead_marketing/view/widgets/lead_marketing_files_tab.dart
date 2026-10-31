import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import 'lead_file_tile.dart';

/// Tab hiển thị danh sách file đính kèm của phiếu lead.
///
/// Dùng chung cho 2 nhóm file, phân biệt bằng `fileType` của API
/// `GET /Lead/get-files?customerContactId=X&fileType=N`:
/// - `fileType = 1`: file đính kèm thường (tab Files).
/// - `fileType = 2`: file PO (tab Files PO).
///
/// Mỗi file hỗ trợ 2 thao tác:
/// - Xem trước: ảnh (zoom được) và PDF (viewer native).
/// - Tải xuống: mọi định dạng — pdf, word, excel, ảnh, zip...
class LeadMarketingFilesTab extends StatefulWidget {
  const LeadMarketingFilesTab({
    super.key,
    required this.files,
    this.isLoading = false,
    this.errorMessage,
  });

  /// Danh sách file đính kèm của phiếu lead.
  final List<LeadFile> files;

  /// Đang tải danh sách file hay không.
  final bool isLoading;

  /// Thông báo lỗi khi tải danh sách file thất bại.
  final String? errorMessage;

  @override
  State<LeadMarketingFilesTab> createState() => _LeadMarketingFilesTabState();
}

class _LeadMarketingFilesTabState extends State<LeadMarketingFilesTab> {
  /// Index của file đang tải xuống — dùng để hiển thị loading ở nút tải.
  int? _downloadingIndex;

  /// Index của file đang tải nội dung để xem trước.
  int? _previewingIndex;

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading && widget.files.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (widget.files.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.folder_open_outlined,
              size: 48,
              color: AppColors.placeholder,
            ),
            const SizedBox(height: 10),
            Text(
              widget.errorMessage ?? 'Chưa có file đính kèm nào',
              style: const TextStyle(fontSize: 13, color: AppColors.gray),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      itemCount: widget.files.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final file = widget.files[index];
        return LeadFileTile(
          fileName: file.fileName ?? 'File không tên',
          subtitle: _subtitle(file),
          isBusy: _downloadingIndex == index || _previewingIndex == index,
          busyIcon: Icons.hourglass_top_rounded,
          onPreview: () => _openPreview(file, index),
          onDownload: () => _downloadFile(file, index),
        );
      },
    );
  }

  /// Dòng mô tả của file: đuôi file + ngày tạo.
  String _subtitle(LeadFile file) {
    final name = (file.fileName ?? '').trim();
    final extension = leadFileExtensionLabel(name);
    final created = (file.createdDate ?? '').trim();
    if (created.isEmpty) return extension;
    return '$extension • $created';
  }

  /// Mở màn xem trước nội dung file.
  ///
  /// File được tải về qua Dio (kèm token) rồi hiển thị bằng renderer native:
  /// - Ảnh: `Image.memory` trong khung zoom.
  /// - PDF: `SfPdfViewer` đọc trực tiếp từ bytes.
  ///
  /// Không dùng WebView vì Android WebView không có trình xem PDF và tự
  /// tải file xuống khi server trả `Content-Disposition: attachment`.
  Future<void> _openPreview(LeadFile file, int index) async {
    if (_previewingIndex != null || _downloadingIndex != null) return;

    setState(() => _previewingIndex = index);
    debugPrint('[LeadFiles] preview start: ${file.fileName}');

    try {
      await showLeadFilePreview(
        context,
        file,
        onEnd: () {
          if (!mounted) return;
          setState(() => _previewingIndex = null);
        },
      );
    } finally {
      if (mounted && _previewingIndex == index) {
        setState(() => _previewingIndex = null);
      }
    }
  }

  /// Tải file xuống máy và lưu vào thư mục tải về của hệ điều hành.
  Future<void> _downloadFile(LeadFile file, int index) async {
    if (_previewingIndex != null || _downloadingIndex != null) return;

    final fileName = (file.fileName ?? '').trim();
    if (fileName.isEmpty) {
      context.showMessage('File không có tên, không thể tải xuống');
      return;
    }

    setState(() => _downloadingIndex = index);
    debugPrint('[LeadFiles] download start: $fileName');

    try {
      final bytes = await fetchLeadFileBytes(file);

      final sanitizedName = fileName.replaceAll('/', '_');
      final dotIndex = sanitizedName.lastIndexOf('.');
      final hasExtension =
          dotIndex > 0 && dotIndex < sanitizedName.length - 1;
      final name =
          hasExtension ? sanitizedName.substring(0, dotIndex) : sanitizedName;
      final extension = hasExtension ? sanitizedName.substring(dotIndex + 1) : '';

      await FileSaver.instance.saveFile(
        name: name,
        bytes: bytes,
        mimeType: _mimeTypeFromExtension(extension),
      );

      if (!mounted) return;
      context.showMessage('Tải file thành công');
    } catch (e) {
      if (!mounted) return;
      debugPrint('[LeadFiles] download failed: $e');
      context.showMessage('Tải file thất bại: $e', type: SnackBarType.error);
    } finally {
      if (mounted) {
        setState(() => _downloadingIndex = null);
      }
    }
  }

  /// Ánh xạ đuôi file sang mime type để lưu file đúng định dạng.
  MimeType _mimeTypeFromExtension(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return MimeType.pdf;
      case 'doc':
      case 'docx':
        return MimeType.microsoftWord;
      case 'xls':
      case 'xlsx':
        return MimeType.microsoftExcel;
      case 'ppt':
      case 'pptx':
        return MimeType.microsoftPresentation;
      case 'jpg':
      case 'jpeg':
        return MimeType.jpeg;
      case 'png':
        return MimeType.png;
      case 'gif':
        return MimeType.gif;
      case 'bmp':
        return MimeType.bmp;
      case 'txt':
        return MimeType.text;
      case 'csv':
        return MimeType.csv;
      case 'zip':
        return MimeType.zip;
      case 'rar':
        return MimeType.rar;
      case 'mp3':
        return MimeType.mp3;
      case 'mp4':
        return MimeType.mp4Video;
      default:
        return MimeType.other;
    }
  }
}
