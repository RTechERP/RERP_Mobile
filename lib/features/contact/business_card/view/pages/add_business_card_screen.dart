import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../../../../base/bloc/index.dart';
import '../../../../../common/app_theme/index.dart';
import '../../../../../common/config/permission_helper.dart';
import '../../../../../common/utils/snack_bar_helper.dart';
import '../bloc/business_card_bloc.dart';

/// Màn hình quét danh thiếp tự động.
///
/// Flow:
/// 1. Mở camera bằng `camerawesome`.
/// 2. Vẽ khung 4 góc cố định ở giữa preview → vùng mục tiêu cho danh thiếp.
/// 3. Mỗi frame: chạy ML Kit Object Detection lấy bbox vật thể lớn nhất.
/// 4. Lọc bbox theo:
///    - Diện tích tối thiểu (5% ảnh).
///    - Aspect ratio giống danh thiếp (1.4–1.9, CR80 85.6×54mm).
///    - Tâm bbox nằm trong khung 4 góc.
/// 5. Khi bbox đạt cả 3 tiêu chí → chạy ML Kit Text Recognition trong bbox.
///    Có >= 1 dòng text → coi như danh thiếp, bắt đầu đếm 2s, tự chụp và
///    gọi API.
/// 6. Text recognition chỉ chạy khi bbox trong khung, debounce 600ms để tránh
///    xử lý nặng mỗi frame. Sau khi verify pass, _isCardVerified = true và
///    giữ cho cả session (reset khi vật vắng mặt > 1.5s).
/// 7. Rút card ra khỏi khung giữa countdown → hủy countdown, reset timer.
///    Đặt card vào lại → đếm lại 2s từ đầu (không cần verify lại).
///
/// Lý do dùng camerawesome + ML Kit thay cho `cunning_document_scanner`:
/// - Tự kiểm soát UX (khung 4 góc, glow theo trạng thái, countdown 2s).
/// - Tránh native scanner mặc định đôi lúc không tìm thấy cạnh danh thiếp.
class AddBusinessCardScreen extends StatefulWidget {
  const AddBusinessCardScreen({super.key});

  @override
  State<AddBusinessCardScreen> createState() => _AddBusinessCardScreenState();
}

class _AddBusinessCardScreenState extends State<AddBusinessCardScreen>
    with SingleTickerProviderStateMixin {
  /// Thời gian cần giữ yên trong khung trước khi tự chụp.
  static const Duration _stableDuration = Duration(seconds: 2);

  /// Tỉ lệ diện tích bbox / ảnh tối thiểu.
  static const double _minObjectAreaRatio = 0.05;

  /// Aspect ratio (w/h) của danh thiếp CR80: 85.6×54mm → ~1.586.
  /// Cho phép dải rộng 1.4–1.9 để chấp nhận danh thiếp hơi xéo, bị crop nhẹ.
  static const double _minCardAspect = 1.4;
  static const double _maxCardAspect = 1.9;

  /// Debounce giữa 2 lần chạy text recogn — tránh chạy mỗi frame.
  /// Debounce text recogn — 300ms để phản hồi nhanh hơn khi detector miss.
  static const Duration _textRecognDebounce = Duration(milliseconds: 300);

  /// Detector ML Kit — chạy stream, cho phép nhiều đối tượng.
  /// Dùng nullable + mutable để có thể recreate khi tracking bị stuck
  /// (vật rời khung rồi vào lại nhưng detector không trả về bbox mới).
  ObjectDetector? _objectDetector = _createDetector();

  static ObjectDetector _createDetector() {
    return ObjectDetector(
      options: ObjectDetectorOptions(
        mode: DetectionMode.stream,
        classifyObjects: false,
        multipleObjects: true,
      ),
    );
  }

  /// Số frame liên tiếp không có vật hợp lệ trong khung.
  /// Khi đạt ngưỡng → recreate detector để clear tracking state.
  int _consecutiveMisses = 0;

  /// Số frame tối đa cho phép miss trước khi reset detector.
  /// Cao để tránh recreate giữa lúc detect bị latency thoáng qua.
  static const int _maxConsecutiveMisses = 15;

  /// Text recognizer — dùng model on-device Latin.
  late final TextRecognizer _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  /// Thời điểm cuối cùng chạy text recogn.
  DateTime? _lastTextRecognAt;

  /// Bbox hiện tại ở tọa độ ảnh.
  Rect? _boxInImage;
  AnalysisImage? _lastImage;

  /// Thời điểm bắt đầu bbox nằm ổn định trong khung.
  DateTime? _stableSince;

  /// Đã verify vật này là danh thiếp (qua text recogn) trong session này.
  /// Sau khi verify pass, không cần chạy text recogn lại cho đến khi user
  /// rời khung đủ lâu.
  bool _isCardVerified = false;

  /// Thời điểm vật rời khung lần cuối — để reset verify sau khoảng trống.
  DateTime? _leftFrameAt;

  /// Đã gửi yêu cầu chụp → chặn các frame tiếp theo.
  bool _captureRequested = false;

  /// Đang trong tiến trình chụp → tránh gọi `takePhoto()` nhiều lần.
  bool _captureInProgress = false;

  /// Animation pulse cho 4 góc khi bbox trong khung.
  late final AnimationController _pulseController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );

  @override
  void initState() {
    super.initState();
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _objectDetector?.close();
    _textRecognizer.close();
    _pulseController.dispose();
    super.dispose();
  }

  /// Đóng detector cũ (nếu có) và tạo mới — clear tracking state bị stuck.
  /// Chỉ hủy timer countdown hiện tại, KHÔNG xóa `_isCardVerified` vì
  /// verify vẫn còn hiệu lực trong session (vật chỉ tạm thời bị miss).
  /// Lần detect tiếp theo sẽ dùng lại verify ngay.
  void _recreateDetector() {
    _objectDetector?.close();
    _objectDetector = _createDetector();
    _consecutiveMisses = 0;
    _stableSince = null;
    _lastTextRecognAt = null;
  }

  /// Xử lý mỗi frame từ camera: chạy object detector, fallback sang text recogn.
  ///
  /// Ưu tiên:
  /// 1. Object detector trả bbox hợp lệ (area + aspect ratio) → dùng luôn.
  /// 2. Object detector miss → thử text recogn lấy union bbox các text blocks
  ///    (đặc trưng danh thiếp: nhiều dòng text name/email/phone).
  /// 3. Cả 2 fail → vật không hợp lệ.
  ///
  /// Verify pass = text recogn thấy >= 1 block có text. Set 1 lần trong session.
  Future<void> _onImageForAnalysis(AnalysisImage image) async {
    if (_captureRequested) return;

    final inputImage = _buildInputImage(image);
    if (inputImage == null) return;

    final detector = _objectDetector;
    if (detector == null) return;
    final objects = await detector.processImage(inputImage);

    // Lấy bbox có diện tích lớn nhất.
    Rect? bestBox;
    var bestArea = 0.0;
    for (final o in objects) {
      final area = o.boundingBox.width * o.boundingBox.height;
      if (area > bestArea) {
        bestArea = area;
        bestBox = o.boundingBox;
      }
    }

    // Lọc theo diện tích tối thiểu (tránh bắt vật rất nhỏ).
    final imageArea = image.size.width * image.size.height;
    if (bestBox == null || bestArea / imageArea < _minObjectAreaRatio) {
      // Fallback: thử text recogn nếu chưa verify hoặc cần re-detect.
      await _tryTextBasedDetection(inputImage, image);
      return;
    }

    // Lọc theo aspect ratio: bắt buộc gần tỉ lệ danh thiếp CR80.
    // Tránh bắt nhầm bàn tay, màn hình điện thoại, ly nước,...
    final aspect = bestBox.width / bestBox.height;
    if (aspect < _minCardAspect || aspect > _maxCardAspect) {
      await _tryTextBasedDetection(inputImage, image);
      return;
    }

    // Có bbox hợp lệ → _updateDetection sẽ tự reset miss counter.
    _updateDetection(boxInImage: bestBox, image: image);

    // Nếu đã verify text (pass), không chạy lại text recogn.
    if (_isCardVerified) return;

    // Verify nhanh: chạy text recogn 1 lần khi có bbox hợp lệ.
    final now = DateTime.now();
    if (_lastTextRecognAt != null &&
        now.difference(_lastTextRecognAt!) < _textRecognDebounce) {
      return;
    }
    _lastTextRecognAt = now;
    final recognized = await _textRecognizer.processImage(inputImage);
    final hasText = recognized.blocks.any((b) => b.text.trim().isNotEmpty);
    if (hasText) {
      _isCardVerified = true;
      _scheduleRebuild();
    }
  }

  /// Fallback khi object detector miss: dùng text recogn lấy union bbox.
  /// Yêu cầu >= 2 text blocks có text để coi là danh thiếp (tránh bắt
  /// mỗi dòng chữ trên bao bì, sách, màn hình).
  Future<void> _tryTextBasedDetection(
    InputImage inputImage,
    AnalysisImage image,
  ) async {
    final now = DateTime.now();
    if (_lastTextRecognAt != null &&
        now.difference(_lastTextRecognAt!) < _textRecognDebounce) {
      // Trong khoảng debounce mà detector vẫn miss → không có vật, reset UI.
      _updateDetection(boxInImage: null, image: image);
      return;
    }
    _lastTextRecognAt = now;

    final recognized = await _textRecognizer.processImage(inputImage);
    final blocks =
        recognized.blocks.where((b) => b.text.trim().isNotEmpty).toList();
    if (blocks.length < 2) {
      _updateDetection(boxInImage: null, image: image);
      return;
    }

    // Union bbox của tất cả text blocks — đại diện cho vùng danh thiếp.
    Rect union = blocks.first.boundingBox;
    for (final b in blocks.skip(1)) {
      final r = b.boundingBox;
      union = Rect.fromLTRB(
        union.left < r.left ? union.left : r.left,
        union.top < r.top ? union.top : r.top,
        union.right > r.right ? union.right : r.right,
        union.bottom > r.bottom ? union.bottom : r.bottom,
      );
    }

    // Lọc theo aspect ratio (union bbox có thể là cả 1 trang sách).
    final aspect = union.width / union.height;
    if (aspect < _minCardAspect || aspect > _maxCardAspect) {
      _updateDetection(boxInImage: null, image: image);
      return;
    }

    _isCardVerified = true;
    _updateDetection(boxInImage: union, image: image);
  }

  /// Tạo `InputImage` từ `AnalysisImage` — tương thích Android (NV21) và iOS (BGRA8888).
  InputImage? _buildInputImage(AnalysisImage image) {
    return image.when<InputImage?>(
      nv21: (img) => InputImage.fromBytes(
        bytes: img.bytes,
        metadata: InputImageMetadata(
          size: img.size,
          rotation: _toInputRotation(img.rotation),
          format: InputImageFormat.nv21,
          bytesPerRow: img.planes.first.bytesPerRow,
        ),
      ),
      bgra8888: (img) => InputImage.fromBytes(
        bytes: img.bytes,
        metadata: InputImageMetadata(
          size: img.size,
          rotation: _toInputRotation(img.rotation),
          format: InputImageFormat.bgra8888,
          bytesPerRow: img.planes.first.bytesPerRow,
        ),
      ),
      jpeg: (_) => null,
      yuv420: (_) => null,
    );
  }

  InputImageRotation _toInputRotation(InputAnalysisImageRotation r) {
    switch (r) {
      case InputAnalysisImageRotation.rotation0deg:
        return InputImageRotation.rotation0deg;
      case InputAnalysisImageRotation.rotation90deg:
        return InputImageRotation.rotation90deg;
      case InputAnalysisImageRotation.rotation180deg:
        return InputImageRotation.rotation180deg;
      case InputAnalysisImageRotation.rotation270deg:
        return InputImageRotation.rotation270deg;
    }
  }

  /// Cập nhật bbox. Cập nhật `setState` an toàn (post-frame).
  void _updateDetection({
    required Rect? boxInImage,
    required AnalysisImage image,
  }) {
    // Đếm miss liên tiếp để reset detector khi bị stuck.
    if (boxInImage == null) {
      _consecutiveMisses++;
      if (_consecutiveMisses >= _maxConsecutiveMisses) {
        _recreateDetector();
      }
    } else {
      _consecutiveMisses = 0;
    }
    _boxInImage = boxInImage;
    _lastImage = image;
    _scheduleRebuild();
  }

  /// Đánh dấu cần build lại UI. An toàn khi gọi từ bất kỳ frame nào.
  void _scheduleRebuild() {
    if (!mounted) return;
    final phase = SchedulerBinding.instance.schedulerPhase;
    if (phase == SchedulerPhase.idle) {
      setState(() {});
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() {});
      });
    }
  }

  /// Cập nhật stability timer dựa trên bbox hiện tại so với khung.
  ///
  /// Để bắt đầu đếm phải thỏa:
  /// - Vật nằm trong khung 4 góc (tâm).
  /// - Đã verify là danh thiếp qua text recogn (`_isCardVerified`).
  ///
  /// Vật rời khung (bất kể lúc nào) → reset timer về 0, lần vào sau đếm lại
  /// từ đầu. Không có "commit" — countdown luôn gắn với vật đang trong khung.
  void _updateStability(bool isInFrame) {
    if (!isInFrame) {
      // Vật rời khung → hủy countdown, reset về verifying.
      // Lần vào khung sau sẽ đếm lại từ đầu (vì verify đã pass từ trước).
      final wasInFrame = _stableSince != null;
      _stableSince = null;
      if (wasInFrame) _scheduleRebuild();
      _leftFrameAt = DateTime.now();
      _maybeResetVerification();
      return;
    }
    // Vật trong khung nhưng chưa verify → không đếm.
    if (!_isCardVerified) {
      if (_stableSince != null) {
        _stableSince = null;
        _scheduleRebuild();
      }
      return;
    }
    _stableSince ??= DateTime.now();
    final heldFor = DateTime.now().difference(_stableSince!);
    if (heldFor >= _stableDuration && !_captureRequested) {
      _captureRequested = true;
      _scheduleRebuild();
    }
  }

  /// Nếu vật vắng mặt quá 1.5s → reset verify để lần vào khung sau verify lại.
  void _maybeResetVerification() {
    if (!_isCardVerified || _leftFrameAt == null) return;
    if (DateTime.now().difference(_leftFrameAt!) <
        const Duration(milliseconds: 1500)) {
      return;
    }
    _isCardVerified = false;
    _lastTextRecognAt = null;
  }

  /// Gọi chụp ảnh thật từ camera. Được schedule trong builder khi
  /// `_captureRequested == true` và state đang ở `PhotoCameraState`.
  Future<void> _takePhoto(PhotoCameraState state) async {
    if (!_captureRequested || _captureInProgress) return;
    _captureInProgress = true;
    try {
      await state.takePhoto();
    } catch (_) {
      // Cho phép thử lại nếu capture lỗi.
      _captureRequested = false;
      _scheduleRebuild();
    } finally {
      _captureInProgress = false;
    }
  }

  void _onMediaCapture(MediaCapture capture) {
    if (capture.status != MediaCaptureStatus.success) return;
    if (!capture.isPicture) return;
    capture.captureRequest.when(
      single: (single) {
        final path = single.file?.path ?? '';
        if (path.isEmpty || !mounted) return;
        context.read<BusinessCardBloc>().add(BusinessCardEvent.scanCard(path));
      },
      multiple: (multiple) {
        for (final f in multiple.fileBySensor.values) {
          final path = f?.path ?? '';
          if (path.isNotEmpty && mounted) {
            context
                .read<BusinessCardBloc>()
                .add(BusinessCardEvent.scanCard(path));
            return;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<BusinessCardBloc, BusinessCardState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status == BaseStateStatus.success &&
              state.scannedData.isNotEmpty) {
            Navigator.pop(context, state.scannedData);
          } else if (state.status == BaseStateStatus.failed) {
            SnackBarHelper().showError(
              context,
              state.message ?? 'Lỗi khi quét danh thiếp',
            );
            Navigator.pop(context);
          }
        },
        child: FutureBuilder<bool>(
          future: _ensureCameraPermission(),
          builder: (context, snap) {
            if (!snap.hasData) {
              return const _LoadingView(
                message: 'Đang chuẩn bị camera...',
                description: 'Vui lòng chờ trong giây lát',
              );
            }
            if (snap.data == false) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) Navigator.pop(context);
              });
              return const _LoadingView(
                message: 'Cần quyền truy cập camera',
                description: 'Vui lòng cấp quyền trong cài đặt để tiếp tục',
              );
            }
            return _buildCamera();
          },
        ),
      ),
    );
  }

  Future<bool> _ensureCameraPermission() async {
    return PermissionHelper.requestCameraPermission(
      context,
      canOpenAppSetting: false,
      showToastWarning: false,
    );
  }

  Widget _buildCamera() {
    return CameraAwesomeBuilder.custom(
      saveConfig: SaveConfig.photo(),
      sensorConfig: SensorConfig.single(
        sensor: Sensor.position(SensorPosition.back),
        flashMode: FlashMode.auto,
        aspectRatio: CameraAspectRatios.ratio_4_3,
      ),
      imageAnalysisConfig: AnalysisConfig(
        androidOptions: const AndroidAnalysisOptions.nv21(width: 320),
        cupertinoOptions: const CupertinoAnalysisOptions.bgra8888(),
        maxFramesPerSecond: 10,
      ),
      onImageForAnalysis: _onImageForAnalysis,
      onMediaCaptureEvent: _onMediaCapture,
      builder: (cameraState, preview) {
        return cameraState.when(
          onPreparingCamera: (_) => const _LoadingView(
            message: 'Đang mở máy quét...',
            description: 'Vui lòng chờ trong giây lát',
          ),
          onPhotoMode: (state) {
            if (_captureRequested) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) _takePhoto(state);
              });
            }
            return LayoutBuilder(
              builder: (context, constraints) {
                final size = constraints.biggest;
                final frameRect = _frameRectFor(size);

                // Tính bbox mapped sang preview + check "trong khung" theo
                // coverage (chứ không phải IoU — IoU nhạy với bbox lệch tâm).
                // Chỉ quan tâm vật thể có tâm nằm trong khung 4 góc.
                // Vật ngoài khung → bỏ qua, không glow, không đếm.
                final mapped = _mapBboxToPreview(preview);
                final inFrame = mapped != null && _centerInFrame(mapped, frameRect);

                _updateStability(inFrame);

                final phase = _resolvePhase(inFrame: inFrame);
                final showCountdown = inFrame &&
                    _isCardVerified &&
                    _stableSince != null &&
                    !_captureRequested;

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Lớp đen mờ phủ ngoài khung 4 góc (khoét lỗ trong suốt).
                    Positioned.fromRect(
                      rect: Rect.fromLTWH(0, 0, size.width, size.height),
                      child: IgnorePointer(
                        child: CustomPaint(
                          painter: _DimMaskPainter(frameRect: frameRect),
                          child: const SizedBox.expand(),
                        ),
                      ),
                    ),
                    // Khung 4 góc cố định — glow + pulse khi "looks like card".
                    Positioned.fromRect(
                      rect: frameRect,
                      child: AnimatedBuilder(
                        animation: _pulseController,
                        builder: (context, _) => _CornerFrame(
                          color: phase.cornerColor,
                          glow: phase.cornerGlow,
                          pulse: phase == _Phase.looksLikeCard
                              ? _pulseController.value
                              : 0,
                        ),
                      ),
                    ),
                    // Countdown overlay khi đang ổn định.
                    if (showCountdown)
                      Positioned.fromRect(
                        rect: frameRect,
                        child: _CountdownRing(
                          total: _stableDuration,
                          startedAt: _stableSince!,
                        ),
                      ),
                    // Top bar với nút đóng.
                    _buildTopBar(),
                    // Bottom hint.
                    _buildBottomHint(phase),
                  ],
                );
              },
            );
          },
          onVideoMode: (_) => const SizedBox.shrink(),
          onVideoRecordingMode: (_) => const SizedBox.shrink(),
        );
      },
    );
  }

  Rect? _mapBboxToPreview(AnalysisPreview preview) {
    if (_boxInImage == null || _lastImage == null) return null;
    final box = _boxInImage!;
    final tl = preview.convertFromImage(box.topLeft, _lastImage!);
    final br = preview.convertFromImage(box.bottomRight, _lastImage!);
    return Rect.fromLTRB(tl.dx, tl.dy, br.dx, br.dy);
  }

  /// Tâm của bbox có nằm trong khung 4 góc không?
  /// Vật đặt ngoài khung thì bỏ qua, không vẽ / không glow.
  bool _centerInFrame(Rect bbox, Rect frameRect) {
    final cx = bbox.left + bbox.width / 2;
    final cy = bbox.top + bbox.height / 2;
    return cx >= frameRect.left &&
        cx <= frameRect.right &&
        cy >= frameRect.top &&
        cy <= frameRect.bottom;
  }

  _Phase _resolvePhase({required bool inFrame}) {
    if (_captureRequested) return _Phase.capturing;
    if (!inFrame) return _Phase.none;
    if (_stableSince != null) return _Phase.looksLikeCard;
    if (_isCardVerified) return _Phase.looksLikeCard;
    return _Phase.verifying;
  }

  /// Tính khung 4 góc ở giữa preview theo tỉ lệ danh thiếp chuẩn (1.75:1).
  Rect _frameRectFor(Size canvasSize) {
    const aspectRatio = 1.75; // width / height
    const horizontalPaddingRatio = 0.06;
    final maxW = canvasSize.width * (1 - horizontalPaddingRatio * 2);
    var w = maxW;
    var h = w / aspectRatio;
    if (h > canvasSize.height * 0.65) {
      h = canvasSize.height * 0.65;
      w = h * aspectRatio;
    }
    final left = (canvasSize.width - w) / 2;
    final top = (canvasSize.height - h) / 2;
    return Rect.fromLTWH(left, top, w, h);
  }

  Widget _buildTopBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
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
      ),
    );
  }

  Widget _buildBottomHint(_Phase phase) {
    final (icon, color, text) = switch (phase) {
      _Phase.none => (
          Icons.center_focus_strong,
          Colors.white,
          'Đưa danh thiếp vào trong khung',
        ),
      _Phase.verifying => (
          Icons.search,
          Colors.amberAccent,
          'Đang xác nhận danh thiếp...',
        ),
      _Phase.looksLikeCard => (
          Icons.check_circle,
          Colors.greenAccent,
          'Đã thấy danh thiếp - giữ yên 2 giây',
        ),
      _Phase.capturing => (
          Icons.camera_alt,
          Colors.greenAccent,
          'Đang chụp...',
        ),
    };
    return Positioned(
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).padding.bottom + 24,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Detection phases + visual mapping
// ---------------------------------------------------------------------------

enum _Phase {
  /// Chưa thấy vật trong khung 4 góc.
  none,

  /// Vật trong khung, đúng aspect ratio, nhưng chưa verify là danh thiếp
  /// (đang chạy text recogn hoặc text recogn fail).
  verifying,

  /// Đã verify là danh thiếp, đang đếm 2s.
  looksLikeCard,

  /// Đã trigger chụp — vẫn giữ glow cho đến khi capture xong.
  capturing;

  Color get cornerColor => switch (this) {
        _Phase.none => Colors.white,
        _Phase.verifying => Colors.amberAccent,
        _Phase.looksLikeCard => Colors.greenAccent,
        _Phase.capturing => Colors.greenAccent,
      };

  bool get cornerGlow => this != _Phase.none;
}

// ---------------------------------------------------------------------------
// Overlay widgets
// ---------------------------------------------------------------------------

/// Lớp phủ đen mờ toàn bộ, khoét 1 lỗ trong suốt ở giữa để lộ khung 4 góc.
class _DimMaskPainter extends CustomPainter {
  const _DimMaskPainter({required this.frameRect});

  final Rect frameRect;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = Colors.black.withValues(alpha: 0.45),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(frameRect, const Radius.circular(2)),
      Paint()..blendMode = BlendMode.clear,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _DimMaskPainter oldDelegate) =>
      oldDelegate.frameRect != frameRect;
}

// ---------------------------------------------------------------------------
// Khung 4 góc (đặt dưới detection phase để dễ tham chiếu ngược)

/// Khung 4 góc (4 nét L ở 4 góc) với màu + glow thay đổi theo trạng thái.
class _CornerFrame extends StatelessWidget {
  const _CornerFrame({
    required this.color,
    required this.glow,
    required this.pulse,
  });

  final Color color;
  final bool glow;

  /// 0..1: 0 = thường, 1 = glow mạnh nhất. Chỉ dùng khi `glow = true`.
  final double pulse;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CornerFramePainter(
        color: color,
        glow: glow,
        pulse: pulse,
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _CornerFramePainter extends CustomPainter {
  _CornerFramePainter({
    required this.color,
    required this.glow,
    required this.pulse,
  });

  static const double _length = 32;
  static const double _thickness = 4;

  final Color color;
  final bool glow;
  final double pulse;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = _thickness
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Vẽ glow trước (lớp mờ, rộng hơn) nếu có.
    if (glow) {
      final glowOpacity = 0.35 + 0.45 * pulse;
      final glowPaint = Paint()
        ..color = color.withValues(alpha: glowOpacity)
        ..strokeWidth = _thickness + 6 + 4 * pulse
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      _drawCorners(canvas, size, glowPaint);
    }

    _drawCorners(canvas, size, paint);
  }

  void _drawCorners(Canvas canvas, Size size, Paint paint) {
    // Top-left
    canvas.drawLine(const Offset(0, 0), const Offset(_length, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, _length), paint);
    // Top-right
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width - _length, 0), paint);
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width, _length), paint);
    // Bottom-left
    canvas.drawLine(
        Offset(0, size.height), Offset(_length, size.height), paint);
    canvas.drawLine(
        Offset(0, size.height), Offset(0, size.height - _length), paint);
    // Bottom-right
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width - _length, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width, size.height - _length), paint);
  }

  @override
  bool shouldRepaint(covariant _CornerFramePainter old) =>
      old.color != color || old.glow != glow || old.pulse != pulse;
}

/// Vòng tròn đếm ngược khi đối tượng đang nằm yên trong khung.
class _CountdownRing extends StatefulWidget {
  const _CountdownRing({required this.total, required this.startedAt});

  final Duration total;
  final DateTime startedAt;

  @override
  State<_CountdownRing> createState() => _CountdownRingState();
}

class _CountdownRingState extends State<_CountdownRing>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((_) {
      if (mounted) setState(() {});
    })
      ..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = DateTime.now().difference(widget.startedAt);
    final progress = (elapsed.inMilliseconds / widget.total.inMilliseconds)
        .clamp(0.0, 1.0);
    final remaining = (widget.total.inSeconds - elapsed.inSeconds)
        .clamp(0, widget.total.inSeconds);
    return Center(
      child: SizedBox(
        width: 96,
        height: 96,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 5,
                backgroundColor: Colors.white.withValues(alpha: 0.25),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.primaryERP),
              ),
            ),
            Text(
              '$remaining',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Loading view với spinner + message.
class _LoadingView extends StatelessWidget {
  const _LoadingView({required this.message, required this.description});

  final String message;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
