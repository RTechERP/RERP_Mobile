import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/widgets/form/index.dart';

/// Riêng cho: giao hàng Demo/triển lãm.
class TypeFormDemoDelivery extends StatelessWidget {
  const TypeFormDemoDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        children: [
          FormInputField(
            icon: Icons.location_on_outlined,
            nameForm: 'demo_delivery_address',
            nameTextField: 'demo_delivery_address_text',
            label: 'Địa chỉ giao hàng demo',
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          FormDateTimePicker(
            icon: Icons.access_time_filled,
            nameForm: 'time_demo_delivery',
            nameTimePicker: 'time_demo_delivery_picker',
            label: 'Thời gian giao',
            inputType: InputType.time,
            format: DateFormat('HH:mm'),
          ),
          const SizedBox(height: 8),
          FormInputField(
            icon: Icons.description_outlined,
            nameForm: 'demo_item_description',
            nameTextField: 'demo_item_description_text',
            label: 'Nội dung demo/triển lãm',
            maxLines: 3,
          ),
          const SizedBox(height: 8),
          FormInputField(
            icon: Icons.person_outline,
            nameForm: 'demo_receiver_name',
            nameTextField: 'demo_receiver_name_text',
            label: 'Người nhận',
          ),
          const SizedBox(height: 8),
          FormInputField(
            icon: Icons.note_outlined,
            nameForm: 'note_demo_delivery',
            nameTextField: 'note_demo_delivery_text',
            label: 'Ghi chú',
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

