// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình "Thêm" - hiển thị thông tin cá nhân, cài đặt, giới thiệu và đăng xuất
//
// Giao diện:
//   - AppBar: title "Cá nhân"
//   - Profile header: avatar, tên, email, phòng ban, chức vụ, mã nhân viên
//   - Card cài đặt: Cài đặt chung, Thông báo, Bảo mật & quyền riêng tư
//   - Card hỗ trợ: Hướng dẫn sử dụng, Liên hệ hỗ trợ, Giới thiệu ứng dụng
//   - Card thông tin: Phiên bản ứng dụng
//   - Nút đăng xuất

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';

import '../../../../common/app_theme/index.dart';
import '../../../../common/app/app_config.dart';
import '../../../../base/bloc/bloc_status.dart';
import '../../../../routes/route_names.dart';
import '../../../../common/utils/snack_bar_helper.dart';
import '../../../../di/injection.dart';
import '../../auth/view/bloc/auth_bloc.dart';

/// Màn hình "Thêm" — tab thứ 5 trong DashboardScreen.
///
/// Hiển thị thông tin cá nhân của người dùng đang đăng nhập,
/// các mục cài đặt, hỗ trợ và nút đăng xuất.
/// Nghe [AuthState] để redirect về login khi logout thành công.
class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  /// Track previous.isUploadingAvatar để phát hiện "upload vừa kết thúc"
  /// trong BlocConsumer listener (listener chỉ nhận current state).
  bool _wasUploadingAvatar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'Cá nhân',
          style: TextStyle(
            color: AppColors.heading,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.status != current.status ||
            previous.user != current.user ||
            previous.isUploadingAvatar != current.isUploadingAvatar ||
            current.status == BaseStateStatus.init,
        listener: (context, state) {
          if (state.user == null && state.status == BaseStateStatus.init) {
            context.go(RouteNames.login);
            return;
          }

          // Bắn snackbar khi upload avatar vừa kết thúc (thành công hoặc thất bại).
          // So sánh isUploadingAvatar: false ở current + true ở previous.
          if (_wasUploadingAvatar && !state.isUploadingAvatar) {
            _wasUploadingAvatar = false;
            final msg = state.message;
            if (msg != null && msg.isNotEmpty) {
              context.showMessage(msg, type: SnackBarType.error);
            } else {
              context.showMessage(
                'more.upload_avatar_success'.tr(),
                type: SnackBarType.success,
              );
            }
          } else if (state.isUploadingAvatar) {
            _wasUploadingAvatar = true;
          }
        },
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.user != current.user ||
            previous.isUploadingAvatar != current.isUploadingAvatar ||
            previous.avatarUploadedAt != current.avatarUploadedAt,
        builder: (context, state) {
          final user = state.user;
          final name = user?.fullName ?? 'User Name';
          final email = user?.loginName ?? 'user@rtc.edu.vn';
          final department = user?.departmentName ?? 'Phòng ban';

          // URL dùng `user.imagePath` (server field `ImagePath`) làm cache-bust.
          // Sau upload, AuthBloc re-fetch user → user.imagePath đổi → URL đổi
          // → CachedNetworkImage fetch ảnh mới đồng bộ trên mọi màn đang
          // nghe AuthBloc (more_screen, workspace_screen, ...).
          //
          // Ngoài ra thêm `cacheBust` (epoch ms) để chắc chắn cache bị bust
          // kể cả khi server trả về cùng imagePath (server có thể reuse filename).
          final avatarUrl = _resolveAvatarUrl(
            user?.employeeId,
            imagePath: user?.imagePath,
            cacheBust: state.avatarUploadedAt?.millisecondsSinceEpoch,
          );

          final isLoading = state.status == BaseStateStatus.loading;
          final isUploading = state.isUploadingAvatar;

          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    const SizedBox(height: 10),

                    //---(Profile Header)---//
                    _ProfileCard(
                      name: name,
                      email: email,
                      department: department,
                      avatarUrl: avatarUrl,
                      isUploading: isUploading,
                      onTapChangeAvatar: () =>
                          _showAvatarSourceSheet(context, avatarUrl: avatarUrl),
                    ),

                    const SizedBox(height: 20),

                    //---(Cài đặt)---//
                    _SectionCard(
                      title: 'Cài đặt',
                      icon: Icons.settings_outlined,
                      children: [
                        _SettingsTile(
                          icon: Icons.notifications_outlined,
                          title: 'Thông báo',
                          subtitle: 'Âm thanh, tin nhắn, nhắc nhở',
                          onTap: () {
                            context.push(RouteNames.notificationSettings);
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),
                  ],
                ),
              ),
              //---(Đăng xuất)---//
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: _LogoutButton(isLoading: isLoading),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Hiển thị bottom sheet cho user chọn nguồn ảnh (gallery / camera).
  Future<void> _showAvatarSourceSheet(
    BuildContext context, {
    String? avatarUrl,
  }) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      // Đẩy modal route lên root navigator (ngoài các tab) để:
      //  - Che toàn màn hình, kể cả khi user chuyển sang tab khác.
      //  - Không bị "treo" trong navigator của tab More khi IndexedStack ẩn.
      useRootNavigator: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        final hasAvatar = avatarUrl != null && avatarUrl.isNotEmpty;

        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(top: 12, bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.gray.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                child: Text(
                  'more.change_avatar'.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                child: Text(
                  'more.change_avatar_hint'.tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: AppColors.gray),
                ),
              ),
              const SizedBox(height: 12),
              if (hasAvatar)
                ListTile(
                  leading: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.visibility_outlined,
                      color: AppColors.primaryERP,
                    ),
                  ),
                  title: Text('more.view_avatar'.tr()),
                  onTap: () async {
                    sheetContext.pop();
                    await Future.delayed(const Duration(milliseconds: 300));
                    if (context.mounted) {
                      _showAvatarViewer(context, avatarUrl);
                    }
                  },
                ),
              ListTile(
                leading: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.photo_library_outlined,
                    color: AppColors.primaryERP,
                  ),
                ),
                title: Text('more.pick_from_gallery'.tr()),
                onTap: () =>
                    sheetContext.pop(ImageSource.gallery),
              ),
              ListTile(
                leading: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.primaryERP,
                  ),
                ),
                title: Text('more.take_photo'.tr()),
                onTap: () => sheetContext.pop(ImageSource.camera),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );

    if (source == null) return;
    await _pickCropAndUploadAvatar(source);
  }

  /// Hiển thị ảnh đại diện full màn hình với khả năng zoom.
  Future<void> _showAvatarViewer(
    BuildContext context,
    String avatarUrl,
  ) async {
    final userName = context.read<AuthBloc>().state.user?.fullName ?? '';
    await context.push(
      RouteNames.avatarViewer,
      extra: {'avatarUrl': avatarUrl, 'userName': userName},
    );
  }

  /// Flow chọn ảnh → crop → upload lên server.
  ///
  /// Quy trình:
  /// 1. Xin quyền (camera hoặc photo) tuỳ nguồn
  /// 2. image_picker lấy file ảnh
  /// 3. image_cropper crop 1:1 (avatar)
  /// 4. AuthBloc.add(AuthEvent.uploadAvatar(filePath))
  /// 5. AuthBloc tự refetch user → imagePath đổi → UI tự rebuild ảnh mới
  Future<void> _pickCropAndUploadAvatar(ImageSource source) async {
    // 1. Xin quyền qua permission_handler (hiển thị native dialog
    // của iOS hoặc Android runtime permission).
    final granted = await _requestPermissionFor(source);
    if (!granted) {
      if (!mounted) return;

      // Nếu đã bị từ chối vĩnh viễn (iOS: 2 lần trở lên, Android: "Don't ask again")
      // → tự mở Settings app luôn để user cấp lại.
      final isPermanently = await _isPermanentlyDenied(source);
      if (isPermanently) {
        await openAppSettings();
      }
      return;
    }

    // 2. Pick ảnh
    final picker = ImagePicker();
    final XFile? picked;
    try {
      picked = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
    } catch (e) {
      if (!mounted) return;
      getIt<SnackBarHelper>().showError(context, e.toString());
      return;
    }
    if (picked == null) return; // user huỷ
    if (!mounted) return;

    // 3. Crop tròn (circular) — phù hợp với avatar hiển thị dạng ClipOval.
    final cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'more.crop_avatar_title'.tr(),
          toolbarColor: AppColors.primaryERP,
          toolbarWidgetColor: Colors.white,
          // Crop hình tròn, không có background nền.
          cropStyle: CropStyle.circle,
          // Ẩn các nút thừa dưới đáy, chỉ giữ Done / Cancel trên toolbar.
          hideBottomControls: true,
          lockAspectRatio: true,
          aspectRatioPresets: const [CropAspectRatioPreset.square],
        ),
        IOSUiSettings(
          title: 'more.crop_avatar_title'.tr(),
          // iOS native cropper chỉ hiển thị Done / Cancel — không có
          // rotate/reset/extra button. Giữ aspect ratio 1:1.
          aspectRatioLockEnabled: true,
          resetAspectRatioEnabled: false,
          aspectRatioPickerButtonHidden: true,
          rotateButtonsHidden: true,
          resetButtonHidden: true,
        ),
      ],
    );

    if (cropped == null) return; // user huỷ crop
    if (!mounted) return;

    context.read<AuthBloc>().add(AuthEvent.uploadAvatar(cropped.path));
  }

  /// Xin quyền tương ứng với nguồn ảnh.
  /// Trả về `true` nếu user đã cấp quyền (kể cả limited).
  /// Android 13+ dùng Photo Picker không cần quyền → luôn trả về true.
  Future<bool> _requestPermissionFor(ImageSource source) async {
    if (source == ImageSource.camera) {
      var status = await Permission.camera.status;
      if (status.isGranted || status.isLimited) return true;
      if (status.isPermanentlyDenied) return false;
      status = await Permission.camera.request();
      return status.isGranted || status.isLimited;
    }

    // iOS: image_picker tự xin quyền qua NSPhotoLibraryUsageDescription.
    if (Platform.isIOS) return true;

    // Android: Photo Picker (API 33+) không cần quyền.
    // Android < 13 cần READ_EXTERNAL_STORAGE (đã khai báo trong manifest).
    final photosStatus = await Permission.photos.status;
    if (photosStatus.isGranted || photosStatus.isLimited) return true;
    if (photosStatus.isPermanentlyDenied) return false;

    // Photos permission chưa được cấp:
    // - Android 13+ (API 33+): Photo Picker hoạt động không cần quyền → return true
    // - Android < 13: image_picker dùng READ_EXTERNAL_STORAGE → return true
    return true;
  }

  /// Kiểm tra permission hiện tại có bị từ chối vĩnh viễn không.
  /// - iOS: sau khi user từ chối 2 lần trở lên → permanentlyDenied
  /// - Android: sau khi user chọn "Don't ask again" → permanentlyDenied
  /// Dùng để phân biệt message giữa "vừa từ chối" vs "đã chặn vĩnh viễn".
  Future<bool> _isPermanentlyDenied(ImageSource source) async {
    if (source == ImageSource.camera) {
      return (await Permission.camera.status).isPermanentlyDenied;
    }
    if (Platform.isIOS) return false;
    if ((await Permission.photos.status).isPermanentlyDenied) return true;
    return (await Permission.storage.status).isPermanentlyDenied;
  }

  /// Resolve full URL cho avatar qua endpoint /api/home/avatar.
  ///
  /// [imagePath] (server field `ImagePath`) thay đổi mỗi lần user upload avatar mới,
  /// dùng làm query param để cache-bust đồng bộ trên mọi màn đang
  /// nghe AuthBloc (more_screen, workspace_screen, ...).
  ///
  /// [cacheBust] là epoch ms của lần fetch hiện tại — bắt buộc phải có sau khi
  /// upload để tránh cache CachedNetworkImage trả ảnh cũ khi server trả về
  /// cùng `imagePath` (server có thể reuse filename).
  String? _resolveAvatarUrl(
    int? employeeId, {
    String? imagePath,
    int? cacheBust,
  }) {
    if (employeeId == null) return null;

    final baseUrl = AppConfig.baseUrl.trim();
    if (baseUrl.isEmpty) return null;

    var normalizedBaseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    if (normalizedBaseUrl.endsWith('/api')) {
      normalizedBaseUrl = normalizedBaseUrl.substring(
        0,
        normalizedBaseUrl.length - 4,
      );
    }

    final extra = imagePath != null && imagePath.isNotEmpty
        ? '&v=$imagePath'
        : '';
    final bust = cacheBust != null ? '&_t=$cacheBust' : '';
    return '$normalizedBaseUrl/api/home/avatar?employeeId=$employeeId$extra$bust';
  }
}

//---(Profile)---//

/// Card hiển thị thông tin cá nhân người dùng.
///
/// Gồm: avatar gradient, tên, email, phòng ban, chức vụ.
class _ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String department;
  final String? avatarUrl;
  final bool isUploading;
  final VoidCallback onTapChangeAvatar;

  const _ProfileCard({
    required this.name,
    required this.email,
    required this.department,
    required this.avatarUrl,
    required this.isUploading,
    required this.onTapChangeAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar với nút camera overlay
          GestureDetector(
            onTap: isUploading ? null : onTapChangeAvatar,
            child: Stack(
              children: [
                _buildAvatar(),
                if (isUploading)
                  const Positioned.fill(
                    child: ColoredBox(
                      color: Color(0x66000000),
                      child: Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  Positioned(
                    right: -2,
                    bottom: -2,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.primaryERP,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Thông tin
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(fontSize: 13, color: AppColors.gray),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Tags: phòng ban & chức vụ
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    _InfoChip(icon: Icons.business_outlined, label: department),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Trích initials từ tên đầy đủ: "Nguyễn Văn An" -> "NVA".
  String _initials(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    final first = parts.first.isNotEmpty ? parts.first[0] : '';
    final last = parts.last.isNotEmpty ? parts.last[0] : '';
    return '$first$last'.toUpperCase();
  }

  /// Build avatar — ưu tiên hiển thị [avatarUrl] nếu có, fallback gradient + initials.
  Widget _buildAvatar() {
    const size = 80.0;
    final hasAvatar = avatarUrl != null && avatarUrl!.isNotEmpty;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: hasAvatar ? null : AppColors.primaryERP,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: AppColors.primaryERP)],
      ),
      clipBehavior: Clip.antiAlias,
      child: hasAvatar
          ? CachedNetworkImage(
              imageUrl: avatarUrl!,
              width: size,
              height: size,
              fit: BoxFit.cover,
              placeholder: (_, __) => const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (_, __, ___) => _initialsFallback(),
            )
          : _initialsFallback(),
    );
  }

  Widget _initialsFallback() {
    return Center(
      child: Text(
        _initials(name),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Chip nhỏ hiển thị phòng ban / chức vụ.
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.secondaryERP.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.secondaryERP),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryERP,
            ),
          ),
        ],
      ),
    );
  }
}

//---(Section)---//

/// Card bao quanh một nhóm mục cài đặt / hỗ trợ.
class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFF0F2F5), width: 1),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, size: 18, color: AppColors.primaryERP),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
              ],
            ),
          ),
          // Children
          ...children,
        ],
      ),
    );
  }
}

//---(Settings Tile)---//

/// Một dòng tile trong _SectionCard.
class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool showDivider;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.bgCard,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 20, color: AppColors.heading),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.heading,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: AppColors.gray,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF0F2F5),
            indent: 66,
          ),
      ],
    );
  }
}

//---(Logout Button)---//

/// Nút đăng xuất — viền đỏ nhạt, nền đỏ rất nhạt, có loading indicator.
class _LogoutButton extends StatelessWidget {
  final bool isLoading;

  const _LogoutButton({required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading
          ? null
          : () => context.read<AuthBloc>().add(const AuthEvent.logout()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.alert.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.alert.withValues(alpha: 0.2),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) ...[
              const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.alert,
                ),
              ),
              const SizedBox(width: 10),
            ] else ...[
              const Icon(Icons.logout, size: 18, color: AppColors.alert),
              const SizedBox(width: 8),
            ],
            const Text(
              'Đăng xuất',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.alert,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
