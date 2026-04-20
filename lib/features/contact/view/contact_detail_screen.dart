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

import '../../../../../common/app_theme/index.dart';
import 'models/contact_model.dart';

/// Màn hình chi tiết liên hệ.
///
/// Hiển thị thông tin đầy đủ của một liên hệ: avatar, chức vụ, phòng ban,
/// thông tin liên lạc (điện thoại, email), thông tin công ty (mã NV, ngày vào làm).
/// Có các nút hành động: gọi điện, nhắn tin, gửi email.
class ContactDetailScreen extends StatelessWidget {
  final ContactData contact;

  const ContactDetailScreen({super.key, required this.contact});

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
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_outlined, color: AppColors.heading),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile header
            _ProfileHeader(contact: contact),

            const SizedBox(height: 20),

            // Action buttons
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
                  value: contact.phone,
                  onTap: () {},
                ),
                _InfoRow(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: contact.email,
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Thông tin công ty
            _InfoCard(
              title: 'Thông tin công ty',
              icon: Icons.business_outlined,
              children: [
                _InfoRow(
                  icon: Icons.badge_outlined,
                  label: 'Mã nhân viên',
                  value: 'NV${contact.id.padLeft(4, '0')}',
                ),
                _InfoRow(
                  icon: Icons.location_city_outlined,
                  label: 'Phòng ban',
                  value: contact.department,
                ),
                _InfoRow(
                  icon: Icons.work_outline,
                  label: 'Chức vụ',
                  value: contact.position,
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
  final ContactData contact;

  const _ProfileHeader({required this.contact});

  @override
  Widget build(BuildContext context) {
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
          // Avatar lớn với online indicator
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: contact.avatarColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: contact.avatarColor.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  contact.avatar,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: contact.isOnline
                        ? const Color(0xFF41B339)
                        : AppColors.gray.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 3),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Tên
          Text(
            contact.fullName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
          ),

          const SizedBox(height: 4),

          // Chức vụ & phòng ban
          Text(
            '${contact.position} • ${contact.department}',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.gray,
            ),
          ),

          const SizedBox(height: 8),

          // Trạng thái online
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: (contact.isOnline ? const Color(0xFF41B339) : AppColors.gray)
                  .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              contact.isOnline ? 'Đang hoạt động' : 'Offline',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: contact.isOnline
                    ? const Color(0xFF41B339)
                    : AppColors.gray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Các nút hành động: gọi, nhắn tin, email.
class _ActionButtons extends StatelessWidget {
  final ContactData contact;

  const _ActionButtons({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            icon: Icons.phone_outlined,
            label: 'Gọi điện',
            color: const Color(0xFF41B339),
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionButton(
            icon: Icons.chat_outlined,
            label: 'Nhắn tin',
            color: AppColors.primaryERP,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionButton(
            icon: Icons.email_outlined,
            label: 'Email',
            color: const Color(0xFF2957A6),
            onTap: () {},
          ),
        ),
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
          // Title
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
          // Children
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
            if (onTap != null)
              const Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.gray,
              ),
          ],
        ),
      ),
    );
  }
}
