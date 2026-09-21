import 'dart:convert';

import '../models/business_card_model.dart';

/// Parse response từ Ollama thành [BusinessCardVisionResult].
///
/// Ollama có thể trả JSON ở `response` hoặc `thinking`, kèm markdown code
/// block. Fail thì trả về object rỗng (caller có thể dùng fallback).
BusinessCardVisionResult parseBusinessCardVisionResponse(dynamic data) {
  String raw;
  if (data is Map) {
    raw = (data['response'] ?? '').toString();
    if (raw.isEmpty && data['thinking'] != null) {
      raw = data['thinking'].toString();
    }
  } else if (data is String) {
    raw = data;
  } else {
    raw = jsonEncode(data);
  }

  // Strip markdown code block nếu có.
  final match = RegExp(r'```(?:json)?\s*([\s\S]*?)```').firstMatch(raw.trim());
  final text = (match?.group(1) ?? raw).trim();

  try {
    final map = jsonDecode(text) as Map<String, dynamic>;
    return BusinessCardVisionResult(
      name: _stringOrNull(map['name']),
      phone: _normalizePhone(_stringOrNull(map['phone']) ?? ''),
      email: _stringOrNull(map['email']),
      company: _stringOrNull(map['company']),
      address: _stringOrNull(map['address']),
      position: _stringOrNull(map['position']),
      website: _stringOrNull(map['website']),
    );
  } catch (_) {
    return const BusinessCardVisionResult();
  }
}

/// Convert [BusinessCardVisionResult] về dạng `Map<String,String>` mà UI
/// (ConfirmScreen) đang dùng — giữ key viết HOA để tương thích vCard cũ.
Map<String, String> businessCardVisionResultToMap(
  BusinessCardVisionResult result,
) {
  final map = <String, String>{};
  if (result.name != null && result.name!.isNotEmpty) map['NAME'] = result.name!;
  if (result.phone != null && result.phone!.isNotEmpty) {
    map['PHONE'] = result.phone!;
  }
  if (result.email != null && result.email!.isNotEmpty) {
    map['EMAIL'] = result.email!;
  }
  if (result.company != null && result.company!.isNotEmpty) {
    map['COMPANY'] = result.company!;
  }
  if (result.address != null && result.address!.isNotEmpty) {
    map['ADDRESS'] = result.address!;
  }
  if (result.position != null && result.position!.isNotEmpty) {
    map['TITLE'] = result.position!;
  }
  if (result.website != null && result.website!.isNotEmpty) {
    map['WEBSITE'] = result.website!;
  }
  return map;
}

String? _stringOrNull(dynamic value) {
  if (value == null) return null;
  final s = value.toString().trim();
  return s.isEmpty ? null : s;
}

/// Chuẩn hoá số điện thoại Việt Nam: `+84xxxxxxxxx` → `0xxxxxxxxx`.
String _normalizePhone(String raw) {
  if (raw.isEmpty) return raw;
  final hasPlus = raw.trim().startsWith('+');
  final digits = raw.replaceAll(RegExp(r'[^\d]'), '');
  if (hasPlus) return '+$digits';
  if (digits.startsWith('84') && digits.length >= 10) {
    return '0${digits.substring(2)}';
  }
  return digits;
}
