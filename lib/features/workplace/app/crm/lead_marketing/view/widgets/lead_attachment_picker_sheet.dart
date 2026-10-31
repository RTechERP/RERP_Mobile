import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../../common/app_theme/index.dart';

/// Nguồn chọn file đính kèm.
enum LeadAttachSource {
  /// Chụp ảnh mới bằng camera.
  camera,

  /// Chọn ảnh có sẵn trong bộ nhớ thiết bị.
  gallery,

  /// Chọn file bất kỳ (PDF, Word, Excel, ...).
  file,
}

/// Bottom sheet chọn nguồn đính kèm: chụp ảnh, chọn ảnh từ bộ nhớ hoặc chọn
/// file.
///
/// Trả về danh sách [PlatformFile] đã chuẩn hoá về cùng định dạng với file
/// chọn bằng `file_picker` để phần upload / xem trước dùng chung logic.
class LeadAttachmentPickerSheet extends StatelessWidget {
  const LeadAttachmentPickerSheet({
    super.key,
    this.allowedExtensions = const [
      'pdf',
      'doc',
      'docx',
      'xls',
      'xlsx',
      'png',
      'jpg',
      'jpeg',
      'gif',
      'zip',
      'rar',
    ],
  });

  /// Danh sách đuôi file được phép chọn ở chế độ chọn file.
  final List<String> allowedExtensions;

  /// Mở bottom sheet và trả về danh sách file người dùng chọn.
  ///
  /// Trả về `null` khi người dùng đóng sheet hoặc không chọn file nào.
  static Future<List<PlatformFile>?> pick(
    BuildContext context, {
    List<String> allowedExtensions = const [
      'pdf',
      'doc',
      'docx',
      'xls',
      'xlsx',
      'png',
      'jpg',
      'jpeg',
      'gif',
      'zip',
      'rar',
    ],
  }) async {
    final source = await showModalBottomSheet<LeadAttachSource>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LeadAttachmentPickerSheet(
        allowedExtensions: allowedExtensions,
      ),
    );
    if (source == null || !context.mounted) return null;

    switch (source) {
      case LeadAttachSource.camera:
        return _pickFromCamera(context);
      case LeadAttachSource.gallery:
        return _pickImagesFromGallery(context);
      case LeadAttachSource.file:
        return _pickDocuments(context, allowedExtensions);
    }
  }

  /// Chụp ảnh bằng camera → chuyển sang [PlatformFile].
  static Future<List<PlatformFile>?> _pickFromCamera(
    BuildContext context,
  ) async {
    final picker = ImagePicker();
    final shot = await picker.pickImage(source: ImageSource.camera);
    if (shot == null) return null;
    return [await _toPlatformFile(shot)];
  }

  /// Chọn nhiều ảnh từ bộ nhớ → chuyển sang [PlatformFile].
  static Future<List<PlatformFile>?> _pickImagesFromGallery(
    BuildContext context,
  ) async {
    final picker = ImagePicker();
    final images = await picker.pickMultiImage();
    if (images.isEmpty) return null;
    return [for (final image in images) await _toPlatformFile(image)];
  }

  /// Chọn file bất kỳ theo danh sách đuôi được phép.
  static Future<List<PlatformFile>?> _pickDocuments(
    BuildContext context,
    List<String> allowedExtensions,
  ) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withData: true,
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );
    if (result == null || result.files.isEmpty) return null;
    return result.files;
  }

  /// Chuyển ảnh từ `image_picker` sang [PlatformFile] của `file_picker` để
  /// dùng chung pipeline upload / xem trước.
  static Future<PlatformFile> _toPlatformFile(XFile image) async {
    return PlatformFile(
      name: image.name,
      size: await image.length(),
      path: image.path,
      bytes: await image.readAsBytes(),
    );
  }

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
                color: AppColors.borderColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Chọn tệp đính kèm',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _sourceTile(
              context,
              icon: Icons.camera_alt_outlined,
              iconColor: AppColors.primaryERP,
              title: 'Chụp ảnh',
              subtitle: 'Mở camera để chụp ảnh',
              source: LeadAttachSource.camera,
            ),
            _sourceTile(
              context,
              icon: Icons.photo_library_outlined,
              iconColor: AppColors.orangeA500,
              title: 'Chọn ảnh từ bộ nhớ',
              subtitle: 'Chọn một hoặc nhiều ảnh có sẵn trên thiết bị',
              source: LeadAttachSource.gallery,
            ),
            _sourceTile(
              context,
              icon: Icons.attach_file,
              iconColor: AppColors.secondaryERP,
              title: 'Chọn tệp',
              subtitle: 'PDF, Word, Excel, Zip hoặc tệp khác',
              source: LeadAttachSource.file,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  /// Một lựa chọn trong bottom sheet: icon, tiêu đề, mô tả.
  Widget _sourceTile(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required LeadAttachSource source,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () => Navigator.of(context).pop(source),
    );
  }
}
