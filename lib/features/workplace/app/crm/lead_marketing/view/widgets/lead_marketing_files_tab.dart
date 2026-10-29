import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/app/app_config.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../di/injection.dart';
import '../../data/datasource/models/lead_marketing_model.dart';

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
        return _FileTile(
          file: file,
          isDownloading: _downloadingIndex == index,
          isPreviewing: _previewingIndex == index,
          onPreview: () => _openPreview(file, index),
          onDownload: () => _downloadFile(file, index),
        );
      },
    );
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

    final fileName = (file.fileName ?? '').trim();
    final extension = _extensionOf(fileName).toLowerCase();
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
        'Định dạng này không xem trước được, vui lòng tải xuống',
        type: SnackBarType.info,
      );
      return;
    }

    setState(() => _previewingIndex = index);
    debugPrint('[LeadFiles] preview start: $fileName');

    try {
      final bytes = await _fetchFileBytes(file);
      if (!mounted) return;

      if (isImage) {
        showDialog<void>(
          context: context,
          useSafeArea: false,
          builder: (_) => _ImagePreviewDialog(
            title: fileName.isEmpty ? 'Xem ảnh' : fileName,
            bytes: bytes,
          ),
        );
        return;
      }

      showDialog<void>(
        context: context,
        useSafeArea: false,
        builder: (_) => _PdfPreviewDialog(
          title: fileName.isEmpty ? 'Xem file PDF' : fileName,
          bytes: bytes,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      debugPrint('[LeadFiles] preview failed: $e');
      context.showMessage('Không xem được file: $e', type: SnackBarType.error);
    } finally {
      if (mounted) {
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
      final bytes = await _fetchFileBytes(file);

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

  /// Tải nội dung file từ server qua Dio (tự đính kèm token).
  ///
  /// Kiểm tra status + content-type để chắc chắn nhận được đúng nội dung
  /// file, không phải trang lỗi (JSON/HTML) mà server trả khi thiếu quyền.
  Future<Uint8List> _fetchFileBytes(LeadFile file) async {
    final url = resolveLeadFileUrl(file);
    if (url == null || url.isEmpty) {
      throw Exception('Không tìm thấy đường dẫn file');
    }

    final response = await getIt<Dio>().get<Uint8List>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    final status = response.statusCode ?? 0;
    if (status < 200 || status >= 300) {
      throw Exception('Tải file thất bại (HTTP $status)');
    }

    final contentType = response.headers.value(contentTypeHeader) ?? '';
    if (contentType.contains(contentTypeJson) ||
        contentType.contains(contentTypeHtml)) {
      throw Exception('Server không trả về file (HTTP $status)');
    }

    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) {
      throw Exception('File rỗng');
    }
    return bytes;
  }

  /// Lấy đuôi file (không có dấu chấm) từ tên file.
  String _extensionOf(String fileName) {
    final dotIndex = fileName.lastIndexOf('.');
    if (dotIndex <= 0 || dotIndex == fileName.length - 1) return '';
    return fileName.substring(dotIndex + 1);
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

/// Header HTTP dùng để kiểm tra content-type của response tải file.
const String contentTypeHeader = 'content-type';

/// Content-type JSON — server trả lỗi dạng này khi thiếu quyền truy cập.
const String contentTypeJson = 'application/json';

/// Content-type HTML — server trả về trang lỗi thay vì file.
const String contentTypeHtml = 'text/html';

/// Dựng URL tải/xem file từ đường dẫn UNC mà API trả về.
///
/// `ServerPath`/`OriginPath` là đường dẫn thư mục trên server dạng
/// `\\192.168.1.190\WebData\07. CustomerContact\11294`. URL tương ứng là
/// `{baseUrl}/share/{đường dẫn sau host}/{FileName}`.
///
/// Dùng [Uri] để encode khoảng trắng trong tên thư mục / tên file
/// (vd `07. CustomerContact`) thành `%20`.
String? resolveLeadFileUrl(LeadFile file) {
  final folder = (file.serverPath ?? file.originPath ?? '').trim();
  final name = (file.fileName ?? '').trim();
  if (folder.isEmpty || name.isEmpty) return null;

  final baseUrl = AppConfig.baseUrl.trim();
  if (baseUrl.isEmpty) return null;

  // UNC path `\\host\share\...` → `//host/share/...`, bỏ toàn bộ dấu `/` đầu.
  var normalized = '$folder\\$name'.replaceAll('\\', '/');
  normalized = normalized.replaceFirst(RegExp(r'^/+'), '');

  // Cắt phần host (vd `192.168.1.190`) nếu có để URL chỉ giữ path.
  final ipMatch =
      RegExp(r'^(?:\d{1,3}\.){3}\d{1,3}/(.+)$').firstMatch(normalized);
  final relative = ipMatch != null ? ipMatch.group(1)! : normalized;

  final base = Uri.parse(baseUrl);
  final uri = base.replace(
    pathSegments: [
      ...base.pathSegments.where((s) => s.isNotEmpty),
      'share',
      ...relative.split('/').where((s) => s.isNotEmpty),
    ],
  );

  return uri.toString();
}

/// Một dòng file trong tab Files.
class _FileTile extends StatelessWidget {
  const _FileTile({
    required this.file,
    required this.isDownloading,
    required this.isPreviewing,
    required this.onPreview,
    required this.onDownload,
  });

  final LeadFile file;
  final bool isDownloading;
  final bool isPreviewing;
  final VoidCallback onPreview;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final fileName = (file.fileName ?? '').trim();
    final displayName = fileName.isEmpty ? 'File không tên' : fileName;
    final extension = _extensionLabel(displayName);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: _iconColor(extension).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              _resolveIcon(extension),
              size: 19,
              color: _iconColor(extension),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  displayName,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  extension,
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _actionButton(
            icon: isPreviewing
                ? Icons.hourglass_top_rounded
                : Icons.visibility_outlined,
            tooltip: 'Xem trước',
            isDisabled: isPreviewing || isDownloading,
            onTap: onPreview,
          ),
          const SizedBox(width: 6),
          _actionButton(
            icon: isDownloading
                ? Icons.hourglass_top_rounded
                : Icons.download_rounded,
            tooltip: 'Tải xuống',
            isDisabled: isDownloading || isPreviewing,
            onTap: onDownload,
          ),
        ],
      ),
    );
  }

  /// Nút hành động nhỏ dạng icon.
  Widget _actionButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onTap,
    bool isDisabled = false,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: isDisabled ? null : onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Icon(
            icon,
            size: 16,
            color: isDisabled ? AppColors.gray : AppColors.secondaryERP,
          ),
        ),
      ),
    );
  }

  /// Chọn icon theo đuôi file.
  IconData _resolveIcon(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf_outlined;
      case 'doc':
      case 'docx':
        return Icons.description_outlined;
      case 'xls':
      case 'xlsx':
      case 'csv':
        return Icons.table_chart_outlined;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow_outlined;
      case 'zip':
      case 'rar':
      case '7z':
        return Icons.folder_zip_outlined;
      case 'mp4':
      case 'mov':
      case 'avi':
        return Icons.movie_outlined;
      case 'mp3':
      case 'wav':
        return Icons.audiotrack_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }

  /// Màu nhấn mạnh theo nhóm định dạng file.
  Color _iconColor(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return AppColors.primaryERP;
      case 'doc':
      case 'docx':
      case 'xls':
      case 'xlsx':
      case 'csv':
      case 'ppt':
      case 'pptx':
        return AppColors.blueMain;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'bmp':
      case 'webp':
        return AppColors.greenA500;
      default:
        return AppColors.gray;
    }
  }

  /// Đuôi file hiển thị rút gọn, ví dụ `PNG`.
  String _extensionLabel(String fileName) {
    final dotIndex = fileName.lastIndexOf('.');
    if (dotIndex <= 0 || dotIndex == fileName.length - 1) return 'Tệp';
    return fileName.substring(dotIndex + 1).toUpperCase();
  }
}

/// Dialog xem trước ảnh, hỗ trợ phóng to.
class _ImagePreviewDialog extends StatelessWidget {
  const _ImagePreviewDialog({required this.title, required this.bytes});

  final String title;
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 5,
              child: Center(
                child: Image.memory(
                  bytes,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Text(
                      'Không đọc được ảnh',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ),
          ),
          _previewHeader(context, title),
        ],
      ),
    );
  }
}

/// Dialog xem trước PDF bằng viewer native.
class _PdfPreviewDialog extends StatelessWidget {
  const _PdfPreviewDialog({required this.title, required this.bytes});

  final String title;
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: SfPdfViewer(
              source: BytePDFSource(bytes),
              onDocumentLoadFailed: (details) {
                debugPrint('[LeadFiles] pdf load failed: ${details.description}');
              },
            ),
          ),
          _previewHeader(context, title),
        ],
      ),
    );
  }
}

/// Thanh tiêu đề chung cho các dialog xem trước file.
Widget _previewHeader(BuildContext context, String title) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            borderRadius: BorderRadius.circular(999),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
