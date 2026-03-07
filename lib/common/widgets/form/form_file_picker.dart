import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../app_theme/index.dart';

class FormFilePicker extends StatelessWidget {
  final String name;
  final String label;
  final IconData icon;
  final bool allowMultiple;

  /// ➜ thêm callback
  final ValueChanged<List<PlatformFile>>? onChanged;

  const FormFilePicker({
    super.key,
    required this.name,
    required this.label,
    required this.icon,
    this.allowMultiple = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<PlatformFile>>(
      name: name,
      builder: (field) {
        return ListTile(
          leading: Icon(icon, color: AppColors.primaryERP),
          title: Text(label),
          trailing: const Icon(Icons.upload_file),
          onTap: () async {
            final result = await FilePicker.platform.pickFiles(
              allowMultiple: allowMultiple,
            );

            if (result != null && result.files.isNotEmpty) {
              field.didChange(result.files);

              /// ➜ gọi callback ra ngoài
              onChanged?.call(result.files);
            }
          },
        );
      },
    );
  }
}