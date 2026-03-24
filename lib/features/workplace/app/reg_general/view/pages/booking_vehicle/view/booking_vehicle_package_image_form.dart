import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<PlatformFile?> _platformFileFromXFile(XFile xFile) async {
  final name = xFile.name.trim();
  try {
    final path = xFile.path;
    if (path.isNotEmpty && !kIsWeb) {
      final size = await xFile.length();
      return PlatformFile(
        name: name.isNotEmpty ? name : path.split('/').last,
        path: path,
        size: size,
      );
    }
    final bytes = await xFile.readAsBytes();
    return PlatformFile(
      name: name.isNotEmpty ? name : 'image.jpg',
      bytes: bytes,
      size: bytes.length,
    );
  } catch (_) {
    return null;
  }
}

/// Thư viện ảnh — chọn **nhiều** ảnh (iOS Photos / Android). Trả về rỗng nếu huỷ / không chọn.
Future<List<PlatformFile>> pickBookingVehiclePackageImagesFromGallery() async {
  final xFiles = await ImagePicker().pickMultiImage(imageQuality: 85);
  if (xFiles.isEmpty) return const [];

  final out = <PlatformFile>[];
  for (final x in xFiles) {
    final p = await _platformFileFromXFile(x);
    if (p != null) out.add(p);
  }
  return out;
}

/// Giá trị form `FormBuilderField<List<PlatformFile>>` (ảnh kiện giao / lấy).
List<PlatformFile> bookingVehicleParsePackageImageField(dynamic raw) {
  if (raw == null) return const [];
  if (raw is List<PlatformFile>) return List<PlatformFile>.from(raw);
  if (raw is List) {
    return raw.whereType<PlatformFile>().toList();
  }
  return const [];
}
