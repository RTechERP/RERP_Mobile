import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../common/app_theme/index.dart';
import '../../../../../base/network/errors/extension.dart';
import '../../../../../common/utils/snack_bar_helper.dart';
import '../../data/datasource/models/business_card_model.dart';

/// Màn hình chi tiết danh thiếp.
class BusinessCardDetailScreen extends StatelessWidget {
  final BusinessCardModel card;

  const BusinessCardDetailScreen({super.key, required this.card});

  String? get _email {
    if (card.emailCongTy != null && card.emailCongTy!.trim().isNotEmpty) {
      return card.emailCongTy!.trim();
    }
    if (card.emailCaNhan != null && card.emailCaNhan!.trim().isNotEmpty) {
      return card.emailCaNhan!.trim();
    }
    return null;
  }

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
          'Chi tiết danh thiếp',
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
            _ProfileHeader(card: card),
            const SizedBox(height: 20),
            _ActionButtons(card: card),
            const SizedBox(height: 20),
            _buildContactInfo(),
            const SizedBox(height: 14),
            _buildCompanyInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
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
            child: const Row(
              children: [
                Icon(Icons.contact_phone_outlined, size: 18, color: AppColors.secondaryERP),
                SizedBox(width: 8),
                Text(
                  'Thông tin liên hệ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
              ],
            ),
          ),
          _InfoRow(
            icon: Icons.phone_outlined,
            label: 'Điện thoại',
            value: card.sdtCaNhan ?? '--',
            showCopy: card.sdtCaNhan != null && card.sdtCaNhan!.trim().isNotEmpty,
          ),
          if (_email != null)
            _InfoRow(
              icon: Icons.email_outlined,
              label: 'Email',
              value: _email!,
              showCopy: true,
            ),
          if (card.address != null && card.address!.trim().isNotEmpty)
            _InfoRow(
              icon: Icons.location_on_outlined,
              label: 'Địa chỉ',
              value: card.address!.trim(),
              showCopy: false,
            ),
        ],
      ),
    );
  }

  Widget _buildCompanyInfo() {
    final hasCompanyInfo = (card.companyName != null && card.companyName!.trim().isNotEmpty) ||
        (card.companyAddress != null && card.companyAddress!.trim().isNotEmpty);

    if (!hasCompanyInfo) {
      return const SizedBox.shrink();
    }

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
            child: const Row(
              children: [
                Icon(Icons.business_outlined, size: 18, color: AppColors.secondaryERP),
                SizedBox(width: 8),
                Text(
                  'Thông tin công ty',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
              ],
            ),
          ),
          if (card.companyName != null && card.companyName!.trim().isNotEmpty)
            _InfoRow(
              icon: Icons.business_outlined,
              label: 'Công ty',
              value: card.companyName!.trim(),
              showCopy: false,
            ),
          if (card.companyAddress != null && card.companyAddress!.trim().isNotEmpty)
            _InfoRow(
              icon: Icons.location_city_outlined,
              label: 'Địa chỉ công ty',
              value: card.companyAddress!.trim(),
              showCopy: false,
            ),
        ],
      ),
    );
  }
}

/// Header hiển thị avatar và tên.
class _ProfileHeader extends StatelessWidget {
  final BusinessCardModel card;

  const _ProfileHeader({required this.card});

  @override
  Widget build(BuildContext context) {
    final avatarText = (card.fullName?.trim().isNotEmpty ?? false)
        ? card.fullName!.trim()[0].toUpperCase()
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
            card.fullName ?? '--',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
          ),
          if (card.chucVu != null && card.chucVu!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              card.chucVu!.trim(),
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.gray,
              ),
            ),
          ],
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

/// Các nút hành động: gọi, email.
class _ActionButtons extends StatelessWidget {
  final BusinessCardModel card;

  const _ActionButtons({required this.card});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final phone = card.sdtCaNhan?.trim() ?? '';

    return Row(
      children: [
        if (phone.isNotEmpty)
          Expanded(
            child: _ActionButton(
              icon: Icons.phone_outlined,
              label: 'Gọi điện',
              color: AppColors.primaryERP,
              onTap: () {
                if (phone.isNotEmpty) {
                  _makePhoneCall(phone);
                }
              },
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

/// Một dòng thông tin trong card.
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showCopy;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.showCopy = false,
  });

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: value));
    context.showMessage('Đã sao chép $label', type: SnackBarType.success);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            if (showCopy && value != '--')
              GestureDetector(
                onTap: () => _copyToClipboard(context),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.copy_outlined,
                    size: 18,
                    color: AppColors.gray,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
