import 'package:flutter/material.dart';

class WeekPlanTapCard extends StatelessWidget {
  const WeekPlanTapCard({
    super.key,
    required this.label,
    this.value,
    required this.icon,
    this.onTap,
  });

  final String label;
  final String? value;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEBEBF0)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: const Color(0xff989898)),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xff989898),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (value != null && value!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      value!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff404C6D),
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: value != null && value!.isNotEmpty
                  ? const Color(0xff989898)
                  : const Color(0xffD4D4D4),
            ),
          ],
        ),
      ),
    );
  }
}