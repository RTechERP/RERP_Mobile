import 'dart:io';
import 'dart:typed_data';

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

  @override
  void initState() {
    super.initState();
    _initializeAndLoadImage();
  }

  Future<void> _initializeAndLoadImage() async {
    await _loadImage();
    if (mounted) {
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
          _processingError = e.toString();
        });
      }
    }
  }

  void _onRetake() {
    Navigator.of(context).pop('retake');
  }

  Future<void> _onConfirm() async {
    if (_showTransparentBg && _transparentBytes != null) {
      Navigator.of(context).pop(_transparentBytes);
    } else if (_imageBytes != null) {
      Navigator.of(context).pop(_imageBytes);
    }
  }

  @override
  void dispose() {
    super.dispose();
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
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                if (_processingError != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Lỗi: $_processingError',
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                      textAlign: TextAlign.center,
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
    if (_showTransparentBg && _transparentBytes != null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: _CheckerboardPainter()),
          Image.memory(_transparentBytes!, fit: BoxFit.contain),
        ],
      );
    }

    return Image.memory(_imageBytes!, fit: BoxFit.contain);
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
