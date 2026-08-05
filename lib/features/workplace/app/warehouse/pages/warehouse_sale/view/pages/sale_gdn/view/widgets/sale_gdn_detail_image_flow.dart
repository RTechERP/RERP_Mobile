import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

import 'sale_gdn_detail_camera_page.dart';

/// Mở flow chụp nhiều ảnh cho dòng chi tiết phiếu xuất kho.
///
/// Flow:
/// 1. Mở thẳng màn camera (`CameraCapturePage`) — plugin `camerawesome`
///    giữ camera session liên tục, cho phép chụp nhiều ảnh mà không cần
///    đóng/mở lại.
/// 2. Mỗi lần user bấm nút chụp, ảnh được lưu ngay vào strip vào state
///    nội bộ của camera page.
/// 3. Khi user bấm "Tiếp theo" → đóng camera và mở màn xác nhận
///    (`_ImageConfirmPage`) cho phép xoá ảnh không muốn trước khi lưu.
///
/// Trả về danh sách đường dẫn ảnh đã user xác nhận, hoặc `null` nếu user
/// huỷ trước khi xác nhận.
Future<List<String>?> showSaleGdnDetailImageFlow(BuildContext context) {
  return Navigator.of(context).push<List<String>>(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => const CameraCapturePage(),
    ),
  );
}

// ---------------------------------------------------------------------------
// Confirm / select-many page (grid + remove + confirm)
// ---------------------------------------------------------------------------

class ImageConfirmPage extends StatefulWidget {
  const ImageConfirmPage({super.key, required this.initial});

  final List<String> initial;

  static Future<List<String>?> show(BuildContext context, List<String> paths) {
    return Navigator.of(context).push<List<String>>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => ImageConfirmPage(initial: paths),
      ),
    );
  }

  @override
  State<ImageConfirmPage> createState() => _ImageConfirmPageState();
}

class _ImageConfirmPageState extends State<ImageConfirmPage> {
  late List<String> _paths;

  @override
  void initState() {
    super.initState();
    _paths = List<String>.from(widget.initial);
  }

  @override
  Widget build(BuildContext context) {
    final allFilesExist =
        _paths.where((p) => File(p).existsSync()).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.heading,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Xác nhận ảnh',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '${_paths.length} ảnh đã chọn${_paths.length != allFilesExist.length ? ' (${allFilesExist.length} hợp lệ)' : ''}',
              style: TextStyle(
                fontSize: 11,
                color: AppColors.gray,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        titleSpacing: 0,
      ),
      body: _buildGrid(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: AppColors.gray.withValues(alpha: 0.4),
                    ),
                  ),
                  child: const Text('Huỷ'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: _paths.isEmpty
                      ? null
                      : () => Navigator.of(context).pop(_paths),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryERP,
                    disabledBackgroundColor:
                        AppColors.gray.withValues(alpha: 0.3),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    _paths.isEmpty
                        ? 'Chưa có ảnh'
                        : 'Xác nhận (${_paths.length})',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid() {
    if (_paths.isEmpty) {
      return Center(
        child: Text(
          'Chưa có ảnh nào',
          style: TextStyle(color: AppColors.gray),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _paths.length,
      itemBuilder: (context, index) {
        final path = _paths[index];
        final exists = File(path).existsSync();
        return GestureDetector(
          onTap: () => _openFullscreen(index),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: exists
                      ? Image.file(File(path), fit: BoxFit.cover)
                      : Container(
                          color: AppColors.gray.withValues(alpha: 0.2),
                          child: Icon(
                            Icons.broken_image_outlined,
                            color: AppColors.gray,
                          ),
                        ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withValues(alpha: 0.25),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () => setState(() => _paths.removeAt(index)),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 6,
                bottom: 6,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '#${index + 1}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _openFullscreen(int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => _ConfirmPageFullscreenViewer(
          paths: _paths,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

class _ConfirmPageFullscreenViewer extends StatefulWidget {
  const _ConfirmPageFullscreenViewer({
    required this.paths,
    required this.initialIndex,
  });

  final List<String> paths;
  final int initialIndex;

  @override
  State<_ConfirmPageFullscreenViewer> createState() =>
      _ConfirmPageFullscreenViewerState();
}

class _ConfirmPageFullscreenViewerState
    extends State<_ConfirmPageFullscreenViewer> {
  late PageController _pageController;
  late int _currentIndex;
  late List<String> _paths;

  @override
  void initState() {
    super.initState();
    _paths = List<String>.from(widget.paths);
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '${_currentIndex + 1} / ${_paths.length}',
          style: const TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              setState(() {
                if (_paths.length == 1) {
                  Navigator.of(context).pop();
                } else {
                  _paths.removeAt(_currentIndex);
                  if (_currentIndex >= _paths.length) {
                    _currentIndex = _paths.length - 1;
                  }
                }
              });
            },
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _paths.length,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemBuilder: (context, index) {
          final path = _paths[index];
          return InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: Center(
              child: Image.file(
                File(path),
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Center(
                  child: Icon(Icons.broken_image_outlined,
                      color: Colors.white54, size: 64),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
