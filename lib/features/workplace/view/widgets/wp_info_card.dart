// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Widget thông tin user (avatar + tên + mã) trong workspace appBar

import 'package:flutter/material.dart';

/// Widget hiển thị thông tin user trong appBar của workspace.
///
/// Gồm avatar (circle) bên trái và tên + mã nhân viên bên phải.
/// Dùng làm title của AppBar.
class WpInfoCard extends StatelessWidget {
  /// Tên hiển thị của user.
  final String name;

  /// Mã nhân viên.
  final String code;

  /// URL avatar. Nếu null hoặc rỗng thì hiển thị icon default.
  final String? avatarUrl;

  /// Chiều cao tổng của card.
  final double height;

  const WpInfoCard({
    super.key,
    required this.name,
    required this.code,
    this.avatarUrl,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints: const BoxConstraints(
        minWidth: 330,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAvatar(),
          const SizedBox(width: 12),
          _buildInfo(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    final hasAvatar = avatarUrl != null && avatarUrl!.trim().isNotEmpty;

    return CircleAvatar(
      radius: (height - 16) / 2,
      backgroundColor: Colors.grey.shade200,
      backgroundImage: hasAvatar ? NetworkImage(avatarUrl!) : null,
      child: hasAvatar
          ? null
          : const Icon(Icons.person, color: Colors.grey),
    );
  }

  Widget _buildInfo() {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            code,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
