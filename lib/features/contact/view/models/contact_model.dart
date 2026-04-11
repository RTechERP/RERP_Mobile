// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Model dữ liệu liên hệ - chia sẻ giữa ContactScreen và ContactDetailScreen

import 'package:flutter/material.dart';

/// Dữ liệu liên hệ.
class ContactData {
  final String id;
  final String fullName;
  final String position;
  final String department;
  final String email;
  final String phone;
  final String avatar;
  final Color avatarColor;
  final bool isOnline;

  const ContactData({
    required this.id,
    required this.fullName,
    required this.position,
    required this.department,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.avatarColor,
    required this.isOnline,
  });
}
