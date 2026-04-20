import 'package:file_picker/file_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Dịch field form người giao + kiện (lấy hàng) khi xoá một dòng.
abstract final class BookingVehicleDeliverFormShift {
  BookingVehicleDeliverFormShift._();

  static const List<List<String>> _stringPairs = [
    ['pickup_giver_employee', 'pickup_giver_employee_text'],
    ['pickup_giver_name', 'pickup_giver_name_text'],
    ['pickup_giver_phone_number', 'pickup_giver_phone_number_text'],
    ['pickup_package_name', 'pickup_package_name_text'],
    ['pickup_package_size', 'pickup_package_size_text'],
    ['pickup_package_weight', 'pickup_package_weight_text'],
    ['pickup_package_quantity', 'pickup_package_quantity_text'],
    ['note_pickup_package', 'note_pickup_package_text'],
  ];

  static Map<String, dynamic> computeShiftedFields({
    FormBuilderState? form,
    required int deletedIndex,
    required int oldLineCount,
  }) {
    if (form == null || oldLineCount <= 1) return {};
    if (deletedIndex < 0 || deletedIndex >= oldLineCount) return {};

    final newLength = oldLineCount - 1;
    final snap = form.instantValue;
    final patch = <String, dynamic>{};

    // 1. Shift existing rows up
    for (var newIdx = deletedIndex; newIdx < newLength; newIdx++) {
      final oldIdx = newIdx + 1;
      for (final pair in _stringPairs) {
        final bf = pair[0];
        final bt = pair[1];
        patch['${bf}_$newIdx'] = snap['${bf}_$oldIdx'] ?? '';
        patch['${bt}_$newIdx'] = snap['${bt}_$oldIdx'] ?? '';
      }
      final oldImg = snap['pickup_package_image_$oldIdx'];
      final files = oldImg is List
          ? oldImg.whereType<PlatformFile>().toList()
          : <PlatformFile>[];
      patch['pickup_package_image_$newIdx'] = List<PlatformFile>.from(files);
    }

    // 2. Clear (set null) deleted row fields so patchValue removes the keys
    final deletedRowIdx = oldLineCount - 1;
    for (final pair in _stringPairs) {
      patch['${pair[0]}_$deletedRowIdx'] = null;
      patch['${pair[1]}_$deletedRowIdx'] = null;
    }
    patch['pickup_package_image_$deletedRowIdx'] = null;

    return patch;
  }

  /// @deprecated Dùng [computeShiftedFields] thay thế.
  static void afterDeleteAt(
    FormBuilderState? form, {
    required int deletedIndex,
    required int oldLineCount,
  }) {
    final patch = computeShiftedFields(
      form: form,
      deletedIndex: deletedIndex,
      oldLineCount: oldLineCount,
    );
    if (patch.isNotEmpty) {
      form?.patchValue(patch);
    }
  }
}
