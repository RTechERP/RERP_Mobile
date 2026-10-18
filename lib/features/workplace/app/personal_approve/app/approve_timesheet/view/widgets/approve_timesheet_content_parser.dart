/// Parser chuyển chuỗi HTML trong `NoiDung` thành danh sách cấu trúc
/// để widget Dart render.
///
/// Pattern hỗ trợ (theo mẫu backend hiện tại):
/// - `<br/>`, `<br>`, `<br />` phân cách dòng.
/// - Mỗi dòng có dạng `Label: Value` (tiếng Việt có dấu).
/// - `<span style="color:#dc3545; white-space:nowrap;">...</span>`
///   đánh dấu dòng thời gian, hiển thị đỏ.
/// - Các tag `<b>`, `<strong>`, `<i>`, `<u>`, `<span>` khác chỉ lấy text bên trong.
///
/// Không phụ thuộc package HTML parser — chỉ dùng regex trên các tag đã biết.
library;

import 'package:flutter/material.dart';

/// Một dòng trong nội dung phiếu duyệt.
class ApproveContentLine {
  const ApproveContentLine({
    required this.label,
    required this.value,
    this.isHighlighted = false,
  });

  /// Label phía trước dấu `:` (ví dụ: `Ngày lễ`). Có thể rỗng nếu dòng
  /// không theo cấu trúc `Label: Value`.
  final String label;

  /// Phần giá trị phía sau `:` (hoặc cả dòng nếu không có `:`).
  final String value;

  /// true khi dòng được bọc bởi span đỏ (thường là thời gian).
  final bool isHighlighted;
}

class ApproveTimesheetContentParser {
  const ApproveTimesheetContentParser._();

  /// Regex nhận diện thẻ `<br>` ở các biến thể.
  static final RegExp _brRegex = RegExp(
    r'<br\s*/?>',
    caseSensitive: false,
  );

  /// Regex bắt span có style màu đỏ (highlight).
  static final RegExp _highlightSpanRegex = RegExp(
    r'<span[^>]*style\s*=\s*"[^"]*color\s*:\s*#dc3545[^"]*"[^>]*>([\s\S]*?)</span>',
    caseSensitive: false,
  );

  /// Regex bắt span bất kỳ (để lấy text bên trong).
  static final RegExp _spanRegex = RegExp(
    r'<span[^>]*>([\s\S]*?)</span>',
    caseSensitive: false,
  );

  /// Regex bắt các tag inline đơn giản.
  static final RegExp _inlineTagRegex = RegExp(
    r'<(?:b|strong|i|u|em)>([\s\S]*?)</(?:b|strong|i|u|em)>',
    caseSensitive: false,
  );

  /// Parse HTML → danh sách dòng cấu trúc.
  static List<ApproveContentLine> parse(String? html) {
    if (html == null || html.trim().isEmpty) return const [];

    // Bước 1: thay thế toàn bộ span đỏ bằng text thuần bên trong.
    // Sau bước này, dòng nào thuộc span đỏ sẽ chỉ còn text thuần và được
    // đánh dấu `isHighlighted = true` thông qua mapping vị trí.
    final highlightInnerByText = <String>{};
    var processedHtml = html;

    for (final m in _highlightSpanRegex.allMatches(html).toList()) {
      final inner = (m.group(1) ?? '').trim();
      if (inner.isEmpty) continue;
      highlightInnerByText.add(inner);
      processedHtml = processedHtml.replaceFirst(m.group(0)!, inner);
    }

    // Bước 2: tách theo <br/> và build từng dòng.
    final result = <ApproveContentLine>[];
    for (final raw in processedHtml.split(_brRegex)) {
      final line = raw.trim();
      if (line.isEmpty) continue;

      final cleaned = _stripTags(line);
      if (cleaned.isEmpty) continue;

      final isHighlighted = highlightInnerByText.contains(cleaned);
      result.add(_splitLabelValue(cleaned, isHighlighted));
    }

    return result;
  }

  /// Tách `Label: Value` nếu có dấu `:` ở đầu dòng và phần trước không chứa số
  /// (tránh nhầm với pattern thời gian `18:00`).
  static ApproveContentLine _splitLabelValue(String text, bool highlighted) {
    final colonIdx = text.indexOf(':');
    if (colonIdx <= 0 || colonIdx >= text.length - 1) {
      return ApproveContentLine(
        label: '',
        value: text,
        isHighlighted: highlighted,
      );
    }

    final label = text.substring(0, colonIdx).trim();
    if (_looksLikeTimePattern(label) || label.length > 30) {
      return ApproveContentLine(
        label: '',
        value: text,
        isHighlighted: highlighted,
      );
    }

    final value = text.substring(colonIdx + 1).trim();
    if (label.isEmpty || value.isEmpty) {
      return ApproveContentLine(
        label: '',
        value: text,
        isHighlighted: highlighted,
      );
    }

    return ApproveContentLine(
      label: label,
      value: value,
      isHighlighted: highlighted,
    );
  }

  /// Phần trước `:` có chứa chữ số và ngắn → nhiều khả năng là thời gian.
  static bool _looksLikeTimePattern(String label) {
    return label.contains(RegExp(r'\d')) && label.length <= 15;
  }

  /// Bỏ các tag `<span>`, `<b>`, `<strong>`, `<i>`, `<u>`, `<em>` và lấy text bên trong.
  static String _stripTags(String input) {
    var result = input;

    // Span (bắt trước để text bên trong span có thể còn tag inline).
    while (_spanRegex.hasMatch(result)) {
      result = result.replaceAllMapped(_spanRegex, (m) => m.group(1) ?? '');
    }

    // Inline tags.
    while (_inlineTagRegex.hasMatch(result)) {
      result = result.replaceAllMapped(
        _inlineTagRegex,
        (m) => m.group(1) ?? '',
      );
    }

    // Whitespace.
    return result.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// Màu highlight dùng cho dòng thời gian (đỏ giống web).
  static Color get highlightColor => const Color(0xFFDC3545);
}
