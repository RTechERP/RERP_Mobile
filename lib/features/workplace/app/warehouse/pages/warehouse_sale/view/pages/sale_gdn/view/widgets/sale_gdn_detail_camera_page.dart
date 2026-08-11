import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

import 'sale_gdn_detail_image_flow.dart';

/// Màn camera chụp nhiều ảnh liên tục trong cùng 1 session sử dụng
/// plugin `camerawesome`.
///
/// - Nút chụp lớn ở giữa dưới → chụp và thêm vào strip.
/// - Strip ảnh đã chụp ngay phía trên nút chụp.
/// - Nút "Tiếp theo" (kích hoạt khi đã chụp ≥ 1 ảnh) → đóng camera và mở
///   màn xác nhận.
///
/// Trả về danh sách đường dẫn ảnh đã user xác nhận, hoặc `null` nếu user huỷ.
class CameraCapturePage extends StatefulWidget {
  const CameraCapturePage({super.key});

  @override
  State<CameraCapturePage> createState() => _CameraCapturePageState();
}

class _CameraCapturePageState extends State<CameraCapturePage> {
  final List<String> _captured = [];
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CameraAwesomeBuilder.custom(
        saveConfig: SaveConfig.photo(),
        sensorConfig: SensorConfig.single(
          sensor: Sensor.position(SensorPosition.back),
          flashMode: FlashMode.auto,
          aspectRatio: CameraAspectRatios.ratio_4_3,
        ),
        onMediaCaptureEvent: _onMediaCapture,
        builder: (cameraState, _) {
          return cameraState.when(
            onPreparingCamera: (_) => const Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            onPhotoMode: (state) => _buildCameraUi(state),
            onVideoMode: (_) => const SizedBox.shrink(),
            onVideoRecordingMode: (_) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildCameraUi(PhotoCameraState state) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Top bar — bọc SafeArea để nút X không dính dynamic island / status bar.
        SafeArea(
          bottom: false,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
              child: Row(
                children: [
                  // Nút đóng — có vùng bấm rộng 48x48 theo chuẩn Material.
                  _TopBarIconButton(
                    icon: Icons.close,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.photo_camera_outlined,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Đã chụp: ${_captured.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),
        ),

        // Bottom bar
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_captured.isNotEmpty) _buildThumbnailStrip(),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _ShutterButton(
                        enabled: !_busy,
                        onPressed: () => _capture(state),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _captured.isEmpty ? null : _confirmAndExit,
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Tiếp theo'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryERP,
                          disabledBackgroundColor:
                              Colors.white.withValues(alpha: 0.2),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThumbnailStrip() {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _captured.length,
        separatorBuilder: (_, _) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final path = _captured[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(path),
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: 56,
                height: 56,
                color: Colors.white24,
                child: const Icon(
                  Icons.broken_image_outlined,
                  color: Colors.white54,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _capture(PhotoCameraState state) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await state.takePhoto();
    } catch (_) {
      // ignore
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _confirmAndExit() async {
    final result = await ImageConfirmPage.show(context, _captured);
    if (!mounted) return;
    if (result == null) {
      // "Chụp lại" → xoá toàn bộ ảnh đã chụp, quay về camera
      setState(() => _captured.clear());
      return;
    }
    if (result.isEmpty) {
      // Không có ảnh nào sau khi confirm → về camera
      return;
    }
    Navigator.of(context).pop(result);
  }

  void _onMediaCapture(MediaCapture capture) {
    if (capture.status != MediaCaptureStatus.success) return;
    if (!capture.isPicture) return;
    capture.captureRequest.when(
      single: (single) {
        final path = single.file?.path ?? '';
        if (path.isNotEmpty && mounted) {
          setState(() => _captured.add(path));
        }
      },
      multiple: (multiple) {
        for (final f in multiple.fileBySensor.values) {
          final path = f?.path ?? '';
          if (path.isNotEmpty) {
            setState(() => _captured.add(path));
          }
        }
      },
    );
  }
}

/// Nút icon trong suốt cho top bar, có vùng bấm rộng 48x48 (chuẩn Material).
class _TopBarIconButton extends StatelessWidget {
  const _TopBarIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: Center(
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/// Nút chụp hình tròn lớn kiểu iOS, ở giữa dưới.
class _ShutterButton extends StatelessWidget {
  const _ShutterButton({required this.enabled, required this.onPressed});

  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: GestureDetector(
        onTap: enabled ? onPressed : null,
        child: Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
          ),
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}