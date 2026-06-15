import 'package:flutter/material.dart';

import '../../../../../../../../../common/widgets/form/form_input_field.dart';

class WeekPlanWorkplaceCard extends StatelessWidget {
  const WeekPlanWorkplaceCard({
    super.key,
    required this.selected,
    required this.otherText,
    required this.onSelected,
    required this.onOtherTextChanged,
  });

  /// -1 = chưa chọn, 0 = VP RTC, 1 = Đan Phượng, 2 = Khác.
  final int selected;
  final String otherText;
  final ValueChanged<int> onSelected;
  final ValueChanged<String> onOtherTextChanged;

  static const labels = ['VP RTC', 'Đan Phượng', 'Khác'];
  static const colors = [
    Color(0xFF2F80ED),
    Color(0xFF41B339),
    Color(0xFFF0891A),
  ];

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
              const Icon(
                Icons.location_on_outlined,
                size: 24,
                color: Color(0xff989898),
              ),
              const SizedBox(width: 14),
              const Text(
                'Địa điểm làm việc',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff989898),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(labels.length, (i) {
              final isSelected = i == selected;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onSelected(i),
                  child: Container(
                    margin: EdgeInsets.only(right: i < 2 ? 8 : 0),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colors[i]
                          : const Color(0xFFF5F5FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        labels[i],
                        style: TextStyle(
                          fontSize: 12,
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
          if (selected == 2) ...[
            const SizedBox(height: 12),
            FormInputField(
              nameForm: 'workplace_other',
              nameTextField: 'workplace_other_field',
              label: 'Địa điểm khác',
              icon: Icons.edit_location_alt_outlined,
              initialValue: otherText,
              autoExpand: true,
              isRequired: true,
              validator: (value) {
                if ((value == null) || value.trim().isEmpty) {
                  return 'Vui lòng nhập địa điểm làm việc';
                }
                return null;
              },
              onChanged: (value) => onOtherTextChanged(value ?? ''),
            ),
          ],
        ],
      ),
    );
  }
}
