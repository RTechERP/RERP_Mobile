import 'package:flutter/material.dart';

class WeekPlanMultiSelectChips<T> extends StatelessWidget {
  const WeekPlanMultiSelectChips({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onAdd,
    required this.onRemove,
    this.isEmployee = false,
  });

  final String label;
  final IconData icon;
  final List<T> selected;
  final VoidCallback onAdd;
  final void Function(int id) onRemove;
  final bool isEmployee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEBEBF0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: const Color(0xff989898)),
              const SizedBox(width: 14),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xff989898),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.add_circle_outline,
                size: 24,
                color: const Color(0xFFEE4623),
              ),
            ],
          ),
          if (selected.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: selected.map((item) {
                final id = _getId(item);
                final name = _getName(item);
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFA726).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFEE4623).withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFFEE4623),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () => onRemove(id),
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: Color(0xFFEE4623),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  int _getId(T item) {
    if (isEmployee) {
      return (item as dynamic).id as int;
    }
    return (item as dynamic).id as int;
  }

  String _getName(T item) {
    if (isEmployee) {
      return (item as dynamic).displayText as String;
    }
    return item.toString();
  }
}
