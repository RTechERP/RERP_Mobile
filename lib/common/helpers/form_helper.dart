import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormHelper {
  /// Tự động tìm trường lỗi đầu tiên trong [formState] và thực hiện focus.
  ///
  /// - [formState]: Trạng thái của FormBuilder.
  /// - [slipPrefix]: Tiền tố tên field để nhận diện field đó thuộc về một "phiếu" (ví dụ: 'on_slip_').
  /// - [slipKeys]: Danh sách các key định danh cho từng phiếu, dùng để tìm index của phiếu chứa lỗi.
  /// - [onSlipError]: Callback thực hiện chuyển tab/index khi lỗi nằm ở một phiếu không phải phiếu hiện tại.
  static void focusFirstError({
    required FormBuilderState formState,
    String? slipPrefix,
    List<String>? slipKeys,
    void Function(int index)? onSlipError,
  }) {
    try {
      final entries = formState.fields.entries.toList();
      final firstInvalid = entries.firstWhere((e) => e.value.hasError);
      final name = firstInvalid.key;
      final field = firstInvalid.value;

      // Nếu có thông tin về slip và trường lỗi thuộc về slip
      if (slipPrefix != null &&
          name.contains(slipPrefix) &&
          slipKeys != null &&
          onSlipError != null) {
        
        // Tìm key của slip từ tên trường (thường có dạng prefix_{key}_fieldname)
        final slipKey = slipKeys.firstWhere(
          (k) => name.contains('_${k}_'),
          orElse: () => '',
        );
        final idx = slipKeys.indexOf(slipKey);

        if (idx != -1) {
          onSlipError(idx);
          // Đợi build frame tiếp theo để đảm bảo widget đã hiển thị (nếu nằm trong IndexedStack/TabBar)
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (field.context.mounted) {
              field.focus();
              Scrollable.ensureVisible(
                field.context,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                alignment: 0.5,
              );
            }
          });
          return;
        }
      }

      // Trường hợp lỗi ở ngoài slip hoặc không có thông tin slip
      if (field.context.mounted) {
        field.focus();
        Scrollable.ensureVisible(
          field.context,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          alignment: 0.5,
        );
      }
    } catch (e) {
      // Không tìm thấy trường lỗi (entries.firstWhere báo lỗi) or errors khác
    }
  }
}
