import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/widgets/form/index.dart';

/// Gộp 2 lựa chọn: lấy hàng thương mại + lấy hàng Demo/triển lãm.
class TypeFormCommercialAndDemoPickup
    extends StatelessWidget {
  const TypeFormCommercialAndDemoPickup({super.key});

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        children: [
          FormInputField(
            icon: Icons.inventory_2_outlined,
            nameForm: 'pickup_company_name',
            nameTextField: 'pickup_company_name_text',
            label: 'Đơn vị/địa điểm lấy',
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          FormDateTimePicker(
            icon: Icons.access_time,
            nameForm: 'time_pickup',
            nameTimePicker: 'time_pickup_picker',
            label: 'Thời gian cần lấy',
            inputType: InputType.time,
            format: DateFormat('HH:mm'),
          ),
          const SizedBox(height: 8),
          FormInputField(
            icon: Icons.description_outlined,
            nameForm: 'pickup_item_description',
            nameTextField: 'pickup_item_description_text',
            label: 'Mô tả hàng hóa / demo',
            maxLines: 3,
          ),
          const SizedBox(height: 8),
          FormInputField(
            icon: Icons.note_outlined,
            nameForm: 'note_pickup',
            nameTextField: 'note_pickup_text',
            label: 'Ghi chú',
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

