import 'dart:async';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../common/app_theme/index.dart';
import '../../../../../common/utils/snack_bar_helper.dart';
import '../../data/datasource/services/ollama_vision_service.dart';

/// Mute camera shutter sound on iOS/Android.
class _CameraSoundMuter {
  static const _channel = MethodChannel('com.rerp/camera_mute');

  static Future<void> mute() async {
    try {
      await _channel.invokeMethod('muteShutter');
    } catch (_) {}
  }
}

/// Màn hình quét danh thiếp bằng camera.
class AddBusinessCardScreen extends StatefulWidget {
  const AddBusinessCardScreen({super.key});

  @override
  State<AddBusinessCardScreen> createState() => _AddBusinessCardScreenState();
}

class _AddBusinessCardScreenState extends State<AddBusinessCardScreen>
    with TickerProviderStateMixin {
  final OllamaVisionService _ollamaService = OllamaVisionService();
  bool _isProcessing = false;
  bool _hasObject = false;
  late AnimationController _scanLineController;
  late AnimationController _pulseController;
  late AnimationController _blinkController;
  late Animation<double> _scanLineAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _blinkAnimation;
  PhotoCameraState? _photoState;

  // Stability detection
  Timer? _stabilityTimer;
  DateTime? _stableStartTime;
  Uint8List? _lastFrameBytes;
  static const _stableDuration = Duration(seconds: 2);

  // Edge ratio với hysteresis để tránh flickering
  double _smoothedEdgeRatio = 0.0;
  bool _confirmedHasObject = false;

  @override
  void initState() {
    super.initState();
    _scanLineController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _blinkController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _scanLineAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _scanLineController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _blinkAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _blinkController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ollamaService.dispose();
    _scanLineController.dispose();
    _pulseController.dispose();
    _blinkController.dispose();
    _stabilityTimer?.cancel();
    super.dispose();
  }

  Future<void> _captureAndScan() async {
    if (_isProcessing) return;

    setState(() => _isProcessing = true);
    _stabilityTimer?.cancel();

    // Mute shutter sound before capture
    await _CameraSoundMuter.mute();

    try {
      final captureRequest = await _photoState?.takePhoto();
      if (captureRequest == null || !mounted) {
        if (mounted) setState(() => _isProcessing = false);
        return;
      }

      final path = captureRequest.when(
        single: (s) => s.path,
        multiple: (m) => m.path,
      );

      if (path == null || path.isEmpty) {
        if (mounted) setState(() => _isProcessing = false);
        return;
      }

      // Gọi Ollama Qwen2.5VL để extract thông tin danh thiếp.
      final ollamaResult = await _ollamaService.extractBusinessCard(path);
      final scannedData = ollamaResult.toMap();

      if (!mounted) return;

      Navigator.pop(context, scannedData);
    } on OllamaConnectionException catch (e) {
      if (!mounted) return;
      SnackBarHelper().showError(context, e.message);
      setState(() => _isProcessing = false);
    } catch (e) {
      if (!mounted) return;
      SnackBarHelper().showError(context, 'Lỗi khi xử lý ảnh: $e');
      setState(() => _isProcessing = false);
    }
  }

  Future<void> _onAnalysis(AnalysisImage image) async {
    if (_isProcessing || !mounted) return;

    final bytes = image.when(
      nv21: (img) => img.bytes,
      bgra8888: (img) => img.bytes,
      jpeg: (img) => img.bytes,
      yuv420: (img) => img.planes.first.bytes,
    );

    if (bytes == null || bytes.isEmpty) return;

    // Phát hiện vật thể với smoothing để tránh flickering
    final currentEdgeRatio = _calculateEdgeRatio(bytes);
    _smoothedEdgeRatio = _smoothedEdgeRatio * 0.7 + currentEdgeRatio * 0.3;

    // Hysteresis: threshold khác nhau cho on/off
    const onThreshold = 0.60;
    const offThreshold = 0.50;

    bool hasObject;
    if (_confirmedHasObject) {
      hasObject = _smoothedEdgeRatio > offThreshold;
    } else {
      hasObject = _smoothedEdgeRatio > onThreshold;
    }

    if (hasObject != _confirmedHasObject) {
      _confirmedHasObject = hasObject;
      setState(() => _hasObject = hasObject);
    }

    if (!hasObject) {
      _stableStartTime = null;
      _stabilityTimer?.cancel();
      _stabilityTimer = null;
      return;
    }

    // Chỉ đếm stability khi có vật thể
    final isStable = _isFrameStable(bytes);

    if (isStable) {
      if (_stableStartTime == null) {
        _stableStartTime = DateTime.now();
        _stabilityTimer?.cancel();
        _stabilityTimer = Timer(_stableDuration, () {
          _captureAndScan();
        });
      }
    } else {
      _stableStartTime = null;
      _stabilityTimer?.cancel();
      _stabilityTimer = null;
    }
  }

    double _calculateEdgeRatio(Uint8List bytes) {
    if (bytes.length < 1000) return 0.0;

    int diffCount = 0;
    final sampleSize = (bytes.length / 20).clamp(500, 3000).toInt();
    final step = (bytes.length / sampleSize).floor();

    for (int i = 0; i < bytes.length - step; i += step) {
      final diff = (bytes[i] - bytes[i + step]).abs();
      if (diff > 30) diffCount++;
    }

    return diffCount / sampleSize;
  }

  bool _isFrameStable(Uint8List currentBytes) {
    if (_lastFrameBytes == null) {
      _lastFrameBytes = currentBytes;
      return false;
    }

    if (currentBytes.length != _lastFrameBytes!.length) {
      _lastFrameBytes = currentBytes;
      return false;
    }

    // Compare bytes to detect motion
    int diff = 0;
    for (int i = 0; i < currentBytes.length && i < _lastFrameBytes!.length; i += 100) {
      diff += (currentBytes[i] - _lastFrameBytes![i]).abs();
    }

    _lastFrameBytes = currentBytes;

    // Consider stable if average difference per sampled byte is less than 3
    final avgDiff = diff / (currentBytes.length / 100);
    return avgDiff < 3;
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
          // Camera preview with image analysis for stability detection
          CameraAwesomeBuilder.custom(
            sensorConfig: SensorConfig.single(
              sensor: Sensor.position(SensorPosition.back),
            ),
            saveConfig: SaveConfig.photo(),
            imageAnalysisConfig: AnalysisConfig(
              androidOptions: const AndroidAnalysisOptions.nv21(width: 100),
              maxFramesPerSecond: 5,
              autoStart: true,
            ),
            onImageForAnalysis: _onAnalysis,
            builder: (cameraState, preview) {
              cameraState.when(
                onPhotoMode: (s) => _photoState = s,
              );
              return const SizedBox.shrink();
            },
          ),

          // Dark overlay with transparent scan area
          _buildScanOverlay(context, frameWidth, frameHeight),

          // Scan frame with animated scan line
          Center(
            child: _ScanFrame(
              width: frameWidth,
              height: frameHeight,
              scanAnimation: _scanLineAnimation,
              pulseAnimation: _pulseAnimation,
              isProcessing: _isProcessing,
              hasObject: _hasObject,
            ),
          ),

          // Processing overlay
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
                        'Đang quét bằng AI...',
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

          // Hint text - placed right below the centered scan frame.
          Positioned(
            top: MediaQuery.of(context).size.height / 2 +
                frameHeight / 2 +
                16,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: _blinkAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _isProcessing ? _blinkAnimation.value : 1.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.45),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.15),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _isProcessing
                                ? Icons.hourglass_empty
                                : _hasObject
                                    ? Icons.check_circle_outline
                                    : Icons.center_focus_weak,
                            color: Colors.white70,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _isProcessing
                                ? 'Đang xử lý ...'
                                : _hasObject
                                    ? 'Vui lòng giữ nguyên trong 1 - 2 giây'
                                    : 'Đưa danh thiếp vào khung để quét',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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

class _ScanFrame extends StatefulWidget {
  const _ScanFrame({
    required this.width,
    required this.height,
    required this.scanAnimation,
    required this.pulseAnimation,
    required this.isProcessing,
    required this.hasObject,
  });

  final double width;
  final double height;
  final Animation<double> scanAnimation;
  final Animation<double> pulseAnimation;
  final bool isProcessing;
  final bool hasObject;

  @override
  State<_ScanFrame> createState() => _ScanFrameState();
}

class _ScanFrameState extends State<_ScanFrame> {
  late bool _hasObject;

  @override
  void initState() {
    super.initState();
    _hasObject = widget.hasObject;
  }

  @override
  void didUpdateWidget(_ScanFrame oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hasObject != oldWidget.hasObject) {
      setState(() => _hasObject = widget.hasObject);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _hasObject ? Colors.green : Colors.white;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          // 4 corners
          Positioned(
            top: 0,
            left: 0,
            child: _CornerWidget(color: color),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: _CornerWidget(color: color, isRight: true),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: _CornerWidget(color: color, isBottom: true),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: _CornerWidget(color: color, isRight: true, isBottom: true),
          ),
          if (!widget.isProcessing)
            AnimatedBuilder(
              animation: widget.scanAnimation,
              builder: (context, child) {
                return Positioned(
                  top: 20 + (widget.height - 40) * widget.scanAnimation.value,
                  left: 20,
                  right: 20,
                  child: _ScanLine(pulseAnimation: widget.pulseAnimation),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _CornerWidget extends StatelessWidget {
  const _CornerWidget({
    required this.color,
    this.isRight = false,
    this.isBottom = false,
  });

  final Color color;
  final bool isRight;
  final bool isBottom;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: CustomPaint(
        painter: _CornerPainter(
          color: color,
          isRight: isRight,
          isBottom: isBottom,
        ),
      ),
    );
  }
}

class _CornerPainter extends CustomPainter {
  _CornerPainter({
    required this.color,
    required this.isRight,
    required this.isBottom,
  });

  final Color color;
  final bool isRight;
  final bool isBottom;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    final radius = 12.0;

    if (!isRight && !isBottom) {
      // top-left
      path.moveTo(0, size.height);
      path.lineTo(0, radius);
      path.quadraticBezierTo(0, 0, radius, 0);
      path.lineTo(size.width, 0);
    } else if (isRight && !isBottom) {
      // top-right
      path.moveTo(0, 0);
      path.lineTo(size.width - radius, 0);
      path.quadraticBezierTo(size.width, 0, size.width, radius);
      path.lineTo(size.width, size.height);
    } else if (!isRight && isBottom) {
      // bottom-left
      path.moveTo(0, 0);
      path.lineTo(0, size.height - radius);
      path.quadraticBezierTo(0, size.height, radius, size.height);
      path.lineTo(size.width, size.height);
    } else {
      // bottom-right
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height - radius);
      path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);
      path.lineTo(0, size.height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CornerPainter oldDelegate) =>
      oldDelegate.color != color;
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
