import 'dart:async';
import 'dart:math' as math;

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../common/app_theme/index.dart';
import '../../../../../common/logger/index.dart';
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
///
/// Flow nhận diện tự động:
/// 1. Mỗi frame phân tích được tính [EdgeDetector] → [EdgeStats] (edge ratio,
///    độ sáng, tương phản, hasCard ở vùng giữa khung).
/// 2. Áp dụng hysteresis 0.30/0.20 + rectangle frame gate (≥2 đường ngang
///    dài + ≥2 đường dọc dài) + centerEdge > 0.05 + debounce 3 frame liên
///    tiếp để chống flickering và tránh false positive với nền gỗ/tường có vân.
/// 3. Khi đã xác nhận "có danh thiếp", đếm thời gian ổn định; nếu 2s liên
///    tục frame không đổi nhiều → tự chụp.
/// 4. Trước khi chụp chạy [ImageQualityGate]: từ chối nếu ảnh quá tối /
///    quá sáng / quá mờ → reset đếm và chờ tiếp.
class AddBusinessCardScreen extends StatefulWidget {
  const AddBusinessCardScreen({super.key});

  @override
  State<AddBusinessCardScreen> createState() => _AddBusinessCardScreenState();
}

class _AddBusinessCardScreenState extends State<AddBusinessCardScreen>
    with TickerProviderStateMixin {
  final OllamaVisionService _ollamaService = OllamaVisionService();
  final LogUtils _log = LogUtils();

  bool _isProcessing = false;
  bool _hasObject = false;
  bool _isStabilizing = false;

  late AnimationController _blinkController; // blink hint text khi xử lý
  late AnimationController _progressController; // countdown ổn định
  late Animation<double> _blinkAnimation;

  PhotoCameraState? _photoState;

  // Pipeline detection.
  final _edgeDetector = EdgeDetector();
  final _qualityGate = ImageQualityGate();
  final _stabilityChecker = FrameStabilityChecker();

  // Hysteresis + debounce cho "hasObject".
  // Threshold dựa trên composite score (0..1) đã ưu tiên longLines (0.50).
  // Rectangle frame gate (≥2 đường ngang + ≥2 đường dọc dài) là filter chính.
  static const _onThreshold = 0.30;
  static const _offThreshold = 0.20;
  static const _debounceFrames = 3;
  int _candidateFrames = 0;
  bool _candidateValue = false;

  // Stability timer (UI countdown).
  Timer? _stabilityTimer;
  bool _captureRequested = false;
  int _framesProcessed = 0;
  static const _stableDuration = Duration(milliseconds: 1500);

  @override
  void initState() {
    super.initState();
    _blinkController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _progressController = AnimationController(
      duration: _stableDuration,
      vsync: this,
    );

    _blinkAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _blinkController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ollamaService.dispose();
    _blinkController.dispose();
    _progressController.dispose();
    _stabilityTimer?.cancel();
    _stabilityTimer = null;
    super.dispose();
  }

  Future<void> _captureAndScan() async {
    if (_isProcessing) return;

    setState(() => _isProcessing = true);
    _stabilityTimer?.cancel();
    _stabilityTimer = null;
    _progressController.stop();
    _progressController.value = 0;

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

      _log.logI('[Scan] captured path=$path, calling Ollama');
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
    await _processFrame(image);
  }

  Future<void> _processFrame(AnalysisImage image) async {
    final stats = _edgeDetector.analyze(image);
    if (stats == null) return;

    _framesProcessed++;

    // Log mỗi frame khi debug — tắt sau khi ổn định.
    _log.logD(
        '[Scan] f#$_framesProcessed '
        'comp=${stats.composite.toStringAsFixed(2)} '
        'cEdge=${stats.centerEdgeRatio.toStringAsFixed(2)} '
        'cBr=${stats.centerBrightness.toStringAsFixed(2)} '
        'hLines=${stats.longHorizontalLines} '
        'vLines=${stats.longVerticalLines} '
        'hasRect=${stats.hasRectangleFrame}',
      );

    // Bước 1: Hysteresis + debounce cho "có vật thể trong khung".
    //
    // 2 gate để chống false positive với nền gỗ/tường:
    // 1. Rectangle signature: có ≥ 2 đường ngang dài + ≥ 2 đường dọc dài
    //    (= chu vi chữ nhật). Vân gỗ có vân ngắn không tạo được.
    // 2. Center edge > 0.05 (có text trong khung) HOẶC tổng longLines ≥ 6.
    final hasRectFrame = stats.hasRectangleFrame;
    final hasContent = stats.centerEdgeRatio > 0.05;
    final passesComposite = _hasObject
        ? stats.composite > _offThreshold
        : stats.composite > _onThreshold;
    final rawCandidate = hasRectFrame && hasContent && passesComposite;

    if (rawCandidate == _candidateValue) {
      _candidateFrames++;
    } else {
      _candidateValue = rawCandidate;
      _candidateFrames = 1;
    }

    if (_candidateFrames >= _debounceFrames && _candidateValue != _hasObject) {
      _log.logI(
        '[Scan] hasObject $_hasObject → $_candidateValue '
        'composite=${stats.composite.toStringAsFixed(2)}',
      );
      setState(() => _hasObject = _candidateValue);
      // Reset candidate counter khi trạng thái đổi để tránh "memory" cũ.
      _candidateFrames = 0;
      _candidateValue = _hasObject;
      if (!_hasObject) {
        // Reset pipeline khi mất object.
        _stabilityTimer?.cancel();
        _stabilityTimer = null;
        _progressController.stop();
        _progressController.value = 0;
        _captureRequested = false;
        _stabilityChecker.reset();
        if (_isStabilizing) {
          setState(() => _isStabilizing = false);
        }
        return;
      }
    }

    if (!_hasObject) return;

    // Bước 2: Kiểm tra chất lượng ảnh (brightness/contrast). Nếu fail → reset.
    final quality = _qualityGate.check(stats);
    if (!quality.ok) {
      _log.logD('[Scan] quality fail: ${quality.reason}');
      _stabilityTimer?.cancel();
      _stabilityTimer = null;
      _progressController.stop();
      _progressController.value = 0;
      if (_isStabilizing) {
        setState(() => _isStabilizing = false);
      }
      return;
    }

    // Bước 3: Frame stability (EMA-based, auto-exposure tolerant).
    final isStable = _stabilityChecker.isStable(stats);
    if (!isStable) {
      _log.logD(
        '[Scan] unstable, br=${stats.brightness.toStringAsFixed(3)} '
        'range=${stats.centerRange.toStringAsFixed(3)}',
      );
      _stabilityTimer?.cancel();
      _stabilityTimer = null;
      _progressController.stop();
      _progressController.value = 0;
      if (_isStabilizing) {
        setState(() => _isStabilizing = false);
      }
      return;
    }

    // Bước 4: Bắt đầu/ tiếp tục đếm.
    if (_stabilityTimer == null && !_captureRequested) {
      _log.logI('[Scan] stable, starting countdown');
      if (!_isStabilizing) {
        setState(() => _isStabilizing = true);
      }
      _captureRequested = true;
      _progressController.forward(from: 0).whenComplete(() {
        // Đánh dấu đã capture xong để tránh Timer fire lần 2.
        _captureRequested = false;
        if (mounted && _isStabilizing) _captureAndScan();
      });
      _stabilityTimer = Timer(_stableDuration, () {
        if (mounted && _isStabilizing) _captureAndScan();
      });
    }
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
          // Camera preview với image analysis cho edge/stability detection.
          CameraAwesomeBuilder.custom(
            sensorConfig: SensorConfig.single(
              sensor: Sensor.position(SensorPosition.back),
            ),
            saveConfig: SaveConfig.photo(),
            imageAnalysisConfig: AnalysisConfig(
              androidOptions: const AndroidAnalysisOptions.nv21(width: 320),
              cupertinoOptions: const CupertinoAnalysisOptions.bgra8888(),
              maxFramesPerSecond: 12,
              autoStart: true,
            ),
            onImageForAnalysis: _onAnalysis,
            builder: (cameraState, preview) {
              cameraState.when(onPhotoMode: (s) => _photoState = s);
              return const SizedBox.shrink();
            },
          ),

          // Dark overlay với scan area trong suốt.
          _buildScanOverlay(context, frameWidth, frameHeight),

          // Scan frame: 4 corners + progress arc tròn 0→100%.
          Center(
            child: _ScanFrame(
              width: frameWidth,
              height: frameHeight,
              isProcessing: _isProcessing,
              hasObject: _hasObject,
              isStabilizing: _isStabilizing,
              progress: _progressController,
            ),
          ),

          // Processing overlay.
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

          // Top bar.
          _buildTopBar(context),

          // Hint text — placed right below the centered scan frame.
          Positioned(
            top: MediaQuery.of(context).size.height / 2 + frameHeight / 2 + 16,
            left: 0,
            right: 0,
            child: Center(child: _buildHint()),
          ),
        ],
      ),
    );
  }

  Widget _buildHint() {
    final String text;
    final IconData icon;
    if (_isProcessing) {
      text = 'Đang xử lý ...';
      icon = Icons.hourglass_empty;
    } else if (_isStabilizing) {
      text = 'Giữ yên — đang chụp...';
      icon = Icons.timelapse;
    } else if (_hasObject) {
      text = 'Phát hiện danh thiếp — giữ yên';
      icon = Icons.check_circle_outline;
    } else {
      text = 'Đưa danh thiếp vào khung để quét';
      icon = Icons.center_focus_weak;
    }

    return AnimatedBuilder(
      animation: _blinkAnimation,
      builder: (context, _) {
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
                Icon(icon, color: Colors.white70, size: 16),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: const TextStyle(
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
            colors: [Colors.black.withValues(alpha: 0.8), Colors.transparent],
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
                child: const Icon(Icons.close, color: Colors.white, size: 22),
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

  Widget _buildScanOverlay(
    BuildContext context,
    double frameWidth,
    double frameHeight,
  ) {
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

/// Tóm tắt kết quả phân tích 1 frame.
class EdgeStats {
  const EdgeStats({
    required this.edgeRatio,
    required this.centerEdgeRatio,
    required this.brightness,
    required this.contrast,
    required this.centerRange,
    required this.centerBrightness,
    required this.longHorizontalLines,
    required this.longVerticalLines,
    required this.lumaHash,
  });

  /// Tỉ lệ pixel "có edge" trong toàn frame.
  final double edgeRatio;

  /// Tỉ lệ pixel "có edge" trong vùng giữa (loại trừ rìa).
  final double centerEdgeRatio;

  /// Mean luminance [0..1].
  final double brightness;

  /// Stddev luminance [0..1] — đo độ tương phản.
  final double contrast;

  /// Dải sáng-tối trong vùng trung tâm [0..1]. Danh thiếp có chữ → cao,
  /// tường phẳng → thấp.
  final double centerRange;

  /// Mean luminance vùng trung tâm [0..1]. Danh thiếp có nền giấy trắng
  /// (0.70-0.85), nền gỗ/tường thường thấp hơn (0.30-0.60).
  final double centerBrightness;

  /// Số đường edge ngang liên tục ≥ minLineLength pixels.
  /// Viền trên/dưới danh thiếp + dòng kẻ text cho đường dài.
  /// Vân gỗ ngắt quãng → không có đường dài.
  final int longHorizontalLines;

  /// Số đường edge dọc liên tục ≥ minLineLength pixels.
  /// Viền trái/phải danh thiếp + cột chữ cho đường dài.
  final int longVerticalLines;

  /// Hash nhỏ (~32 byte) để so sánh frame-to-frame nhanh.
  final List<int> lumaHash;

  /// Số đường thẳng dài tối thiểu để gọi là có "khung chữ nhật".
  /// Viền danh thiếp cho ≥ 2 đường ngang + ≥ 2 đường dọc.
  /// Vân gỗ có vân ngắn, ngẫu nhiên, không tạo "đường kín" như viền.
  bool get hasRectangleFrame =>
      longHorizontalLines >= 2 && longVerticalLines >= 2;

  /// Score tổng hợp — kết hợp nhiều tín hiệu để robust với lighting khác nhau.
  ///
  /// Tín hiệu:
  /// - longLines (0.50): có đường thẳng dài (viền/dòng kẻ) → đặc trưng
  ///   chu vi chữ nhật. Vân gỗ ngắn → fail.
  /// - centerEdge (0.30): edge vùng giữa — text trên thiệp.
  /// - centerBrightness (0.20): vùng giữa sáng — phụ trợ.
  ///
  /// KHÔNG dùng centerRange vì nền gradient cũng có range cao.
  double get composite {
    // Lines score: clamp 0..1 từ tổng (hLine + vLine). ≥ 4 lines → 1.0.
    final linesScore =
        ((longHorizontalLines + longVerticalLines) / 4.0).clamp(0.0, 1.0);
    final centerEdgeScore = ((centerEdgeRatio - 0.05) / 0.40).clamp(0.0, 1.0);
    final brightnessScore = ((centerBrightness - 0.30) / 0.40).clamp(0.0, 1.0);
    return (0.50 * linesScore +
            0.30 * centerEdgeScore +
            0.20 * brightnessScore)
        .clamp(0.0, 1.0);
  }
}

/// Tính edge ratio, brightness, contrast, và luma hash từ 1 analysis image.
///
/// Thuật toán:
/// - Lấy Y plane (NV21) hoặc chuyển BGRA → gray.
/// - Chia ảnh thành lưới N×N ô (mặc định 12×12).
/// - Mỗi ô tính mean luminance + edge ratio (số pixel cặp ngang có |Δ| > threshold).
/// - Tổng hợp: edgeRatio toàn frame, centerEdgeRatio (4 ô trung tâm),
///   brightness = mean, contrast = stddev, lumaHash = 32 byte mean-of-cell.
class EdgeDetector {
  static const _gridSize = 12;
  // Giảm _edgeThreshold 14→9 để bắt được edge yếu (text mờ, font nhỏ trên
  // danh thiếp) thay vì chỉ edge của cảnh có contrast cao.
  static const _edgeThreshold = 9;
  // Đường "dài" tối thiểu = 25% chiều frame tương ứng. Viền danh thiếp thường
  // chiếm ≥ 50% chiều frame; vân gỗ hiếm khi tạo đường dài liên tục.
  static const _minLineRatio = 0.25;

  EdgeStats? analyze(AnalysisImage image) {
    final pixels = _extractLuminance(image);
    if (pixels == null) return null;
    final w = image.width;
    final h = image.height;

    // Compute per-cell means and edge counts.
    final cellW = w ~/ _gridSize;
    final cellH = h ~/ _gridSize;
    if (cellW < 4 || cellH < 4) return null;

    final cellEdge = List<int>.filled(_gridSize * _gridSize, 0);
    final cellTotal = List<int>.filled(_gridSize * _gridSize, 0);
    final cellSum = List<int>.filled(_gridSize * _gridSize, 0);
    final cellMin = List<int>.filled(_gridSize * _gridSize, 255);
    final cellMax = List<int>.filled(_gridSize * _gridSize, 0);

    // Edge map: 1 byte/pixel = 1 nếu là edge pixel (dùng để đếm đường dài).
    // Với frame 640×480 ~300KB, OK trong RAM nhưng sẽ giải phóng sau khi analyze.
    final edgeMap = Uint8List(w * h);

    for (int cy = 0; cy < _gridSize; cy++) {
      for (int cx = 0; cx < _gridSize; cx++) {
        final x0 = cx * cellW;
        final y0 = cy * cellH;
        final idx = cy * _gridSize + cx;
        int edges = 0;
        int total = 0;
        int sum = 0;
        int minVal = 255;
        int maxVal = 0;

        for (int y = y0; y < y0 + cellH - 1; y++) {
          final rowBase = y * w;
          final rowBaseNext = (y + 1) * w;
          for (int x = x0; x < x0 + cellW - 1; x++) {
            final cur = pixels[rowBase + x];
            final right = pixels[rowBase + x + 1];
            final down = pixels[rowBaseNext + x];
            final dH = (cur - right).abs();
            final dV = (cur - down).abs();
            if (dH > _edgeThreshold || dV > _edgeThreshold) {
              edges++;
              edgeMap[rowBase + x] = 1;
            }
            total++;
            sum += cur;
            if (cur < minVal) minVal = cur;
            if (cur > maxVal) maxVal = cur;
          }
          // Cộng pixel cuối cột vào sum/min/max để mean chính xác hơn.
          final last = pixels[rowBase + x0 + cellW - 1];
          sum += last;
          if (last < minVal) minVal = last;
          if (last > maxVal) maxVal = last;
          total++;
        }

        cellEdge[idx] = edges;
        cellTotal[idx] = total;
        cellSum[idx] = sum;
        cellMin[idx] = minVal;
        cellMax[idx] = maxVal;
      }
    }

    int totalEdges = 0;
    int totalTotal = 0;
    int totalSum = 0;
    int totalSumSq = 0;
    for (int i = 0; i < cellEdge.length; i++) {
      totalEdges += cellEdge[i];
      totalTotal += cellTotal[i];
      // mean cell = sum / total; đóng góp vào tổng = mean * pixels_per_cell.
      final mean = cellTotal[i] == 0 ? 0.0 : cellSum[i] / cellTotal[i];
      totalSum += cellSum[i];
      totalSumSq += (mean * mean * cellTotal[i]).round();
    }

    final edgeRatio = totalTotal == 0 ? 0.0 : totalEdges / totalTotal;
    final brightness = totalTotal == 0 ? 0.0 : totalSum / totalTotal / 255.0;
    final meanBrightness = brightness * 255.0;
    final variance = totalTotal == 0
        ? 0.0
        : (totalSumSq / totalTotal - meanBrightness * meanBrightness).clamp(
            0.0,
            double.infinity,
          );
    final contrast = (variance <= 0 ? 0.0 : math.sqrt(variance)) / 255.0;

    // Center edge: 4 ô trung tâm (ô (5,5), (5,6), (6,5), (6,6)).
    final centerIndices = <int>[
      (_gridSize ~/ 2 - 1) * _gridSize + (_gridSize ~/ 2 - 1),
      (_gridSize ~/ 2 - 1) * _gridSize + (_gridSize ~/ 2),
      (_gridSize ~/ 2) * _gridSize + (_gridSize ~/ 2 - 1),
      (_gridSize ~/ 2) * _gridSize + (_gridSize ~/ 2),
    ];
    int centerEdges = 0;
    int centerTotal = 0;
    int centerMin = 255;
    int centerMax = 0;
    int centerSum = 0;
    for (final i in centerIndices) {
      centerEdges += cellEdge[i];
      centerTotal += cellTotal[i];
      centerSum += cellSum[i];
      if (cellMin[i] < centerMin) centerMin = cellMin[i];
      if (cellMax[i] > centerMax) centerMax = cellMax[i];
    }
    final centerEdgeRatio = centerTotal == 0 ? 0.0 : centerEdges / centerTotal;
    final centerRange = centerMax > centerMin
        ? (centerMax - centerMin) / 255.0
        : 0.0;
    final centerBrightness =
        centerTotal == 0 ? 0.0 : centerSum / centerTotal / 255.0;

    // Rectangle detection: đếm "đường thẳng dài" trong edge map.
    //
    // Vân gỗ → các vân ngắn, ngắt quãng, không tạo đường liên tục dài.
    // Viền danh thiếp → 4 đường dài (2 ngang + 2 dọc) kéo dài ≥ 25% frame.
    //
    // Thuật toán: với mỗi hàng, đếm đoạn edge liên tục dài ≥ minLineLen;
    // nếu ≥ K pixel trong đoạn đó là edge → tính là 1 đường ngang.
    // Tương tự cho mỗi cột → đường dọc.
    final minHorizLen = (w * _minLineRatio).round();
    final minVertLen = (h * _minLineRatio).round();
    final longH = _countLongHorizontalLines(edgeMap, w, h, minHorizLen);
    final longV = _countLongVerticalLines(edgeMap, w, h, minVertLen);

    // Luma hash: 32 byte = lấy mean của 32 vùng 8×8 đều trên frame.
    final hash = _computeLumaHash(pixels, w, h);

    return EdgeStats(
      edgeRatio: edgeRatio,
      centerEdgeRatio: centerEdgeRatio,
      brightness: brightness,
      contrast: contrast,
      centerRange: centerRange,
      centerBrightness: centerBrightness,
      longHorizontalLines: longH,
      longVerticalLines: longV,
      lumaHash: hash,
    );
  }

  /// Đếm số hàng có "đường edge ngang" thực sự dài ≥ minLen pixels.
  ///
  /// "Đường" = đoạn pixel liên tục có edge, cho phép tối đa maxGap pixel
  /// không-edge giữa đoạn. Nếu gặp gap dài hơn → kết thúc đoạn, đếm nếu đủ dài.
  ///
  /// Tránh đếm nhầm: mỗi hàng CHỈ tính tối đa 1 đường (break sau khi count++).
  /// "Đường" phải có mật độ edge ≥ minDensity trong cửa sổ [start..end].
  int _countLongHorizontalLines(
      Uint8List edgeMap, int w, int h, int minLen) {
    int count = 0;
    const minDensity = 0.55;
    const maxGap = 6; // cho phép gap tối đa 6 pixel giữa đoạn
    for (int y = 0; y < h; y++) {
      final rowBase = y * w;
      int runStart = -1; // vị trí bắt đầu đoạn hiện tại
      int runEdge = 0; // số edge pixel trong đoạn hiện tại
      int gap = 0;
      for (int x = 0; x < w; x++) {
        final isEdge = edgeMap[rowBase + x] == 1;
        if (isEdge) {
          if (runStart < 0) runStart = x;
          runEdge++;
          gap = 0;
        } else {
          gap++;
          if (runStart >= 0 && gap > maxGap) {
            // Kết thúc đoạn tại x - gap.
            final runLen = (x - gap) - runStart + 1;
            if (runLen >= minLen &&
                runEdge >= (runLen * minDensity).round()) {
              count++;
              break; // 1 đường/hàng là đủ
            }
            runStart = -1;
            runEdge = 0;
          }
        }
      }
      // Check cuối hàng.
      if (runStart >= 0) {
        final runLen = w - runStart;
        if (runLen >= minLen &&
            runEdge >= (runLen * minDensity).round()) {
          count++;
        }
      }
    }
    return count;
  }

  /// Đếm số cột có "đường edge dọc" thực sự dài ≥ minLen pixels.
  int _countLongVerticalLines(
      Uint8List edgeMap, int w, int h, int minLen) {
    int count = 0;
    const minDensity = 0.55;
    const maxGap = 6;
    for (int x = 0; x < w; x++) {
      int runStart = -1;
      int runEdge = 0;
      int gap = 0;
      for (int y = 0; y < h; y++) {
        final isEdge = edgeMap[y * w + x] == 1;
        if (isEdge) {
          if (runStart < 0) runStart = y;
          runEdge++;
          gap = 0;
        } else {
          gap++;
          if (runStart >= 0 && gap > maxGap) {
            final runLen = (y - gap) - runStart + 1;
            if (runLen >= minLen &&
                runEdge >= (runLen * minDensity).round()) {
              count++;
              break;
            }
            runStart = -1;
            runEdge = 0;
          }
        }
      }
      if (runStart >= 0) {
        final runLen = h - runStart;
        if (runLen >= minLen &&
            runEdge >= (runLen * minDensity).round()) {
          count++;
        }
      }
    }
    return count;
  }

  /// Trả về luminance plane (1 byte / pixel), hoặc null nếu không đọc được.
  Uint8List? _extractLuminance(AnalysisImage image) {
    if (image is Nv21Image) {
      // NV21: Y plane = w*h byte đầu, sau đó là V/U interleaved.
      final ySize = image.width * image.height;
      if (image.bytes.length < ySize) return null;
      return Uint8List.fromList(image.bytes.sublist(0, ySize));
    }
    if (image is Bgra8888Image) {
      // BGRA: 4 byte / pixel, lấy channel BGR->gray: 0.299*R + 0.587*G + 0.114*B.
      final pixels = image.bytes;
      final n = image.width * image.height;
      if (pixels.length < n * 4) return null;
      final out = Uint8List(n);
      for (int i = 0, j = 0; i < n; i++, j += 4) {
        final b = pixels[j];
        final g = pixels[j + 1];
        final r = pixels[j + 2];
        // Approximation nhanh: 0.299*r + 0.587*g + 0.114*b.
        out[i] = ((r * 77 + g * 150 + b * 29) >> 8).clamp(0, 255);
      }
      return out;
    }
    if (image is Yuv420Image) {
      // Y plane là planes[0].bytes.
      if (image.planes.isEmpty) return null;
      final y = image.planes.first.bytes;
      if (y.length < image.width * image.height) return null;
      return Uint8List.fromList(y);
    }
    if (image is JpegImage) {
      // Decode JPEG không nhanh hơn decode Y, fallback: dùng ImageDecoder.
      try {
        return _decodeJpegLuminance(image.bytes, image.width, image.height);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  Uint8List? _decodeJpegLuminance(Uint8List bytes, int width, int hint) {
    // Tránh import thêm image package — fallback về null, caller sẽ bỏ qua frame.
    return null;
  }

  Uint8List _computeLumaHash(Uint8List pixels, int w, int h) {
    const n = 32;
    final out = Uint8List(n);
    final cellW = w ~/ 8;
    final cellH = h ~/ 4;
    if (cellW < 1 || cellH < 1) return out;
    // Chia thành 8 cột × 4 hàng = 32 ô.
    for (int row = 0; row < 4; row++) {
      for (int col = 0; col < 8; col++) {
        int sum = 0;
        int count = 0;
        final y0 = row * cellH;
        final y1 = y0 + cellH;
        final x0 = col * cellW;
        final x1 = x0 + cellW;
        for (int y = y0; y < y1; y += 2) {
          final base = y * w;
          for (int x = x0; x < x1; x += 2) {
            sum += pixels[base + x];
            count++;
          }
        }
        out[row * 8 + col] = count == 0 ? 0 : (sum ~/ count);
      }
    }
    return out;
  }
}

/// Đánh giá chất lượng ảnh (brightness, contrast). Ảnh quá tối / quá sáng /
/// quá mờ → fail.
class ImageQualityGate {
  static const _minBrightness = 0.20;
  static const _maxBrightness = 0.92;
  static const _minContrast = 0.06;

  ImageQualityResult check(EdgeStats stats) {
    if (stats.brightness < _minBrightness) {
      return ImageQualityResult(false, 'ảnh quá tối');
    }
    if (stats.brightness > _maxBrightness) {
      return ImageQualityResult(false, 'ảnh quá sáng');
    }
    if (stats.contrast < _minContrast) {
      return ImageQualityResult(false, 'ảnh thiếu tương phản');
    }
    return const ImageQualityResult(true, null);
  }
}

class ImageQualityResult {
  const ImageQualityResult(this.ok, this.reason);
  final bool ok;
  final String? reason;
}

/// Kiểm tra camera có đang rung không, dựa trên EMA của brightness & center range.
///
/// Lý do dùng EMA thay vì hash tuyệt đối: camera auto-exposure sẽ từ từ thay
/// đổi brightness theo thời gian; hash tuyệt đối sẽ liên tục bị coi là "rung"
/// dù user giữ yên. EMA với alpha cao (0.4) bám sát thay đổi exposure →
/// chỉ coi là rung khi Δ lớn đột ngột.
class FrameStabilityChecker {
  static const _alpha = 0.4; // EMA weight cho frame mới.
  static const _brightnessTolerance =
      0.04; // Δ brightness tối đa để coi là yên.
  static const _centerRangeTolerance = 0.04;
  static const _requiredStableFrames = 4; // Số frame liên tiếp stable.

  double? _emaBrightness;
  double? _emaCenterRange;
  int _stableCount = 0;

  bool isStable(EdgeStats stats) {
    final b = stats.brightness;
    final r = stats.centerRange;

    if (_emaBrightness == null || _emaCenterRange == null) {
      _emaBrightness = b;
      _emaCenterRange = r;
      _stableCount = 0;
      return false;
    }

    _emaBrightness = _alpha * b + (1 - _alpha) * _emaBrightness!;
    _emaCenterRange = _alpha * r + (1 - _alpha) * _emaCenterRange!;

    final dB = (b - _emaBrightness!).abs();
    final dR = (r - _emaCenterRange!).abs();

    if (dB < _brightnessTolerance && dR < _centerRangeTolerance) {
      _stableCount++;
      return _stableCount >= _requiredStableFrames;
    }
    _stableCount = 0;
    return false;
  }

  void reset() {
    _emaBrightness = null;
    _emaCenterRange = null;
    _stableCount = 0;
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

class _ScanFrame extends StatelessWidget {
  const _ScanFrame({
    required this.width,
    required this.height,
    required this.isProcessing,
    required this.hasObject,
    required this.isStabilizing,
    required this.progress,
  });

  final double width;
  final double height;
  final bool isProcessing;
  final bool hasObject;
  final bool isStabilizing;
  final AnimationController progress;

  @override
  Widget build(BuildContext context) {
    final color = hasObject ? Colors.green : Colors.white;
    // Vòng tròn nằm gọn trong khung chữ nhật, padding ~16px.
    final side = math.min(width, height) - 32;
    final ringSize = side.clamp(80.0, double.infinity);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // 4 corners.
          Positioned(top: 0, left: 0, child: _CornerWidget(color: color)),
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

          // Progress arc tròn ở giữa: chỉ chạy khi ổn định, ngược lại hiện
          // track mờ tĩnh.
          if (!isProcessing)
            Center(
              child: SizedBox(
                width: ringSize,
                height: ringSize,
                child: AnimatedBuilder(
                  animation: progress,
                  builder: (context, _) {
                    return CustomPaint(
                      painter: _ScanRingPainter(
                        color: hasObject ? Colors.green : AppColors.primaryERP,
                        progress: isStabilizing ? progress.value : 0.0,
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
    const radius = 12.0;

    if (!isRight && !isBottom) {
      path.moveTo(0, size.height);
      path.lineTo(0, radius);
      path.quadraticBezierTo(0, 0, radius, 0);
      path.lineTo(size.width, 0);
    } else if (isRight && !isBottom) {
      path.moveTo(0, 0);
      path.lineTo(size.width - radius, 0);
      path.quadraticBezierTo(size.width, 0, size.width, radius);
      path.lineTo(size.width, size.height);
    } else if (!isRight && isBottom) {
      path.moveTo(0, 0);
      path.lineTo(0, size.height - radius);
      path.quadraticBezierTo(0, size.height, radius, size.height);
      path.lineTo(size.width, size.height);
    } else {
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height - radius);
      path.quadraticBezierTo(
        size.width,
        size.height,
        size.width - radius,
        size.height,
      );
      path.lineTo(0, size.height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CornerPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// Vẽ vòng tròn progress 0→100% đơn giản.
///
/// - Track nền (luôn hiển thị): vòng tròn mờ làm nền.
/// - Foreground (chỉ khi isStabilizing): progress arc quét từ 12 giờ thuận
///   chiều, độ dài tỉ lệ progress [0..1]. Khi progress = 0 → chỉ thấy track.
class _ScanRingPainter extends CustomPainter {
  _ScanRingPainter({required this.color, required this.progress});

  final Color color;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - 4; // chừa viền ngoài.
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Track nền — luôn hiển thị.
    final trackPaint = Paint()
      ..color = color.withValues(alpha: 0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, trackPaint);

    if (progress <= 0) return;

    // Foreground progress arc.
    final fgPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final sweep = progress.clamp(0.0, 1.0) * 2 * math.pi;
    canvas.drawArc(rect, -math.pi / 2, sweep, false, fgPaint);
  }

  @override
  bool shouldRepaint(covariant _ScanRingPainter old) =>
      old.color != color || old.progress != progress;
}
