import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../../common/app_theme/index.dart';
import '../../../../../common/utils/snack_bar_helper.dart';
import '../../data/services/business_card_ocr_service.dart';

/// Màn hình scan danh thiếp - live scan tự động.
class AddBusinessCardScreen extends StatefulWidget {
  const AddBusinessCardScreen({super.key});

  @override
  State<AddBusinessCardScreen> createState() => _AddBusinessCardScreenState();
}

class _AddBusinessCardScreenState extends State<AddBusinessCardScreen>
    with TickerProviderStateMixin {
  final BusinessCardOcrService _ocrService = BusinessCardOcrService();
  MobileScannerController? _controller;
  bool _isProcessing = false;
  late AnimationController _scanLineController;
  late AnimationController _pulseController;
  late Animation<double> _scanLineAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      torchEnabled: false,
    );

    _scanLineController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scanLineAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _scanLineController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _ocrService.dispose();
    _scanLineController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_isProcessing) return;

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final barcode = barcodes.first;
    final String? rawValue = barcode.rawValue;

    if (rawValue == null || rawValue.isEmpty) return;

    setState(() => _isProcessing = true);
    _processScannedData(rawValue);
  }

  Future<void> _processScannedData(String rawValue) async {
    try {
      final result = await _ocrService.parseScannedText(rawValue);

      if (!mounted) return;

      if (result.isEmpty) {
        setState(() => _isProcessing = false);
        return;
      }

      Navigator.pop(context, result);
    } catch (e) {
      if (!mounted) return;
      SnackBarHelper().showError(context, 'Lỗi khi quét: $e');
      setState(() => _isProcessing = false);
    }
  }

  void _enterManually() {
    Navigator.pop(context, <String, String>{});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final frameWidth = screenWidth * 0.85;
    const frameHeightRatio = 0.57;
    final frameHeight = screenWidth * frameHeightRatio;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Camera preview
          MobileScanner(
            controller: _controller,
            onDetect: _onDetect,
          ),

          // Dark overlay with transparent scan area
          _buildScanOverlay(context, frameWidth, frameHeight),

          // Scan frame with corners
          Center(
            child: _ScanFrame(
              width: frameWidth,
              height: frameHeight,
              scanAnimation: _scanLineAnimation,
              pulseAnimation: _pulseAnimation,
              isProcessing: _isProcessing,
            ),
          ),

          // Loading overlay
          if (_isProcessing)
            Center(
              child: Container(
                width: frameWidth,
                height: frameHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withValues(alpha: 0.7),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: CircularProgressIndicator(
                          color: AppColors.primaryERP,
                          strokeWidth: 3,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Đang xử lý...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Top bar
          _buildTopBar(context),

          // Hint text
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 100,
            left: 0,
            right: 0,
            child: const Text(
              'Đưa danh thiếp vào khung để quét tự động',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          // Manual input button
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 32,
            left: 0,
            right: 0,
            child: Center(
              child: _ManualInputButton(onTap: _enterManually),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 8,
          left: 8,
          right: 8,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.8),
              Colors.transparent,
            ],
          ),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
            const Expanded(
              child: Text(
                'Quét danh thiếp',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildScanOverlay(BuildContext context, double frameWidth, double frameHeight) {
    final screenSize = MediaQuery.of(context).size;
    final topBarHeight = MediaQuery.of(context).padding.top + 80;
    final bottomOffset = MediaQuery.of(context).padding.bottom + 180;
    final availableHeight = screenSize.height - topBarHeight - bottomOffset;
    final centerY = topBarHeight + availableHeight / 2;

    final frameRect = Rect.fromCenter(
      center: Offset(screenSize.width / 2, centerY),
      width: frameWidth,
      height: frameHeight,
    );

    return CustomPaint(
      size: screenSize,
      painter: _ScanOverlayPainter(frameRect: frameRect),
    );
  }
}

class _ScanOverlayPainter extends CustomPainter {
  _ScanOverlayPainter({required this.frameRect});

  final Rect frameRect;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.6)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(frameRect, const Radius.circular(12)))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);

    // Draw subtle border around scan area
    final borderPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawRRect(
      RRect.fromRectAndRadius(frameRect, const Radius.circular(12)),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ScanOverlayPainter oldDelegate) => false;
}

class _ScanFrame extends StatelessWidget {
  const _ScanFrame({
    required this.width,
    required this.height,
    required this.scanAnimation,
    required this.pulseAnimation,
    required this.isProcessing,
  });

  final double width;
  final double height;
  final Animation<double> scanAnimation;
  final Animation<double> pulseAnimation;
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Corner brackets
          ..._buildCorners(),

          // Animated scan line
          if (!isProcessing)
            AnimatedBuilder(
              animation: scanAnimation,
              builder: (context, child) {
                return Positioned(
                  top: 20 + (height - 40) * scanAnimation.value,
                  left: 20,
                  right: 20,
                  child: _ScanLine(pulseAnimation: pulseAnimation),
                );
              },
            ),
        ],
      ),
    );
  }

  List<Widget> _buildCorners() {
    const cornerSize = 40.0;
    const strokeWidth = 4.0;
    const radius = 12.0;

    return [
      // Top-left
      Positioned(
        top: 0,
        left: 0,
        child: _CornerBracket(
          size: cornerSize,
          strokeWidth: strokeWidth,
          radius: radius,
          position: _BracketPosition.topLeft,
        ),
      ),
      // Top-right
      Positioned(
        top: 0,
        right: 0,
        child: _CornerBracket(
          size: cornerSize,
          strokeWidth: strokeWidth,
          radius: radius,
          position: _BracketPosition.topRight,
        ),
      ),
      // Bottom-left
      Positioned(
        bottom: 0,
        left: 0,
        child: _CornerBracket(
          size: cornerSize,
          strokeWidth: strokeWidth,
          radius: radius,
          position: _BracketPosition.bottomLeft,
        ),
      ),
      // Bottom-right
      Positioned(
        bottom: 0,
        right: 0,
        child: _CornerBracket(
          size: cornerSize,
          strokeWidth: strokeWidth,
          radius: radius,
          position: _BracketPosition.bottomRight,
        ),
      ),
    ];
  }
}

enum _BracketPosition { topLeft, topRight, bottomLeft, bottomRight }

class _CornerBracket extends StatelessWidget {
  const _CornerBracket({
    required this.size,
    required this.strokeWidth,
    required this.radius,
    required this.position,
  });

  final double size;
  final double strokeWidth;
  final double radius;
  final _BracketPosition position;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _BracketPainter(
          strokeWidth: strokeWidth,
          radius: radius,
          position: position,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _BracketPainter extends CustomPainter {
  _BracketPainter({
    required this.strokeWidth,
    required this.radius,
    required this.position,
    required this.color,
  });

  final double strokeWidth;
  final double radius;
  final _BracketPosition position;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();

    switch (position) {
      case _BracketPosition.topLeft:
        path.moveTo(0, size.height);
        path.lineTo(0, radius);
        path.quadraticBezierTo(0, 0, radius, 0);
        path.lineTo(size.width, 0);
        break;
      case _BracketPosition.topRight:
        path.moveTo(0, 0);
        path.lineTo(size.width - radius, 0);
        path.quadraticBezierTo(size.width, 0, size.width, radius);
        path.lineTo(size.width, size.height);
        break;
      case _BracketPosition.bottomLeft:
        path.moveTo(0, 0);
        path.lineTo(0, size.height - radius);
        path.quadraticBezierTo(0, size.height, radius, size.height);
        path.lineTo(size.width, size.height);
        break;
      case _BracketPosition.bottomRight:
        path.moveTo(size.width, 0);
        path.lineTo(size.width, size.height - radius);
        path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);
        path.lineTo(0, size.height);
        break;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BracketPainter oldDelegate) => true;
}

class _ScanLine extends StatelessWidget {
  const _ScanLine({required this.pulseAnimation});

  final Animation<double> pulseAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulseAnimation,
      builder: (context, child) {
        return Container(
          height: 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                AppColors.primaryERP.withValues(alpha: 0.5 + 0.5 * pulseAnimation.value),
                AppColors.primaryERP,
                AppColors.primaryERP.withValues(alpha: 0.5 + 0.5 * pulseAnimation.value),
                Colors.transparent,
              ],
              stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryERP.withValues(alpha: 0.6 * pulseAnimation.value),
                blurRadius: 12,
                spreadRadius: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ManualInputButton extends StatelessWidget {
  const _ManualInputButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.edit_outlined,
              color: Colors.white70,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Nhập tay',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
