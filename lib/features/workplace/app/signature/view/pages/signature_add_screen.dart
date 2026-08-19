import 'dart:io';
import 'dart:typed_data';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../base/bloc/index.dart';
import '../bloc/my_signature_bloc.dart';
import '../widgets/smooth_signature_canvas.dart';
import 'signature_photo_confirm_page.dart';

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
  int _currentTabIndex = 0;

  String? _capturedImagePath;
  Uint8List? _processedImageBytes;
  Uint8List? _rawCameraBytes;

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
      _rawCameraBytes = null;
    });
  }

  Future<void> _pickImage() async {
    final choice = await showModalBottomSheet<_ImageSourceChoice>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => const _ImageSourceBottomSheet(),
    );

    if (!mounted) return;

    switch (choice) {
      case _ImageSourceChoice.camera:
        await _openCamera();
        break;
      case _ImageSourceChoice.gallery:
        await _pickFromGallery();
        break;
      case null:
        break;
    }
  }

  Future<void> _openCamera() async {
    final result = await Navigator.of(context).push<dynamic>(
      MaterialPageRoute(
        builder: (_) => const SignatureCameraPage(),
      ),
    );

    if (!mounted) return;

    if (result == null || result == 'cancel' || result == 'retake') return;

    if (result is Uint8List) {
      setState(() {
        _rawCameraBytes = result;
        _capturedImagePath = null;
        _processedImageBytes = result;
      });
      // Auto-submit: confirmed bytes are already cropped to 300x150.
      bloc.add(MySignatureEvent.saveEmployeeSignature(result));
    }
  }

  Future<void> _pickFromGallery() async {
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (!mounted) return;
      if (picked == null) return;

      // Copy the picked file to a temp location so the downstream
      // confirm page (which expects a file path) can reuse it.
      final tempDir = await getTemporaryDirectory();
      final dest = File(
        '${tempDir.path}/sig_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await File(picked.path).copy(dest.path);

      final result = await Navigator.of(context).push<dynamic>(
        MaterialPageRoute(
          builder: (_) => SignaturePhotoConfirmPage(imagePath: dest.path),
        ),
      );

      if (!mounted) return;

      if (result == null || result == 'cancel') return;
      if (result == 'retake') return;

      if (result is Uint8List) {
        setState(() {
          _rawCameraBytes = result;
          _capturedImagePath = null;
          _processedImageBytes = result;
        });
        bloc.add(MySignatureEvent.saveEmployeeSignature(result));
      }
    } catch (e) {
      if (!mounted) return;
      showMessage(
        context,
        'Không thể chọn ảnh. Vui lòng thử lại.',
        type: SnackBarType.error,
      );
    }
  }

  Future<void> _saveSignature() async {
    final signatureBytes = await _signatureKey.currentState?.toTransparentBytes();
    if (signatureBytes == null) {
      showMessage(context, 'Vui lòng bổ sung chữ ký', type: SnackBarType.error);
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
                  onTap: (index) {
                    setState(() => _currentTabIndex = index);
                  },
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
                    Tab(text: 'Ảnh chữ ký'),
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
              if (_currentTabIndex == 0) ...[
                const SizedBox(height: 8),
                _buildBottomButtons(state),
              ],
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
                  'Ảnh chữ ký',
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
              'Chụp hoặc chọn ảnh chữ ký của bạn',
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
              onPressed: _pickImage,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Ảnh chữ ký'),
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
    final imageBytes = _processedImageBytes ?? _rawCameraBytes;
    if (imageBytes == null) return const SizedBox.shrink();

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
            child: Image.memory(
              imageBytes,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: _PreviewActionButton(
              icon: Icons.refresh,
              onPressed: _clearPhoto,
              tooltip: 'Chụp lại',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(MySignatureState state) {
    final isSignatureTab = _currentTabIndex == 0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: isSignatureTab ? _clearSignature : _clearPhoto,
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
                  : (isSignatureTab ? _saveSignature : _savePhoto),
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
  bool _busy = false;
  PhotoCameraState? _cameraState;

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
            onPhotoMode: (state) {
              _cameraState = state;
              return _buildCameraUi();
            },
            onVideoMode: (_) => const SizedBox.shrink(),
            onVideoRecordingMode: (_) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildCameraUi() {
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
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ShutterButton(
                  enabled: !_busy,
                  onPressed: _capture,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _capture() async {
    if (_busy || _cameraState == null) return;
    setState(() => _busy = true);
    try {
      await _cameraState!.takePhoto();
    } catch (_) {
      // ignore
    }
  }

  void _onMediaCapture(MediaCapture capture) {
    if (capture.status != MediaCaptureStatus.success) return;
    if (!capture.isPicture) return;

    capture.captureRequest.when(
      single: (single) {
        final path = single.file?.path ?? '';
        if (path.isNotEmpty && mounted) {
          _navigateToConfirm(path);
        }
      },
      multiple: (multiple) {
        for (final f in multiple.fileBySensor.values) {
          final path = f?.path ?? '';
          if (path.isNotEmpty) {
            _navigateToConfirm(path);
            break;
          }
        }
      },
    );
  }

  Future<void> _navigateToConfirm(String imagePath) async {
    final result = await Navigator.of(context).push<dynamic>(
      MaterialPageRoute(
        builder: (_) => SignaturePhotoConfirmPage(imagePath: imagePath),
      ),
    );

    if (!mounted) return;

    if (result == null || result == 'cancel') {
      setState(() => _busy = false);
      return;
    }

    if (result == 'retake') {
      setState(() => _busy = false);
      return;
    }

    if (result is Uint8List) {
      Navigator.of(context).pop(result);
    }
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

// ============================================================
// Image source picker (camera / gallery)
// ============================================================

enum _ImageSourceChoice { camera, gallery }

class _ImageSourceBottomSheet extends StatelessWidget {
  const _ImageSourceBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Chọn chế độ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.primaryERP,
                ),
              ),
              title: const Text('Chụp ảnh'),
              subtitle: const Text('Mở camera để chụp ảnh'),
              onTap: () =>
                  Navigator.of(context).pop(_ImageSourceChoice.camera),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.photo_library_outlined,
                  color: Colors.orange,
                ),
              ),
              title: const Text('Chọn ảnh từ bộ nhớ'),
              subtitle: const Text('Chọn ảnh có sẵn trên thiết bị'),
              onTap: () =>
                  Navigator.of(context).pop(_ImageSourceChoice.gallery),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
