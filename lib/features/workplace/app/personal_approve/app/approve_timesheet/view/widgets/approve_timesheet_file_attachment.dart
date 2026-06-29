import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../../common/app/app_config.dart';
import '../../../../../../../../common/app_theme/app_colors.dart';

/// Widget hiển thị file đính kèm với nút xem trước.
///
/// Resolves `filePath` thành URL đầy đủ (hỗ trợ các biến thể `/share/`,
/// `http(s)://`, hoặc raw path) rồi mở preview bằng WebView fullscreen.
class ApproveTimesheetFileAttachment extends StatelessWidget {
  const ApproveTimesheetFileAttachment({
    super.key,
    required this.fileName,
    required this.filePath,
  });

  final String fileName;
  final String filePath;

  String? _resolveFileUrl(String rawPath) {
    final path = rawPath.trim();
    if (path.isEmpty) return null;
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return path;
    }

    var baseUrl = AppConfig.baseUrl.trim();
    if (baseUrl.isEmpty) return null;
    if (baseUrl.endsWith('/')) {
      baseUrl = baseUrl.substring(0, baseUrl.length - 1);
    }

    var normalizedPath = path.replaceAll('\\', '/');
    normalizedPath = normalizedPath.replaceAll(RegExp(r'^/+'), '');
    final lowerPath = normalizedPath.toLowerCase();

    final apiShareIndex = lowerPath.indexOf('/api/api/share/');
    if (apiShareIndex >= 0) {
      normalizedPath = normalizedPath.substring(apiShareIndex + '/api/api'.length);
    } else {
      final shareIndex = lowerPath.indexOf('/share/');
      if (shareIndex >= 0) {
        normalizedPath = normalizedPath.substring(shareIndex);
      } else {
        final ipPathMatch = RegExp(r'^(?:\d{1,3}\.){3}\d{1,3}/?(.+)$').firstMatch(normalizedPath);
        if (ipPathMatch != null) {
          normalizedPath = '/share/${ipPathMatch.group(1)!}';
        } else {
          normalizedPath = '/$normalizedPath';
        }
      }
    }

    if (!normalizedPath.startsWith('/')) {
      normalizedPath = '/$normalizedPath';
    }

    return '$baseUrl$normalizedPath';
  }

  void _openPreview(BuildContext context) {
    final url = _resolveFileUrl(filePath);
    if (url == null || url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không tìm thấy đường dẫn file')),
      );
      return;
    }

    showDialog<void>(
      context: context,
      useSafeArea: false,
      builder: (_) => _FilePreviewDialog(
        title: fileName.trim().isNotEmpty ? fileName.trim() : 'Xem file',
        url: url,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryERP.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primaryERP.withValues(alpha: 0.12),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.attach_file, size: 14, color: AppColors.primaryERP),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              fileName,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.heading,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () => _openPreview(context),
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.visibility_outlined,
                      size: 13, color: AppColors.primaryERP),
                  SizedBox(width: 3),
                  Text(
                    'Xem',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryERP,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Dialog xem file sử dụng WebView.
class _FilePreviewDialog extends StatefulWidget {
  const _FilePreviewDialog({required this.title, required this.url});

  final String title;
  final String url;

  @override
  State<_FilePreviewDialog> createState() => _FilePreviewDialogState();
}

class _FilePreviewDialogState extends State<_FilePreviewDialog> {
  late final WebViewController _controller;

  Uri get _previewUri => Uri.parse(widget.url);

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..loadRequest(_previewUri);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: WebViewWidget(controller: _controller),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        widget.title,
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
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
