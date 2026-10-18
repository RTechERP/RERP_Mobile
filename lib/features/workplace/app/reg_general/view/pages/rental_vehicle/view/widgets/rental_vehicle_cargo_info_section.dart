// Section "Thông tin hàng hoá" của form thêm yêu cầu thuê xe:
// Tên gói + Dự án + Số lượng + Dài/Rộng + Cao/Nặng.

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/rental_vehicle_model.dart';
import 'rental_vehicle_label_helpers.dart';
import 'rental_vehicle_select_field.dart';

/// Section thông tin hàng hoá.
class RentalVehicleCargoInfoSection extends StatelessWidget {
  const RentalVehicleCargoInfoSection({
    super.key,
    required this.projects,
    required this.selectedProject,
    required this.onProjectChanged,
  });

  final List<RentalVehicleProject> projects;
  final RentalVehicleProject? selectedProject;
  final ValueChanged<RentalVehicleProject> onProjectChanged;

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        children: [
          // Tên gói hàng
          FormInputField(
            nameForm: 'packageName',
            nameTextField: 'packageName_text',
            label: 'Tên gói hàng',
            icon: Icons.inventory_2_outlined,
            isRequired: true,
            autoExpand: true,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập tên gói hàng',
            ),
          ),
          const SizedBox(height: 12),

          // Dự án
          RentalVehicleSelectField<RentalVehicleProject>(
            nameForm: 'projectId',
            label: 'Dự án',
            icon: Icons.folder_outlined,
            items: projects,
            sheetTitle: 'Chọn dự án',
            displayText: formatRentalVehicleProjectLabel,
            initialSelectedItem: selectedProject,
            onSelected: onProjectChanged,
            isRequired: false,
          ),
          const SizedBox(height: 12),

          // Số lượng
          FormInputField(
            nameForm: 'packageQuantity',
            nameTextField: 'packageQuantity_text',
            label: 'Số lượng',
            icon: Icons.numbers,
            keyboardType: TextInputType.text,
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập số lượng',
            ),
          ),
          const SizedBox(height: 12),

          // Kích thước: Dài x Rộng
          Row(
            children: [
              Expanded(
                child: FormInputField(
                  nameForm: 'packageLengthCm',
                  nameTextField: 'packageLengthCm_text',
                  label: 'Dài (cm)',
                  icon: Icons.straighten,
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormInputField(
                  nameForm: 'packageWidthCm',
                  nameTextField: 'packageWidthCm_text',
                  label: 'Rộng (cm)',
                  icon: Icons.straighten,
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Kích thước: Cao x Nặng
          Row(
            children: [
              Expanded(
                child: FormInputField(
                  nameForm: 'packageHeightCm',
                  nameTextField: 'packageHeightCm_text',
                  label: 'Cao (cm)',
                  icon: Icons.height,
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormInputField(
                  nameForm: 'packageWeightKg',
                  nameTextField: 'packageWeightKg_text',
                  label: 'Nặng (kg)',
                  icon: Icons.monitor_weight_outlined,
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
