import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../../common/widgets/form/index.dart';

class TypeFormCommercialDeliveryPackage extends StatelessWidget {
  const TypeFormCommercialDeliveryPackage({super.key});

  static const List<String> _allowedImageExtensions = ['png', 'jpeg', 'jpg'];

  @override
  Widget build(BuildContext context) {
    return FormCard(
      title: 'Thông tin kiện hàng',
      child: Column(
        children: [
          FormInputField(
            icon: Icons.description_outlined,
            nameForm: 'commercial_package_name',
            nameTextField: 'commercial_package_name_text',
            label: 'Tên kiện hàng',
            maxLines: 3,
          ),
          const SizedBox(height: 8),

          FormBuilderField<List<PlatformFile>>(
            name: 'commercial_package_image',
            builder: (field) {
              final files = field.value ?? const <PlatformFile>[];
              final name = files.isNotEmpty ? files.first.name : '';

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.attach_file_outlined,
                        color: AppColors.primaryERP),
                    title: const Text(
                      'Ảnh kiện hàng (png/jpeg)',
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: const Icon(Icons.upload_file),
                    onTap: () async {
                      final result = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        allowedExtensions: _allowedImageExtensions,
                        type: FileType.custom,
                      );

                      if (result != null && result.files.isNotEmpty) {
                        field.didChange(result.files);
                      }
                    },
                  ),
                  if (name.trim().isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 8),
                      child: Text(
                        name,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              );
            },
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: FormInputField(
                  icon: Icons.crop_square_outlined,
                  nameForm: 'package_size',
                  nameTextField: 'package_size_text',
                  label: 'Kích thước (cm)',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormInputField(
                  icon: Icons.monitor_weight_outlined,
                  nameForm: 'package_weight',
                  nameTextField: 'package_weight_text',
                  label: 'Cân nặng (kg)',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.inventory_2_outlined,
            nameForm: 'commercial_package_quantity',
            nameTextField: 'commercial_package_quantity_text',
            label: 'Số lượng kiện hàng',
            keyboardType: TextInputType.number,
            initialValue: '1',
          ),

          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.note_outlined,
            nameForm: 'note_return_or_delivery',
            nameTextField: 'note_return_or_delivery_text',
            label: 'Ghi chú (nếu có)',
            maxLines: 3,
            initialValue: '[Hàng đang chuẩn bị]',
          ),
        ],
      ),
    );
  }
}

