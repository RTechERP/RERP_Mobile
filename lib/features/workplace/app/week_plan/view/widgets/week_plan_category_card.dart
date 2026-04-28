import 'package:flutter/material.dart';

class WeekPlanCategoryCard extends StatelessWidget {
  const WeekPlanCategoryCard({
    super.key,
    required this.selectedId,
    required this.onChanged,
  });

  final String? selectedId;
  final ValueChanged<String> onChanged;

  static const categories = [
    ('co_khi', 'Cơ khí'),
    ('agv', 'AGV'),
    ('sale', 'Sale'),
    ('vision', 'Vision'),
    ('phan_mem', 'Phần mềm'),
    ('dien', 'Điện'),
    ('mua_hang', 'Mua Hàng'),
    ('robot', 'Robot'),
  ];

  String? get _selectedName {
    for (final c in categories) {
      if (c.$1 == selectedId) return c.$2;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              const Icon(Icons.category_outlined,
                  size: 24, color: Color(0xff989898)),
              const SizedBox(width: 14),
              const Text(
                'Hạng mục',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff989898),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          PopupMenuButton<String>(
            initialValue: selectedId,
            onSelected: onChanged,
            offset: const Offset(0, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            itemBuilder: (context) => categories.map((c) {
              final isSelected = c.$1 == selectedId;
              return PopupMenuItem<String>(
                value: c.$1,
                child: Row(
                  children: [
                    if (isSelected)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEE4623),
                          shape: BoxShape.circle,
                        ),
                      )
                    else
                      const SizedBox(width: 8),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        c.$2,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.w400,
                          color: isSelected
                              ? const Color(0xff404C6D)
                              : const Color(0xff6E7191),
                        ),
                      ),
                    ),
                    if (isSelected)
                      const Icon(Icons.check,
                          size: 18, color: Color(0xffEE4623)),
                  ],
                ),
              );
            }).toList(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5FA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFEBEBF0)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedName ?? 'Chọn hạng mục',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight:
                            selectedId != null ? FontWeight.w600 : FontWeight.w400,
                        color: selectedId != null
                            ? const Color(0xff404C6D)
                            : const Color(0xff989898),
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down,
                      size: 22, color: Color(0xff989898)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
