import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

/// Service xử lý OCR cho danh thiếp.
class BusinessCardOcrService {
  final TextRecognizer _textRecognizer = TextRecognizer();

  /// Nhận diện text từ ảnh và trả về map các trường đã parse.
  Future<Map<String, String>> scanBusinessCard(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final recognizedText = await _textRecognizer.processImage(inputImage);
    return _parseBusinessCardText(recognizedText.text);
  }

  /// Parse text đã quét thành các trường danh thiếp.
  Map<String, String> parseScannedText(String text) {
    return _parseBusinessCardText(text);
  }

  /// Parse text thành các trường danh thiếp.
  Map<String, String> _parseBusinessCardText(String text) {
    final lines = text.split('\n').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    final result = <String, String>{};

    for (final line in lines) {
      // Email pattern
      final emailMatch = RegExp(r'[\w.+-]+@[\w-]+\.[\w.-]+').firstMatch(line);
      if (emailMatch != null && !result.containsKey('EMAIL')) {
        result['EMAIL'] = emailMatch.group(0)!;
        continue;
      }

      // Phone pattern (Vietnam: 0xxx, +84, 84xxx)
      final phoneMatch = RegExp(r'(?:\+84|84|0)[3-9]\d{8}').firstMatch(line);
      if (phoneMatch != null && !result.containsKey('PHONE')) {
        result['PHONE'] = phoneMatch.group(0)!;
        continue;
      }

      // Website
      final websiteMatch = RegExp(r'(?:www\.)?[\w-]+\.[\w.-]+').firstMatch(line);
      if (websiteMatch != null && !result.containsKey('WEBSITE')) {
        final match = websiteMatch.group(0)!;
        if (!match.contains('@')) {
          result['WEBSITE'] = match;
          continue;
        }
      }
    }

    // Tách các trường còn lại theo heuristics
    final remainingLines = <String>[];
    for (final line in lines) {
      bool matched = result.values.any((v) => line.contains(v));
      if (!matched) {
        remainingLines.add(line);
      }
    }

    // Dòng đầu tiên thường là tên
    if (remainingLines.isNotEmpty) {
      result['NAME'] = remainingLines.first;
    }

    // Các dòng còn lại là công ty, địa chỉ, chức vụ
    if (remainingLines.length > 1) {
      result['COMPANY'] = remainingLines.sublist(1).join(' | ');
    }

    return result;
  }

  void dispose() {
    _textRecognizer.close();
  }
}
