import 'dart:io';
import 'dart:typed_data';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../base/bloc/index.dart';
import '../bloc/my_signature_bloc.dart';
import '../widgets/smooth_signature_canvas.dart';

class SignatureAddScreen extends StatefulWidget {
  const SignatureAddScreen({super.key});

  @override
  State<SignatureAddScreen> createState() => _SignatureAddScreenState();
}

class _SignatureAddScreenState
    extends BaseState<SignatureAddScreen, MySignatureEvent, MySignatureState, MySignatureBloc>
    with SingleTickerProviderStateMixin {
  final GlobalKey<SmoothSignatureCanvasState> _signatureKey = GlobalKey();

  late TabController _tabController;

  String? _capturedImagePath;
  Uint8List? _processedImageBytes;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _clearSignature() {
    _signatureKey.currentState?.clear();
    setState(() {});
  }

  void _clearPhoto() {
    setState(() {
      _capturedImagePath = null;
      _processedImageBytes = null;
    });
  }

  Future<void> _openCamera() async {
    final result = await Navigator.of(context).push<List<String>>(
      MaterialPageRoute(
        builder: (_) => const SignatureCameraPage(),
      ),
    );

    if (result != null && result.isNotEmpty && mounted) {
      setState(() {
        _capturedImagePath = result.first;
        _processedImageBytes = null;
      });
      await _cropAndProcessImage(result.first);
    }
  }

  Future<void> _cropAndProcessImage(String imagePath) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cắt ảnh',
          toolbarColor: AppColors.primaryERP,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          hideBottomControls: false,
        ),
        IOSUiSettings(
          title: 'Cắt ảnh',
          cancelButtonTitle: 'Huỷ',
          doneButtonTitle: 'Xong',
        ),
      ],
    );

    if (croppedFile != null && mounted) {
      final bytes = await File(croppedFile.path).readAsBytes();
      setState(() {
        _processedImageBytes = bytes;
      });
    }
  }

  Future<void> _saveSignature() async {
    final signatureBytes = await _signatureKey.currentState?.toTransparentBytes();
    if (signatureBytes == null) {
      showMessage(context, 'Vui lòng vẽ chữ ký', type: SnackBarType.error);
      return;
    }
    bloc.add(MySignatureEvent.saveEmployeeSignature(signatureBytes));
  }

  Future<void> _savePhoto() async {
    if (_processedImageBytes == null && _capturedImagePath == null) {
      showMessage(context, 'Vui lòng chụp ảnh', type: SnackBarType.error);
      return;
    }
    final bytes = _processedImageBytes ?? await File(_capturedImagePath!).readAsBytes();
    bloc.add(MySignatureEvent.saveEmployeeSignature(Uint8List.fromList(bytes)));
  }

  @override
  bool listenWhen(MySignatureState previous, MySignatureState current) {
    return previous.saveSuccess != current.saveSuccess ||
        previous.isSaving != current.isSaving ||
        previous.message != current.message;
  }

  @override
  void listener(BuildContext context, MySignatureState state) {
    if (state.saveSuccess) {
      showMessage(
        context,
        'Lưu chữ ký thành công',
        type: SnackBarType.success,
      );
      context.pop(true);
      return;
    }
    if (state.status == BaseStateStatus.failed &&
        (state.message ?? '').isNotEmpty) {
      showMessage(context, state.message!, type: SnackBarType.error);
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<MySignatureBloc, MySignatureState>(
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: Text(
              'Thêm chữ ký',
              style: AppStyles.headingTitle2,
            ),
            onBackTap: () => context.pop(),
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.grey_bg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: AppColors.primaryERP,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.all(4),
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: AppColors.textSecondaryColor,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  tabs: const [
                    Tab(text: 'Khung ký'),
                    Tab(text: 'Chụp ảnh'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildSignatureTab(),
                    _buildPhotoTab(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              _buildBottomButtons(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSignatureTab() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.08),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Icon(Icons.draw_outlined, size: 20, color: AppColors.primaryERP),
                const SizedBox(width: 8),
                Text(
                  'Khung chữ ký',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryERP,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryERP, width: 1.5),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SmoothSignatureCanvas(
                  key: _signatureKey,
                  penColor: Colors.black,
                  strokeWidth: 2.5,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoTab() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.08),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Icon(Icons.camera_alt_outlined, size: 20, color: AppColors.primaryERP),
                const SizedBox(width: 8),
                Text(
                  'Chụp ảnh chữ ký',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryERP,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _capturedImagePath != null
                ? _buildPhotoPreview()
                : _buildPhotoPlaceholder(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoPlaceholder() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryERP, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_a_photo_outlined,
              size: 64,
              color: AppColors.textSecondaryColor.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'Chụp ảnh chữ ký của bạn',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Đảm bảo chữ ký rõ ràng và nền sạch',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textSecondaryColor.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _openCamera,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Mở camera'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoPreview() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryERP, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: _processedImageBytes != null
                ? Image.memory(
                    _processedImageBytes!,
                    fit: BoxFit.contain,
                  )
                : Image.file(
                    File(_capturedImagePath!),
                    fit: BoxFit.contain,
                  ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Row(
              children: [
                _PreviewActionButton(
                  icon: Icons.crop,
                  onPressed: () => _cropAndProcessImage(_capturedImagePath!),
                  tooltip: 'Cắt ảnh',
                ),
                const SizedBox(width: 8),
                _PreviewActionButton(
                  icon: Icons.refresh,
                  onPressed: _clearPhoto,
                  tooltip: 'Chụp lại',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(MySignatureState state) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: AnimatedBuilder(
        animation: _tabController,
        builder: (context, _) {
          final currentTab = _tabController.index;
          return Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: currentTab == 0 ? _clearSignature : _clearPhoto,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Xoá'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: AppColors.primaryERP),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: state.isSaving
                      ? null
                      : (currentTab == 0 ? _saveSignature : _savePhoto),
                  icon: state.isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.save),
                  label: Text(state.isSaving ? 'Đang lưu...' : 'Lưu'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryERP,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PreviewActionButton extends StatelessWidget {
  const _PreviewActionButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Tooltip(
          message: tooltip,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}

class SignatureCameraPage extends StatefulWidget {
  const SignatureCameraPage({super.key});

  @override
  State<SignatureCameraPage> createState() => _SignatureCameraPageState();
}

class _SignatureCameraPageState extends State<SignatureCameraPage> {
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
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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
        SafeArea(
          bottom: false,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
              child: Row(
                children: [
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
    if (_captured.isEmpty) return;
    Navigator.of(context).pop(_captured);
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
