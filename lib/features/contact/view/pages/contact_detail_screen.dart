// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình chi tiết một liên hệ - hiển thị thông tin đầy đủ và các hành động (gọi, nhắn tin, email)
//
// Giao diện:
//   - AppBar với nút back
//   - Avatar lớn ở giữa với trạng thái online
//   - Thông tin: họ tên, chức vụ, phòng ban
//   - Card thông tin liên lạc: số điện thoại, email
//   - Card thông tin công ty: mã nhân viên, ngày vào làm
//   - Các nút hành động: Gọi điện, Nhắn tin, Gửi Email

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/contact_model.dart';

/// Màn hình chi tiết liên hệ.
///
/// Hiển thị thông tin đầy đủ của một liên hệ từ API: avatar, chức vụ, phòng ban,
/// thông tin liên lạc (điện thoại, email), thông tin công ty (mã NV, ngày vào làm).
/// Có các nút hành động: gọi điện, nhắn tin, gửi email.
class ContactDetailScreen extends StatelessWidget {
  final ContactPersonalItem contact;

  const ContactDetailScreen({super.key, required this.contact});

  String get _displayEmail => contact.emailCongTy?.trim() ?? '--';
  String get _displayPhone => contact.sdtCaNhan?.trim() ?? '--';
  String get _displayCode => contact.code?.trim() ?? '--';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.heading),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Chi tiết liên hệ',
          style: TextStyle(
            color: AppColors.heading,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _ProfileHeader(contact: contact),

            const SizedBox(height: 20),

            _ActionButtons(contact: contact),

            const SizedBox(height: 20),

            // Thông tin liên lạc
            _InfoCard(
              title: 'Thông tin liên lạc',
              icon: Icons.contact_phone_outlined,
              children: [
                _InfoRow(
                  icon: Icons.phone_outlined,
                  label: 'Điện thoại',
                  value: _displayPhone,
                  onTap: _displayPhone != '--'
                      ? () async {
                          final phone = contact.sdtCaNhan?.trim() ?? '';
                          if (phone.isNotEmpty) {
                            final uri = Uri(scheme: 'tel', path: phone);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            }
                          }
                        }
                      : null,
                ),

                _InfoRow(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: _displayEmail,
                  onTap: _displayEmail != '--'
                      ? () async {}
                      : null,
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Thông tin nhân viên
            _InfoCard(
              title: 'Thông tin nhân viên',
              icon: Icons.business_outlined,
              children: [
                _InfoRow(
                  icon: Icons.badge_outlined,
                  label: 'Mã nhân viên',
                  value: _displayCode,
                ),
                if ((contact.departmentName?.trim() ?? '').isNotEmpty)
                  _InfoRow(
                    icon: Icons.location_city_outlined,
                    label: 'Phòng ban',
                    value: contact.departmentName!.trim(),
                  ),
                if ((contact.chucVu?.trim() ?? '').isNotEmpty)
                  _InfoRow(
                    icon: Icons.work_outline,
                    label: 'Chức vụ',
                    value: contact.chucVu!.trim(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Header hiển thị avatar và tên.
class _ProfileHeader extends StatelessWidget {
  final ContactPersonalItem contact;

  const _ProfileHeader({required this.contact});

  @override
  Widget build(BuildContext context) {
    final avatarText = contact.fullName?.trim().isNotEmpty == true
        ? contact.fullName!.trim()[0].toUpperCase()
        : '?';

    final avatarColor = _resolveColor(avatarText);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: avatarColor.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              avatarText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 14),

          Text(
            contact.fullName?.trim() ?? '--',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
          ),

          const SizedBox(height: 4),

          if (contact.chucVu != null && contact.chucVu!.isNotEmpty)
            Text(
              [
                contact.code?.trim(),
                contact.chucVu?.trim(),
              ].where((e) => e != null && e.isNotEmpty).join(' - '),
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.gray,
              ),
            ),
        ],
      ),
    );
  }

  Color _resolveColor(String letter) {
    const colors = {
      'A': Color(0xFF2957A6),
      'B': Color(0xFFEE4623),
      'C': Color(0xFF41B339),
      'D': Color(0xFFF0891A),
      'E': Color(0xFF853EFD),
      'F': Color(0xFF2F80ED),
      'G': Color(0xFF009688),
      'H': Color(0xFFE91E63),
      'I': Color(0xFF795548),
      'J': Color(0xFFFF5722),
      'K': Color(0xFF607D8B),
      'L': Color(0xFF9C27B0),
      'M': Color(0xFF3F51B5),
      'N': Color(0xFF00BCD4),
      'O': Color(0xFF8BC34A),
      'P': Color(0xFFFF9800),
      'Q': Color(0xFF673AB7),
      'R': Color(0xFF4CAF50),
      'S': Color(0xFFCDDC39),
      'T': Color(0xFF03A9F4),
      'U': Color(0xFFF44336),
      'V': Color(0xFF009688),
      'W': Color(0xFFFFC107),
      'X': Color(0xFF9E9E9E),
      'Y': Color(0xFF607D8B),
    };
    return colors[letter.toUpperCase()] ?? AppColors.primaryERP;
  }
}

/// Các nút hành động: gọi, nhắn tin, email.
class _ActionButtons extends StatelessWidget {
  final ContactPersonalItem contact;

  const _ActionButtons({required this.contact});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final phone = contact.sdtCaNhan?.trim() ?? '';

    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            icon: Icons.phone_outlined,
            label: 'Gọi điện',
            color: const Color(0xFF41B339),
            onTap: () {
              if (phone.isNotEmpty) {
                _makePhoneCall(phone);
              }
            },
          ),
        ),
        // const SizedBox(width: 12),
        // Expanded(
        //   child: _ActionButton(
        //     icon: Icons.chat_outlined,
        //     label: 'Nhắn tin',
        //     color: AppColors.primaryERP,
        //     onTap: () {},
        //   ),
        // ),
      ],
    );
  }
}

/// Một nút hành động.
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A1A1A).withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Card chứa thông tin.
class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFE8EAF0), width: 0.5),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, size: 18, color: AppColors.secondaryERP),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

/// Một dòng thông tin trong _InfoCard.
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.gray),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.gray,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
