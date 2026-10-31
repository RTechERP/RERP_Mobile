import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/app/app_config.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../di/injection.dart';
import '../../data/datasource/models/lead_marketing_model.dart';

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

/// Lấy đuôi file (không có dấu chấm) từ tên file.
String leadFileExtension(String fileName) {
  final dotIndex = fileName.lastIndexOf('.');
  if (dotIndex <= 0 || dotIndex == fileName.length - 1) return '';
  return fileName.substring(dotIndex + 1);
}

/// Đuôi file hiển thị rút gọn, ví dụ `PNG`.
String leadFileExtensionLabel(String fileName) {
  final extension = leadFileExtension(fileName);
  if (extension.isEmpty) return 'Tệp';
  return extension.toUpperCase();
}

/// Chọn icon theo đuôi file.
IconData leadFileIcon(String extension) {
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
Color leadFileIconColor(String extension) {
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

/// Tải nội dung file từ server qua Dio (tự đính kèm token).
///
/// Kiểm tra status + content-type để chắc chắn nhận được đúng nội dung
/// file, không phải trang lỗi (JSON/HTML) mà server trả khi thiếu quyền.
Future<Uint8List> fetchLeadFileBytes(LeadFile file) async {
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

/// Mở màn xem trước nội dung file đính kèm của phiếu lead.
///
/// File được tải về qua Dio (kèm token) rồi hiển thị bằng renderer native:
/// - Ảnh: `Image.memory` trong khung zoom.
/// - PDF: `SfPdfViewer` đọc trực tiếp từ bytes.
///
/// Không dùng WebView vì Android WebView không có trình xem PDF và tự
/// tải file xuống khi server trả `Content-Disposition: attachment`.
Future<void> showLeadFilePreview(
  BuildContext context,
  LeadFile file, {
  VoidCallback? onStart,
  VoidCallback? onEnd,
}) async {
  final fileName = (file.fileName ?? '').trim();
  final extension = leadFileExtension(fileName).toLowerCase();
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

  onStart?.call();

  try {
    final bytes = await fetchLeadFileBytes(file);
    if (!context.mounted) return;
    await showLeadBytesPreview(
      context,
      title: fileName.isEmpty ? 'Xem file' : fileName,
      bytes: bytes,
      isImage: isImage,
    );
  } catch (e) {
    if (!context.mounted) return;
    context.showMessage('Không xem được file: $e', type: SnackBarType.error);
  } finally {
    onEnd?.call();
  }
}

/// Hiển thị nội dung file (bytes) trong dialog fullscreen.
///
/// [isImage] = true → hiển thị ảnh có thể zoom, ngược lại hiển thị PDF.
Future<void> showLeadBytesPreview(
  BuildContext context, {
  required String title,
  required Uint8List bytes,
  bool isImage = true,
}) {
  return showDialog<void>(
    context: context,
    useSafeArea: false,
    builder: (_) => isImage
        ? _LeadImagePreviewDialog(title: title, bytes: bytes)
        : _LeadPdfPreviewDialog(title: title, bytes: bytes),
  );
}

/// Một dòng file đính kèm — hiển thị icon, tên file và các nút hành động.
///
/// Dùng chung cho tab Files của màn chi tiết và khối đính kèm trong form
/// tạo / sửa phiếu lead.
class LeadFileTile extends StatelessWidget {
  const LeadFileTile({
    super.key,
    required this.fileName,
    this.subtitle,
    this.onPreview,
    this.onDelete,
    this.onDownload,
    this.isBusy = false,
    this.busyIcon,
  });

  /// Tên file hiển thị.
  final String fileName;

  /// Dòng mô tả phụ (vd kích thước, ngày tạo).
  final String? subtitle;

  /// Callback mở màn xem trước — `null` → ẩn nút xem.
  final VoidCallback? onPreview;

  /// Callback xoá file — `null` → ẩn nút xoá.
  final VoidCallback? onDelete;

  /// Callback tải file xuống — `null` → ẩn nút tải.
  final VoidCallback? onDownload;

  /// Đang xử lý (tải / xem) → hiển thị loading ở nút tương ứng.
  final bool isBusy;

  /// Icon thay thế khi [isBusy] = true.
  final IconData? busyIcon;

  @override
  Widget build(BuildContext context) {
    final displayName = fileName.trim().isEmpty ? 'File không tên' : fileName;
    final extension = leadFileExtension(displayName);

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
              color: leadFileIconColor(extension).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              leadFileIcon(extension),
              size: 19,
              color: leadFileIconColor(extension),
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
                  subtitle ?? leadFileExtensionLabel(displayName),
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray,
                    height: 1.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (onPreview != null)
            _actionButton(
              icon: isBusy && busyIcon != null
                  ? busyIcon!
                  : Icons.visibility_outlined,
              tooltip: 'Xem trước',
              isDisabled: isBusy,
              onTap: onPreview!,
            ),
          if (onDelete != null) ...[
            const SizedBox(width: 6),
            _actionButton(
              icon: Icons.delete_outline,
              tooltip: 'Xoá',
              color: AppColors.alert,
              onTap: onDelete!,
            ),
          ],
          if (onDownload != null) ...[
            const SizedBox(width: 6),
            _actionButton(
              icon: isBusy && busyIcon != null
                  ? busyIcon!
                  : Icons.download_rounded,
              tooltip: 'Tải xuống',
              isDisabled: isBusy,
              onTap: onDownload!,
            ),
          ],
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
    Color? color,
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
            color: isDisabled ? AppColors.gray : (color ?? AppColors.secondaryERP),
          ),
        ),
      ),
    );
  }
}

/// Dialog xem trước ảnh, hỗ trợ phóng to.
class _LeadImagePreviewDialog extends StatelessWidget {
  const _LeadImagePreviewDialog({required this.title, required this.bytes});

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
          _leadPreviewHeader(context, title),
        ],
      ),
    );
  }
}

/// Dialog xem trước PDF bằng viewer native.
class _LeadPdfPreviewDialog extends StatelessWidget {
  const _LeadPdfPreviewDialog({required this.title, required this.bytes});

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
          _leadPreviewHeader(context, title),
        ],
      ),
    );
  }
}

/// Thanh tiêu đề chung cho các dialog xem trước file.
Widget _leadPreviewHeader(BuildContext context, String title) {
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
