import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LocationRadioGroup extends StatelessWidget {
  final bool? enabled;

  const LocationRadioGroup({
    super.key,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderRadioGroup<String>(
      name: 'location',
      enabled: enabled ?? true,
      decoration: const InputDecoration(
        labelText: 'Địa điểm',
        border: InputBorder.none,
      ),
      options: const [
        FormBuilderFieldOption(
          value: 'hn',
          child: _LocationOption(
            icon: Icons.location_city,
            label: 'VP Hà Nội',
          ),
        ),
        FormBuilderFieldOption(
          value: 'dp',
          child: _LocationOption(
            icon: Icons.factory_outlined,
            label: 'Xưởng Đan Phượng',
          ),
        ),
      ],
    );
  }
}

class _LocationOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool enabled;
  final bool selected;

  const _LocationOption({
    required this.icon,
    required this.label,
    this.enabled = true,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = selected
        ? Theme.of(context).primaryColor
        : Colors.grey.shade300;

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: enabled ? borderColor : Colors.grey.shade300,
          ),
          color: selected
              ? Theme.of(context).primaryColor.withOpacity(0.05)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
