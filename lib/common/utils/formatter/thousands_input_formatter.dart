// `TextInputFormatter` format số tiền VNĐ khi user gõ.
//
// Trả về text dạng "x.xxx.xxx VNĐ" (chèn `.` mỗi 3 chữ số + hậu tố " VNĐ").
// Chỉ giữ chữ số; ký tự khác (chữ, dấu phẩy, dấu chấm) bị bỏ qua.
//
// QUAN TRỌNG — VÌ SAO KHÔNG DÙNG `onChanged`:
// Trước đây màn "Đề nghị tạm ứng" / "Cập nhật TTQT" format số tiền bằng
// cách set `_amountCtrl.value = TextEditingValue(...)` trong `onChanged`.
// Chuỗi thao tác: `onChanged` → set controller.value → `notifyListeners` →
// `_FormBuilderTextFieldState._handleControllerChanged` →
// `didChange` → `effectiveController.text = value` (line 594 của
// `form_builder_text_field.dart`) → `notifyListeners` lặp lại →
// `StackOverflow` (~9000 frame).
//
// `TextInputFormatter` được Flutter gọi TRƯỚC khi TextField set value vào
// controller, không trigger lại listener của FormBuilderTextField → an toàn.

import 'package:flutter/services.dart';

class ThousandsInputFormatter extends TextInputFormatter {
  /// [suffix] mặc định rỗng — đơn vị tiền tệ ("VNĐ") hiển thị ở
  /// `suffixIcon` của field, không chèn vào text. Nếu muốn chèn vào
  /// text thì truyền `suffix` (ví dụ: " đ", " $").
  ThousandsInputFormatter({this.suffix = ''});

  final String suffix;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Bỏ hết ký tự không phải số, giữ lại chuỗi digits thuần.
    final digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) {
      // Cho phép user xoá sạch field.
      return const TextEditingValue();
    }

    // Format "x.xxx.xxx" + hậu tố.
    final n = int.tryParse(digits) ?? 0;
    final grouped = n.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    final formatted = '$grouped$suffix';

    // Giữ con trỏ ở cuối text (cộng dồn offset theo vị trí tương đối
    // trong phần digits — ổn định vì chỉ có chữ số là thay đổi nội dung).
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
