import 'package:flutter/material.dart';

class WeekPlanChoiceOption {
  const WeekPlanChoiceOption({
    required this.label,
    required this.value,
  });
  final String label;
  final bool value;
}

class WeekPlanChoiceRow extends StatelessWidget {
  const WeekPlanChoiceRow({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.icon,
    this.label,
  });

  final List<WeekPlanChoiceOption> options;
  final bool selected;
  final ValueChanged<bool> onChanged;
  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEBEBF0)),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 24, color: const Color(0xff989898)),
            const SizedBox(width: 14),
          ],
          if (label != null) ...[
            Text(
              label!,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xff989898),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Row(
              children: List.generate(options.length, (i) {
                final opt = options[i];
                final isSelected = opt.value == selected;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onChanged(opt.value),
                    child: Container(
                      margin: EdgeInsets.only(right: i == 0 ? 10 : 0),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFEE4623)
                            : const Color(0xFFF5F5FA),
                        borderRadius: BorderRadius.circular(12),
                        border: isSelected
                            ? Border.all(
                                color: const Color(0xFFEE4623), width: 1.5)
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          opt.label,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xff989898),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
