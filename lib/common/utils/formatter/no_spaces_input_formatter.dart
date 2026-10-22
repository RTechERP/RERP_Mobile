// `TextInputFormatter` chặn nhập dấu cách (khoảng trắng) trong field.
//
// Khi user gõ hoặc dán (paste) nội dung có khoảng trắng, các ký tự
// whitespace bị loại bỏ ngay lúc nhập — con trỏ được giữ đúng vị trí
// tương ứng nên không bị nhảy lung tung.
//
// Dùng cho các field không được chứa khoảng trắng (mật khẩu, mã, tài khoản).

import 'package:flutter/services.dart';

/// Loại bỏ toàn bộ ký tự khoảng trắng (space, tab, xuống dòng) khỏi input.
class NoSpacesInputFormatter extends TextInputFormatter {
  static final RegExp _whitespace = RegExp(r'\s');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Không có khoảng trắng → giữ nguyên để không mất thông tin composing.
    if (!_whitespace.hasMatch(newValue.text)) return newValue;

    final cursor = newValue.selection.baseOffset;
    final buffer = StringBuffer();
    // Số ký tự khoảng trắng bị xóa nằm trước con trỏ → dùng để dời con trỏ.
    var removedBeforeCursor = 0;

    for (var i = 0; i < newValue.text.length; i++) {
      final char = newValue.text[i];
      if (_whitespace.hasMatch(char)) {
        if (i < cursor) removedBeforeCursor++;
        continue;
      }
      buffer.write(char);
    }

    final text = buffer.toString();
    final offset = (cursor - removedBeforeCursor).clamp(0, text.length);

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: offset),
      composing: TextRange.empty,
    );
  }
}
