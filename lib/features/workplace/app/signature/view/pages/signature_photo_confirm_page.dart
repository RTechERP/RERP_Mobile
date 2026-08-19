import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../utils/signature_background_remover.dart';

class SignaturePhotoConfirmPage extends StatefulWidget {
  final String imagePath;

  const SignaturePhotoConfirmPage({super.key, required this.imagePath});

  @override
  State<SignaturePhotoConfirmPage> createState() =>
      _SignaturePhotoConfirmPageState();
}

class _SignaturePhotoConfirmPageState extends State<SignaturePhotoConfirmPage> {
  Uint8List? _imageBytes;
  Uint8List? _transparentBytes;
  bool _showTransparentBg = true;
  bool _isProcessing = false;
  bool _isLoading = true;
  String? _processingError;

  static const Size _outputSize = Size(600, 300);
  static const double _outputAspect = 2.0; // 600 / 300

  /// Crop rect expressed in pixels of the rendered image (not normalized).
  /// Updated by [_SignatureCropOverlay] through [_setCropRect].
  Rect _cropRect = Rect.zero;

  @override
  void initState() {
    super.initState();
    _initializeAndLoadImage();
  }

  Future<void> _initializeAndLoadImage() async {
    await _loadImage();
    if (mounted && _imageBytes != null) {
      await _processBackgroundRemoval();
    }
  }

  Future<void> _loadImage() async {
    final bytes = await File(widget.imagePath).readAsBytes();
    if (mounted) {
      setState(() {
        _imageBytes = bytes;
        _isLoading = false;
      });
    }
  }

  Future<void> _processBackgroundRemoval() async {
    if (_transparentBytes != null) return;
    if (_imageBytes == null) return;

    setState(() {
      _isProcessing = true;
      _processingError = null;
    });

    try {
      final result = SignatureImageHelper.process(_imageBytes!);

      debugPrint(
        'removeBg result: ${result.width}x${result.height}, '
        'inputSize=${_imageBytes!.length}B, outputSize=${result.pngBytes.length}B',
      );

      if (mounted) {
        setState(() {
          _transparentBytes = result.pngBytes;
          _isProcessing = false;
          _showTransparentBg = true;
        });
      }
    } catch (e) {
      debugPrint('Background removal failed: $e');
      if (mounted) {
        setState(() {
          _isProcessing = false;
          _showTransparentBg = false;
          _processingError = _humanizeError(e);
        });
      }
    }
  }

  /// Translate low-level exceptions into a short, user-facing
  /// message in Vietnamese.
  String _humanizeError(Object e) {
    final raw = e.toString();
    if (raw.contains('Invalid image data')) {
      return 'Ảnh không hợp lệ. Vui lòng chọn ảnh khác.';
    }
    if (raw.contains('No signature detected')) {
      return 'Không nhận diện được chữ ký. Vui lòng chụp lại với nét đậm hơn và rõ nét hơn.';
    }
    if (raw.contains('FormatException')) {
      return 'Định dạng ảnh không được hỗ trợ. Vui lòng chọn ảnh JPG hoặc PNG.';
    }
    if (raw.contains('OutOfMemory') || raw.contains('ImageTooLarge')) {
      return 'Ảnh quá lớn. Vui lòng chọn ảnh có dung lượng nhỏ hơn.';
    }
    return 'Không thể xử lý ảnh. Vui lòng thử lại hoặc chụp ảnh khác.';
  }

  void _setCropRect(Rect rect) {
    if (_cropRect == rect) return;
    setState(() => _cropRect = rect);
  }

  void _onRetake() {
    Navigator.of(context).pop('retake');
  }

  Future<void> _onConfirm() async {
    final source = _showTransparentBg && _transparentBytes != null
        ? _transparentBytes!
        : _imageBytes;

    if (source == null) return;

    final cropped = await _cropToOutput(source);
    if (mounted && cropped != null) {
      Navigator.of(context).pop(cropped);
    }
  }

  /// Decode, crop using the rendered crop rect, and resize to
  /// the fixed output size (300x150).
  Future<Uint8List?> _cropToOutput(Uint8List bytes) async {
    try {
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      final image = frame.image;

      // Map the rendered crop rect (which is in the BoxFit.contain
      // image space) back to actual image pixel coordinates.
      final decodedSize = Size(image.width.toDouble(), image.height.toDouble());
      final renderedFit = _fitContain(decodedSize, _previewImageSize);

      final cropX = (_cropRect.left - renderedFit.left) / renderedFit.width;
      final cropY = (_cropRect.top - renderedFit.top) / renderedFit.height;
      final cropW = _cropRect.width / renderedFit.width;
      final cropH = _cropRect.height / renderedFit.height;

      final src = Rect.fromLTWH(
        (cropX * image.width).clamp(0.0, image.width.toDouble()),
        (cropY * image.height).clamp(0.0, image.height.toDouble()),
        (cropW * image.width).clamp(1.0, image.width.toDouble()),
        (cropH * image.height).clamp(1.0, image.height.toDouble()),
      );
      final dst = Rect.fromLTWH(0, 0, _outputSize.width, _outputSize.height);

      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      final paint = Paint()
        ..filterQuality = FilterQuality.high
        ..isAntiAlias = true;
      canvas.drawImageRect(image, src, dst, paint);
      final picture = recorder.endRecording();
      final resized = await picture.toImage(
        _outputSize.width.toInt(),
        _outputSize.height.toInt(),
      );
      final data = await resized.toByteData(format: ui.ImageByteFormat.png);
      image.dispose();
      resized.dispose();
      if (data == null) return null;
      return data.buffer.asUint8List();
    } catch (e) {
      debugPrint('Crop to output failed: $e');
      return bytes;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Rendered size of the image preview (the Stack area where both
  // the image and the crop overlay are laid out).
  Size _previewImageSize = Size.zero;

  /// Compute the rect inside [container] where an image with [source]
  /// size would be rendered using `BoxFit.contain`.
  static Rect _fitContain(Size source, Size container) {
    if (source.width <= 0 || source.height <= 0) {
      return Rect.fromLTWH(0, 0, container.width, container.height);
    }
    final srcAspect = source.width / source.height;
    final dstAspect = container.width / container.height;

    double w, h;
    if (srcAspect > dstAspect) {
      w = container.width;
      h = w / srcAspect;
    } else {
      h = container.height;
      w = h * srcAspect;
    }

    final left = (container.width - w) / 2;
    final top = (container.height - h) / 2;
    return Rect.fromLTWH(left, top, w, h);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Xác nhận ảnh', style: TextStyle(fontSize: 18)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop('cancel'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading || _imageBytes == null
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : _buildImagePreview(),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPreviewOption(
                        icon: Icons.check_box_outlined,
                        label: 'Nền trong',
                        isSelected: _showTransparentBg,
                        onTap: _transparentBytes != null
                            ? () => setState(() => _showTransparentBg = true)
                            : null,
                      ),
                      Container(width: 1, height: 40, color: Colors.white24),
                      _buildPreviewOption(
                        icon: Icons.image_outlined,
                        label: 'Nền thật',
                        isSelected: !_showTransparentBg,
                        onTap: () => setState(() => _showTransparentBg = false),
                      ),
                    ],
                  ),
                ),
                if (_isProcessing)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Đang xử lý tách nền...',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_processingError != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.red.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 18,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Không thể tách nền ảnh',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _processingError!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _isProcessing
                                ? null
                                : () {
                                    setState(() =>
                                        _processingError = null);
                                    _processBackgroundRemoval();
                                  },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                            ),
                            child: const Text(
                              'Thử lại',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _onRetake,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Chụp lại'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white54),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _isProcessing ? null : _onConfirm,
                        icon: const Icon(Icons.check),
                        label: const Text('Xác nhận'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryERP,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.white24,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    final showTransparent = _showTransparentBg && _transparentBytes != null;

    return LayoutBuilder(
      builder: (context, constraints) {
        final containerSize = Size(constraints.maxWidth, constraints.maxHeight);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_previewImageSize != containerSize) {
            setState(() => _previewImageSize = containerSize);
          }
        });

        Widget imageWidget;
        if (showTransparent) {
          imageWidget = Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(painter: _CheckerboardPainter()),
              Image.memory(_transparentBytes!, fit: BoxFit.contain),
            ],
          );
        } else {
          imageWidget = Image.memory(_imageBytes!, fit: BoxFit.contain);
        }

        if (!showTransparent) {
          return imageWidget;
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            imageWidget,
            Positioned.fill(
              child: _SignatureCropOverlay(
                containerSize: containerSize,
                fixedAspectRatio: _outputAspect,
                initialRect: _cropRect,
                onChanged: _setCropRect,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPreviewOption({
    required IconData icon,
    required String label,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    final isEnabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryERP.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryERP : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.primaryERP
                  : (isEnabled ? Colors.white70 : Colors.white38),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppColors.primaryERP
                    : (isEnabled ? Colors.white70 : Colors.white38),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignatureCropOverlay extends StatefulWidget {
  final Size containerSize;
  final double fixedAspectRatio;
  final Rect initialRect;
  final ValueChanged<Rect> onChanged;

  const _SignatureCropOverlay({
    required this.containerSize,
    required this.fixedAspectRatio,
    required this.initialRect,
    required this.onChanged,
  });

  @override
  State<_SignatureCropOverlay> createState() => _SignatureCropOverlayState();
}

class _SignatureCropOverlayState extends State<_SignatureCropOverlay> {
  /// The crop rect in container coordinates. This is the source of
  /// truth - we never recompute it from normalized values.
  Rect? _rect;

  Rect _ensureRect() {
    if (_rect != null) return _rect!;
    final size = widget.containerSize;
    final h = size.width / widget.fixedAspectRatio;
    final w = size.width;
    final left = 0.0;
    final top = (size.height - h) / 2;
    final rect = Rect.fromLTWH(left, top, w, h);
    _rect = rect;
    return rect;
  }

  Rect _clampRect(Rect rect) {
    final aspect = widget.fixedAspectRatio;
    final size = widget.containerSize;

    double w = rect.width;
    double h = rect.height;

    if (w / h > aspect) {
      w = h * aspect;
    } else {
      h = w / aspect;
    }

    double left = rect.left;
    double top = rect.top;

    if (left < 0) left = 0;
    if (top < 0) top = 0;
    if (left + w > size.width) left = size.width - w;
    if (top + h > size.height) top = size.height - h;

    return Rect.fromLTWH(left, top, w, h);
  }

  void _emit(Rect rect) {
    _rect = rect;
    widget.onChanged(rect);
  }

  void _onMove(DragUpdateDetails details) {
    final current = _ensureRect();
    final shifted = current.shift(details.delta);
    final clamped = _clampRect(shifted);
    setState(() => _emit(clamped));
  }

  void _onCornerDrag(DragUpdateDetails details, _HandlePosition handle) {
    final current = _ensureRect();
    double left = current.left;
    double top = current.top;
    double right = current.right;
    double bottom = current.bottom;

    switch (handle) {
      case _HandlePosition.topLeft:
        left += details.delta.dx;
        top += details.delta.dy;
        break;
      case _HandlePosition.topRight:
        right += details.delta.dx;
        top += details.delta.dy;
        break;
      case _HandlePosition.bottomLeft:
        left += details.delta.dx;
        bottom += details.delta.dy;
        break;
      case _HandlePosition.bottomRight:
        right += details.delta.dx;
        bottom += details.delta.dy;
        break;
    }

    final aspect = widget.fixedAspectRatio;
    double width = right - left;
    double height = bottom - top;

    if (width / height > aspect) {
      width = height * aspect;
    } else {
      height = width / aspect;
    }

    // Minimum size to avoid collapsing to nothing.
    const minSize = 60.0;
    if (width < minSize) {
      width = minSize;
      height = width / aspect;
    }
    if (height < minSize / aspect) {
      height = minSize / aspect;
      width = height * aspect;
    }

    switch (handle) {
      case _HandlePosition.topLeft:
        left = right - width;
        top = bottom - height;
        break;
      case _HandlePosition.topRight:
        right = left + width;
        top = bottom - height;
        break;
      case _HandlePosition.bottomLeft:
        left = right - width;
        bottom = top + height;
        break;
      case _HandlePosition.bottomRight:
        right = left + width;
        bottom = top + height;
        break;
    }

    final clamped = _clampRect(
      Rect.fromLTRB(left, top, right, bottom),
    );
    setState(() => _emit(clamped));
  }

  @override
  Widget build(BuildContext context) {
    final rect = _ensureRect();

    return Stack(
      children: [
        // Dim everything outside the crop rect.
        Positioned.fill(
          child: CustomPaint(painter: _CropDimPainter(cropRect: rect)),
        ),
        // Movable crop frame.
        Positioned.fromRect(
          rect: rect,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanUpdate: _onMove,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryERP,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        _buildHandles(rect),
        // Helper label.
        Positioned(
          left: rect.left,
          top: (rect.top - 28).clamp(4.0, double.infinity),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Kéo khung để căn chữ ký',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHandles(Rect rect) {
    const handleSize = 22.0;
    final positions = {
      _HandlePosition.topLeft: rect.topLeft,
      _HandlePosition.topRight: rect.topRight,
      _HandlePosition.bottomLeft: rect.bottomLeft,
      _HandlePosition.bottomRight: rect.bottomRight,
    };

    return Stack(
      children: positions.entries.map((entry) {
        return Positioned(
          left: entry.value.dx - handleSize / 2,
          top: entry.value.dy - handleSize / 2,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanUpdate: (d) => _onCornerDrag(d, entry.key),
            child: Container(
              width: handleSize,
              height: handleSize,
              decoration: BoxDecoration(
                color: AppColors.primaryERP,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

enum _HandlePosition { topLeft, topRight, bottomLeft, bottomRight }

class _CropDimPainter extends CustomPainter {
  final Rect cropRect;

  _CropDimPainter({required this.cropRect});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.55)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(cropRect)
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CropDimPainter oldDelegate) {
    return oldDelegate.cropRect != cropRect;
  }
}

class _CheckerboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double squareSize = 16;
    final Paint whitePaint = Paint()..color = Colors.white;
    final Paint greyPaint = Paint()..color = const Color(0xFFE0E0E0);

    for (double y = 0; y < size.height; y += squareSize) {
      for (double x = 0; x < size.width; x += squareSize) {
        final bool isWhite = ((x ~/ squareSize) + (y ~/ squareSize)) % 2 == 0;
        canvas.drawRect(
          Rect.fromLTWH(x, y, squareSize, squareSize),
          isWhite ? whitePaint : greyPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}