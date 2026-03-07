import 'package:flutter/material.dart';

class WpInfoCard extends StatelessWidget {
  final String name;
  final String code;
  final String? avatarUrl;
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
      fit: FlexFit.loose,
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
