import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../app_theme/index.dart';

class FormFilePicker extends StatelessWidget {
  final String name;
  final String label;
  final IconData icon;
  final bool allowMultiple;

  const FormFilePicker({
    super.key,
    required this.name,
    required this.label,
    required this.icon,
    this.allowMultiple = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<PlatformFile>>(
      name: name,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(icon, color: AppColors.primaryERP),
              title: Text(label),
              trailing: const Icon(Icons.upload_file),
              onTap: () async {
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: allowMultiple,
                );
                if (result != null) {
                  field.didChange(result.files);
                }
              },
            ),
            if (field.value != null && field.value!.isNotEmpty)
              ...field.value!.map(
                    (e) => Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Text('• ${e.name}', style: const TextStyle(fontSize: 13)),
                ),
              ),
          ],
        );
      },
    );
  }
}