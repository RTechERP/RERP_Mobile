// Section "Lộ trình & chi phí" của form thêm yêu cầu thuê xe:
// Nơi xuất phát + Nơi đến + Khoảng cách + Ghi chú.

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../../../../common/widgets/form/index.dart';

/// Section lộ trình & chi phí.
class RentalVehicleRouteSection extends StatelessWidget {
  const RentalVehicleRouteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        children: [
          // Nơi xuất phát
          FormInputField(
            nameForm: 'departureLocation',
            nameTextField: 'departureLocation_text',
            label: 'Nơi xuất phát',
            icon: Icons.trip_origin,
            isRequired: true,
            autoExpand: true,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập nơi xuất phát',
            ),
          ),
          const SizedBox(height: 12),

          // Nơi đến
          FormInputField(
            nameForm: 'addressLocation',
            nameTextField: 'addressLocation_text',
            label: 'Nơi đến',
            icon: Icons.location_on_outlined,
            isRequired: true,
            autoExpand: true,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập nơi đến',
            ),
          ),
          const SizedBox(height: 12),

          // Khoảng cách
          FormInputField(
            nameForm: 'distanceKm',
            nameTextField: 'distanceKm_text',
            label: 'Khoảng cách (km)',
            icon: Icons.route,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),

          // Ghi chú
          FormInputField(
            nameForm: 'note',
            nameTextField: 'note_text',
            label: 'Ghi chú',
            icon: Icons.note_outlined,
            autoExpand: true,
          ),
        ],
      ),
    );
  }
}
