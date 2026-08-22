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
    if (text.contains('BEGIN:VCARD')) {
      return _parseVCard(text);
    }
    return _parseBusinessCardText(text);
  }

  /// Parse vCard format thành các trường danh thiếp.
  Map<String, String> _parseVCard(String text) {
    final result = <String, String>{};
    final lines = text.split('\n');

    for (final line in lines) {
      final trimmed = line.trim();

      if (trimmed.startsWith('FN:') || trimmed.startsWith('FN;')) {
        final value = _extractVCardValue(trimmed);
        if (value != null && value.isNotEmpty) result['NAME'] = value;
      } else if (trimmed.startsWith('N:') || trimmed.startsWith('N;')) {
        if (!result.containsKey('NAME')) {
          final value = _extractVCardValue(trimmed);
          if (value != null && value.isNotEmpty) {
            final parts = value.split(';');
            final nameParts = <String>[];
            if (parts.length > 1) {
              if (parts[1].isNotEmpty) nameParts.add(parts[1]);
              if (parts[0].isNotEmpty) nameParts.add(parts[0]);
            }
            if (nameParts.isNotEmpty) result['NAME'] = nameParts.join(' ');
          }
        }
      } else if (trimmed.startsWith('ORG:') || trimmed.startsWith('ORG;')) {
        final value = _extractVCardValue(trimmed);
        if (value != null && value.isNotEmpty) {
          result['COMPANY'] = value.split(';').first;
        }
      } else if (trimmed.startsWith('TITLE:') || trimmed.startsWith('TITLE;')) {
        final value = _extractVCardValue(trimmed);
        if (value != null && value.isNotEmpty) result['TITLE'] = value;
      } else if (trimmed.startsWith('ROLE:') || trimmed.startsWith('ROLE;')) {
        if (!result.containsKey('TITLE')) {
          final value = _extractVCardValue(trimmed);
          if (value != null && value.isNotEmpty) result['TITLE'] = value;
        }
      } else if (trimmed.startsWith('TEL:') || trimmed.startsWith('TEL;')) {
        if (!result.containsKey('TEL')) {
          final value = _extractVCardValue(trimmed);
          if (value != null && value.isNotEmpty) result['TEL'] = value;
        }
      } else if (trimmed.startsWith('EMAIL:') || trimmed.startsWith('EMAIL;')) {
        final value = _extractVCardValue(trimmed);
        if (value != null && value.isNotEmpty) result['EMAIL'] = value;
      } else if (trimmed.startsWith('ADR:') || trimmed.startsWith('ADR;')) {
        if (!result.containsKey('ADDRESS')) {
          final value = _extractVCardValue(trimmed);
          if (value != null && value.isNotEmpty) {
            final parts = value.split(';').where((p) => p.isNotEmpty).toList();
            if (parts.isNotEmpty) result['ADDRESS'] = parts.join(', ');
          }
        }
      } else if (trimmed.startsWith('URL:') || trimmed.startsWith('URL;')) {
        final value = _extractVCardValue(trimmed);
        if (value != null && value.isNotEmpty) result['WEBSITE'] = value;
      } else if (trimmed.startsWith('NOTE:') || trimmed.startsWith('NOTE;')) {
        if (!result.containsKey('NOTE')) {
          final value = _extractVCardValue(trimmed);
          if (value != null && value.isNotEmpty) result['NOTE'] = value;
        }
      }
    }

    return result;
  }

  String? _extractVCardValue(String line) {
    final colonIndex = line.indexOf(':');
    if (colonIndex == -1) return null;
    var value = line.substring(colonIndex + 1).trim();
    value = value.replaceAll(r'\n', '\n').replaceAll(r'\,', ',').replaceAll(r'\;', ';');
    return value.isEmpty ? null : value;
  }

  /// Email pattern - match anywhere in the line.
  static final _emailRegex =
      RegExp(r'[A-Za-z0-9._%+\-]+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}');

  /// Phone pattern - tolerant to spaces, dots, dashes, parentheses.
  /// Captures a sequence of 9-12 digits with optional country prefix.
  static final _phoneRegex = RegExp(
    r'(?:\+?84[\s.\-]?)?(?:\(\d{2,4}\)[\s.\-]?|(?<![\d])\d{2,4}[\s.\-]?)?'
    r'(?<![\d.])(0\d{9}|\d{9,11})(?![\d.])',
  );

  /// Website pattern - requires explicit scheme or www. prefix to avoid false positives.
  static final _websiteRegex =
      RegExp(r'(?:https?://|www\.)[A-Za-z0-9\-]+(?:\.[A-Za-z0-9\-]+)+(?:\S*)?');

  /// Address indicators - words commonly seen in addresses.
  static const _addressKeywords = [
    'street', 'st.', 'st,', 'road', 'rd.', 'rd,', 'avenue', 'ave', 'ave.',
    'district', 'dist.', 'ward', 'city', 'province', 'country',
    'tỉnh', 'tỉnh,', 'huyện', 'quận', 'phường', 'thành phố', 'tp.',
    'đường', 'phố', 'số', 'tầng', 'tòa nhà', 'building', 'floor',
  ];

  /// Title / position indicators.
  static const _titleKeywords = [
    'manager', 'director', 'engineer', 'developer', 'designer',
    'president', 'ceo', 'cto', 'cfo', 'coo', 'vp', 'vice', 'head',
    'lead', 'chief', 'senior', 'junior', 'officer', 'specialist',
    'consultant', 'analyst', 'coordinator', 'executive', 'founder',
    'giám đốc', 'phó giám đốc', 'trưởng phòng', 'phó phòng',
    'quản lý', 'kỹ sư', 'lập trình viên', 'thiết kế', 'kiến trúc sư',
    'trưởng', 'phó', 'nhân viên', 'chuyên viên', 'cố vấn',
    'tổng giám đốc', 'phó tổng',
  ];

  /// Company indicators - words commonly seen in company names.
  static const _companyKeywords = [
    'inc', 'inc.', 'ltd', 'ltd.', 'corp', 'corp.', 'co.,', 'company',
    'group', 'company limited', 'corporation',
    'công ty', 'cty', 'tnhh', 'cp', 'tập đoàn', 'tổng công ty',
  ];

  /// Parse OCR text thành các trường danh thiếp.
  Map<String, String> _parseBusinessCardText(String text) {
    final lines = text
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    final result = <String, String>{};

    if (lines.isEmpty) return result;

    // Find email across all lines (often split from name on multiple lines).
    for (final line in lines) {
      final m = _emailRegex.firstMatch(line);
      if (m != null) {
        result['EMAIL'] = m.group(0)!;
        break;
      }
    }

    // Find phone across all lines.
    for (final line in lines) {
      final m = _phoneRegex.firstMatch(line);
      if (m != null) {
        result['PHONE'] = _normalizePhone(m.group(0)!);
        break;
      }
    }

    // Find website across all lines.
    for (final line in lines) {
      final m = _websiteRegex.firstMatch(line);
      if (m != null) {
        result['WEBSITE'] = m.group(0)!;
        break;
      }
    }

    // Classify remaining lines (excluding lines that only contain the matched
    // fields) into NAME / TITLE / COMPANY / ADDRESS using keyword heuristics.
    final consumedPatterns = <RegExp>[
      RegExp(r'^\s*' + RegExp.escape(result['EMAIL'] ?? '___none___') + r'\s*$',
          caseSensitive: false),
    ];

    final nameCandidates = <_Candidate>[];
    final titleCandidates = <_Candidate>[];
    final companyCandidates = <_Candidate>[];
    final addressCandidates = <_Candidate>[];

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];

      // Skip lines that ARE the matched email / phone / website.
      if (result.containsKey('EMAIL') && _lineIsOnlyMatch(line, result['EMAIL']!)) {
        continue;
      }
      if (result.containsKey('PHONE') && _lineIsOnlyMatch(line, result['PHONE']!)) {
        continue;
      }
      if (result.containsKey('WEBSITE') &&
          _lineIsOnlyMatch(line, result['WEBSITE']!)) {
        continue;
      }
      // Skip lines that look like a phone number even if regex missed them.
      if (_looksLikePhoneLine(line)) continue;

      final lower = line.toLowerCase();

      if (_containsAny(lower, _addressKeywords)) {
        addressCandidates.add(_Candidate(i, line));
        continue;
      }
      if (_containsAny(lower, _companyKeywords)) {
        companyCandidates.add(_Candidate(i, line));
        continue;
      }
      if (_containsAny(lower, _titleKeywords)) {
        titleCandidates.add(_Candidate(i, line));
        continue;
      }

      // Heuristic: a name line has 2-4 capitalized words and no digits.
      if (_looksLikeName(line)) {
        nameCandidates.add(_Candidate(i, line));
      }
    }

    // Name: prefer candidates near the top of the card.
    if (nameCandidates.isNotEmpty) {
      result['NAME'] = nameCandidates.first.line;
    }

    // Title: first title candidate.
    if (titleCandidates.isNotEmpty) {
      result['TITLE'] = titleCandidates.first.line;
    }

    // Company: first company candidate, else fall back to a line below title.
    if (companyCandidates.isNotEmpty) {
      result['COMPANY'] = companyCandidates.first.line;
    }

    // Address: join all address candidates (often split across lines).
    if (addressCandidates.isNotEmpty) {
      result['ADDRESS'] = addressCandidates.map((c) => c.line).join(', ');
    }

    // Fallback for missing name: pick the first line that has 2+ words and
    // contains no digits.
    if (!result.containsKey('NAME')) {
      for (final line in lines) {
        if (_looksLikeName(line)) {
          result['NAME'] = line;
          break;
        }
      }
    }

    // Suppress unused warning for unused pattern list (kept for future use).
    consumedPatterns.clear();

    return result;
  }

  /// True if the line is essentially just the matched value (ignoring symbols).
  bool _lineIsOnlyMatch(String line, String value) {
    final stripped = line
        .replaceAll(RegExp(r'[\s().\-:]'), '')
        .toLowerCase();
    final vStripped = value
        .replaceAll(RegExp(r'[\s().\-:]'), '')
        .toLowerCase();
    return stripped == vStripped || stripped.contains(vStripped);
  }

  /// True if a line is primarily digits / phone separators.
  bool _looksLikePhoneLine(String line) {
    final digits = line.replaceAll(RegExp(r'[^\d]'), '');
    return digits.length >= 9 && RegExp(r'^[\d+\-\s().]+$').hasMatch(line);
  }

  /// True if `haystack` contains any of `keywords` as whole words.
  bool _containsAny(String haystack, List<String> keywords) {
    for (final kw in keywords) {
      final pattern = RegExp(
        r'(^|\s|,|\.)' + RegExp.escape(kw) + r'(\s|,|\.|$)',
        caseSensitive: false,
      );
      if (pattern.hasMatch(haystack)) return true;
    }
    return false;
  }

  /// Heuristic for a name line: 2-4 words, mostly letters, no digits.
  bool _looksLikeName(String line) {
    if (RegExp(r'\d').hasMatch(line)) return false;
    final words = line.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    if (words.length < 2 || words.length > 4) return false;
    // At least 2 words start with an uppercase letter (or all-uppercase).
    var uppercaseCount = 0;
    for (final w in words) {
      final first = w[0];
      if (first.toUpperCase() == first && first.toLowerCase() != first) {
        uppercaseCount++;
      }
    }
    if (uppercaseCount < 2) {
      // Allow all-caps acronyms like "NGUYEN VAN A".
      final allCaps = words.every((w) => w == w.toUpperCase());
      if (!allCaps) return false;
    }
    return true;
  }

  /// Normalize a phone number to a clean form (digits with + prefix).
  String _normalizePhone(String raw) {
    final hasPlus = raw.trim().startsWith('+');
    final digits = raw.replaceAll(RegExp(r'[^\d]'), '');
    if (hasPlus) return '+$digits';
    // Vietnamese local: convert 84xxxx to 0xxx.
    if (digits.startsWith('84') && digits.length >= 10) {
      return '0${digits.substring(2)}';
    }
    return digits;
  }

  void dispose() {
    _textRecognizer.close();
  }
}

/// Lightweight candidate holding the original line index for ordering.
class _Candidate {
  const _Candidate(this.index, this.line);
  final int index;
  final String line;
}
